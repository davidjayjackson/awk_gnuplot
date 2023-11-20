# Initialize arrays to store values and dates
BEGIN {
    for (i = 1; i <= 200; i++) {
        values[i] = 0;
    }
}

{
    # Add the new value and remove the oldest value for 100-day and 200-day calculations
    total100 -= values[(NR-1)%100 + 1];
    total200 -= values[(NR-1)%200 + 1];
    values[(NR-1)%200 + 1] = $2; # Assuming $2 is the value for the day
    total100 += $2;
    total200 += $2;

    # Store the date
    dates[NR] = $1; # Assuming $1 is the date

    # Calculate and print moving averages after enough data points are available
    if (NR >= 100) {
        ma100 = total100 / 100;
        if (NR >= 200) {
            ma200 = total200 / 200;
            print dates[NR] ", " ma100 ", " ma200;
        } else {
            print dates[NR] ", " ma100 ", NA";
        }
    }
}
