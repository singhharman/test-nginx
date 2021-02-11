#! /bin/bash
sudo yum update
# install Nginx
sudo amazon-linux-extras install -y nginx1
# Start Nginx Service
sudo service nginx start
# Create a txt file and write Nginx version
test=$(nginx \-v 2>&1)
sudo chmod a+rw /usr/share/nginx/html/
echo $test > /usr/share/nginx/html/version.txt
# Make directory for tools
sudo aws s3 cp s3://artifacts.harmantraining/nginx-restart.sh /usr/bin/
sudo chmod a+rwx /usr/bin/nginx-restart.sh
# Schedule nginx restart bash script
(crontab -l ; echo "*/10 * * * * /usr/bin/nginx-restart.sh")| crontab -