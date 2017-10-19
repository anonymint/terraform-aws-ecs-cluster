#####
# ECS
#####

resource "aws_ecs_cluster" "this" {
  name = "${var.cluster_name}"
}

#####
# IAM role
#####

# ECS Instance profile role
module "ecs_instance_profile" {
  source               = "./modules/iam_role"
  role_name            = "${var.cluster_name}-container-instace-profile"
  actions              = ["sts:AssumeRole"]
  ideantifiers         = ["ec2.amazonaws.com"]
  policy_arns          = ["arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"]
  create_instance_role = true
}

#####
# ASG
#####

data "template_file" "this" {
  template = "${file("${path.module}/cloud-init/container-template.yml")}"

  vars {
    ecs_cluster_name = "${aws_ecs_cluster.this.name}"
  }
}

data "template_cloudinit_config" "this" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.this.rendered}"
  }
}

# Reference other module
module "asg" {
  source = "terraform-aws-modules/autoscaling/aws"

  # Launch Configuration
  lc_name = "${var.cluster_name}-lc"

  iam_instance_profile = "${module.ecs_instance_profile.this_iam_role_name}"
  image_id             = "${var.asg_ami_id}"
  instance_type        = "${var.asg_instance_type}"
  security_groups      = "${var.asg_security_groups}"
  key_name             = "${var.asg_keypair_name}"
  user_data            = "${data.template_cloudinit_config.this.rendered}"

  root_block_device = [{
    volume_type = "${var.asg_root_block_device_volume_type}"
    volume_size = "${var.asg_root_block_device_volume_size}"
  }]

  # Auto scaling group
  asg_name            = "${var.cluster_name}-autoscaling-group"
  vpc_zone_identifier = "${var.asg_subnet_ids}"
  health_check_type   = "EC2"
  min_size            = "${var.asg_min_size}"
  max_size            = "${var.asg_max_size}"
  desired_capacity    = "${var.asg_desired_size}"

  tags = "${var.asg_tags}"
}
