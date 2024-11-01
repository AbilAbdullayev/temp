output "s3_bucket" {
  value       = aws_s3_bucket.statefile.id
  description = "Statefile"
  sensitive   = false
}