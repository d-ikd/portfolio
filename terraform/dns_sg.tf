/* SecurityGroup for ALB */
resource "aws_security_group" "portfolio-alb-sg" {
  description = "ALB security group for portfolio"
  name        = "portfolio-alb-sg"
  vpc_id      = aws_vpc.portfolio-vpc.id
}
