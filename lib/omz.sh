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

function my_zsh_vi_mode_init() {
  bindkey "^s" autosuggest-accept
  unsetopt correct_all
  setopt correct
}

zvm_after_init_commands+=(my_zsh_vi_mode_init)