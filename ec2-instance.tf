resource "aws_instance" "test_101" {
 # ami           = "ami-0e5b37ba2c8e7cc82"
  ami            = "ami-047a51fa27710816e"
  instance_type = "t2.micro"
  key_name      = "webserver"
  security_groups = [
    aws_security_group.allow_rule_webserver.id
  ]
  subnet_id = aws_default_subnet.df_subnet_az1.id
  root_block_device {
    volume_size = 30
    volume_type = "standard"
  }
  iam_instance_profile = aws_iam_instance_profile.test101_profile.name
  associate_public_ip_address = true
  user_data                   = file("install-nginx.sh")
  tags = {
    Name = "test_101"
  }
}


