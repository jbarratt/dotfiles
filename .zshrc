source ~/.dotfiles/zshuery/zshuery.sh

load_defaults
load_aliases
load_completion ~/.dotfiles/zshuery/completion
load_correction

# Make ls colorized for Lion
export CLICOLOR=1
# faux solarized scheme for ls
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

export TERM="screen-256color"
alias tmux="tmux -2"

prompts '%{$fg_bold[green]%}$(COLLAPSED_DIR)%{$reset_color%}$(virtualenv_info) %{$fg[yellow]%}$(prompt_char)%{$reset_color%} '

chpwd() {
        update_terminal_cwd
}

export GOROOT="/usr/local/Cellar/go/1.2"
export GOBIN="$GOROOT/bin"
export GOPATH=$HOME/work/go

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/opt/local/bin:/usr/local/git/bin:~/perl5/bin:~/.dotfiles/bin:/usr/local/texlive/2012basic/bin/universal-darwin:$GOBIN:$PATH

eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)

alias vi=vim
alias rd="open /System/Library/CoreServices/Screen\ Sharing.app"
alias clean_downloads="find ~/Downloads -mtime +30 -maxdepth 1 -print -exec rmtrash '{}' ';'"
alias cleanpyc='find . -type f -name "*.pyc" -delete;'
alias serve="python -m SimpleHTTPServer"
alias 'perl-repl'='perl -MData::Dumper -MTerm::ReadLine -e '\''$r = Term::ReadLine->new(1);while(defined($_ = $r->readline("code:  "))){$ret=Dumper(eval($_));$err=$@;if($err ne ""){print $err;}else{print $ret;}}'\'''

unset PYTHONDONTWRITEBYTECODE
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/work
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
source /usr/local/share/python/virtualenvwrapper.sh

alias mk26env='mkvirtualenv --python=/usr/local/Cellar/python26/2.6.8/bin/python'

#export PYTHONDONTWRITEBYTECODE=1

# Ansible Config
export ANSIBLE_HOSTS=~/.ansible_hosts

# Z, the magic remembering command line warper
. ~/.dotfiles/bin/z.sh


export RBENV_ROOT=/usr/local/var/rbenv 
export PATH="$RBENV_ROOT/bin:$PATH"
export RUBY_BUILD_BUILD_PATH="$HOME/tmp"
#export PREFIX="$RBENV_ROOT"
export RBENV_VERSION=1.9.3-p392
eval "$(rbenv init -)"

 #add some easy terminal alias for bundler calls
alias b="bundle exec"
alias bi="bundle install --without production"
# add bundler binstubs to the path so relative binarys are auto run from a project dir
export PATH="./vendor/bundle/bin:$PATH"

# pip reinstall
alias pipr='pip install --no-deps --ignore-installed'

alias dropboxgit='if [[ -e .git ]] ; then NAME=$(basename `pwd`) ; git init --bar ~/Dropbox/git/$NAME.git ; git remote add origin ~/Dropbox/git/$NAME.git ; git push -u origin master ; echo "Dropbox remote created" ; else ; echo "not currently in a git repo" ; fi'

alias rpi_ip="arp -a | grep b8:27:eb | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'"
alias key_rpi="ssh-copy-id pi@`rpi_ip`"

alias ipn='ipython notebook'
export PATH="/Users/jbarratt/tmp/google-cloud-sdk/bin:$PATH"

mdhtml () { pandoc -t html -T 'Pandoc Generated' --smart --standalone --self-contained -c ~/.dotfiles/css/avenir-white.css $1 | bcat }
