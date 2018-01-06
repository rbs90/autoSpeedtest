#!/bin/bash
echo "=== Auto-Speedtest Installer ==="
echo "Installiere Vorraussetzungen..."
sudo apt -qq update
sudo apt -qq install gnuplot speedtest-cli lighttpd php5-common php-cgi php5
sudo lighty-enable-mod fastcgi-php
sudo service lighttpd restart

echo "Download von github..."
cd /tmp/
wget -q https://github.com/rbs90/autoSpeedtest/archive/master.zip
mkdir -p /home/pi/speedtest/
unzip /tmp/master.zip -d /home/pi/speedtest/

echo "Erstelle Cronjob (automatisierter Aufruf)"
crontab -l | { cat; echo "3,33 * * * * cd /home/pi/speedtest/ && ./auto_speedtest.sh >> speedtest_log"; } | crontab -
crontab -l | { cat; echo "5,35 * * * * cd /home/pi/speedtest/ && ./plot_speed.sh"; } | crontab -
crontab -l | { cat; echo "10 0 * * * cd /home/pi/speedtest/ && ./speed_rotate.sh"; } | crontab -

echo "Erstelle Webserver-Verzeichnis und kopiere index.php..."
mkdir -p /var/www/html/speed/
cp /home/pi/speedtest/index.php /var/www/html/speed/
chmod 775 /var/www/html/speed/ -R
sudo useradd -G www-data pi 

echo "Fertig."
