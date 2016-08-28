provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.region}"
}

 #Load Balancer
resource "aws_security_group" "load_balancers" {
    
}


#ECS Cluster
resource "aws_ecs_cluster" "main" {
    name = "${var.ecs_cluster_name}"
}


#ASG
resource "aws_autoscaling_group" "ecs-cluster-asg" {
    availability_zones = ["us-east-1a,us-east-1b"]
    name = "ECS ${var.ecs_cluster_name}"
    min_size = "${var.autoscale_min}"
    max_size = "${var.autoscale_max}"
    desired_capacity = "${var.autoscale_desired}"
    health_check_type = "EC2"
    launch_configuration = "${aws_launch_configuration.ecs-cluster-asg.name}"
    vpc_zone_identifier = ["subnet-a6e8e98c,subnet-8b0effc2"]
    health_check_grace_period = "1000"
}

#launch Config
resource "aws_launch_configuration" "ecs-cluster-asf-lc" {
    name = "ECS ${var.ecs_cluster_name}"
    image_id = "${var.amis}"
    instance_type = "${var.instance_type}"
    security_groups = ["${aws_security_group.ecs.id}"]
    iam_instance_profile = "ecs-instance-role"
    key_name = "${var.ssh_key}"
    associate_public_ip_address = true
    user_data = "#!/bin/bash\necho ECS_CLUSTER='${var.ecs_cluster_name}' > /etc/ecs/ecs.config"
}

