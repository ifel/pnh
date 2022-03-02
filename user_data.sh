#!/bin/bash
set -x 
sudo systemctl start amazon-ssm-agent
ulimit -n 100000
wget -O plow.tar.gz https://github.com/six-ddc/plow/releases/download/v1.1.0/plow_1.1.0_linux_amd64.tar.gz
tar -xzf plow.tar.gz
chmod u+x ./plow
./plow -c 300 -d 600s URL_HERE
#sudo yum install docker -y
#sudo service docker start
#sudo docker run -i --rm alpine/bombardier -c 750 -d 600s -l URL_HERE >> /home/ec2-user/log.txt 
#sudo shutdown now
