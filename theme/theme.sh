#!/usr/bin/env bash

git_status="#(/home/jose/.config/tmux/theme/git_status.sh #{pane_current_path})"
weather="#(/home/jose/.config/tmux/theme/weather.sh #{pane_current_path})"

tmux set-option -g status-style "bg=default"

bg_dark="#2ac3de" # color texto para moodo comoando y cuando se recarga la pagina
fg_gutter="#1a2452" # color texto de la sesion
dark3="#545c7e" # color texto windows inactiva
dark5="#737aa2"
blue0="#3d59a1"
green="#0ece6a" # color fondo sesion
red="#1a2452" # color fondo en modo comando
white="#ffffff" # color texto window inactiva/activa

tmux set-option -g status-left-length 100
tmux set-option -g status-right-length 100

tmux set-window-option -g window-status-activity-style "italics"
tmux set-window-option -g window-status-bell-style "bold"
tmux set-window-option -g window-status-separator ""

tmux set-option -g message-style "bg=${red},fg=${bg_dark}"
tmux set-option -g status-style "bg=default,fg=${white}"

fg_gutter="#1a2452" # color texto de la sesion
dark3="#545c7e" # color texto windows inactiva
dark5="#737aa2"
magenta="#bb9af7"
purple="#9d7cd8"
yellow="#e0af68" # color para cuando se presiona el prefix
green="#0ece6a" # color fondo sesion
white="#ffffff" # color texto window inactiva/activa

tmux set-option -g status-left "
#[fg=${fg_gutter},bold]#{?client_prefix,#[bg=${yellow}],#[bg=${green}]}   #S #[bg=default]#{?client_prefix,#[fg=${yellow}],#[fg=${green}]}"

tmux set-window-option -g window-status-format "
#[bg=default,fg=${dark5}]
#[bg=${dark5},fg=${white}]#I
#[bg=${dark3},fg=${dark5}]
#[fg=${white}] #{?window_zoomed_flag, , }
#W #[bg=default,fg=${dark3}]"

tmux set-window-option -g window-status-current-format "
#[bg=default,fg=${magenta}]
#[bg=${magenta},fg=${white}]#I
#[bg=${purple},fg=${magenta}]
#[fg=${white}] #{?window_zoomed_flag, , }
#W #{?pane_synchronized,✵,}
#[bg=default,fg=${purple}]"

date_fg="#eeffee"
date_bg="#394b70"
blue0="#3d59a1"
dark3="#545c7e" # color texto windows inactiva
tmux set -g status-right "
$git_status
#[fg=${blue0},bg=default]
#[fg=#ffffff,bg=${blue0}] #[fg=${blue0},bg=${date_bg}]
#[fg=${date_fg},bg=${date_bg}] #(date '+%Y-%m-%d %H:%M')"

tmux set-option -g status-style "bg=default"
