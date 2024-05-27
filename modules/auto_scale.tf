resource "aws_iam_instance_profile" "instance_profile" {
  name = "instance-profile"
  role = aws_iam_role.autoscale_role.name
}

resource "aws_iam_role" "autoscale_role" {
  name = "auto-scaling-group-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_autoscaling_group" "autoscaling" {
  name                  = var.asg_name
  min_size              = var.min_size
  max_size              = var.max_size
  desired_capacity      = var.desired_capacity
  health_check_type     = "EC2"
  health_check_grace_period = 300
  force_delete          = true
  launch_configuration  = aws_launch_configuration.lc.name
}

resource "aws_launch_configuration" "lc" {
  name_prefix               = "example-lc"
  image_id                  = var.ami_id
  instance_type             = var.instance_type
  iam_instance_profile      = aws_iam_instance_profile.instance_profile.name
}


