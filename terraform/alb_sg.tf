/* SecurityGroup for ALB */
resource "aws_security_group" "myportfolio-alb-sg" {
  description = "ALB security group for myportfolio"
  name        = "myportfolio-alb-sg"
  vpc_id      = aws_vpc.myportfolio-vpc.id
}

/* security group for ALB*/
resource "aws_security_group_rule" "myportfolio-alb-sg-rule1" {
  description       = "myportfolio-alb-sg-rule1"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0", "0.0.0.0/16"]
  security_group_id = aws_security_group.myportfolio-alb-sg.id
}
resource "aws_security_group_rule" "myportfolio-alb-sg-rule2" {
  description       = "myportfolio-alb-sg-rule2"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0", "0.0.0.0/16"]
  security_group_id = aws_security_group.myportfolio-alb-sg.id
}
resource "aws_security_group_rule" "myportfolio-alb-sg-rule3" {
  description       = "myportfolio-alb-sg-rule3"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.myportfolio-alb-sg.id
}
resource "aws_security_group_rule" "myportfolio-alb-sg-rule4" {
  description       = "myportfolio-alb-sg-rule4"
  type              = "ingress"
  from_port         = 8
  to_port           = 0
  protocol          = "icmp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.myportfolio-alb-sg.id
}
resource "aws_security_group_rule" "myportfolio-alb-sg-rule5" {
  description       = "myportfolio-alb-sg-rule5"
  type              = "ingress"
  from_port         = 5000
  to_port           = 5000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.myportfolio-alb-sg.id
}
resource "aws_security_group_rule" "myportfolio-alb-sg-rule6" {
  description       = "myportfolio-alb-sg-rule6"
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.myportfolio-alb-sg.id
}
