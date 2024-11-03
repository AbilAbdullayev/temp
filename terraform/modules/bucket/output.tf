output aws_bucket_regional_domain_name {
  value       = aws_s3_bucket.bucket.bucket_regional_domain_name
  sensitive   = false
  description = "-"
  depends_on  = []
}
output aws_bucket_name {
  value       = aws_s3_bucket.bucket.bucket
  sensitive   = false
  description = "-"
  depends_on  = []
}

