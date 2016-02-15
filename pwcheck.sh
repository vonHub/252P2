#!/bin/bash

#DO NOT REMOVE THE FOLLOWING TWO LINES
git add $0 >> .local.git.out
git commit -a -m "Lab 2 commit" >> .local.git.out

#Your code here

SCORE=0
PW=/bin/cat $1

if grep -q [0-9] $1 ; then
    let SCORE=SCORE+1
fi

echo $SCORE
