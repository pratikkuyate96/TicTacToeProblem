#!/bin/bash
echo "..........WELCOME TO TIC-TAC-TOE.................."

declare -a board
turnCount=0
MAX_TURNS=9
user=""
computer=""
curretntPlayer=""
board=( 1 2 3 4 5 6 7 8)


function displayBoard() {
	for (( row=0; row<=6; row=row+3 ))
	do
		echo "${board[$row]} | ${board[$row+1]} | ${board[$row+2]}"
		if [ $row -lt 6 ]
		then
		echo "----------"
		fi
	done
}

function playerName() {
	if [[ $((RANDOM%2)) -eq 0 ]]
	then
		user="X"
		computer="O"
	else
		computer="X"
		user="O"
	fi
	echo "user=$user"
	echo "computer=$computer"
}

function toss() {
	if [[ $((RANDOM%2)) -eq 0 ]]
	then
		currentPlayer="user"
	else
		currentPlayer="computer"
	fi
	echo "$currentPlayer"
}

function winner() {
   diagonal=0
   column=0
   for((row=0;row<9;row=row+3))
   do
      if [[ ${board[$row]} == ${board[$row+1]} && ${board[$row+1]} == ${board[$row+2]} ]] ||
         [[ ${board[$column]} == ${board[$column+3]} && ${board[$column+3]} ==  ${board[$column+6]} ]] || 
         [[ ${board[$diagonal]} == ${board[$diagonal+4]} && ${board[$diagonal+4]} == ${board[$diagonal+8]} ]] ||
         [[ ${board[$diagonal+2]} == ${board[$diagonal+4]} && ${board[$diagonal+4]} == ${board[$diagonal+6]} ]]
      then
         echo "winner=$currentPlayer"
         echo ""
         exit
      fi
      column=$((column+1))
   done
}

function play(){
	if [[ "$currentPlayer" = "user" ]]
	then
		userPlay
	else
		computerPlay
	fi
}

function userPlay() {
	currentPlayer="user"
	if [[ $turnCount -lt $MAX_TURNS ]]
	then
		read -p "Enter position between 0 to 8: " position
		if [[ "${board[$position]}" = "$position" ]]
		then
			board[$position]=$user	
			((turnCount++))
			displayBoard
		else
			echo "wrong input, please enter  between 0 to 8"
			userPlay
		fi
		winner
		computerPlay
	else
		echo "Game tie !!"
		echo ""
		exit
	fi
}

function computerPlay() {
	currentPlayer="computer"
	if [[ $turnCount -lt $MAX_TURNS ]]
	then
		position=$((RANDOM%9))
		if [[ "${board[$position]}" = "$position" ]]
		then
			echo "computer's turn:"
			board[$position]=$computer
			((turnCount++))
			displayBoard
		else
			computerPlay
		fi
		winner
		userPlay
	else
		echo "Game tie !!"
		echo ""
		exit
	fi
}

playerName
toss
displayBoard
play
