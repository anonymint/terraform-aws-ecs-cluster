variable "role_name" {
  description = "Role name"
}

variable "ideantifiers" {
  type        = "list"
  description = "List of princiapls identifiers eg. ecs.amazon.com, ec2.amazonaws.com"
}

variable "actions" {
  type        = "list"
  description = "List of policy actions"

  default = [
    "sts:AssumeRole"
  ]
}

variable "policy_arns" {
  type        = "list"
  description = "List of policy arns to attach to this role"
  default     = []
}

variable "create_instance_role" {
  description = "Need to create a same name instance role or not"
  default     = false
}
