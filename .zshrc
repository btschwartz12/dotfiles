# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="sporty_256" zhann
# ZSH_THEME="zhann"
ZSH_THEME="mlh"
ZSH_THEME_RANDOM_IGNORED=("dallas" "superjarin" "humza" "mikeh" "half-life"
                          "agnoster" "apple" "simonoff" "darkblood" "obraun"
                          "lukerandall" "evan" "junkfood" "adben" "dieter" "pygmalion"
                          "gallois" "fletcherm" "tonotdo" "dpoggi" "macovsky"
                          "kennethreitz" "lambda" "frisk" "funky" "crunch" "fox"
                          "gianu" "sunaku" "mh" "rkj" "flazz" "duellj" "jaischeema"
                          "gentoo" "simple" "norm" "eastwood" "afowler" "macovsky-ruby"
                          "maran" "alanpeabody" "jreese" "example"
                          "oldgallois" "fishy" "rkj-repos" "gnzh" "blinks" "pmcgee"
                          "rixius" "trapd00r" "fino-time" "murilasso" "3den" "kphoen"
                          "michelebologna" "smt" "rgm" "xiong-chiamiov-plus" "kardan" "dst"
                          "jispwoso" "tjkirch" "nicoulaj" "jonathan" "crcandy" "re5et" "aussiegeek"
                          "mira" "af-magic" "amuse" "dstufft" "wezm+" "linuxonly" "wezm" "takashiyoshida"
                          "Soliah" "kiwi" "candy" "itchy" "strug" "jtriley" "avit" "tjkirch_mod" "suvash"
                          "mortalscumbag" "kafeitu" "ys" "xiong-chiamiov" "dogenpunk" "muse" "josh" "juanghurtado"
                          "pygmalion-virtualenv" "bureau" "intheloop" "essembeh" "bira" "candy-kingdom")

# Plugins
plugins=(git
        z
        zsh-autosuggestions
        zsh-syntax-highlighting
        copyfile
        macos
	    alias-finder
	    aliases
	    battery
        emotty
        docker
        emoji
        zsh-vi-mode
        )

source $ZSH/oh-my-zsh.sh

# Aliases
alias ls='ls -G -1'
alias l='tree --du -h -L 1 -F'
alias t='tmux attach -t $1'
alias v='omz reload'
alias vim="nvim"
alias tp='bpytop'
alias cat="bat"
alias dotfiles='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Path
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin"
export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
export PATH="/opt/X11/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

function my_zsh_vi_mode_init() {
  bindkey "^s" autosuggest-accept
  unsetopt correct_all
  setopt correct
}

# Append the function to zvm_after_init_commands
zvm_after_init_commands+=(my_zsh_vi_mode_init)

backup() {
    curdir=$PWD
    device='m3'

    cd ~/Backup
    source env/bin/activate
    last_backup_str=$(python3 check-backup.py $device)
    last_backup_exit_code=$?

    if [ $last_backup_exit_code -ne 0 ]; then
      echo "Last backup: $last_backup_str. Run 'backup'"
    fi

    cd $curdir
    deactivate
    alias backup='cd ~/Backup && sudo make backup && sudo make backup-local && cd -'
}

# If you have backups configured
backup

# Cowsay prompt
source ~/lib/data/functions.sh
battery=$(battery_pct_prompt | sed 's/\x1b\[[0-9;]*[a-zA-Z]//g' | sed 's/%{[^}]*}\[\([0-9]*\)%%\].*/\1/')
welcome_msg=$(get_computer_info "$battery" "N/A")
print_box "$welcome_msg"

# Only if the pwd is ~, then cd to ~/Desktop
if [[ $PWD == $HOME ]]; then
  cd ~/Desktop
fi

# copilot
source ~/lib/data/ghrc

# Yubikey
export SSH_AUTH_SOCK="$(brew --prefix)/var/run/yubikey-agent.sock"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/benschwartz/lib/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/benschwartz/lib/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/benschwartz/lib/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/benschwartz/lib/google-cloud-sdk/completion.zsh.inc'; fi

