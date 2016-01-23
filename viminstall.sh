rm -rf ~/.vim

cp ./vimrc ~/.vimrc

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle

git clone https://github.com/miyakogi/conoline.vim
git clone https://github.com/kien/ctrlp.vim
git clone https://github.com/scrooloose/nerdcommenter
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/ervandew/supertab
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/Townk/vim-autoclose
git clone https://github.com/flazz/vim-colorschemes
#snipmate
git clone https://github.com/tomtom/tlib_vim.git
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
git clone https://github.com/garbas/vim-snipmate.git
git clone https://github.com/honza/vim-snippets.git
