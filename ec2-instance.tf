resource "aws_instance" "test_101" {
  ami           = "ami-0e5b37ba2c8e7cc82"
  instance_type = "t2.micro"
  key_name      = "webserver"
  security_groups = [
    aws_security_group.allow_rule_webserver.id
  ]
  subnet_id = aws_default_subnet.df_subnet.id
  root_block_device {
    volume_size = 30
    volume_type = "standard"
  }
  associate_public_ip_address = true
  user_data                   = file("install-nginx.sh")
  tags = {
    Name = "test_101"
  }
}


