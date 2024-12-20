source ~/dotfiles/lib/omz.sh
source ~/dotfiles/lib/aliases.sh
source ~/dotfiles/lib/path.sh
source ~/dotfiles/lib/prompt.sh
source ~/dotfiles/lib/ghrc.sh

# Yubikey
export SSH_AUTH_SOCK="$(brew --prefix)/var/run/yubikey-agent.sock"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/benschwartz/lib/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/benschwartz/lib/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/benschwartz/lib/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/benschwartz/lib/google-cloud-sdk/completion.zsh.inc'; fi

