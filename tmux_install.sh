echo "This will overwrite your tmux config. Do you wish to proceed? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  cp ~/dotfiles/.tmux.conf ~/.tmux.conf
  cp ~/dotfiles/.tmux.conf.local ~/.tmux.conf.local
  echo "tmux config copied from repo to home"
else
  echo "tmux config not copied"
fi