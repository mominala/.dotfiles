# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.npm-packages/bin:$PATH
unset MANPATH
export MANPATH="$HOME/.npm-packages/share/man:$(manpath)"

[ ! -d ~/.zplug ] && git clone https://github.com/zplug/zplug ~/.zplug
source ~/.zplug/init.zsh


zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"

zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/scd",   from:oh-my-zsh
zplug "plugins/zsh-autosugggestions",   from:oh-my-zsh
zplug "plugins/zsh-syntax-highlighting",   from:oh-my-zsh


zplug 'junegunn/fzf', \
      as:command, \
      use:'bin/{fzf,fzf-tmux}', \
      if:"[[ $OSTYPE == linux* || $OSTYPE == darwin* ]]", \
      hook-build:'./install --key-bindings --completion --no-update-rc'
zplug "junegunn/fzf", from:github, use:"shell/*.zsh"


zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose

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


# manage configs
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
