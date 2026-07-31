provider "aws" {
  region = "us-east-1"
}

# VIOLATION: Publicly accessible S3 bucket
resource "aws_s3_bucket" "demo_bucket" {
  bucket = "oxvenia-demo-insecure-bucket"
}

resource "aws_s3_bucket_public_access_block" "demo_bucket_access" {
  bucket = aws_s3_bucket.demo_bucket.id

  # Making it public for the sake of demo
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
