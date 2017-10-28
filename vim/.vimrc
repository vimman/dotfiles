"------------------------- Vimrc file from Siphillis -------------------------

"------------------------------ Fevrier 2017 ---------------------------------

"------------------------------- VIM-PLUG ------------------------------------
call plug#begin()

Plug 'vim-syntastic/syntastic'			" Avoid simple mistakes of syntax
Plug 'tpope/vim-surround'				" Plugin to help surrounding (){}[]...
Plug 'bling/vim-airline'				" Bottom line styling plugin
Plug 'vim-airline/vim-airline-themes'	" Themes for vim-airline
Plug 'chrisbra/Recover.vim'				" recover .swp files
Plug 'ekalinin/Dockerfile.vim'			" syntax for Dockerfiles
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "FZF !
Plug 'tpope/vim-fugitive'				" git plugin
Plug 'junegunn/goyo.vim'				" Distraction free plugin
"Plug 'gilligan/vim-lldb'				" lldb

if has('nvim')
	Plug 'critiqjo/lldb.nvim'			" lldb integration needs python-client
endif

" Initialize plugin system
call plug#end()

filetype plugin indent on    " required

" Use space as <mapleader> key
:let mapleader = " "

"-------------------------------- AFFICHAGE ----------------------------------

syntax enable		" Active la coloration syntaxique
set mouse=a			" Permet d'utiliser la souris
set title			" Met a jour le titre du terminal
"set number			" Affiche le numero de ligne
set ruler			" Affiche la position actuelle du curseur
set wrap			" Affiche les lignes trop longues sur plusieur lignes
set linebreak		" Ne coupe pas les mots
set scrolloff=5		" Affiche un minimum de 5 lignes autour du curseur
set shiftwidth=4	" Regle les tabulations automatiques sur 4 espaces
set tabstop=4		" Regle l'affichage des tabulations sur 4 espaces
set background=dark	" Utilise des couleurs adaptees pour fond noir
set splitright		" Ouvre les verticalsplit sur la droite

set laststatus=2	" Affiche la bar de status
set cc=80			" Change la couleur de fond a 80 colonnes
set showcmd			" Affiche les commandes incompletes
					" Set list set nolist nice caracteres
set wildmenu		" Show autocompletion possibles

set listchars=space:.,tab:▸\ ,eol:¬
set cursorline
"set cursorcolumn

" Set my personal scheme
colorscheme kantum

"-------------------------------- RECHERCHE ----------------------------------

set ignorecase		" Ignore la casse lors d'une recherche
set smartcase		" Sauf si la recherche contient une majuscule
set incsearch		" Surligne le resultat pendant la saisie

"---------------------------------- Beep -------------------------------------

set visualbell		" Empeche vim de beeper
set noerrorbells	" Empeche vim de beeper

" Cache les fichiers lors de l'ouverture d'un autre
set hidden

" Desactive les touches directionnelles
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"------------------------------- FUNCTIONS -----------------------------------

" Raccourci pour passer la numérotation en mode relative "
nnoremap <leader>N :set relativenumber!<cr>
nnoremap <leader>n :set number!<cr>

" Raccourci clavier pour pouvoir coller du code sans problemes
"nnoremap <C-l> :set paste! <cr>

" from 90% without plugins
"set path+=** " not so good idea !

" Shortcut to recursivly make tags
command! Mt !ctags -R .

" Do not create swapfiles
:set noswapfile

"-------------------------------- NETRW --------------------------------------

" Faire de netrw quelquechose de classe (pas au point)
let g:netrw_banner=0		" disable annoying banner
let g:netrw_liststyle=3		" tree view
let g:netrw_winsize=15
let g:netrw_preview=1

nnoremap <leader>l :Lex<cr>

"------------------------------ AIRLINE --------------------------------------

" If you have powerline fonts installed
let g:airline_powerline_fonts = 1
"themes choosing
let g:airline_theme='bubblegum'

" Enable the list of buffers
"let g:airline#extensions#tabline#enabled = 1

" Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'

"--------------------------------- GOYO ---------------------------------------

" Goyo shortcut
:nnoremap <leader>g <esc>:Goyo<cr>

let g:goyo_width=160
let g:goyo_height="80%"

"--------------------------------- NEOVIM -------------------------------------

" Use escape to get out insert-mode in terminal
if has('nvim')
	:tnoremap <Esc> <C-\><C-n>
endif

" Use Alt-[hjkl] to move around splits
if has('nvim')
	:tnoremap <A-h> <C-\><C-N><C-w>h
	:tnoremap <A-j> <C-\><C-N><C-w>j
	:tnoremap <A-k> <C-\><C-N><C-w>k
	:tnoremap <A-l> <C-\><C-N><C-w>l
endif
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

"--------------------------------- TABS ---------------------------------------

" Use <alt-j> and <alt-k> to change tab
:inoremap <C-j> gT
:inoremap <C-k> gt
:nnoremap <C-j> gT
:nnoremap <C-k> gt

"------------------------------ VIMSCRIPT -------------------------------------

" Use \\ as <localleader>
:let  maplocalleader = "\\"

" Let Vim say something nice at startup
autocmd VimEnter * echo "'O.O' Ah que coucou !"

" Map Leader-u to set the current word Uppercase
:imap <localleader>u <esc>viw~ea

" Use a shorcut to edit my vimrc
:nnoremap <leader>ev :sp $MYVIMRC<cr>

" Use a shorcut to source my vimrc
:nnoremap <leader>sv :so $MYVIMRC<cr>

" Abbreviation for main
:iabbrev mainc int		main(int argc, char **argv)<cr>{<cr>}<esc>ko

" Unset wrap when oppening html
:autocmd BufWrite,BufRead *.hml :setlocal nowrap

" Autoindent html files when write/read it
":autocmd BufWritePre,BufRead *.html :normal G=gg

" Set differents commenting depending on the language
:autocmd FileType c iabbrev /* /**/<left><left>
:autocmd FileType c nnoremap <buffer> <localleader>c I//<esc>
:autocmd FileType vim nnoremap <buffer> <localleader>c I"<esc>
:autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
:autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>

" Open the previous buffer when delete one
:command! Bd bp\|bd \#

" Neovim terminal toggle
let g:term_buf = 0
let g:term_win = 0

function! Term_toggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height * 2
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction


if has('nvim')
	nnoremap <localleader>t :call Term_toggle(10)<cr>
	tnoremap <localleader>t <C-\><C-n>:call Term_toggle(10)<cr>
endif

" Change in next parenthese
onoremap in( :<c-u>normal! f(vi(<cr>
" Change in previous parenthese
onoremap il( :<c-u>normal! F)vi(<cr>
" Change around next parenthese
onoremap an( :<c-u>normal! f(va(<cr>
" Change around previous parenthese
onoremap al( :<c-u>normal! F)va(<cr>

" Change in next square brackets
onoremap in[ :<c-u>normal! f[vi[<cr>
" Change in previous square brackets
onoremap il[ :<c-u>normal! F]vi[<cr>
" Change around next square brackets
onoremap an[ :<c-u>normal! f[va[<cr>
" Change around previous square brackets
onoremap al[ :<c-u>normal! F]va[<cr>

" Change in next curly brackets
onoremap in{ :<c-u>normal! f{vi{<cr>
" Change in previous curly brackets
onoremap il{ :<c-u>normal! F}vi{<cr>
" Change around next curly brackets
onoremap an{ :<c-u>normal! f{va{<cr>
" Change around previous curly brackets
onoremap al{ :<c-u>normal! F}va{<cr>

onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
onoremap ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>

