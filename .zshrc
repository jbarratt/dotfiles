source ~/.dotfiles/zshuery/zshuery.sh

load_defaults
load_aliases
load_completion ~/.dotfiles/zshuery/completion
load_correction

# Make ls colorized for Lion
export CLICOLOR=1
# faux solarized scheme for ls
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

prompts '%{$fg_bold[green]%}$(COLLAPSED_DIR)%{$reset_color%}$(virtualenv_info) %{$fg[yellow]%}$(prompt_char)%{$reset_color%} '

chpwd() {
        update_terminal_cwd
}

export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/python:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/opt/local/bin:/usr/local/git/bin:~/perl5/bin:~/.dotfiles/bin:$PATH

eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)

alias vi=vim

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
