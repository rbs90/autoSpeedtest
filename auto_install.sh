#!/bin/bash
echo "=== Auto-Speedtest Installer ==="
echo "Installiere Vorraussetzungen..."
apt update
apt -y install gnuplot speedtest-cli apache2 php7.0

echo "Download von github..."
cd /tmp/
wget -q https://github.com/rbs90/autoSpeedtest/archive/master.zip
mkdir -p /root//speedtest/
mkdir -p /tmp/speed/
unzip -o /tmp/master.zip -d /tmp/speed/
mv /tmp/speed/autoSpeedtest-master/* /root/speedtest/
chmod +x /root/speedtest/*.sh
chmod +x /root/speedtest/*.gp

echo "Erstelle Cronjob (automatisierter Aufruf)"
crontab -l | { cat; echo "3,33 * * * * cd /root/speedtest/ && ./auto_speedtest.sh >> speedtest_log"; } | crontab -
crontab -l | { cat; echo "5,35 * * * * cd /root/speedtest/ && ./plot_speed.sh"; } | crontab -
crontab -l | { cat; echo "10 0 * * * cd /root/speedtest/ && ./speed_rotate.sh"; } | crontab -

echo "Erstelle Webserver-Verzeichnis und kopiere index.php..."
mkdir -p /var/www/html/speed/
cp /root/speedtest/index.php /var/www/html/speed/
chmod 775 /var/www/html/speed/ -R

echo "Fertig."
