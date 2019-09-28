# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

[ ! -d ~/.zplug ] && git clone https://github.com/zplug/zplug ~/.zplug
source ~/.zplug/init.zsh



zplug "plugins/git", from:oh-my-zsh
zplug "b4b4r07/enhancd", use:"init.sh", at:2ccdaca
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"


zplug 'junegunn/fzf', \
      as:command, \
      use:'bin/{fzf,fzf-tmux}', \
      if:"[[ $OSTYPE == linux* || $OSTYPE == darwin* ]]", \
      hook-build:'./install --key-bindings --completion --no-update-rc'
zplug "junegunn/fzf", use:"shell/*.zsh", defer:2

zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

alias ect="emacsclient"
alias ecg="emacsclient -c"

export TERM=xterm-256color
export EDITOR="emacsclient"
export TMUX_CONF_DIR="~/.tmux"

# virtual env stuff
export WORKON_HOME="~/.virtualenvs/"
export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python3"
source ~/.local/bin/virtualenvwrapper.sh

# cuda stuff
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64/

# path
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.npm-packages/bin:$PATH
unset MANPATH
export MANPATH="$HOME/.npm-packages/share/man:$(manpath)"


# manage configs
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no


export ENHANCD_FILTER=fzf

