#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export LIBGL_ALWAYS_SOFTWARE=1

export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

if uwsm check may-start; then
  exec uwsm start hyprland-uwsm.desktop
fi

#. "$HOME/.local/share/../bin/env"
