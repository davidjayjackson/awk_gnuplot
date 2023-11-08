set datafile separator comma
# set key autotitle columnheader
set terminal png
set  output "open_volume.png"
set title "ET Daily Volume and Opening"
set ylabel "Opening"
set xlabel "Volume"
set key autotitle nocolumnhead
set key title "Volume"
set key title "Opening"
plot "ET.csv" using 1:2

 