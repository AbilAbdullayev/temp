resource "aws_cloudfront_origin_access_control" "oac" {
  name                              = "oac-${random_password.hash.result}"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"

  description                       = "Shared OAC for S3 buckets"
}

