" automatically reload .vimrc
autocmd! bufwritepost .vimrc source %

" enable pathogen package manager
execute pathogen#infect()
execute pathogen#helptags()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             GENERAL VIM SETTINGS                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" has to go first, because it changes other settings
set nocompatible

" automatically change the working dir
" (according to some sources) this sometimes causes problems, I haven't had any
set autochdir

" detect filetypes
filetype plugin indent on
syntax on
colorscheme 256-jungle
set background=dark

" set leader key to ,
let mapleader=","

" line numbering
set number

" set terminal title (current version 7.4 does this by default)
"set title

" enable mouse
set mouse=a

" tabs as 4 spaces and autoindent
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
au FileType python set autoindent
au FileType python set smartindent " after keywords like if, for, while etc

" no autoindent whatsoever in tex files!
au FileType tex setl noai nocin nosi inde=

set textwidth=80
set wrap
set fo-=t " no autowrap when typing
" line to limit 80 chars
set colorcolumn=80
highlight ColorColumn ctermbg=8

" code folding (triggered with za)
" for python indent is the perfect method
au FileType python set foldmethod=indent
set foldlevel=99 " open file unfolded --> high foldlevel
" enable folding for latex files
let g:tex_fold_enabled=1


" Show tabs as triangles and trailing spaces as
" well es lines with only spaces as dots.
" Does not seem to be compatible, because of encoding stuff
" set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" leave selection afer indentation (allows multiple tab)
vnoremap < <gv
vnoremap > >gv

" better tab complete for commands (bash-like)
set wildmode=longest,list,full
set wildmenu

" expected backspace behaviour (otherwise it doesn't work sometimes in insert)
set backspace=2

" incremental search
set incsearch

" disable ex mode, which is useless and only there for compatibility reasons
nnoremap Q <nop>

" Run code
au FileType python map <Leader>r :w<CR>:!ipython3 %<CR>

" overwrite g:masterfile to set a latex master document
" latex compiling using rubber and synctex
function CompileTex()
    let l:file = get(g:, 'masterfile', @%)
    execute '!rubber --pdf --synctex ' . l:file . ' ; okular --unique ' . join(split(l:file,'\.')[:-2],'') . '.pdf\#src:' . line('.') . expand('%:p')
endfunction 

au FileType tex,plaintex map <Leader>r :w<CR>:call CompileTex()<CR>

" very pretty comments (as healines for sections or something)

au FileType vim let b:commentchar='"'
au FileType python let b:commentchar='#'
au FileType tex let b:commentchar='%'

au FileType vim,python,tex command! Prettyc normal :center<cr>41A <esc>79|d$a<C-r>=b:commentchar<cr><esc>0cl<C-r>=b:commentchar<cr><esc>79i<C-r>=b:commentchar<cr><esc>a<cr><esc><up>yy<down>p

"" SPELL CHECKING
" activate german or english spellchecking in current buffer
command Spellen setlocal spell spelllang=en
command Spellde setlocal spell spelllang=de_de
" when in tex file we also want to write the command in the first line, so that
" it gets activated the next time the file is opened (--> redefine cmd locally)
au FileType tex command! -buffer Spellen setlocal spell spelllang=en | normal gg0i% vim: spell spelllang=en<cr><esc>
au FileType tex command! -buffer Spellde setlocal spell spelllang=de_de | normal gg0i% vim: spell spelllang=de_de<cr><esc>

" spell checking for non syntax elements on all levels (when spellchecking
" is active) for latex documents!
au FileType tex syntax spell toplevel notoplevel

highlight SpellBad ctermbg=bg ctermfg=red
highlight SpellCap ctermbg=bg ctermfg=blue



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 KEY MAPPINGS                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" moving between windows with , instead of ctrl-w
map <silent><Leader><Up> <C-w><Up>
map <silent><Leader><Down> <C-w><Down>
map <silent><Leader><Left> <C-w><Left>
map <silent><Leader><Right> <C-w><Right>

" quit window
map <silent><Leader>q <C-w>q
" open new window vertically and switch in new window
map <silent><leader>v <C-w>v<C-w>l


" use ctrl+d to quickly open&close bash terminal
map <C-d> :silent !bash<CR><C-l>

" toggle auto hard wrap at textwidth
function! ToggleAutoHardWrap()
    if &fo =~ 't'
     set fo-=t
     echo "turned auto hard wrap off"
    else
     set fo+=t
     echo "turned auto hard warp on"
    endif
endfunction

map <Leader>t :call ToggleAutoHardWrap()<cr>

" insert breakpoints in python (befor current line)
au FileType python map <Leader>br Oimport pdb; pdb.set_trace()<esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               PLUGIN SETTINGS                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree (filebrowser panel)
" activate with ,u
map <Leader>u :NERDTreeToggle<CR>
let NERDTreeChDirMode=2 " change dir when moving in tree
" set colors consistent
hi Directory ctermfg=fg ctermbg=bg

" ConoLine for nice highlighting of the current line

" For dark colorschemes
let g:conoline_color_normal_dark = 'ctermbg=0'
let g:conoline_color_normal_nr_dark = 'ctermbg=0'
let g:conoline_color_insert_dark = 'ctermbg=8'
let g:conoline_color_insert_nr_dark = 'ctermbg=8'

" " For light colorschemes
" let g:conoline_color_normal_light = 'guibg=#eaeaea'
" let g:conoline_color_normal_nr_light = 'guibg=#eaeaea'
" let g:conoline_color_insert_light = 'guibg=#ffffff'
" let g:conoline_color_insert_nr_light = 'guibg=#ffffff'

" Airline statusline
set laststatus=2 " somehow airline doesn't show up otherwise
let g:airline_powerline_fonts=1 " activate powerline fonts

" define symbols to use in statusline
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = ''
let g:airline_symbols.whitespace = ''

" set theme
let g:airline_theme="simple"

" show file path in statusline
let g:airline_section_b = '%{getcwd()}'
let g:airline_section_c = '%t'

" airline-tabline improved tabline which can show buffers nicely
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s: '

" CtrlP - file finder
" gets really slow when too many files are scanned
let g:ctrlp_max_files = 1000

" setup supertab to use omnicomplete (I only use tab completation for coding)
let g:SuperTabDefaultCompletionType = "context"
" close preview (description of commands) when chosen a completation
let g:SuperTabClosePreviewOnPopupClose = 2

" snipmate constants
let g:snips_author = "David Lindner"

" i don't really like autoclose for strings
" and unfortunately setting it per filetype doesn't work for some reason...
let g:AutoClosePairs = "[] () {}"
