variable "aws_region" {
  description = "AWS region for all resources."
  type        = string
  default     = "us-east-1"
}

variable "aws_bucket_name" {
  description = "AWS bucket name"
  type        = string
  default     = "terraform-1-tfstates"
}