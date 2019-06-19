{
    for ( i = 1; i < NF; i++) {
        if (i % 2 == 0) {
            printf "%-5s ", $i;
        } else {
            printf "%10s ", $i;
        }
    }
}