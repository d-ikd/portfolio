/* Defenition of Cluster */
resource "aws_ecs_cluster" "cs-ecs-cluster" {
  name = "cs-ecs-cluster"
}

/* Frontend: TaskDefinition */
resource "aws_ecs_task_definition" "cs-frontend-task" {
  family                   = "cs-frontend-task"
  cpu                      = "512"
  memory                   = "1024"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./tasks/cs_frontend_definition.json")
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}
/* Backend: TaskDefinition */
resource "aws_ecs_task_definition" "cs-backend-task" {
  family                   = "cs-backend-task"
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./tasks/cs_backend_definition.json")
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}


/* Backend: ServiceDefenition */
resource "aws_ecs_service" "cs-backend-ecs-service" {
  name            = "cs-backend-ecs-service"
  cluster         = aws_ecs_cluster.cs-ecs-cluster.arn
  task_definition = "${aws_ecs_task_definition.cs-backend-task.family}:${max(aws_ecs_task_definition.cs-backend-task.revision, data.aws_ecs_task_definition.cs-backend-task.revision)}"
  #  this & that
  #  task_definition = "${aws_ecs_task_definition.this[each.key].family}:${max(aws_ecs_task_definition.this[each.key].revision, data.aws_ecs_task_definition.this[each.key].revision)}"
  #  task_definition                   = "${aws_ecs_task_definition.cs-backend-task.family}:${max("${aws_ecs_task_definition.cs-backend-task.revision}", "${data.aws_ecs_task_definition.cs-backend-task.revision}")}"
  #  https://hashicorp6.rssing.com/chan-74714669/all_p54.html
  desired_count                     = 1
  launch_type                       = "FARGATE"
  platform_version                  = "1.3.0"
  health_check_grace_period_seconds = 600

  network_configuration {
    assign_public_ip = true
    security_groups = [
      aws_security_group.cs-ecs-sg.id
    ]
    subnets = [
      aws_subnet.cs-back-1a.id,
      aws_subnet.cs-back-1c.id
    ]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.cs-alb-backend-tg.arn
    container_name   = "backend-container"
    container_port   = "3000"
  }
}
/* Frondend: ServiceDefenition */
resource "aws_ecs_service" "cs-frontend-ecs-service" {
  name                              = "cs-frontend-ecs-service"
  cluster                           = aws_ecs_cluster.cs-ecs-cluster.arn
  task_definition                   = "${aws_ecs_task_definition.cs-frontend-task.family}:${max(aws_ecs_task_definition.cs-frontend-task.revision, data.aws_ecs_task_definition.cs-frontend-task.revision)}"
  desired_count                     = 1
  launch_type                       = "FARGATE"
  platform_version                  = "1.3.0"
  health_check_grace_period_seconds = 600

  network_configuration {
    assign_public_ip = true
    security_groups = [
      aws_security_group.cs-ecs-sg.id
    ]
    subnets = [
      aws_subnet.cs-front-1a.id,
      aws_subnet.cs-front-1c.id
    ]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.cs-frontend-alb-tg.arn
    container_name   = "frontend-container"
    container_port   = "80"
  }
}


/* Tasks for Migration */
resource "aws_ecs_task_definition" "db-migrate" {
  family                   = "cs-db-migrate"
  container_definitions    = file("./tasks/cs_db_migrate_definition.json")
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}

/* data */
data "aws_ecs_task_definition" "cs-frontend-task" {
  depends_on      = [aws_ecs_task_definition.cs-frontend-task]
  task_definition = aws_ecs_task_definition.cs-frontend-task.family
}

data "aws_ecs_task_definition" "cs-backend-task" {
  depends_on      = [aws_ecs_task_definition.cs-backend-task]
  task_definition = aws_ecs_task_definition.cs-backend-task.family
}

data "aws_iam_policy" "ecs_task_execution_role_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

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
