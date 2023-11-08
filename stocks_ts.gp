set datafile separator comma
set xdata time
set timefmt "%Y-&m-&d"
set xticks format "%d %b
set ytics nomirror
set y2tics
set ylabel "Mean ice cream consumption per head (g)
set y2label "Mean temperature (c)
set set top left reverse Left

plot ["1951-03-25":]
	"icecream" u 1:2 t "Ice cream" axes xly1 w 1p,
		"" u 1:3 axes x1y2 t "Temperature" w lp