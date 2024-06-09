# aws_batch_compute_environment.managed-batch:
resource "aws_batch_compute_environment" "managed-batch" {
  compute_environment_name = var.compute_environment_name #<batch-compute-environment-name>
  service_role             = var.service_role
  tags = {
    "Environment" = var.environment_tag
  }
  tags_all = {
    "Environment" = var.environment_tag
  }
  type = var.type

  compute_resources {
    allocation_strategy = var.allocation_strategy
    bid_percentage      = 0
    desired_vcpus       = var.desired_vcpus
    ec2_key_pair        = var.ec2_key_pair
    instance_role       = var.instance_role
    instance_type = [
      var.instance_type,
    ]
    max_vcpus = 256
    min_vcpus = 0
    security_group_ids = [
      var.security_group_ids,
    ]
    subnets = [
      var.subnet1,
      var.subnet2,
      var.subnet3,
    ]
    tags = {}
    type = var.instance_ondemand_tye

    ec2_configuration {
      image_type = var.image_type
    }

    launch_template {
      launch_template_id = aws_launch_template.managed-batch-LT.id
    }
  }
}

# aws_launch_template.managed-batch-LT:
resource "aws_launch_template" "managed-batch-LT" {
  default_version         = 1
  disable_api_stop        = false
  disable_api_termination = false
  image_id                = var.ami_id
  #latest_version          = 4
  name                   = var.launch_template_name
  tags                   = {}
  tags_all               = {}
  vpc_security_group_ids = []

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = var.ebs_volume_size
      volume_type = var.ebs_volume_type
    }
  }
}
