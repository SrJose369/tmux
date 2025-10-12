#!/usr/bin/env bash

bg_dark="#2ac3de" # color texto para moodo comoando y cuando se recarga la pagina
bg_highlight="#292e42"
fg_gutter="#1a2452" # color texto de la sesion
dark3="#545c7e" # color texto windows inactiva
dark5="#737aa2"
magenta="#bb9af7"
purple="#9d7cd8"
yellow="#e0af68"
green="#0ece6a" # color fondo sesion
red="#1a2452" # color fondo en modo comando
white="#ffffff" # color texto window inactiva/activa

function generate_left_side_string() {
	session_icon=" "
	left_separator=""
	local separator_end="#[bg=default]#{?client_prefix,#[fg=${yellow}],#[fg=${green}]}${left_separator:?}#[none]"
	echo "#[fg=${fg_gutter},bold]#{?client_prefix,#[bg=${yellow}],#[bg=${green}]} ${session_icon} #S ${separator_end}"
}

function generate_inactive_window_string() {
	inactive_window_icon=" "
	zoomed_window_icon=" "
	left_separator=""
	inactive_window_title="#W "
	left_separator_inverse=""
	local separator_start="#[bg=default,fg=${dark5}]${left_separator_inverse}#[bg=${dark5},fg=${bg_highlight}]"
	local separator_internal="#[bg=${dark3},fg=${dark5}]${left_separator:?}#[none]"
	local separator_end="#[bg=default,fg=${dark3}]${left_separator:?}#[none]"
	echo "${separator_start}#[fg=${white}]#I${separator_internal}#[fg=${white}] #{?window_zoomed_flag,$zoomed_window_icon,$inactive_window_icon}${inactive_window_title}${separator_end}"
}

function generate_active_window_string() {
	active_window_icon=" "
	zoomed_window_icon=" "
	pane_synchronized_icon="✵"
	left_separator=""
	active_window_title="#W "
	left_separator_inverse=""
	separator_start="#[bg=default,fg=${magenta}]${left_separator_inverse}#[bg=${magenta},fg=${bg_highlight}]"
	separator_internal="#[bg=${purple},fg=${magenta}]${left_separator:?}#[none]"
	separator_end="#[bg=default,fg=${purple}]${left_separator:?}#[none]"
	echo "${separator_start}#[fg=${white}]#I${separator_internal}#[fg=${white}] #{?window_zoomed_flag,$zoomed_window_icon,$active_window_icon}${active_window_title}#{?pane_synchronized,$pane_synchronized_icon,}${separator_end}#[none]"
}
