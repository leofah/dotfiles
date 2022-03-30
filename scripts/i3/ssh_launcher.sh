#!/bin/sh

: ${TERMINAL="/usr/bin/alacritty"}

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
        ssh-agent -t 3h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
        source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

rofi -show ssh -terminal "$TERMINAL"
