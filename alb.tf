resource "aws_alb" "test_alb_101" {
  name               = "test-alb-test-101"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_rule_alb.id]
  subnets = [
    aws_default_subnet.df_subnet.id,
    aws_default_subnet.df_subnet_az2.id
  ]

  tags = {
    env = "prod"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_alb.test_alb_101.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx-tg.arn
  }
}

resource "aws_lb_target_group" "nginx-tg" {
  name        = "nginx-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_default_subnet.df_subnet.vpc_id
  target_type = "instance"

}


resource "aws_lb_target_group_attachment" "nginx_servers" {
  target_group_arn = aws_lb_target_group.nginx-tg.arn
  target_id        = aws_instance.test_101.id
  port             = 80
}
