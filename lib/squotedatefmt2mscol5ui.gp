set datafile separator ','; set format y '%.0f'; set xdata time; set timefmt '%Y-%m-%d %H:%M:%S'; plot for [col=5:5] '/home/paul/.cache/squote_data.csv' using 1:5
