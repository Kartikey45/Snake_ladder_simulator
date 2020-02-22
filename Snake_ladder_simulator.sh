#!/bin/bash -x

echo "************************************Welcome to Snake and Ladder simulator************************************"

#VARIABLE AND CONSTANT INITIALIZE
START_POSITION=0
randomDice=$(( RANDOM%6+1 ))

echo $randomDice
