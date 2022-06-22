resource "aws_s3_bucket" "portfolio-s3-bucket" {
  bucket = "portfolio-s3-bucket-for-images"
  acl    = "public-read"

  tags = {
    Name = "portfolio-s3-bucket-for-images"
  }
}

resource "aws_s3_bucket" "portfolio-alb-log" {
  bucket = "artifact-terraform-for-portfolio"

  lifecycle_rule {
    enabled = true

    expiration {
      days = "180"
    }
  }
}
