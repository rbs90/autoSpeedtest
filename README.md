# autoSpeedtest

## Vorraussetzungen Debian
```
sudo apt install gnuplot speedtest-cli
```

## Installation des Skriptes
Download des Repos als zip, entpacken nach /home/pi/speedtest/

## Automatisch alle 15 Minuten aufrufen
```
crontab -e
```

Folgende Zeilen hinzufügen:
```
3,33 * * * * cd /home/pi/speedtest/ && ./auto_speedtest.sh >> speedtest_log
5,35 * * * * cd /home/pi/speedtest/ && ./plot_speed.sh
10 0 * * * cd /home/pi/speedtest/ && ./speed_rotate.sh 
```
