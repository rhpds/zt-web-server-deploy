#!/bin/sh
echo "Starting module called 03-run" >> /tmp/progress.log

# add website code
echo "<h1>My Super Awesome Website</h1>" > /var/www/html/index.html
echo "by: YOUR NAME HERE" >> /var/www/html/index.html
echo "<p>" >> /var/www/html/index.html
echo "My favorite meme is:" >> /var/www/html/index.html
echo "<p>" >> /var/www/html/index.html
echo "<img src='URL-of-your-favorite-meme'>" >>/var/www/html/index.html

# make sure cockpit is installed
dnf -y install cockpit
# Enable cockpit functionality in showroom.
echo "[WebService]" > /etc/cockpit/cockpit.conf
echo "Origins = https://cockpit-${GUID}.${DOMAIN}" >> /etc/cockpit/cockpit.conf
echo "AllowUnencrypted = true" >> /etc/cockpit/cockpit.conf
systemctl enable --now cockpit.socket

# create a user for the cockpit text editor with very limited permissions
sudo useradd -p redhat textedit-user
touch /var/www/html/index.html
# Give read & write permission for index.html
sudo setfacl -m u:textedit-user:rw /var/www/html/index.html

systemctl restart cockpit