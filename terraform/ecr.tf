resource "aws_ecr_repository" "realshinkitv-front" {
  name                 = "realshinkitv-front"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
resource "aws_ecr_repository" "realshinkitv-back" {
  name                 = "realshinkitv-back"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
