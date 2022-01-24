# パブリックバケット
resource "aws_s3_bucket" "myportfolio-s3-bucket" {
  bucket = "myportfolio-s3-bucket-for-images"
  acl    = "public-read"

  tags = {
    Name = "myportfolio-s3-bucket-for-images"
  }
}

# ログバケット
resource "aws_s3_bucket" "myportfolio_alb_log" {
  bucket = "artifact-terraform-for-myportfolio"

  lifecycle_rule {
    enabled = true

    expiration {
      days = "180"
    }
  }
}
