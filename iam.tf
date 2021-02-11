data "aws_iam_policy_document" "test101_ec2_document" {
 statement {
   effect = "Allow"
   principals { 
     identifiers = ["ec2.amazonaws.com"]
     type = "Service"
   }
   actions = ["sts:AssumeRole"]
 }
}

data "aws_iam_policy_document" "test101_s3_document" {
 statement {
   effect = "Allow"
   actions = ["s3:*"]
   resources = [ 
        "arn:aws:s3:::artifacts.harmantraining",
        "arn:aws:s3:::artifacts.harmantraining/*"
   ]
}
}

resource "aws_iam_role" "test101_role" { 
  name = "test101_role"
  assume_role_policy = data.aws_iam_policy_document.test101_ec2_document.json
}

resource "aws_iam_role_policy" "test101_policy" {
  name = "test101_policy"
  role = aws_iam_role.test101_role.id
  policy = data.aws_iam_policy_document.test101_s3_document.json
}

resource "aws_iam_instance_profile" "test101_profile" {
    name = "test101_profile"
    role = aws_iam_role.test101_role.name 
}