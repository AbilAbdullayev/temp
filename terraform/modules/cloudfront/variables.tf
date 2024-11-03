variable root_bucket_domain_name {
  type        = string
  default     = null
  description = "-"
}

variable static_bucket_domain_name {
  type        = string
  default     = null
  description = "-"
}

variable aws_application_tags {
  type        = map
  default     = null
  description = "-"
}
