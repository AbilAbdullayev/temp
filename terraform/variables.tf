variable "project_name" {
  type        = string
  default     = "REACT Webapp"
  description = "Project name"
}

variable "project_description" {
  type        = string
  default     = "Base AWS REACT Webapp application deployment"
  description = "Project description"
}

variable "release_version" {
  type        = string
  default     = "v5"
  description = "-"
}

variable "author" {
  type        = string
  default     = "tf"
  description = "-"
}

variable "project_default_region" {
  description = "AWS region for Projets resources."
  type        = string
  default     = "eu-central-1"
}

#
# CI variables

variable "aws_region" {
  description = "AWS region for all resources."
  type        = string
  default     = "eu-central-1"
}

variable "terraform_role_name" {
  type        = string
  default     = null
  description = "Default role name for delicate access"
}

variable "project_role_external_id" {
  type        = string
  default     = null
  description = "-"
}

# 2ref: 
variable "workspace_iam_roles" {
  type = map(any)
  default = {
    develop    = null
    staging    = null
    production = null
  }
  description = "List of accounts ARN  for workspaces"
}
