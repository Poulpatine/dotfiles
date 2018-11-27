# .bash_profile
#
# Poulpy's bashrc
#
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

set -o emacs
if [ -t 0 ]; then
    bind '"\C-p": shell-backward-kill-word'
    bind "set show-all-if-ambiguous On" 2>/dev/null
    stty -echoctl
    shopt -s checkwinsize
fi


export LANG=en_US.utf8

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
	exec startx
fi

# Set PATH
export PATH="$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"
[ -d $HOME/.local/bin ] && export PATH="$PATH:$HOME/.local/bin"
[ -d $HOME/bin ] && export PATH="$PATH:$HOME/bin"
[ -d $HOME/.gem/ruby/2.5.0/bin ] && export PATH="$PATH:$HOME/.gem/ruby/2.5.0/bin"

export HISTSIZE=32768
export HISTFILESIZE=32768
export PAGER=less
export LESS='-JMQRSi'
export HISTCONTROL=ignoreboth
export TMPDIR="/tmp"

export WORKON_HOME=~/.ve
export PROJECT_HOME=~/workspace
eval "$(pyenv init -)"


PS1="[\[\033[1;35m\]\!\[\033[0m\]|\[\033[1;31m\]\$?\[\033[0m\]][\[\033[1;33m\]\D{%F %T}\[\033[0m\]][\[\033[1;36m\]\u\[\033[0m\]@\[\033[1;32m\]\h\[\033[0m\]:\w]\n\\$ "

alias yaya="yay -Suy --noconfirm"
alias hibernation="sudo systemctl hibernate"
alias suspension="sudo systemctl suspend"
alias mtm="tmux -2u a || tmux -2u"
alias dfp='df -lhP|column -t'
alias bc='bc -l'
alias tmux='tmux -2u'
alias ip='ip -o -c'
alias vi='vim'
alias xup="xrdb ~/.Xresources"
alias dusort='sudo du -sh * | sort -h'
alias pr="pipenv run"
alias prp="pipenv run python"
 

# WOW SO MUCH COLOURS
export TERM=xterm-256color
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -ltrah --color=auto'

export LS_COLORS='no=00:fi=00:di=36:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=01;31:*.cmd=01;31:*.exe=01;31:*.com=01;31:*.bat=01;31:*.reg=01;31:*.app=01;31:*.txt=32:*.org=32:*.md=32:*.mkd=32:*.pdc=32:*.h=32:*.c=32:*.C=32:*.cc=32:*.cxx=32:*.objc=32:*.sh=32:*.csh=32:*.zsh=32:*.el=32:*.vim=32:*.java=32:*.pl=32:*.pm=32:*.py=32:*.rb=32:*.hs=32:*.php=32:*.htm=32:*.html=32:*.shtml=32:*.xml=32:*.rdf=32:*.css=32:*.js=32:*.man=32:*.0=32:*.1=32:*.2=32:*.3=32:*.4=32:*.5=32:*.6=32:*.7=32:*.8=32:*.9=32:*.l=32:*.n=32:*.p=32:*.pod=32:*.tex=32:*.bmp=33:*.cgm=33:*.dl=33:*.dvi=33:*.emf=33:*.eps=33:*.gif=33:*.jpeg=33:*.jpg=33:*.JPG=33:*.mng=33:*.pbm=33:*.pcx=33:*.pdf=33:*.pgm=33:*.png=33:*.ppm=33:*.pps=33:*.ppsx=33:*.ps=33:*.svg=33:*.svgz=33:*.tga=33:*.tif=33:*.tiff=33:*.xbm=33:*.xcf=33:*.xpm=33:*.xwd=33:*.xwd=33:*.yuv=33:*.aac=33:*.au=33:*.flac=33:*.mid=33:*.midi=33:*.mka=33:*.mp3=33:*.mpa=33:*.mpeg=33:*.mpg=33:*.ogg=33:*.ra=33:*.wav=33:*.anx=33:*.asf=33:*.avi=33:*.axv=33:*.flc=33:*.fli=33:*.flv=33:*.gl=33:*.m2v=33:*.m4v=33:*.mkv=33:*.mov=33:*.mp4=33:*.mp4v=33:*.mpeg=33:*.mpg=33:*.nuv=33:*.ogm=33:*.ogv=33:*.ogx=33:*.qt=33:*.rm=33:*.rmvb=33:*.swf=33:*.vob=33:*.wmv=33:*.doc=31:*.docx=31:*.rtf=31:*.dot=31:*.dotx=31:*.xls=31:*.xlsx=31:*.ppt=31:*.pptx=31:*.fla=31:*.psd=31:*.7z=1;35:*.apk=1;35:*.arj=1;35:*.bin=1;35:*.bz=1;35:*.bz2=1;35:*.cab=1;35:*.deb=1;35:*.dmg=1;35:*.gem=1;35:*.gz=1;35:*.iso=1;35:*.jar=1;35:*.msi=1;35:*.rar=1;35:*.rpm=1;35:*.tar=1;35:*.tbz=1;35:*.tbz2=1;35:*.tgz=1;35:*.tx=1;35:*.war=1;35:*.xpi=1;35:*.xz=1;35:*.z=1;35:*.Z=1;35:*.zip=1;35:*.ANSI-30-black=30:*.ANSI-01;30-brblack=01;30:*.ANSI-31-red=31:*.ANSI-01;31-brred=01;31:*.ANSI-32-green=32:*.ANSI-01;32-brgreen=01;32:*.ANSI-33-yellow=33:*.ANSI-01;33-bryellow=01;33:*.ANSI-34-blue=34:*.ANSI-01;34-brblue=01;34:*.ANSI-35-magenta=35:*.ANSI-01;35-brmagenta=01;35:*.ANSI-36-cyan=36:*.ANSI-01;36-brcyan=01;36:*.ANSI-37-white=37:*.ANSI-01;37-brwhite=01;37:*.log=01;32:*~=01;32:*#=01;32:*.bak=01;33:*.BAK=01;33:*.old=01;33:*.OLD=01;33:*.org_archive=01;33:*.off=01;33:*.OFF=01;33:*.dist=01;33:*.DIST=01;33:*.orig=01;33:*.ORIG=01;33:*.swp=01;33:*.swo=01;33:*,v=01;33:*.gpg=34:*.gpg=34:*.pgp=34:*.asc=34:*.3des=34:*.aes=34:*.enc=34:'

function testping() {
	while :; do
		for host in $@; do
			if ping -c 1 -W 1 $host >/dev/null 2>&1; then
				echo "$host : OK"
			else
				echo "$host : KO"
			fi
		done
		sleep 1
	done
}

function gping() {	
	host="${1:=www.nextimpact.com}"  
	while :; do
		echo "resolve $host"
		if host -W 1 "$host" >/dev/null 2>&1; then
			echo "ping $host"
			if ping -c 1 -W 1 "$host" >/dev/null 2>&1 ; then
				echo "ping OK"
				break
			fi
		fi
		sleep 1
	done
}

settitle() {
	echo -ne "\033k${1}\033\\"
}

notif() {
	interval=2
	echo -e '\a'
	while :; do
		settitle "${HOSTNAME^^}"
		sleep "$interval"
		settitle "${1:-INFO}"
		sleep "$interval"
	done
}

psgrep() {
	ps aux|grep -i $1|grep -v grep
}

settitle $HOSTNAME

# Awesome Functions

showfunc()
{
	declare -F | sed 's/declare -f //g' | column -c $(tput cols) 
}

cdpshowt(){
	timeout -s 9 65 sudo tcpdump -i $1 -v -nn -s 1500 -c 1 '(ether[20:2]=0x2000)' 2>/dev/null|egrep 'Device-ID|Port-ID|VLAN ID'|awk -F : '{printf "%s",$3} END {print ""}'|sed "s/'//g"|column -t
}

cdpshow(){
	sudo tcpdump -i $1 -v -nn -s 1500 -c 1 '(ether[20:2]=0x2000)' 2>/dev/null|egrep 'Device-ID|Port-ID|VLAN ID'|awk -F: '{printf "%s",$NF} END {print ""}'|sed "s/'//g"|column -t 
}

topipe(){
	echo $(sed ':a;N;$!ba;s/\n/|/g' $1)
}

tobrackets(){
	for line in $(cat $1); do echo -n "[$line]";done
}

tocomma(){
	echo \'$(sed ':a;N;$!ba;s/\n/,/g' $1)\'
}

tospaces(){
	echo \'$(sed ':a;N;$!ba;s/\n/ /g' $1)\'
}

findfirst10(){
	sudo bash -c "find $1 -type f -printf '%C@ %p\n' | sort -n | head -n 10"
}

findlast10(){
	sudo bash -c "find $1 -type f -printf '%C@ %p\n' | sort -n | tail -n 10"
}

showif(){
	ip -o l|awk -F': ' '$2 != "lo"  {print $2}'
}

showifup(){
	for i in $(showif); do echo $i ; sudo ip link set $i up ; sudo ethtool $i|egrep 'Speed: |Link detected:' ; done
}

extractrpm(){
	name=$(rpm -qp ${1})
	mkdir ${name}
	cd ${name}
	rpm2cpio ../$1 | cpio -idmv
}

gh(){
	getent hosts $1
}

gp(){
	getent passwd $1
}

gg(){
	getent group $1
}

awp(){
	awk -v f=$1 '{print $f}'
}

ss()
{
	sudo ss ${@} |column -t
}

function mssh() {
	f=false
	n=false
	c=false

	local OPTIND
	while getopts "n:f:c" opt; do
		case $opt in
			n)
				n=true
				num="${OPTARG}"
				;;
			f)
				f=true
				file="${OPTARG}"
				;;
			c)
				c=true
				file="/dev/stdin"
				;;
			\?)
				echo "Invalid option: -$OPTARG" >&2
				return 1
				;;
			:)
				echo "Option -$OPTARG requires an argument." >&2
				return 1
				;;
		esac
	done

	shift $((OPTIND-1))

	if ! "${f}" && ! "${c}" && [ -z "${1}" ]; then
		echo "Please provide a list of hosts"
		return 1
	fi

	if "${f}" && "${c}" ; then
		echo "-f (file) and -c (stdin) are mutually exclusive"
		return 1
	fi

	hosts="${@}"

	if "${f}" ; then
		if [ -f "${file}" ]; then
			hosts=$(cat "${file}"|xargs)
		else
			echo "File "${file}" not found"
			return 1
		fi
	fi

	if "${c}" ; then
		hosts=$(cat "/dev/stdin"|xargs)
	fi

	re='^[0-9]+$'

	if "${n}"; then
		if [[ ${num} =~ ${re} ]] ; then
			hosts="$(echo ${hosts} | xargs -n ${num})"
		else
			echo "${num} is not a valid number"
			return 1
		fi
	fi

	function openwin() {
		tmux new-window "bash -l -c \"ssh ${1}\""
		shift
		for arg in ${@}; do
			tmux split-window -v -d "bash -l -c \"ssh ${arg}\""
			tmux select-layout tiled
		done
	}

	echo "${hosts}" | while read host; do
	openwin ${host}
done

}

extract_rpm() {
	usage() {
		echo "Usage : "
		echo "extract_rpm -d <destination> rpmlist"
		echo "-d destination directory"
		echo "-h this help"
	}

	d=false

	local OPTIND
	while getopts "hd:" opt; do
		case $opt in
			h)
				usage
				return 0
				;;
			d)
				d=true
				dir="$OPTARG"
				;;
			\?)
				echo "ERROR : Invalid option: -$OPTARG" 1>&2
				return 1
				;;
			:)
				echo "ERROR : Option -$OPTARG requires an argument." 1>&2
				return 1
				;;
		esac
	done
	shift $((OPTIND-1))
	if ! "$d" ; then
		echo "ERROR : Please provide destination directory"
		usage
		return 1
	fi

	mkdir -p "$dir" 
	if [ $? == -1 ]; then
		echo "ERROR : Can not create $dir"
		return 1
	fi

	packages="$@"

	cwd="$(pwd)" 
	for package in $packages ; do
		if [ ! -f "${cwd}/${package}" ]; then
			echo "ERROR : File $package does not exists"
			return 1
		fi
		cd "$dir"
		rpm2cpio "${cwd}/${package}" | cpio -idmv
		cd "$cwd"
	done
}

mping() {
	c=false

	testping() {
		ping -c 1 -w 2 "$1" >/dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "$1 : ${COLORGREEN}[${OK}]${COLORDEFAULT}"
		else
			echo "$1 : ${COLORRED}[${KO}]]${COLORDEFAULT}"
		fi
	}	

	for host in "${@}" ; do
		testping "$host"
	done
}

function gen_tmux {
	bash_prof="$(cat ~/.bash_profile|bzip2|base64 -w0)" || return 1
	if [ "$(echo $bash_prof|wc -c)" -ge 8192 ]; then
		echo "ERROR : .bash_profile too big"
		return 1
	fi
	if ! grep -q '# TMUX BASH_PROFILE' ~/.tmux.conf ; then
		echo "ERROR : TMUX BASH_PROFILE line not found"
		return 1
	fi
	sed -i '$ d' ~/.tmux.conf || return 1
	if ! grep -q '# TMUX BASH_PROFILE' ~/.tmux.conf ; then
		echo "ERROR : TMUX BASH_PROFILE line not found"
		return 1
	fi
	echo "bind-key -n F7 send-keys \"echo \'$bash_prof\'|base64 -d|bunzip2 > ~/.bash_profile_dmz ; source ~/.bash_profile_dmz\"" >> ~/.tmux.conf || return 1
}

function diffcmd {
	cmd="ssh "
	tmp1="$(mktemp)"
	tmp2="$(mktemp)"
	$cmd $1 "$3" > $tmp1
	$cmd $2 "$3" > $tmp2
	diff $tmp1 $tmp2|less
	rm "$tmp1" "$tmp2"
}

function reset_all {
	snap="clean_install"
	# vmlist="vmcent01 vmcent02"
	vmlist="vmcent01"
	for vm in $vmlist; do
		echo "revert $vm to $snap"
		sudo virsh snapshot-revert "$vm" --snapshotname "$snap"
		echo "start $vm"
		sudo virsh start "$vm"
	done
}

function crun {
	source="${1}"
    file="$(basename $source)"
    dir="$(dirname $source)"
    [ ! -d "$dir/bin" ] && mkdir "$dir/bin"
	[ ! -f "$source" ] && return 1
	if gcc "$source" -o "$dir/bin/${file%.*}"; then
		"$dir/bin/${file%.*}"
	else
		echo "Error during compilation ?"
		return 1
	fi
	echo ""
}

function cpprun {
	source="${1}"
    file="$(basename $source)"
    dir="$(dirname $source)"
    [ ! -d "$dir/bin" ] && mkdir "$dir/bin"
	[ ! -f "$source" ] && return 1
	if g++ "$source" -o "$dir/bin/${file%.*}"; then
		"$dir/bin/${file%.*}"
	else
		echo "Error during compilation ?"
		return 1
	fi
	echo ""
}
