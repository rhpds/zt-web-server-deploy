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
sudo useradd -m -s /usr/sbin/nologin textedit-user
touch /var/www/html/index.html
# Give read & write permission for index.html
sudo setfacl -m u:textedit-user:rw /var/www/html/index.html

# allow textedit-user to use cockpit without login
tee /etc/pam.d/cockpit-nopass << EOF
# PAM configuration for Cockpit – password‑less for textedit-user
auth    sufficient   pam_succeed_if.so user = textedit-user
auth    required     pam_unix.so nullok

account required     pam_unix.so
password required    pam_unix.so
session required     pam_unix.so
EOF

tee /etc/cockpit/cockpit.conf  << EOF
[WebService]
pam-service = cockpit-nopass
EOF

systemctl restart cockpit