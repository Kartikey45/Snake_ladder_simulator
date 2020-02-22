#!/bin/bash -x

#VARIABLE AND CONSTANT INITIALIZED
START_POSITION=0
playerPosition=0
END_POSITION=100
count=0

#PLAY THE GAME TILL THE END POSITION
while [ $playerPosition -ne $END_POSITION  ]
do

	#GENERATE RANDOM VARIABLES
	randomDiceNumber=$(( RANDOM%6+1 ))
	randomCheck=$(( RANDOM%3 ))

	#CHECK THE CONDITIONS
	case $randomCheck in
		1)
			(( count++ ))
			echo "Ladder"
			echo "dice no.: $randomDiceNumber"
			playerPosition=$(($playerPosition+$randomDiceNumber))
			if [ $playerPosition -gt $END_POSITION ]
			then
				playerPosition=$(($playerPosition-$randomDiceNumber))
			elif [ $playerPosition -eq $END_POSITION ]
			then
				echo "Number of times the dice was played: $count"
				echo "Player position: $playerPosition"
				echo "Player Won !!!!!!"
				break
			fi
			echo "Number of times the dice was played: $count"
			echo "Player position: $playerPosition"
			echo ""
			;;
		2)
			(( count++ ))
			echo "Snake"
			echo "dice no.: $randomDiceNumber"
			playerPosition=$(($playerPosition-$randomDiceNumber))
			if [ $playerPosition -lt $START_POSITION ]
			then
				playerPosition=$START_POSITION
				echo "Player position: $playerPosition"
			fi
			echo "Number of times the dice was played: $count"
			echo "Player position: $playerPosition"
			echo ""
			;;
		*)
			echo "No play"
			playerPosition=$playerPosition 
			echo "Player position: $playerPosition"
			echo ""
			;;
	esac
		
	#CONDITION CHECK FOR NEGETIVE POSITION OF THE PLAYERS
	if [ $playerPosition -lt $START_POSITION ]
	then
		playerPosition=$START_POSITION
	fi
done
