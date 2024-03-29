#!/bin/sh
# created by chris helming.
# chris dot helming at gmail

# get the current number of bytes in and bytes out
myvar1=`netstat -ib | grep -e "en1" -m 1 | awk '{print $7}'` #  bytes in
myvar3=`netstat -ib | grep -e "en1" -m 1 | awk '{print $10}'` # bytes out

#wait one second
sleep 1

# get the number of bytes in and out one second later
myvar2=`netstat -ib | grep -e "en1" -m 1 | awk '{print $7}'` # bytes in again
myvar4=`netstat -ib | grep -e "en1" -m 1 | awk '{print $10}'` # bytes out again

# find the difference between bytes in and out during that one second
subin=$(($myvar2 - $myvar1))
subout=$(($myvar4 - $myvar3))

# convert bytes to kilobytes
kbin=`echo "scale=2; $subin/1024;" | bc`
kbout=`echo "scale=2; $subout/1024;" | bc`

# print the results
echo "in: $kbin Kb/sec"
echo "out: $kbout Kb/sec"