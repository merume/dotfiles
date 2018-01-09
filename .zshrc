# Created by newuser for 5.4.2
export EDITOR=vim
export LANG=ja_JP.UTF-8
export KCODE=u
export AUTOFEATUER=true
bindkey -v

setopt no_beep
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt correct

autoload -U compinit
compinit

setopt auto_list
setopt auto_menu
setopt list_packed
setopt list_types

bindkey '^[[z' reverse-menu-complete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

export LSCOLORS=Exfxcxdxbxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;34:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
export CLICOLOR=true
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

autoload -U colors
colors
tmp_prompt="
%{${fg[cyan]}%}%~%{${reset_color}%}
$:"

tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

PROMPT=$tmp_prompt
PROMPT2=$tmp_prompt2
SPROMPT=$tmp_sprompt

# Gitブランチ名の表示 
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]' 
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]' 

precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

RPROMPT="%1(v|%F{green}%1v%f|)"

# Aliases #
alias grep='grep --color'
alias ls='ls --color=auto'
alias vi=vim
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'
alias sudo='sudo -E '

source /usr/share/chruby/chruby.sh

chruby 2.5

PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export GEM_HOME=$(ruby -e 'print Gem.user_dir')

