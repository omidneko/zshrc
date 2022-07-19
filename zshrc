# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="jonathan"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Under .bashrc

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias tt='ls -ltrha'
alias reloadbash='source ~/.zshrc'
alias configibs='nano /usr/local/IBSng/config/IBSng.conf'

#View log auth  with less
function logauth-less {
	if [[ $1 = "" ]]
	then
		less /var/log/IBSng/RADIUS/auth.log
	else
		less /var/log/IBSng/RADIUS/auth.log | grep -i -B3 -A25 $1
	fi
}

#View log auth with tail
function logauth-tail {
	if [[ $1 = "" ]]
	then
		tail -f /var/log/IBSng/RADIUS/auth.log
	else
		tail -f /var/log/IBSng/RADIUS/auth.log | grep -i $1
	fi
}


#View log Policy Error  with less
function logpolicyerror-less {
	if [[ $1 = "" ]]
	then
		less /var/log/IBSng/POLICY_WORKER/error.log
	else
		less /var/log/IBSng/POLICY_WORKER/error.log | grep -i -B3 -A25 $1
	fi
}

#View log Policy Error with tail
function logpolicyerror-tail {
	if [[ $1 = "" ]]
	then
		tail -f /var/log/IBSng/POLICY_WORKER/error.log
	else
		tail -f /var/log/IBSng/POLICY_WORKER/error.log | grep -i $1
	fi
}
#View log Consol  with less
function logconsol-less {
	if [[ $1 = "" ]]
	then
		less /var/log/IBSng/MAIN/console.log
	else
		less /var/log/IBSng/MAIN/console.log | grep -i -B3 -A25 $1
	fi
}

#View log Consol  with tail
function logconsol-tail {
	if [[ $1 = "" ]]
	then
		tail -f /var/log/IBSng/MAIN/console.log
	else
		tail -f /var/log/IBSng/MAIN/console.log | grep -i $1
	fi
}


#check app install
function ch {

	#checke=$(sudo apt list --installed | grep -i $1 | grep -i installed | wc -l)
#	checke=$(ps -aux | grep -i $1 | wc -l)
	checke=$(dpkg -l | grep -i $1| wc -l)
	if [[ $checke == "0" ]]
	then
		echo "Not Installed"
	else
		echo "Installed"
	fi

}
#ssh with alias


function dia {


#!/bin/bash
# yesnobox.sh - An inputbox demon shell script
OUTPUT="/tmp/input.txt"
# create empty file>$OUTPUT

function sayhello(){
local n=${@-"anonymous person"}
#display it
dialog --title "Hello" --clear --msgbox "Hello ${n}, let us be friends!" 10 41
}


trap "rm $OUTPUT; exit" SIGHUP SIGINT SIGTERM

# show an inputbox
dialog --title "SSH"  --backtitle "SSH With Alias"  --inputbox "Enter IP : " 8 60 2>$OUTPUT

# get respose

respose=$?

# get data stored in $OUPUT using input redirection

IP=$(<$OUTPUT)

dialog --title "SSH"  --backtitle "SSH With Alias"  --inputbox "Enter Port : " 8 60 2>$OUTPUT
respose=$?
PORT=$(<$OUTPUT)

# make a decsion
case $respose in
0) sayhello ${IP} ;;

1) echo "Cancel pressed." ;;

255) echo "[ESC] key pressed."

esac
# remove $OUTPUT file
rm $OUTPUT



}



function ss {

# checke=$(sudo apt list --installed | grep -i sshpass | grep -i installed | wc -l)
# checke=$(ps -aux | grep -i sshpass | wc -l)
checke=$(dpkg -l | grep -i sshpass | wc -l)
        if [[ $checke == "0" ]]
        then
                echo -n "sshpass Not Installed. "
		echo -n "For Install Press Enter. "
		echo -n "For Cancel Install press q & Enter : "
		read inst
			if [[ $inst == "" ]]
			then
				sudo apt install sshpass
			fi
	else

			ip=$1
			port=$2
			user=$3
			if [[ $ip == "" ]]
			then
				echo -n "Enter IP : "
				read ip
				echo -n "Enter Port(Defualt 22) : "
				       read port
				       if [[ $port == '' ]]
				       then port="22"
				       fi
				echo -n "Enter Username(Defualt root) : "
				       read user
				       if [[ $user == '' ]]
				       then user="root"
					fi
				echo -n "Enter Password : "
					read pass

			        sshpass -p $pass scp -P$port ~/.zshrc $user@$ip:/tmp/.bashrc_temp
		                #ssh -p$port -t $user@$ip "bash --rcfile /tmp/.bashrc_temp ; rm /tmp/.bashrc_temp"
				sshpass -p $pass ssh -o StrictHostKeyChecking=no -p$port -t $user@$ip -v "bash --rcfile /tmp/.bashrc_temp ; rm /tmp/.bashrc_temp"

			else
			        if [[ $2 == '' ]]
			        then port="22"
				fi
			        if [[ $3 == '' ]]
			        then user="root"
			        fi
				echo -n "Enter Password : "
                                        read pass
			        sshpass -p $pass scp -P$port ~/.zshrc $user@$ip:/tmp/.bashrc_temp
				#ssh -p$port -t $user@$ip "bash --rcfile /tmp/.bashrc_temp ; rm /tmp/.bashrc_temp"
				sshpass -p $pass ssh -o StrictHostKeyChecking=no -p$port -t $user@$ip -v "bash --rcfile /tmp/.bashrc_temp ; rm /tmp/.bashrc_temp"

			fi
	fi
}

#End
