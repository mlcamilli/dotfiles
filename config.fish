set -xU VIRTUALFISH_HOME "/home/boos3y/Dev/.virtualenvs"
. /home/boos3y/.config/fish/virtual.fish
set -g TERM xterm-256color
set -xU EDITOR vim
set -xU SHELL fish
function fuck
  eval sudo $history[1]
end

