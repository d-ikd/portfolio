resource "aws_s3_bucket" "cs-s3-bucket" {
  bucket = "cs-s3-bucket-for-images"
  acl    = "public-read"

  tags = {
    Name = "cs-s3-bucket-for-images"
  }
}

resource "aws_s3_bucket" "cs-alb-log" {
  bucket = "artifact-terraform-for-cs"

  lifecycle_rule {
    enabled = true

    expiration {
      days = "180"
    }
  }
}
