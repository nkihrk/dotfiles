### Install fish plugins
echo 'Installing fish plugins...'

# fisher
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
# nvm.fish
fisher install jorgebucaran/nvm.fish
# z
fisher install jethrokuan/z
# fzf
fisher install jethrokuan/fzf
# fish-bd
fisher install 0rax/fish-bd
# fish-ghq
fisher install decors/fish-ghq

echo 'All done!'
