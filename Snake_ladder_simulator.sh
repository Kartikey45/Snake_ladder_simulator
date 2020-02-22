#!/bin/bash -x

#VARIABLE AND CONSTANT INITIALIZED
START_POSITION=0
playerPosition=0
END_POSITION=100

#PLAY THE GAME TILL THE END POSITION
while [ $playerPosition -ne $END_POSITION  ]
do

	#GENERATE RANDOM VARIABLES
	randomDiceNumber=$(( RANDOM%6+1 ))
	randomCheck=$(( RANDOM%3 ))
	
	#CHECK THE CONDITIONS
	case $randomCheck in
		1)
			echo "Ladder"
			echo "dice no.: $randomDiceNumber"
			playerPosition=$(($playerPosition+$randomDiceNumber))
			if [ $playerPosition -gt $END_POSITION ]
			then
				playerPosition=$END_POSITION
				echo "Player position : $playerPosition"
				echo "player won !!!"
				break
			fi
			echo "Player position: $playerPosition"
			echo ""
			;;
		2)
			echo "Snake"
			echo "dice no.: $randomDiceNumber"
			playerPosition=$(($playerPosition-$randomDiceNumber))
			if [ $playerPosition -lt $START_POSITION ]
			then
				playerPosition=$START_POSITION
				echo "Player position: $playerPosition"
			fi
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

	#CONDITION CHECK FOR PLAYER'S POSITION
	if [ $playerPosition -lt $START_POSITION ]
	then
		playerPosition=$START_POSITION
	fi	
done
