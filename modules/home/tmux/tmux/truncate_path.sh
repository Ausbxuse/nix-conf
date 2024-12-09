#!/usr/bin/env bash

current_path=$(tmux display-message -p -F "#{pane_current_path}")
formatted_path=${current_path/$HOME/\~}

# max_length > 10
truncate_path() {
    local path=$1
    local max_length=$2

    # If the entire path fits, print it and pad with spaces.
    if [ ${#path} -le $max_length ]; then
        local num_spaces=$((max_length - ${#path}))
        local FILL=$(printf '%*s' $num_spaces)
        echo -n "${path}${FILL}"
        return
    fi

    # Split into segments
    IFS='/' read -r -a segments <<< "$path"
    local total_segments=${#segments[@]}

    local lengths=()
    for segment in "${segments[@]}"; do
        lengths+=(${#segment})
    done

    # Compute prefix sums from the end
    # prefix_lengths[i] = sum of lengths of segments[i ... total_segments-1]
    local prefix_lengths=()
    prefix_lengths[${total_segments}]=0
		local last_segment_id=$((total_segments-1))
		local last_length=${lengths[${last_segment_id}]}

		if [[ $last_length -gt $max_length ]]; then
			echo -n ".../${segments[$last_segment_id]:0:$((max_length-7))}..."
			return
		fi

    for (( i=last_segment_id; i>=0; i-- )); do
        prefix_lengths[i]=$(( prefix_lengths[i+1] + lengths[i] ))
    done


    # Binary search to find the largest truncate_depth that fits
    local low=1
    local high=$total_segments
    local best_depth=0

    while [ $low -le $high ]; do
        local mid=$(( (low + high) / 2 ))
        # Calculate the tail length of the last mid segments using prefix sums
        # tail_length = sum of last mid segments lengths + (mid - 1) slashes
        local start_index=$((total_segments - mid))
        local tail_length=$(( prefix_lengths[start_index] + mid - 1 ))
        
        # display_length includes the '.../' prefix (4 chars)
        local display_length=$(( tail_length + 4 ))

        if [ $display_length -le $max_length ]; then
            best_depth=$mid
            low=$((mid + 1))
        else
            high=$((mid - 1))
        fi
    done

		# Reconstruct the tail string for best_depth
		local start_index=$((total_segments - best_depth))
		local tail_segments=("${segments[@]:$start_index}")
		local tail_path=$(IFS='/'; echo "${tail_segments[*]}")

		# Calculate final padding
		local display_length=$(( ${#tail_path} + 4 ))
		local num_spaces=$((max_length - display_length))
		local FILL=$(printf '%*s' $num_spaces)
		echo -n ".../${tail_path}${FILL}"
}

truncate_path "$formatted_path" 30
