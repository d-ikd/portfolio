/* Frontend ALB */
resource "aws_lb" "myportfolio-frontend-alb" {
  name                       = "myportfolio-frontend-alb"
  load_balancer_type         = "application"
  internal                   = false
  idle_timeout               = 60
  enable_deletion_protection = false

  subnets = [
    aws_subnet.myportfolio-front-1a.id,
    aws_subnet.myportfolio-front-1c.id
  ]

  security_groups = [
    aws_security_group.myportfolio-alb-sg.id
  ]

  tags = {
    Name = "myportfolio-frontend-alb"
  }
}

/* Backend ALB */
resource "aws_lb" "myportfolio-backend-alb" {
  name                       = "myportfolio-backend-alb"
  load_balancer_type         = "application"
  internal                   = false
  idle_timeout               = 60
  enable_deletion_protection = false

  subnets = [
    aws_subnet.myportfolio-back-1a.id,
    aws_subnet.myportfolio-back-1c.id
  ]

  security_groups = [
    aws_security_group.myportfolio-alb-sg.id
  ]

  tags = {
    Name = "myportfolio-backend-alb"
  }
}


/* Frontend Listener */
resource "aws_lb_listener" "myportfolio-http-listener" {
  load_balancer_arn = aws_lb.myportfolio-frontend-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}
resource "aws_lb_listener" "myportfolio-https-listener" {
  load_balancer_arn = aws_lb.myportfolio-frontend-alb.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate.myportfolio-frontend-acm.arn

  default_action {
    target_group_arn = aws_lb_target_group.myportfolio-frontend-alb-tg.arn
    type             = "forward"
  }
}

/* Backend Listener */
resource "aws_lb_listener" "myportfolio-backend-http-listener" {
  load_balancer_arn = aws_lb.myportfolio-backend-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "myportfolio-backend-https-listener" {
  load_balancer_arn = aws_lb.myportfolio-backend-alb.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate.myportfolio-backend-acm.arn

  default_action {
    target_group_arn = aws_lb_target_group.myportfolio-backend-alb-tg.arn
    type             = "forward"
  }
}


/* TargetGroup */
resource "aws_lb_target_group" "myportfolio-frontend-alb-tg" {
  name        = "myportfolio-frontend-alb-tg"
  target_type = "ip"
  vpc_id      = aws_vpc.myportfolio-vpc.id
  port        = 80
  protocol    = "HTTP"

  health_check {
    enabled             = true
    path                = "/"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 120
    interval            = 150
    matcher             = 200
    port                = 80
    protocol            = "HTTP"
  }
}

resource "aws_lb_target_group" "myportfolio-backend-alb-tg" {
  name        = "myportfolio-backend-alb-tg"
  target_type = "ip"
  vpc_id      = aws_vpc.myportfolio-vpc.id
  port        = 80
  protocol    = "HTTP"

  health_check {
    enabled             = true
    interval            = 60
    path                = "/api/v1/health_check"
    port                = 3000
    protocol            = "HTTP"
    matcher             = 200
    timeout             = 50
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
}
