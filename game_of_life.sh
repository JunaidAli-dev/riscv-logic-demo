#!/bin/bash

# Grid setup
WIDTH=30
HEIGHT=15
ALIVE="O"
DEAD="."

#Initializing the grid with a random layout
declare -A grid
for ((i=0; i<HEIGHT; i++)); do
    for ((j=0; j<WIDTH; j++)); do
        #1-in-5 chance a cell starts alive
        [[ $((RANDOM % 5)) -eq 0 ]] && grid[$i,$j]=$ALIVE || grid[$i,$j]=$DEAD
    done
done

while true; do
    clear
    declare -A next_grid
    #iterate over every cell in the 2D grid to calculate the next state.
    for ((i=0; i<HEIGHT; i++)); do
        line=""
        for ((j=0; j<WIDTH; j++)); do
            line+="${grid[$i,$j]} "            
            #Iterating through the 3x3 block around the current cell
            neighbors=0
            for dx in -1 0 1; do
                for dy in -1 0 1; do
                    #Skip the cell itself
                    ((dx == 0 && dy == 0)) && continue
                    ni=$((i + dx))
                    nj=$((j + dy))                    
                    [[ ${grid[$ni,$nj]} == "$ALIVE" ]] && ((neighbors++))
                done
            done

            #Conway's rules
            if [[ ${grid[$i,$j]} == "$ALIVE" ]]; then
                [[ $neighbors -eq 2 || $neighbors -eq 3 ]] && next_grid[$i,$j]=$ALIVE || next_grid[$i,$j]=$DEAD
            else
                [[ $neighbors -eq 3 ]] && next_grid[$i,$j]=$ALIVE || next_grid[$i,$j]=$DEAD
            fi
        done
        echo "$line"
    done

    #Overwrite old grid with the new state
    for key in "${!next_grid[@]}"; do 
        grid[$key]=${next_grid[$key]}
    done
    
    #Control the frame rate
    sleep 0.2
done
