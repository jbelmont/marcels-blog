#! /usr/local/bin/awk -f

BEGIN {
    fruits[0] = "apples";
    fruits[1] = "oranges";
    fruits[2] = "strawberries";
    fruits[3] = "bananas";
    fruits[4] = "mangoes";

    for (fruit in fruits) 
        print fruits[fruit];
}