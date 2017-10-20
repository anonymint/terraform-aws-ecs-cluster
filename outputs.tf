output ecs_cluster_name {
  value = "${aws_ecs_cluster.this.name}"
}

output ecs_cluster_id {
  value = "${aws_ecs_cluster.this.id}"
}

output asg_id {
  value = "${module.asg.this_autoscaling_group_id}"
}

output asg_name {
  value = "${module.asg.this_autoscaling_group_name}"
}

output asg_arn {
  value = "${module.asg.this_autoscaling_group_arn}"
}

output asg_lc_id {
  value = "${module.asg.this_launch_configuration_id}"
}