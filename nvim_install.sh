echo "This will overwrite your nvim config. Do you wish to proceed? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  cp -r ~/dotfiles/nvim ~/.config
  echo "nvim config copied from repo to home"
else
  echo "nvim config not copied"
fi
