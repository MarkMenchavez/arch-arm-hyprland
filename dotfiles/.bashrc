#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='eza --group-directories-first --color=auto --git-ignore'
alias ll='eza -l --group-directories-first --color=auto --git-ignore'
alias la='eza -a --group-directories-first --color=auto'
alias lt='eza -T --group-directories-first --color=auto --git-ignore --no-user'
alias lta='eza -aT --group-directories-first --color=auto --git-ignore --no-user'

alias grep='grep --color=auto'
alias cat='bat'
alias rm='trash'
alias vim='nvim'

alias random='. ~/Scripts/endless-random.sh'
alias logo='. ~/Scripts/random-fastfetch.sh'
alias motd='. ~/Scripts/random-motd.sh'

alias reload='clear && source ~/.bashrc'
alias update='yay --noconfirm'

PS1='[\u@\h \W]\$ '
. /etc/profile.d/custom-bash-options.sh


if [ "$XDG_SESSION_TYPE" = "wayland" ] && [ "$TERM_PROGRAM" = "" ]; then

  random_number=$((RANDOM % 3 + 1))
  case $random_number in
    1)
      clear; fastfetch
      ;;
    2)
      . ~/Scripts/random-fastfetch.sh
      ;;
    3)
      . ~/Scripts/random-motd.sh
      ;;
  esac

  eval "$(starship init bash)"
fi

eval "$(zoxide init --cmd cd bash)"

