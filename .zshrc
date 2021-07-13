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

# Elements
function _keychain() {
  keychain="envato.keychain"
  service="elements-development"
  key=${1}
  security find-generic-password -a $service -s $key -w $keychain
}

function _keychain_hex() {
  _keychain $1 | perl -pe 's/([0-9a-f]{2})/chr hex $1/gie'
}

function elements-environment() {
  IMGIX_COVER_IMAGE_HOST=$(_keychain imgix_cover_image_host) \
  IMGIX_COVER_IMAGE_SECURE_URL_TOKEN=$(_keychain imgix_cover_image_secure_url_token) \
  IMGIX_PREVIEW_IMAGE_HOST=$(_keychain imgix_preview_image_host) \
  IMGIX_PREVIEW_IMAGE_SECURE_URL_TOKEN=$(_keychain imgix_preview_image_secure_url_token) \
  SSO_STOREFRONT_API_KEY=$(_keychain sso_storefront_api_key) \
  $*
}
# /Elements
export PATH="/usr/local/opt/elasticsearch@2.4/bin:$PATH"

source /usr/local/opt/asdf/asdf.sh

function killport() {
  kill -9 $( lsof -i:$1 -t )
}

function tunneldw() {
  ssh -nNT -o ServerAliveInterval=50 -L 127.0.0.1:5439:redshift.internal.dw.net:5439 damienadermann@ssh.dw.envato.net
}
export PATH="/usr/local/opt/postgresql@11/bin:$PATH"


. /usr/local/opt/asdf/asdf.sh
