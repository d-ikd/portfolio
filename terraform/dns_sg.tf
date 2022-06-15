/* SecurityGroup for ALB */
resource "aws_security_group" "realshinkitv-alb-sg" {
  description = "ALB security group for realshinkitv"
  name        = "realshinkitv-alb-sg"
  vpc_id      = aws_vpc.realshinkitv-vpc.id
}
