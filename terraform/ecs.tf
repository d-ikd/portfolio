/* クラスター */
resource "aws_ecs_cluster" "realshinkitv-ecs-cluster" {
  name = "realshinkitv-ecs-cluster"
}


/* フロント側 */

/* タスク定義 */
resource "aws_ecs_task_definition" "realshinkitv-front-task" {
  family                   = "realshinkitv-front-task"
  cpu                      = "512"
  memory                   = "1024"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./tasks/realshinkitv_frontend_definition.json")
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}

/* サービス定義 */
resource "aws_ecs_service" "realshinkitv-front-ecs-service" {
  name                              = "realshinkitv-front-ecs-service"
  cluster                           = aws_ecs_cluster.realshinkitv-ecs-cluster.arn
  task_definition                   = "${aws_ecs_task_definition.realshinkitv-front-task.family}:${max("${aws_ecs_task_definition.realshinkitv-front-task.revision}", "${data.aws_ecs_task_definition.realshinkitv-front-task.revision}")}"
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
    target_group_arn = aws_lb_target_group.realshinkitv-alb-front-tg.arn
    container_name   = "front-container"
    container_port   = "80"
  }
}


/* バック側 */

/* タスク定義 */
resource "aws_ecs_task_definition" "realshinkitv-back-task" {
  family                   = "realshinkitv-back-task"
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./tasks/realshinkitv_backend_definition.json")
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}

/* サービス定義 */
resource "aws_ecs_service" "realshinkitv-back-ecs-service" {
  name                              = "realshinkitv-back-ecs-service"
  cluster                           = aws_ecs_cluster.realshinkitv-ecs-cluster.arn
  task_definition                   = "${aws_ecs_task_definition.realshinkitv-back-task.family}:${max("${aws_ecs_task_definition.realshinkitv-back-task.revision}", "${data.aws_ecs_task_definition.realshinkitv-back-task.revision}")}"
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
    target_group_arn = aws_lb_target_group.realshinkitv-alb-back-tg.arn
    container_name   = "back-container"
    container_port   = "3000"
  }
}

/* データベース作成用タスク */
resource "aws_ecs_task_definition" "db-create" {
  family                   = "realshinkitv-db-create"
  container_definitions    = file("./tasks/realshinkitv_db_create_definition.json")
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}

/* マイグレーション用タスク */
resource "aws_ecs_task_definition" "db-migrate" {
  family                   = "realshinkitv-db-migrate"
  container_definitions    = file("./tasks/realshinkitv_db_migrate_definition.json")
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}

/* ファミリーを指定するだけで、そのファミリーの最新のACTIVEリビジョンを見つけることができる */
data "aws_ecs_task_definition" "realshinkitv-front-task" {
  depends_on      = [aws_ecs_task_definition.realshinkitv-front-task]
  task_definition = aws_ecs_task_definition.realshinkitv-front-task.family
}
data "aws_ecs_task_definition" "realshinkitv-back-task" {
  depends_on      = [aws_ecs_task_definition.realshinkitv-back-task]
  task_definition = aws_ecs_task_definition.realshinkitv-back-task.family
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

module "ecs_task_execution_role" {
  source     = "./iam_role"
  name       = "ecs-task-execution"
  identifier = "ecs-tasks.amazonaws.com"
  policy     = data.aws_iam_policy_document.ecs_task_execution.json
}
