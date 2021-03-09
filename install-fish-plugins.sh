### Install fish plugins
echo 'Installing fish plugins...'

# fisher
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
echo 'Installed fisher!'
# nvm.fish
fisher install jorgebucaran/nvm.fish
echo 'Installed nvm.fish!'
# z
fisher install jethrokuan/z
echo 'Installed z!'
# fzf
fisher install jethrokuan/fzf
echo 'Installed fzf!'
# fish-bd
fisher install 0rax/fish-bd
echo 'Installed fish-bd!'
# fish-ghq
fisher install decors/fish-ghq
echo 'Installed fish-ghq!'

echo 'All done!'
