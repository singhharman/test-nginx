#! /bin/bash
sudo yum update
sudo amazon-linux-extras install -y nginx1
sudo service nginx start
test=$(nginx \-v 2>&1)
sudo chmod 777 /usr/share/nginx/html/
echo $test > /usr/share/nginx/html/version.txt
mkdir /home/ec2-user/tools
sudo chmod 777 /home/ec2-user/tools
sudo aws s3 cp s3://artifacts.harmantraining/nginx-restart.sh /home/ec2-user/tools
#*/10 * * * * /home/ec2-user/tools/nginx-restart.sh