resource "aws_ecr_repository" "myportfolio-frontend" {
  name                 = "myportfolio-frontend"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
resource "aws_ecr_repository" "myportfolio-backend" {
  name                 = "myportfolio-backend"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
