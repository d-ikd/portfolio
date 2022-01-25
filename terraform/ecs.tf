/* Cluster Defenition */
resource "aws_ecs_cluster" "myportfolio-ecs-cluster" {
  name = "myportfolio-ecs-cluster"
}

/* Front TaskDefinition */
resource "aws_ecs_task_definition" "myportfolio-frontend-task" {
  family                   = "myportfolio-frontend-task"
  cpu                      = "512"
  memory                   = "1024"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./tasks/myportfolio_frontend_definition.json")
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}

/* Back TaskDefinition */
resource "aws_ecs_task_definition" "myportfolio-backend-task" {
  family                   = "myportfolio-backend-task"
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./tasks/myportfolio_back_definition.json")
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}

/* Front ServiceDefinition */
resource "aws_ecs_service" "myportfolio-frontend-ecs-service" {
  name                              = "myportfolio-frontend-ecs-service"
  cluster                           = aws_ecs_cluster.myportfolio-ecs-cluster.arn
  task_definition                   = "${aws_ecs_task_definition.myportfolio-frontend-task.family}:${max("${aws_ecs_task_definition.myportfolio-frontend-task.revision}", "${data.aws_ecs_task_definition.myportfolio-frontend-task.revision}")}"
  desired_count                     = 1
  launch_type                       = "FARGATE"
  platform_version                  = "1.3.0"
  health_check_grace_period_seconds = 600

  network_configuration {
    assign_public_ip = true
    security_groups = [
      aws_security_group.myportfolio-ecs-sg.id
    ]
    subnets = [
      aws_subnet.myportfolio-front-1a.id,
      aws_subnet.myportfolio-front-1c.id
    ]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.myportfolio-alb-frontend-tg.arn
    container_name   = "frontend-container"
    container_port   = "80"
  }
}

/* Back ServiceDefinition */
resource "aws_ecs_service" "myportfolio-backend-ecs-service" {
  name                              = "myportfolio-backend-ecs-service"
  cluster                           = aws_ecs_cluster.myportfolio-ecs-cluster.arn
  task_definition                   = "${aws_ecs_task_definition.myportfolio-backend-task.family}:${max("${aws_ecs_task_definition.myportfolio-backend-task.revision}", "${data.aws_ecs_task_definition.myportfolio-backend-task.revision}")}"
  desired_count                     = 1
  launch_type                       = "FARGATE"
  platform_version                  = "1.3.0"
  health_check_grace_period_seconds = 600

  network_configuration {
    assign_public_ip = true
    security_groups = [
      aws_security_group.myportfolio-ecs-sg.id
    ]
    subnets = [
      aws_subnet.myportfolio-back-1a.id,
      aws_subnet.myportfolio-back-1c.id
    ]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.myportfolio-alb-backend-tg.arn
    container_name   = "backend-container"
    container_port   = "3000"
  }
}

/* Task for Migration */
resource "aws_ecs_task_definition" "db-migrate" {
  family                   = "myportfolio-db-migrate"
  container_definitions    = file("./tasks/myportfolio_db_migrate_definition.json")
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}

/* data */
data "aws_ecs_task_definition" "myportfolio-frontend-task" {
  depends_on      = [aws_ecs_task_definition.myportfolio-frontend-task]
  task_definition = aws_ecs_task_definition.myportfolio-frontend-task.family
}
data "aws_ecs_task_definition" "myportfolio-backend-endtask" {
  depends_on      = [aws_ecs_task_definition.myportfolio-backend-endtask]
  task_definition = aws_ecs_task_definition.myportfolio-backend-endtask.family
}

/* Reference AmazonECSTaskExecutionRolePolicy */
data "aws_iam_policy" "ecs_task_execution_role_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

/* PolicyDocument */
data "aws_iam_policy_document" "ecs_task_execution" {
  source_json = data.aws_iam_policy.ecs_task_execution_role_policy.policy

  statement {
    effect    = "Allow"
    actions   = ["ssm:GetParameters", "kms:Decrypt"]
    resources = ["*"]
  }
}

/* IAM Role */
module "ecs_task_execution_role" {
  source     = "./iam_role"
  name       = "ecs-task-execution"
  identifier = "ecs-tasks.amazonaws.com"
  policy     = data.aws_iam_policy_document.ecs_task_execution.json
}
