#!/bin/bash

dnf -y remove httpd httpd-core httpd-filesystem

echo "DONE" >> /root/post-run.log
