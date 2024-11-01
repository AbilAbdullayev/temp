terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.72.0"
    }
  }
}

variable "workspace_iam_roles" {
  default = {
    develop    = "arn:aws:iam::DEVELOP-ACCOUNT-ID:role/projectTerraformAdminRole"
    production = "arn:aws:iam::PRODUCTION-ACCOUNT-ID:role/projectTerraformAdminRole"
  }
}

provider "aws" {
  # No credentials explicitly set here because they come from either the
  # environment or the global credentials file.

}
