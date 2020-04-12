#!/bin/bash 
echo "..........WELCOME TO TIC-TAC-TOE.................."

declare -a board
board=( 1 2 3 4 5 6 7 8 9 )

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

function whoPlayFirst() {
	if [[ $((RANDOM%2)) -eq 0 ]]
	then
		player="user"
	else
		player="computer"
	fi
	echo "$currentPlayer"
}
playerName
whoPlayFirst
displayBoard