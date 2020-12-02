cp ~/.bashrc ~/.bashrc~
cat bashrc >> ~/.bashrc
cp tmux.conf ~/.tmux.conf

mkdir ~/bin
cp ml-tmux.sh ~/bin/ml-tmux
chmod +x ~/bin/ml-tmux

cd ~/bin/
wget "https://github.com/direnv/direnv/releases/download/v2.20.0/direnv.linux-amd64"
mv direnv.linux-amd64 direnv
chmod +x ~/bin/direnv

git clone https://github.com/david-lindner/nvidia-htop ~/nvidia-htop
pip install termcolor
