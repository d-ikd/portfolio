/* Defenition of Cluster */
resource "aws_ecs_cluster" "realshinkitv-ecs-cluster" {
  name = "realshinkitv-ecs-cluster"
}

/* Front TaskDefinition */
resource "aws_ecs_task_definition" "realshinkitv-frontend-task" {
  family                   = "realshinkitv-frontend-task"
  cpu                      = "512"
  memory                   = "1024"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./tasks/realshinkitv_frontend_definition.json")
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}

/* Back TaskDefinition */
resource "aws_ecs_task_definition" "realshinkitv-backend-task" {
  family                   = "realshinkitv-backend-task"
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./tasks/realshinkitv_back_definition.json")
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}

/* Front ServiceDefinition */
resource "aws_ecs_service" "realshinkitv-frontend-ecs-service" {
  name                              = "realshinkitv-frontend-ecs-service"
  cluster                           = aws_ecs_cluster.realshinkitv-ecs-cluster.arn
  task_definition                   = "${aws_ecs_task_definition.realshinkitv-frontend-task.family}:${max("${aws_ecs_task_definition.realshinkitv-frontend-task.revision}", "${data.aws_ecs_task_definition.realshinkitv-frontend-task.revision}")}"
  desired_count                     = 1
  launch_type                       = "FARGATE"
  platform_version                  = "1.3.0"
  health_check_grace_period_seconds = 600

  network_configuration {
    assign_public_ip = true
    security_groups = [
      aws_security_group.realshinkitv-ecs-sg.id
    ]
    subnets = [
      aws_subnet.realshinkitv-front-1a.id,
      aws_subnet.realshinkitv-front-1c.id
    ]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.realshinkitv-alb-frontend-tg.arn
    container_name   = "frontend-container"
    container_port   = "80"
  }
}

/* Back ServiceDefinition */
resource "aws_ecs_service" "realshinkitv-backend-ecs-service" {
  name                              = "realshinkitv-backend-ecs-service"
  cluster                           = aws_ecs_cluster.realshinkitv-ecs-cluster.arn
  task_definition                   = "${aws_ecs_task_definition.realshinkitv-backend-task.family}:${max("${aws_ecs_task_definition.realshinkitv-backend-task.revision}", "${data.aws_ecs_task_definition.realshinkitv-backend-task.revision}")}"
  desired_count                     = 1
  launch_type                       = "FARGATE"
  platform_version                  = "1.3.0"
  health_check_grace_period_seconds = 600

  network_configuration {
    assign_public_ip = true
    security_groups = [
      aws_security_group.realshinkitv-ecs-sg.id
    ]
    subnets = [
      aws_subnet.realshinkitv-back-1a.id,
      aws_subnet.realshinkitv-back-1c.id
    ]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.realshinkitv-alb-backend-tg.arn
    container_name   = "backend-container"
    container_port   = "3000"
  }
}

/* Task for Migration */
resource "aws_ecs_task_definition" "db-migrate" {
  family                   = "realshinkitv-db-migrate"
  container_definitions    = file("./tasks/realshinkitv_db_migrate_definition.json")
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}

/* data */
data "aws_ecs_task_definition" "realshinkitv-frontend-task" {
  depends_on      = [aws_ecs_task_definition.realshinkitv-frontend-task]
  task_definition = aws_ecs_task_definition.realshinkitv-frontend-task.family
}
data "aws_ecs_task_definition" "realshinkitv-backend-task" {
  depends_on      = [aws_ecs_task_definition.realshinkitv-backend-task]
  task_definition = aws_ecs_task_definition.realshinkitv-backend-task.family
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
