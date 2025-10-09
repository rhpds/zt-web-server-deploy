#!/bin/bash

dnf -y remove httpd httpd-core httpd-filesystem
git clone https://github.com/ellisonleao/clumsy-bird /var/www/html/clumsy-bird
echo "DONE" >> /root/post-run.log

dnf install -y nano vim