cd ~/.
sudo chown -R $USER_HOME .
echo  'export HOME=/home/$USER_HOME' >> ~/.bashrc
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

wget https://www.dropbox.com/s/cvkcz58cy4i36wi/.tmux.conf
wget https://www.dropbox.com/s/xeip4t6n2l5yo6d/.vimrc
wget https://www.dropbox.com/s/0vihasc1r1bqqsr/.gitconfig

sudo vim +PluginInstall +qall

