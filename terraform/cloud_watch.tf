resource "aws_cloudwatch_log_group" "realshinkitv-ecs-back" {
  name              = "/ecs/back"
  retention_in_days = 180
}
resource "aws_cloudwatch_log_group" "realshinkitv-ecs-front" {
  name              = "/ecs/front"
  retention_in_days = 180
}
resource "aws_cloudwatch_log_group" "realshinkitv-ecs-db-migrate" {
  name              = "/ecs/db-migrate"
  retention_in_days = 180
}
