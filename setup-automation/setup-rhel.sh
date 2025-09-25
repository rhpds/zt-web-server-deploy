#!/bin/bash

dnf -y remove httpd httpd-core httpd-filesystem
cd /var/www/html; git clone https://github.com/ellisonleao/clumsy-bird
echo "DONE" >> /root/post-run.log
