#!/usr/bin/env bash

git_status="#(/home/jose/.config/tmux/theme/git_status.sh #{pane_current_path})"
weather="#(/home/jose/.config/tmux/theme/weather.sh #{pane_current_path})"

tmux set-option -g status-style "bg=default"

bg_dark="#2ac3de" # color texto para moodo comoando y cuando se recarga la pagina
bg_highlight="#292e42"
fg_gutter="#1a2452" # color texto de la sesion
dark3="#545c7e" # color texto windows inactiva
dark5="#737aa2"
blue0="#3d59a1"
green="#0ece6a" # color fondo sesion
red="#1a2452" # color fondo en modo comando
white="#ffffff" # color texto window inactiva/activa

### Load Options
border_style_active_pane="${dark5}"
border_style_inactive_pane="${bg_highlight}"
transparent="false"

window_with_activity_style="italics"
window_status_bell_style="bold"

# tmux set-option -g status-left-length 100
# tmux set-option -g status-right-length 100

tmux set-window-option -g window-status-activity-style "$window_with_activity_style"
tmux set-window-option -g window-status-bell-style "${window_status_bell_style}"

# message styling
tmux set-option -g message-style "bg=${red},fg=${bg_dark}"

# status bar
status_bar_bg=${bg_highlight}
if [ "$transparent" = "true" ]; then
	status_bar_bg="default"
fi
tmux set-option -g status-style "bg=${status_bar_bg},fg=${white}"

# border color
tmux set-option -g pane-active-border-style "fg=$border_style_active_pane"
if ! tmux set-option -g pane-border-style "#{?pane_synchronized,fg=$border_style_active_pane,fg=$border_style_inactive_pane}" &>/dev/null; then
	tmux set-option -g pane-border-style "fg=$border_style_active_pane,fg=$border_style_inactive_pane"
fi

### Left side
. "./theme/left.sh"
tmux set-option -g status-left "$(generate_left_side_string)"

### Windows list
tmux set-window-option -g window-status-format "$(generate_inactive_window_string)"
tmux set-window-option -g window-status-current-format "$(generate_active_window_string)"

git_bg="#9d7cd8"
git_fg="#ffffff"
date_fg="#eeffee"
# date_bg="#3071ab"
date_bg="#394b70" #blue7
blue0="#3d59a1"
dark3="#545c7e" # color texto windows inactiva
tmux set -g status-right "
$git_status
#[fg=${date_bg},bg=default]#[fg=#ffffff,bg=${blue0}] #[fg=${blue0},bg=${date_bg}]
#[fg=${date_fg},bg=${date_bg}] $weather#[fg=${date_bg},bg=default]
#[fg=${date_bg},bg=default]#[fg=#ffffff,bg=${blue0}] #[fg=${blue0},bg=${date_bg}]
#[fg=${date_fg},bg=${date_bg}] #(date '+%Y-%m-%d %H:%M')#[fg=${date_bg},bg=default]"

tmux set-option -g status-style "bg=default"
