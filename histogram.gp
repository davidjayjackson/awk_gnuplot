# Setup the plot environment
set terminal png size 800,600
set output "histogram__total_bags.png"
set title "Histogram of Total Bags Shipped(Avocado)"
set xlabel "Total Bags"
set ylabel "Frequency"

# Set bin width and range
bin_width = 4000000
bin_number(x) = floor(x/bin_width)

# Set fill style
set style fill solid

# Generate the histogram
plot 'data.txt' using (bin_number($1)):(1.0) smooth freq with boxes notitle
