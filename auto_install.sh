#!/bin/bash
echo "=== Auto-Speedtest Installer ==="
echo "Installiere Vorraussetzungen..."
sudo apt update
sudo apt -y install gnuplot speedtest-cli apache2 php7.0

echo "Download von github..."
cd /tmp/
wget -q https://github.com/rbs90/autoSpeedtest/archive/master.zip
mkdir -p /home/pi/speedtest/
mkdir -p /tmp/speed/
unzip -o /tmp/master.zip -d /tmp/speed/
mv /tmp/speed/autoSpeedtest-master/* /home/pi/speedtest/
chmod +x /home/pi/speedtest/*.sh
chmod +x /home/pi/speedtest/*.gp

echo "Erstelle Cronjob (automatisierter Aufruf)"
crontab -l | { cat; echo "3,33 * * * * cd /home/pi/speedtest/ && ./auto_speedtest.sh >> speedtest_log"; } | crontab -
crontab -l | { cat; echo "5,35 * * * * cd /home/pi/speedtest/ && ./plot_speed.sh"; } | crontab -
crontab -l | { cat; echo "10 0 * * * cd /home/pi/speedtest/ && ./speed_rotate.sh"; } | crontab -

echo "Erstelle Webserver-Verzeichnis und kopiere index.php..."
sudo mkdir -p /var/www/html/speed/
sudo cp /home/pi/speedtest/index.php /var/www/html/speed/
sudo chmod 775 /var/www/html/speed/ -R
sudo usermod -a -G www-data pi 

echo "Fertig."
