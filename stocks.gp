set terminal svg
set  output "et_volume.svg"
set title "ET Daily Volume"
set ylabel "Volume"
set xlabel "Days"
plot "volume.txt" using 2 with lines

 