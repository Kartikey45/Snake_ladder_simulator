#!/bin/bash -x

#VARIABLE AND CONSTANT INITIALIZED
START_POSITION=0
player1Position=0
player2Position=0
END_POSITION=100

#PLAY THE GAME TILL THE END POSITION
while [ $player1Position -ne $END_POSITION -a $player2Position -ne $END_POSITION ]
do

	#GENERATE RANDOM VARIABLES
	randomDiceNumber1=$(( RANDOM%6+1 ))
	randomDiceNumber2=$(( RANDOM%6+1 ))
	randomCheck=$(( RANDOM%3 ))

	#CHECK THE CONDITIONS
	case $randomCheck in
		1)
			echo "Ladder"
			echo "dice1 no.: $randomDiceNumber1"
			echo "dice2 no.: $randomDiceNumber2"

			player1Position=$(($player1Position+$randomDiceNumber1))
			player2Position=$(($player2Position+$randomDiceNumber2))

			if [ $player1Position -gt $END_POSITION ]
			then
				player1Position=$(($player1Position-$randomDiceNumber1))
			elif [ $player1Position -eq $END_POSITION ]
			then
				echo "Player1 position: $player1Position"
				echo "Player1 Won !!!!!!"
				break
			fi
			echo "Player1 position: $player1Position"

			if [ $player2Position -gt $END_POSITION ]
			then
				player2Position=$(($player2Position-$randomDiceNumber2))
			elif [ $player2Position -eq $END_POSITION ]
			then
				echo "Player2 position: $player2Position"
				echo "Player2 Won !!!!!!"
				break
			fi
			echo "Player2 position: $player2Position"
			echo ""
			;;
		2)
			echo "Snake"
			echo "dice1 no.: $randomDiceNumber1"
			echo "dice2 no.: $randomDiceNumber2"

			player1Position=$(($player1Position-$randomDiceNumber1))
			player2Position=$(($player2Position-$randomDiceNumber2))

			if [ $player1Position -lt $START_POSITION ]
			then
				player1Position=$START_POSITION
				echo "Player1 position: $player1Position"
			fi
			echo "Player1 position: $player1Position"

			if [ $player2Position -lt $START_POSITION ]
			then
				player2Position=$START_POSITION
				echo "player2 position: $player2Position"
			fi
			echo "player2 position: $player2Position"
			echo ""
			;;
		*)
			echo "No play"
			player1Position=$player1Position
			player2Position=$player2Position
			echo "Player1 position: $player1Position"
			echo "Player2 position: $player2Position"
			echo ""
			;;
	esac

	#CONDITION CHECK FOR NEGETIVE POSITION OF THE PLAYERS
	if [ $player1Position -lt $START_POSITION ]
	then
		player1Position=$START_POSITION
	fi
	if [ $player2Position -lt $START_POSITION ]
	then
		player2Position=$START_POSITION
	fi
done
