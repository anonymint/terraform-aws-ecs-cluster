module "ecs" {
  source = "../../"

  asg_ami_id = "ami-b1498ccb"
  asg_instance_type = "t2.micro"
  asg_keypair_name      = "directpl-ops"
  cluster_name = "MyFirstCluster"

  asg_subnet_ids         = ["subnet-ecdebdb7"]
  asg_security_groups = ["sg-5dfd1421","sg-62fd141e", "sg-5cfd1420"]

  asg_root_block_device_volume_type = "gp2"
  asg_root_block_device_volume_size = "8"

  asg_desired_size = "0"
  asg_min_size = "0"
  asg_max_size = "0"

  asg_tags = [
    {
      key                 = "Environment"
      value               = "dev"
      propagate_at_launch = true
    },
    {
      key                 = "Application"
      value               = "MyFirstCluster"
      propagate_at_launch = true
    }
  ]
}

provider "aws" {
  region = "us-east-1"
  profile = "saml"
}
