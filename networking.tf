terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.27.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_default_subnet" "df_subnet" {
  availability_zone = "us-east-1a"

  tags = {
    Name = "df_us-east-1"
  }
}


resource "aws_default_subnet" "df_subnet_az2" {
  availability_zone = "us-east-1b"

  tags = {
    Name = "df_us-east-1b"
  }
}

resource "aws_security_group" "allow_rule_webserver" {
  name        = "allow_rule_webserver"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_default_subnet.df_subnet.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["99.235.138.16/32"]
  }
  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["99.235.138.16/32"]

  }
  ingress {
    description     = "http"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.allow_rule_alb.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_security_group" "allow_rule_alb" {
  name        = "allow_rule_alb"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_default_subnet.df_subnet.vpc_id

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http"
  }
}