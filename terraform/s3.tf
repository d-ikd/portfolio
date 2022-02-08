resource "aws_s3_bucket" "realshinkitv-s3-bucket" {
  bucket = "realshinkitv-s3-bucket-for-images"
  acl    = "public-read"

  tags = {
    Name = "realshinkitv-s3-bucket-for-images"
  }
}

resource "aws_s3_bucket" "realshinkitv-alb-log" {
  bucket = "artifact-terraform-for-realshinkitv"

  lifecycle_rule {
    enabled = true

    expiration {
      days = "180"
    }
  }
}
