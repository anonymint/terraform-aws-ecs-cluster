# terraform-aws-ecs-cluster
Terraform module decided for registry for ECS cluster with minimal friction

# Usage

```hcl
module "ecs" {
  source = "../../"

  asg_ami_id = "ami-xxxxxx"
  asg_instance_type = "t2.micro"
  asg_keypair_name      = "directpl-ops"
  cluster_name = "MyFirstCluster"

  asg_subnet_ids         = ["subnet-xxxxxxxx", "subnet-xxxxxxxx"]
  asg_security_groups = ["sg-xxxxxxxx","sg-xxxxxxxx", "sg-xxxxxxxx"]

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
      value               = "my-first-cluster"
      propagate_at_launch = true
    }
  ]
}
```

