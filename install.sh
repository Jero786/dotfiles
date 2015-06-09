cd ~/.
sudo chown -R $USER_HOME .

echo  'export HOME=/home/' + $USER_HOME >> ~/.bashrc
echo  'export TERM="xterm-256color' >> ~/.bashrc

sudo apt-get update
sudo apt-get install nodejs-legacy  npm git tmux
sudo npm install -g grunt-cli bower jshint jscs esformatter node-inspector js-beautify
mkdir ~/.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir ~/.vim/undodir
mkdir ~/.vim/undo
mkdir ~/.vim/swaps
mkdir ~/.vim/backups

mkdir  ~/.vim/colors/
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
cp ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/

wget https://github.com/Jero786/dotfiles/raw/master/.gitconfig
wget https://github.com/Jero786/dotfiles/raw/master/.tmux.conf
wget https://github.com/Jero786/dotfiles/raw/master/.vimrc

sudo vim +PluginInstall +qall

