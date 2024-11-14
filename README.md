```bash
# Make sure dotfiles is in your $HOME directory
cd ~/dotfiles
```

## zsh
Change your `.zshrc` to be this:
```bash
source ~/dotfiles/lib/omz.sh
source ~/dotfiles/lib/aliases.sh
source ~/dotfiles/lib/path.sh
source ~/dotfiles/lib/prompt.sh
source ~/dotfiles/lib/ghrc.sh
# include other customizations below
```

## tmux

```bash
# copy the repo's tmux config to your local conifg
$ ./tmux_install.sh
```

## neovim
```bash
# copy the repo's neovim config to your local conifg
$ ./nvim_install.sh
```

