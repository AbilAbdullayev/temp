variable bucket_name {
  type        = string
  default     = null
  description = "Assets bucket name"
}

variable project_region {
  type = string
  default = null
}

variable origin_policy_id {
  type = string
  default = null
}

variable cloudfront_dist_arn {
  type        = string
  default     = null
  description = "-"
}

variable application_tags {
  type        = map
  default     = null
  description = "Application resource-group tags"
}
