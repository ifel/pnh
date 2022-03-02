terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.region
  profile = var.profile
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}


resource "aws_launch_template" "on_demand" {
  name = var.lc_name
  image_id = var.ami_id
  instance_initiated_shutdown_behavior = "terminate" 
  instance_type = "t2.micro"
  iam_instance_profile {
    arn = aws_iam_instance_profile.profile.arn
  }
  user_data = filebase64("user_data.sh")
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "on-demand"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      Name = "on-demand"
    }
  }
  tag_specifications {
    resource_type = "network-interface"
    tags = {
      Name = "on-demand"
    }
  }
}

resource "aws_autoscaling_group" "on_demand" {
  name = var.asg_name
  capacity_rebalance  = true
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size
  vpc_zone_identifier = data.aws_subnets.default.ids
  health_check_grace_period = 180
  launch_template {
    id      = aws_launch_template.on_demand.id
    version = aws_launch_template.on_demand.latest_version
  }
}


resource "aws_iam_role" "instance" {
  name = "instance"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "attach" {
  name       = "attachment"
  roles      = [aws_iam_role.instance.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "profile" {
  name = "profile"
  role = aws_iam_role.instance.name
}