#!/usr/bin/gnuplot
set terminal pngcairo size 1000,1000 enhanced font 'Verdana,10'
set output 'speed.png'

set xdata time
set logscale y 2
set xlabel "Zeit in GMT+1"
set ylabel "Mbit/s"
set timefmt "%s"
#set format x "%m/%d %H"
set format x "%H:%M"
plot "speedtest_log" using ($1+1*3600):2 title "Ping" with lines lc rgb "green", \
     "speedtest_log" using ($1+1*3600):3 title "Download" with lines lc rgb "blue", \
     "speedtest_log" using ($1+1*3600):4 title "Upload" with lines lc rgb "red", \
#     "speedtest_log_rbs90.de" using ($1+1*3600):2 title "Ping vServer" with lines dashtype 3 lc rgb "green", \
#     "speedtest_log_rbs90.de" using ($1+1*3600):3 title "Download vServer" with lines dashtype 3 lc rgb "blue", \
#     "speedtest_log_rbs90.de" using ($1+1*3600):4 title "Upload vServer" with lines dashtype 3 lc rgb "red", \
#     200 title "Soll" with lines dashtype 3 lc rgb "gray"

