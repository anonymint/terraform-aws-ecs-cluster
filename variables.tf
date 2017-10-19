variable "cluster_name" {
  description = "ECS cluster name"
}

variable "asg_ami_id" {
  description = "AMI ID"
}

variable "asg_instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "asg_security_groups" {
  type        = "list"
  description = "List of security groups id"
  default     = []
}

variable "asg_keypair_name" {
  description = "keypair name"
  default     = ""
}

variable "asg_root_block_device_volume_type" {
  description = "Root block device volume type eg. gp2, io1, st1, standard"
  default     = "gp2"
}

variable "asg_root_block_device_volume_size" {
  description = "Root block device volume size in G"
  default     = 8
}

variable "asg_subnet_ids" {
  type        = "list"
  description = "List of subnet id"
}

variable "asg_min_size" {
  description = "Minimum # of instances"
  default     = 0
}

variable "asg_max_size" {
  description = "Maximum # of instances"
  default     = 1
}

variable "asg_desired_size" {
  description = "Desired # of instances"
  default     = 1
}

variable "asg_tags" {
  type        = "list"
  description = "tags of the ec2 in asg"
  default     = []
}
