#!/bin/sh
echo "Starting module called 03-run" >> /tmp/progress.log

# add website code
echo "<h1>My Super Awesome Website</h1>" > /var/www/html/index.html
echo "by: YOUR NAME HERE" >> /var/www/html/index.html
echo "<p>" >> /var/www/html/index.html
echo "My favorite meme is:" >> /var/www/html/index.html
echo "<p>" >> /var/www/html/index.html
echo "<img src='URL-of-your-favorite-meme'>" >>/var/www/html/index.html