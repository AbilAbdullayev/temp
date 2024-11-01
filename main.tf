# AIClouds

# Create S3 bucket

resource "aws_s3_bucket" "statefile" {
  bucket = var.aws_bucket_name

  tags = {
    name        = "Terraform bucket"
    Environment = terraform.workspace
  }
}

resource "aws_s3_bucket_ownership_controls" "statefile" {
  bucket = aws_s3_bucket.statefile.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "statefile" {
  bucket = aws_s3_bucket.statefile.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_acl" "statefile" {
  depends_on = [aws_s3_bucket_ownership_controls.statefile,
    aws_s3_bucket_public_access_block.statefile
  ]

  bucket = aws_s3_bucket.statefile.id
  acl    = "private"
}
