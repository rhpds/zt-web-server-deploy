#!/bin/bash

dnf -y remove httpd httpd-core httpd-filesystem
git clone https://github.com/ellisonleao/clumsy-bird /var/www/html/clumsy-bird
echo "DONE" >> /root/post-run.log

# download sublime text for text editor
run --rm -it --shm-size=512m -p 6901:6901 -e VNC_PW=password kasmweb/sublime-text:1.17.0