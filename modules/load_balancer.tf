resource "aws_lb" "my-load-balancer" {
  name               = "my-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.load_balancer_security_group_id]  
  subnets            = [var.load_balancer_subnets]
  enable_deletion_protection = false
}