variable "compute_environment_name" {
  default = "<compute_environment_name>"
}

variable "service_role" {
  default = "service_role_arn"
}

variable "type" {
  description = "compute type"
  #example = "MANGED" or "FARGATE"
  default = "MANAGED"
}

variable "allocation_strategy" {
  default = "SPOT_CAPACITY_OPTIMIZED"
}

variable "desired_vcpus" {
  default = 50
}

variable "ec2_key_pair" {
  default = "<pemkey>"
}

variable "instance_role" {
  default = "<instance-profile-role>"
}

variable "instance_type" {
  default = "optimal"
}

variable "security_group_ids" {
  default = "sg_id"
}

variable "subnet1" {
  default = "subnet-072541dffe416a273"
}

variable "subnet2" {
  default = "subnet-080ca4bae7f28e8a9"
}

variable "subnet3" {
  default = "subnet-0fa602d9b7d5ac155"
}

variable "instance_ondemand_tye" {
  default = "SPOT"
}

variable "image_type" {
  default = "ECS_AL2"
}

variable "ami_id" {
  default = "AMI-ID" #optional
}

variable "launch_template_name" {
  default = "<launch_template_name>"
}
