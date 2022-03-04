/* alb */
resource "aws_lb" "realshinkitv-alb" {
  name                       = "realshinkitv-alb"
  load_balancer_type         = "application"
  internal                   = false
  idle_timeout               = 60
  enable_deletion_protection = false

  subnets = [
    aws_subnet.realshinkitv-frontend-1a.id,
    aws_subnet.realshinkitv-frontend-1c.id
  ]

  security_groups = [
    aws_security_group.realshinkitv-alb-sg.id
  ]

  tags = {
    Name = "realshinkitv-alb"
  }
}
resource "aws_lb" "realshinkitv-backend-alb" {
  name                       = "realshinkitv-backend-alb"
  load_balancer_type         = "application"
  internal                   = false
  idle_timeout               = 60
  enable_deletion_protection = false

  subnets = [
    aws_subnet.realshinkitv-backend-1a.id,
    aws_subnet.realshinkitv-backend-1c.id
  ]

  security_groups = [
    aws_security_group.realshinkitv-alb-sg.id
  ]

  tags = {
    Name = "realshinkitv-backend-alb"
  }
}

/* listener */
resource "aws_lb_listener" "realshinkitv-http-listener" {
  load_balancer_arn = aws_lb.realshinkitv-alb.arn
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
resource "aws_lb_listener" "realshinkitv-https-listener" {
  load_balancer_arn = aws_lb.realshinkitv-alb.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate.realshinkitv-frontend-acm.arn

  default_action {
    target_group_arn = aws_lb_target_group.realshinkitv-alb-frontend-tg.arn
    type             = "forward"
  }
}

# バックエンド用
resource "aws_lb_listener" "realshinkitv-backend-http-listener" {
  load_balancer_arn = aws_lb.realshinkitv-backend-alb.arn
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
resource "aws_lb_listener" "realshinkitv-backend-https-listener" {
  load_balancer_arn = aws_lb.realshinkitv-backend-alb.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate.realshinkitv-acm.arn

  default_action {
    target_group_arn = aws_lb_target_group.realshinkitv-alb-backend-tg.arn
    type             = "forward"
  }
}

/* target-group */
resource "aws_lb_target_group" "realshinkitv-alb-frontend-tg" {
  name        = "realshinkitv-alb-frontend-tg"
  target_type = "ip"
  vpc_id      = aws_vpc.realshinkitv-vpc.id
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

resource "aws_lb_target_group" "realshinkitv-alb-backend-tg" {
  name        = "realshinkitv-alb-backend-tg"
  target_type = "ip"
  vpc_id      = aws_vpc.realshinkitv-vpc.id
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
