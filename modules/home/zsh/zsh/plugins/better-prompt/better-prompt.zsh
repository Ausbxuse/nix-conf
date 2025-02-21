# Set vim
function __set_beam_cursor {
    echo -ne '\e[6 q'
}

function __set_block_cursor {
    echo -ne '\e[2 q'
}

function zle-keymap-select {
  case $KEYMAP in
    vicmd) __set_block_cursor;;
    viins|main) __set_beam_cursor;;
  esac
}
zle -N zle-keymap-select

function zle-line-init {
    __set_beam_cursor
}
zle -N zle-line-init

precmd() {
    __set_beam_cursor  # doesn't have to be in precmd - can put outside a function if you like
}

bindkey -v '^?' backward-delete-char
bindkey '^[[P' delete-char
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line


# Execution time in prompt
prompt_command_execution_time() {
    local command_duration_seconds="${ZSH_COMMAND_DURATION:-0}"
    local time_threshold=1  # Minimum duration to show execution time
    local precision=1       # Decimal places for seconds

    (( command_duration_seconds >= time_threshold )) || return

    local formatted_time

    if (( command_duration_seconds < 60 )); then
        # Display seconds with precision if required
        if (( !presision )); then
          local -i sec=$((command_duration_seconds + 0.5))
        else
          local -F precision sec=command_duration_seconds
        fi
        formatted_time="${sec}s"
    else
        local -i duration=$((command_duration_seconds + 0.5))

        # Choose between displaying in H:M:S or Xd Xm Xs format
        formatted_time="$((duration % 60))s"
        if (( duration >= 60 )); then
            formatted_time="$((duration / 60 % 60))m $formatted_time"
            if (( duration >= 3600 )); then
                formatted_time="$((duration / 3600))h $formatted_time"
                if (( duration >= 86400 )); then
                    formatted_time="$((duration / 86400))d $formatted_time"
                fi
            fi
        fi
    fi

    # Customize the color and formatting here as needed
    echo "(${formatted_time}) "
}

preexec() {
  ZSH_COMMAND_START=$SECONDS
}

precmd() {
  ZSH_COMMAND_DURATION=$((SECONDS - ZSH_COMMAND_START))
}


# Set prompt
autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst
add-zsh-hook precmd vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats       ' %b%u%c'
zstyle ':vcs_info:git:*' actionformats '%b|%a%u%c'

NEWLINE=$'\n'
truncated_path="%F{4}%0~$NEWLINE%{%k%}%f%F{5}❯%{%k%}%F{white}"

background_jobs="%(1j.%F{0}%K{0}%F{3}%{%k%}%F{0}%f.)"
non_zero_return_value="%(0?..%F{1}%f)"

PROMPT="%F{3}%n%F{2}@%F{6}%m%f:$truncated_path "

RPROMPT='$background_jobs $non_zero_return_value %F{cyan}${vcs_info_msg_0_}%f %F{10}$(prompt_command_execution_time)%F{8}%D{%H:%M:%S %m-%d}'
zle_highlight=(default:bold)

