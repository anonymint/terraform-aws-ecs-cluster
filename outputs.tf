output ecs_cluster_name {
  value = "${aws_ecs_cluster.this.name}"
  description = "The ECS Cluster name"
}

output ecs_cluster_id {
  value = "${aws_ecs_cluster.this.id}"
  description = "The ECS Cluster id"
}

output asg_id {
  value = "${module.asg.this_autoscaling_group_id}"
  description = "The Autoscaling Group ID as part of ECS"
}

output asg_name {
  value = "${module.asg.this_autoscaling_group_name}"
  description = "The Autoscaling Group name as part of ECS"
}

output asg_arn {
  value = "${module.asg.this_autoscaling_group_arn}"
  description = "The Autoscaling Group ARN as part of ECS"
}

output asg_lc_id {
  value = "${module.asg.this_launch_configuration_id}"
  description = "The Launch Configuration Id"
}