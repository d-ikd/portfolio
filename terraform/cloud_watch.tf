resource "aws_cloudwatch_log_group" "cs-ecs-back" {
  name              = "/ecs/backend"
  retention_in_days = 180
}
resource "aws_cloudwatch_log_group" "cs-ecs-front" {
  name              = "/ecs/frontend"
  retention_in_days = 180
}
resource "aws_cloudwatch_log_group" "cs-ecs-db-migrate" {
  name              = "/ecs/db-migrate"
  retention_in_days = 180
}
