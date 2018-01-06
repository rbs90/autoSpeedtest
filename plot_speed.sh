#!/bin/bash

#/usr/bin/rsync rbs90.de:/root/speedtest_log speedtest_log_rbs90.de
/usr/bin/gnuplot plot_speed.gp

/bin/cp speed.png speed_$(date +"%Y_%m_%d").png
/bin/cp speed.png /var/www/html/speed/speed_$(date +"%Y_%m_%d").png
#/usr/bin/rsync speed.png rbs90.de:/var/www/speed/speed_$(date +"%Y_%m_%d").png

