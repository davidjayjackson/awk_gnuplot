# Define a function to calculate the mean of an array
function mean(array, n) { sum = 0 for (i = 1; i <= n; i++) { sum += array[i] } return sum / n }

# Define a function to calculate the standard deviation of an array
function sd(array, n) { m = mean(array, n) ssq = 0 for (i = 1; i <= n; i++) { ssq += (array[i] - m)^2 } return sqrt(ssq / n) }

# Define a function to calculate the skewness of an array
function skew(array, n) { m = mean(array, n) s = sd(array, n) m3 = 0 for (i = 1; i <= n; i++) { m3 += (array[i] - m)^3 } return m3 / (n * s^3) }

# Define a function to calculate the kurtosis of an array
function kurt(array, n) { m = mean(array, n) s = sd(array, n) m4 = 0 for (i = 1; i <= n; i++) { m4 += (array[i] - m)^4 } return m4 / (n * s^4) - 3 # Subtracting 3 gives the excess kurtosis }

# Read the input numbers and store them in an array
BEGIN { FS = “\n” # Use newline as the field separator }

{ data[NR] = $1 # Store the number in the array at index NR (record number) }

END {

# Print the results
print “Skewness:”, skew(data, NR) print “Kurtosis:”, kurt(data, NR) }