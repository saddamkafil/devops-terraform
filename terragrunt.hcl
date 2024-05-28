locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  #aws_profile = local.account_vars.locals.aws_profile_name
  aws_bucket = local.account_vars.locals.aws_s3_bucket_name
  #aws_dynamo = local.account_vars.locals.aws_dynamo_tablei
  #role_arn = local.account_var.local.role_arn
}

terraform {
  extra_arguments "aws_profile" {
    commands = [
      "init",
      "apply",
      "refresh",
      "import",
      "plan",
      "taint",
      "untaint"
    ]
    env_vars = {
      #AWS_PROFILE = "${local.aws_profile}"
      #ROLE_ARN = "{local.role_arn}"
    }
  }
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "${local.aws_bucket}"
    key = "${path_relative_to_include()}/terraform.tfstate"
    #key = "${find_in_parent_folders()}/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "${local.aws_dynamo}"
    #profile = "${local.aws_profile}"
    #role_arn = "${local.role_arn}"
  }
}

/*
generate "provider" {
  path = "provider.tf"
  if_exists = "skip"
  contents = <<EOF
provider "aws" {
  profile = "${local.aws_profile}"
}
EOF
}
*/
