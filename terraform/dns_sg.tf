/* SecurityGroup for ALB */
resource "aws_security_group" "cs-alb-sg" {
  description = "ALB security group for cs"
  name        = "cs-alb-sg"
  vpc_id      = aws_vpc.cs-vpc.id
}
