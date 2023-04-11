/* RDS */
variable "aws_db_user" {}
variable "aws_db_password" {}

resource "aws_db_parameter_group" "portfolio-db-parameter" {
  name   = "portfolio-db-parameter"
  family = "mysql5.7"

  parameter {
    name  = "character_set_database"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_server"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_connection"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_results"
    value = "utf8mb4"
  }
}

/* Database Instance */
resource "aws_db_instance" "portfolio-db" {
  # identifier              = Endpoint of Database"
  allocated_storage       = 20
  instance_class          = "db.t2.micro"
  engine                  = "MySQL"
  engine_version          = "5.7.33"
  storage_type            = "gp2"
  name                    = "production"
  username                = var.aws_db_user
  password                = var.aws_db_password
  backup_retention_period = 7
  copy_tags_to_snapshot   = true
  max_allocated_storage   = 200
  skip_final_snapshot     = true
  port                    = 3306
  vpc_security_group_ids  = [aws_security_group.portfolio-rds-sg.id]
  parameter_group_name    = aws_db_parameter_group.portfolio-db-parameter.name
  db_subnet_group_name    = aws_db_subnet_group.portfolio-rds-subnet-group.name
  enabled_cloudwatch_logs_exports = [
    "audit",
    "error",
    "general",
    "slowquery",
  ]

  lifecycle {
    prevent_destroy = false
  }

}


/* Subnet */
resource "aws_db_subnet_group" "portfolio-rds-subnet-group" {
  name        = "portfolio-rds-subnet-group"
  description = "RDS subnet for portfolio"
  subnet_ids  = [aws_subnet.portfolio-back-1a.id, aws_subnet.portfolio-back-1c.id]
}
