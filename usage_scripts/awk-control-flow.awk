{
    i = 1;
    while (i < NF) {
        if (i % 2 == 0 ) {
            print $i " Ding Dong";
        } else {
            print $i;
        }
        i++;
    }
}