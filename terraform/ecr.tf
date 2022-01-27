resource "aws_ecr_repository" "realshinkitv-frontend" {
  name                 = "realshinkitv-frontend"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
resource "aws_ecr_repository" "realshinkitv-backend" {
  name                 = "realshinkitv-backend"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
