output aws_application_tag {
  value       = aws_servicecatalogappregistry_application.project.application_tag
  sensitive   = false
  description = "-"
  depends_on  = []
}

output aws_account_id {
  value       = data.aws_caller_identity.project.account_id
  sensitive   = false
  description = "AWS Project account ID"
  depends_on  = [data.aws_caller_identity.project]
}