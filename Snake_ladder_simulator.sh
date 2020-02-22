#!/bin/bash -x

echo "************************************Welcome to Snake and Ladder simulator************************************"

#VARIABLE AND CONSTANT INITIALIZED
START_POSITION=0
randomDiceNumber=$(( RANDOM%6+1))
randomCheck=$(( RANDOM%3 ))
playerPosition=0

#CHECK THE CONDITIONS
case $randomCheck in
	1)
		echo "Ladder"
		echo "dice no.: $randomDiceNumber"
		playerPosition=$(($playerPosition+$randomDiceNumber))
		echo "Player position: $playerPosition"
		;;
	2)
		echo "Snake"
		echo "dice no.: $randomDiceNumber"
		playerPosition=$(($playerPosition-$randomDiceNumber))
		echo "Player position: $playerPosition"
		;;	
	*)
		echo "No play"
		playerPosition=$playerPosition
		echo "Player position: $playerPosition"
		;;
esac
