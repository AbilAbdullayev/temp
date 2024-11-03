output origin_access_control_id {
  value       = aws_cloudfront_origin_access_control.oac.id
  sensitive   = false
  description = "-"
  depends_on  = []
}

output aws_cloudfront_dist_arn {
  value       = aws_cloudfront_distribution.dist.arn
  sensitive   = false
  description = "-"
  depends_on  = []
}

output aws_domain_name {
  value       = aws_cloudfront_distribution.dist.domain_name
  sensitive   = false
  description = "-"
  depends_on  = []
}
