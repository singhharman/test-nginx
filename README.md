Reference-style: 
![] https://github.com/singhharman/test-nginx/blob/main/diagrams/CurrentSolution.png

# **Test-Nginx**
The high leve explanation of the test nginx lab. The lab includes deployment of an Nginx web server and publish it on the web using ALB. The test-nginx lab is constructed using terraform. There are three main files.
1. networking
2. ec2-instance
3. alb

# networking
The networking terraform file contains all the networking related code. The details are listed below:
1. VPC
2. Subnet
3. Security Groups

# ec2-instance
The ec2-instance terraform file contains code to deploy EC2 instance with below configuration. The "install-nginx.sh" script is used for installing the ngnix server at the startup. The script also creates a version.txt file that highlights the nginx version. 
- Operating System: Amazon Linux 2
- Instance Type: t2.micro
- HardDisk: 30 GB

# alb
The alb terraform file contains code to deploy application load balance related components as listed below:
1. Load Balancer
2. Listner Rule
3. Target Group
4. Target Group Attachment






