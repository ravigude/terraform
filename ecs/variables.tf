ariable "aws_access_key" {
    description = "The AWS access key."
}

variable "aws_secret_key" {
    description = "The AWS secret key."
}

variable "region" {
    default = "us-east-1"
}

variable "availability_zone" {
    default = "us-east-1a"
}

variable "ecs_cluster_name" {
    default = "main"
}

variable "ami" {
    default =  "ami-f53ea5e2
}


variable "asg_min" {
    default = "1"
}

variable "asg_max" {
    default = "10"
}

variable "asg_desired" {
    default = "1"   
}

variable "instance_type" {
    default = "m4.large"
}

variable "ssh_key" {
    default = "Flash-admin"
}