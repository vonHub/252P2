#!/bin/bash

#DO NOT REMOVE THE FOLLOWING TWO LINES
git add $0 >> .local.git.out
git commit -a -m "Lab 2 commit" >> .local.git.out

#Your code here

pw=$(cat $1)

if [[ ${#pw} -lt 6 ]] || [[ ${#pw} -gt 32 ]] ; then
    echo "Error: Password length invalid."
    exit
fi

SCORE=${#pw}
echo "Password: "$pw
echo "Length: "$SCORE

if grep -q [\(\)\#$+%@] $1 ; then
    let SCORE=SCORE+5
    echo "Has a special character: +5"
fi

if grep -q [0-9] $1 ; then
    let SCORE=SCORE+5
    echo "Has a number: +5"
fi

if grep -q [A-Za-z] $1 ; then
    let SCORE=SCORE+5
    echo "Has a char: +5"
fi

r="([A-Za-z])\1+"
if egrep -q $r $1 ; then
    let SCORE=SCORE-10
    echo "Is stupid: -10"
fi

echo $SCORE
