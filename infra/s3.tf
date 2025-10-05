resource "random_id" "suffix" {
  byte_length = 4
}


resource "aws_s3_bucket" "test-s3-bucket" {
  bucket = "hello-html-${random_id.suffix.hex}"


  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "test" {
  bucket = aws_s3_bucket.test-s3-bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

