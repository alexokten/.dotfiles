if status is-interactive
    # Commands to run in interactive sessions can go here
end

export EZA_CONFIG_DIR="$HOME/.config/eza"
export EDITOR="hx"
export NVM_DEFAULT_VERSION=21
export STRIPE_SECRET_KEY="sk_test_51QMCLy05BCWHhnEgrtYjGmrGU9JPWXuLN9yQFVpWMEN5jH42e3k5G5vH5YxTrWduZLfL0lIsSoYY6xjIAckR2MzU00woVDj1zG"

set -gx EDITOR hx
set -gx TERM xterm-256color

set --universal pure_enable_single_line_prompt true
set --universal pure_color_system_time pure_color_mute
set --universal pure_enable_git true
set --universal pure_color_primary '#a390f0'
set --universal pure_color_git_branch '#a7ff5f'
set --universal pure_color_info '#52a7f6'
set --universal pure_symbol_prompt INSERT
set --universal pure_symbol_reverse_prompt NORMAL
set --universal pure_symbol_git_dirty " :"


# Use LS_COLORS to color fff.
# (On by default if available)
# (Ignores FFF_COL1)
export FFF_LS_COLORS=1

# # Directory color [0-9]
# export FFF_COL1=2

# # Status background color [0-9]
export FFF_COL2=5

# # Selection color [0-9] (copied/moved files)
export FFF_COL3=2

# # Cursor color [0-9]
export FFF_COL4=1

# # Status foreground color [0-9]
export FFF_COL5=8

# Text Editor
export EDITOR="hx"

# File Attributes Command
export FFF_STAT_CMD="stat"

# Enable or disable CD on exit.
# (On by default)
export FFF_CD_ON_EXIT=0

# CD on exit helper file
# Default: '${XDG_CACHE_HOME}/fff/fff.d'
#          If not using XDG, '${HOME}/.cache/fff/fff.d' is used.
export FFF_CD_FILE=~/.fff_d

# Default: 'mv'
#          Define a custom program to use to trash files.
#          The program will be passed the list of selected files
#          and directories.
export FFF_TRASH_CMD="trash"

# Cargo runs rust
export PATH="$HOME/.cargo/bin:$PATH"

# Remove alias to Trash
alias rm="trash"

# Lazygit shortcut
alias L="lazygit"

# Format changed files with Prettier

# Sweater API key
export OPEN_WEATHER_API_KEY="999756e436f0e178ff0f0e72cdd17310"

# GO Path
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/cemalokten/.rd/bin"
# MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# FZF & RIPGREP
function fzf_rg
    bash /Users/cemalokten/.config/fish/bash/fzf.sh
end

bind -M insert \cf fzf_rg

# BAT THEME
export BAT_THEME="Dracula"

# Set cat to bat
alias cat="bat"

# Set ls to exa -alh
# alias ls="eza -alh"
alias ls="eza -alh --group-directories-first --sort=type --no-permissions --no-user"

# GO path
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/Go/bin:$PATH"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

set -gx ATUIN_NOBIND true
atuin init fish | source

# Basic bindings
bind \cr _atuin_search
bind -M insert \cr _atuin_search

# Up arrow binding
bind \e\[A _atuin_bind_up
bind -M insert \e\[A _atuin_bind_up

# bind yy to open yazi
function yy
    set tmp (mktemp -t "yazi-cwd.XXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# pnpm
set -gx PNPM_HOME /Users/cemalokten/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

#Export HELIX runtime location
export HELIX_RUNTIME=~/src/helix/runtime

# Added by Windsurf
fish_add_path /Users/cemalokten/.codeium/windsurf/bin

# task-warrior GTD alias
alias in='task add +in project:general'

# Pomodoro timer
function work
    # usage: work 10m, work 60s etc. Default is 20m
    set -q argv[1]; or set argv[1] 20m
    timer $argv[1]; and terminal-notifier -message Pomodoro \
        -title 'Work Timer is up! Take a Break 😊' \
        -sound Crystal
end

function rest
    # usage: rest 10m, rest 60s etc. Default is 5m
    set -q argv[1]; or set argv[1] 5m
    timer $argv[1]; and terminal-notifier -message Pomodoro \
        -title 'Break is over! Get back to work 😬' \
        -sound Crystal
end
