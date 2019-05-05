set -x LANG en_US.utf8

if test -z "$DISPLAY"; and test -n "$XDG_VTNR"; and test "$XDG_VTNR" -eq 1
	exec startx
end

test -d $HOME/.local/bin; and set -x PATH $PATH $HOME/.local/bin
test -d $HOME/bin; and set -x PATH $PATH $HOME/bin

set -x PAGER less
set -x BROWSER firefox
set -x LESS '-JMQRSi'
set -x TMPDIR "/tmp"
set -x WORKON_HOME ~/.ve
set -x PROJECT_HOME ~/workspace
