#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export EDITOR=vim
export VISUAL=vim

alias ctags="`brew --prefix`/bin/ctags"

alias tags='ctags -R --exclude=.git --exclude=log .'
alias tags-bundler='ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)'

#rails aliases
alias be='bundle exec'
alias bes='be spring'
alias ber='be rspec'
alias besr='bes rspec'

# /Elements
export PATH="/usr/local/opt/elasticsearch@2.4/bin:$PATH"

function killport() {
  kill -9 $( lsof -i:$1 -t )
}

function tunneldw() {
  ssh -nNT -o ServerAliveInterval=50 -L 127.0.0.1:5439:redshift.internal.dw.net:5439 damienadermann@ssh.dw.envato.net
}
export PATH="/usr/local/opt/postgresql@11/bin:$PATH"


. /opt/homebrew/opt/asdf/asdf.sh

export PATH="/opt/homebrew/opt/postgresql@11/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
