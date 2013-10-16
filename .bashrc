#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt(s)
PS1='[\u@\h \W]\$'

# Aliases

# ls
alias ls='ls --color=auto'

# dwm
alias redwm='cd ~/dwm; makepkg -g >> PKGBUILD; makepkg -efi --noconfirm; killall dwm'

# Color theme selection
BASH_COLOR_THEME="solarized"

# Color theme color settings

# Solarized
if [ "$BASH_COLOR_THEME" = "solarized" ]; then
    TERM_COL_BLACK="073642"
    TERM_COL_RED="DC322F"
    TERM_COL_GREEN="859900"
    TERM_COL_YELLOW="B58900"
    TERM_COL_BLUE="268BD2"
    TERM_COL_MAGNETA="D33682"
    TERM_COL_CYAN="2AA198"
    TERM_COL_WHITE="EEE8D5"
    TERM_COL_BR_BLACK="002B36"
    TERM_COL_BR_RED="CB4B16"
    TERM_COL_BR_GREEN="586E75"
    TERM_COL_BR_YELLOW="657B83"
    TERM_COL_BR_BLUE="839496"
    TERM_COL_BR_MAGNETA="6C71C4"
    TERM_COL_BR_CYAN="93A1A1"
    TERM_COL_BR_WHITE="FDF6E3"
fi

# Use solarized color theme for bash
if [ "$TERM" = "linux" ]; then
	echo -en "\e]P0$TERM_COL_BLACK"
	echo -en "\e]P1$TERM_COL_RED"
	echo -en "\e]P2$TERM_COL_GREEN"
	echo -en "\e]P3$TERM_COL_YELLOW"
	echo -en "\e]P4$TERM_COL_BLUE"
	echo -en "\e]P5$TERM_COL_MAGNETA"
	echo -en "\e]P6$TERM_COL_CYAN"
	echo -en "\e]P7$TERM_COL_WHITE"
	echo -en "\e]P8$TERM_COL_BR_BLACK"
	echo -en "\e]P9$TERM_COL_BR_RED"
	echo -en "\e]PA$TERM_COL_BR_GREEN"
	echo -en "\e]PB$TERM_COL_BR_YELLOW"
	echo -en "\e]PC$TERM_COL_BR_BLUE"
	echo -en "\e]PD$TERM_COL_BR_MAGNETA"
	echo -en "\e]PE$TERM_COL_BR_CYAN"
	echo -en "\e]PF$TERM_COL_BR_WHITE"
    # Redraw background
	clear
fi

