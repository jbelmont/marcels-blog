#! /usr/local/bin/awk -f

BEGIN {
    # Numeric Functions examples
    print sqrt(3);
    print rand();

    # String Functions examples
    nums["one"] = "one";
    nums["two"] = "two";
    nums["three"] = "three";
    asort(nums);
    for (num in nums)
        print nums[num];
    
    for (i=1; i <= 10; i++) {
        arr[i] = i+1;
    }
}
{
    # globally subsitute each record that matches on honda to mercury
    gsub(/honda/, "mercury"); print;
    split($6, strings, ":");
    print strings[1];
}

function average(arr) {
    sum = 0;
    for (i = 1; i <= length(arr); i++) {
        sum += i;
    }
    return sum / length(arr); 
}

END {
    avg = average(arr);
    print avg;
}