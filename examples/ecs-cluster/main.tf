module "ecs" {
  source = "../../"

  #Required variables
  cluster_name   = "my-first-cluster"
  asg_ami_id     = "ami-ec33cc96"
  asg_subnet_ids = ["subnet-f9c073a1"]

  #Optional
  asg_security_groups = ["sg-c52493b4", "sg-b320a3cb"]
  asg_keypair_name    = "anonymint-only"
}
