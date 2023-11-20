#!/usr/bin/gawk -f

# Initialize arrays to store values and dates, set field separator to comma
BEGIN {
    FS = ",";
    for (i = 1; i <= 400; i++) {
        values[i] = 0;
    }
}

# Skip the first row
NR > 1 {
    # Add the new value and remove the oldest value for 300-day and 400-day calculations
    total300 -= values[(NR-2)%300 + 1];
    total400 -= values[(NR-2)%400 + 1];
    values[(NR-2)%400 + 1] = $2; # Assuming $2 is the value
    total300 += $2;
    total400 += $2;

    # Store the date
    dates[NR-1] = $1; # Assuming $1 is the date

    # Calculate and print moving averages after enough data points are available
    if (NR > 300) {
        ma300 = total300 / 300;
        if (NR > 400) {
            ma400 = total400 / 400;
            print dates[NR-1] ",


