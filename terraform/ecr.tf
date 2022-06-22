resource "aws_ecr_repository" "portfolio-frontend" {
  name                 = "portfolio-frontend"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
resource "aws_ecr_repository" "portfolio-backend" {
  name                 = "portfolio-backend"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
