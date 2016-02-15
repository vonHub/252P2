#!/bin/bash

#DO NOT REMOVE THE FOLLOWING TWO LINES
git add $0 >> .local.git.out
git commit -a -m "Lab 2 commit" >> .local.git.out

#Your code here

SCORE=0
pw=$(cat $1)

if [[ ${#pw} < 6 ]] || [[ ${#pw} > 32 ]] ; then
    echo "Error: Password length invalid."
fi

if grep -q [0-9] $1 ; then
    let SCORE=SCORE+1
fi

echo $SCORE
