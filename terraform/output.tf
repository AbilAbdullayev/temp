output "aws_account_id" {
  value       = try(module.resource-group.aws_account_id, null)
  sensitive   = true
  description = "AWS Project account ID"
  depends_on  = [module.resource-group]
}

output "app_url" {
  value       = try(module.cloudfront.aws_domain_name, "undefined")
  sensitive   = false
  description = "-"
  depends_on  = []
}

output "resources_tags" {
  value       = module.resource-group.aws_application_tag
  sensitive   = true
  description = "-"
  depends_on  = []
}

output "root_bucket_name" {
  value       = nonsensitive(module.app-root-bucket.aws_bucket_name)
  sensitive   = false
  description = "-"
  depends_on  = []
}

output "static_bucket_name" {
  value       = nonsensitive(module.app-static-bucket.aws_bucket_name)
  sensitive   = false
  description = "-"
  depends_on  = []
}
