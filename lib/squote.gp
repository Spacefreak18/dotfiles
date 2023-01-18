set terminal dumb; set datafile separator ','; set format y '%.0f'; set xdata time; set timefmt '%Y-%m-%d'; plot for [col=1:1] '/home/paul/.cache/squote_data.csv' using 1:2
