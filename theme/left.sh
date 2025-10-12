#!/usr/bin/env bash

bg_highlight="#292e42"
fg_gutter="#1a2452" # color texto de la sesion
dark3="#545c7e" # color texto windows inactiva
dark5="#737aa2"
magenta="#bb9af7"
purple="#9d7cd8"
yellow="#e0af68" # color para cuando se presiona el prefix
green="#0ece6a" # color fondo sesion
white="#ffffff" # color texto window inactiva/activa

function generate_left_side_string() {
	echo "
#[fg=${fg_gutter},bold]#{?client_prefix,#[bg=${yellow}],#[bg=${green}]}   #S #[bg=default]#{?client_prefix,#[fg=${yellow}],#[fg=${green}]}"
}

function generate_inactive_window_string() {
	echo "
#[bg=default,fg=${dark5}]
#[bg=${dark5},fg=${white}]#I
#[bg=${dark3},fg=${dark5}]
#[fg=${white}] #{?window_zoomed_flag, , }
#W #[bg=default,fg=${dark3}]"
}

function generate_active_window_string() {
	echo "
#[bg=default,fg=${magenta}]
#[bg=${magenta},fg=${white}]#I
#[bg=${purple},fg=${magenta}]
#[fg=${white}] #{?window_zoomed_flag, , }
#W #{?pane_synchronized,✵,}
#[bg=default,fg=${purple}]"
}
