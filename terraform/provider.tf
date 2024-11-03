terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.72.0"
    }
  }
}

# No credentials explicitly set here because they come from either the
# environment or the global credentials file.

provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "project"
  region = var.project_default_region

  assume_role {
    role_arn    = var.workspace_iam_roles[terraform.workspace]
    external_id = var.project_role_external_id
  }

  default_tags {
    tags = {
      Environment = terraform.workspace
      Application = var.project_name
      Version     = var.release_version
      Author      = var.author
    }
  }
}