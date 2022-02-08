/* security group for RDS */
resource "aws_security_group" "realshinkitv-rds-sg" {
  description = "RDS security group for realshinkitv"
  name        = "realshinkitv-rds-sg"
  vpc_id      = aws_vpc.realshinkitv-vpc.id
}

/* security group for ALB */
resource "aws_security_group" "realshinkitv-alb-sg" {
  description = "ALB security group for realshinkitv"
  name        = "realshinkitv-alb-sg"
  vpc_id      = aws_vpc.realshinkitv-vpc.id
}

/* security group for ECS */
resource "aws_security_group" "realshinkitv-ecs-sg" {
  description = "ECS security group for realshinkitv"
  name        = "realshinkitv-ecs-sg"
  vpc_id      = aws_vpc.realshinkitv-vpc.id
}
