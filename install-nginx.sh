#! /bin/bash
sudo yum update
sudo amazon-linux-extras install -y nginx1
sudo service nginx start
test=$(nginx \-v 2>&1)
sudo chmod 777 /usr/share/nginx/html/
echo $test > /usr/share/nginx/html/version.txt
