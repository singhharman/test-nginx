resource "aws_iam_role" "test101_role" { 
  name = "test101_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
  }
  EOF
}

resource "aws_iam_role_policy" "test101_policy" {
  name = "test101_policy"
  role = aws_iam_role.test101_role.id
policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
    {
        "Sid": "VisualEditor0",
        "Effect": "Allow",
        "Action": "s3:*",
        "Resource": [
        "arn:aws:s3:::artifacts.harmantraining",
        "arn:aws:s3:::artifacts.harmantraining/*"
        ]
    }
    ]
}
EOF
}

resource "aws_iam_instance_profile" "test101_profile" {
    name = "test101_profile"
    role = aws_iam_role.test101_role.name 
  
}