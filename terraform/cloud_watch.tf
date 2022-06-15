resource "aws_cloudwatch_log_group" "realshinkitv-ecs-backend" {
  name              = "/ecs/backend"
  retention_in_days = 180
}
resource "aws_cloudwatch_log_group" "realshinkitv-ecs-frontend" {
  name              = "/ecs/frontend"
  retention_in_days = 180
}
resource "aws_cloudwatch_log_group" "realshinkitv-ecs-db-create" {
  name              = "/ecs/db-create"
  retention_in_days = 180
}
resource "aws_cloudwatch_log_group" "realshinkitv-ecs-db-migrate" {
  name              = "/ecs/db-migrate"
  retention_in_days = 180
}
resource "aws_cloudwatch_log_group" "realshinkitv-ecs-db-seed" {
  name              = "/ecs/db-seed"
  retention_in_days = 180
}
