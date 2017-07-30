"------------------------- Vimrc file from Siphillis -------------------------

"------------------------------ Fevrier 2017 ---------------------------------

"------------------------------- VIM-PLUG ------------------------------------
call plug#begin()

Plug 'vim-syntastic/syntastic'			"Avoid simple mistakes of syntax
Plug 'tpope/vim-surround'				"Plugin to help surrounding (){}[]...
Plug 'bling/vim-airline'				"Bottom line styling plugin
Plug 'vim-airline/vim-airline-themes'	"Themes for vim-airline
Plug 'chrisbra/Recover.vim'				"recover .swp files
Plug 'ekalinin/Dockerfile.vim'			"syntax for Dockerfiles
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "FZF !
Plug 'tpope/vim-fugitive'				"git plugin

" Initialize plugin system
call plug#end()

filetype plugin indent on    " required

"-------------------------------- AFFICHAGE ----------------------------------

syntax enable		" Active la coloration syntaxique
set mouse=a			" Permet d'utiliser la souris
set title			" Met a jour le titre du terminal
set number			" Affiche le numero de ligne
set ruler			" Affiche la position actuelle du curseur
set wrap			" Affiche les lignes trop longues sur plusieur lignes
set linebreak		" Ne coupe pas les mots
set scrolloff=5		" Affiche un minimum de 5 lignes autour du curseur
set shiftwidth=4	" Regle les tabulations automatiques sur 4 espaces
set tabstop=4		" Regle l'affichage des tabulations sur 4 espaces
set background=dark	" Utilise des couleurs adaptees pour fond noir

set laststatus=2	" Affiche la bar de status
set cc=80			" Change la couleur de fond a 80 colonnes
set showcmd			" Affiche les commandes incompletes
					" set list set nolist nice caracteres
					"
set listchars=space:.,tab:▸\ ,eol:¬	
set cursorline
" set cursorcolumn

set background=dark
hi ColorColumn ctermbg=darkgrey
hi Folded ctermbg=NONE "set the folds to not be backgrounded 

" set invisisble split separators
hi VertSplit ctermfg=0
set fillchars=""

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
nnoremap <C-n> :set relativenumber!<cr>

" Raccourci clavier pour pouvoir coller du code sans problemes
nnoremap <C-l> :set paste! <cr>

" from 90% without plugins
"set path+=** " not so good idea !
set wildmenu

" Raccourci pour creer les tags dans un fichier
command! MakeTags !ctags -R .

"-------------------------------- NETRW --------------------------------------

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction

map <silent> <C-E> :call ToggleVExplorer()<CR>

" Faire de netrw quelquechose de classe (pas au point)
let g:netrw_banner=0		" disable annoying banner
let g:netrw_browse_split=4	" open in prior window
let g:netrw_altv=1			" open splits to the right
let g:netrw_liststyle=3		" tree view
" let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_winsize=15
let g:netrw_preview=1

" Change directory to the current buffer when opening files.
set autochdir

"------------------------------ AIRLINE --------------------------------------

" If you have powerline fonts installed
let g:airline_powerline_fonts = 1
"themes choosing
let g:airline_theme='bubblegum'

" Enable the list of buffers
"let g:airline#extensions#tabline#enabled = 1

" Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'

" utiliser escape pour sortir du mode insert du terminal dans nvim
if has('nvim')
	:tnoremap <Esc> <C-\><C-n>
endif

" Utiliser Alt-[hjkl] pour se déplacer dans les splits
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

"------------------------------ VIMSCRIPT -------------------------------------

" Use space as <mapleader> key
:let mapleader = " "

" Use \\ as <localleader>
:let  MAPLOCALLEADER = "\\"

" Let Vim say something nice at startup
autocmd VimEnter * echo "'O.O' Ah que coucou !"

" Map ctrl-u to set the current word Uppercase
:imap <c-u> <esc>viw~ea

" Use a shorcut to edit my vimrc
:nnoremap <leader>ev :sp $MYVIMRC<cr>G

" Use a shorcut to source my vimrc
:nnoremap <leader>sv :so $MYVIMRC<cr>
