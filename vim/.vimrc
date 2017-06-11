"------------------------- Vimrc file from Siphillis -------------------------

"------------------------------ Fevrier 2017 ---------------------------------

"------------------------------- VIM-PLUG ------------------------------------
call plug#begin()

Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'maksimr/vim-translator'
Plug 'chrisbra/Recover.vim'
Plug 'ekalinin/Dockerfile.vim'

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
set scrolloff=20	" Affiche un minimum de 20 lignes autour du curseur
set shiftwidth=4	" Regle les tabulations automatiques sur 4 espaces
set tabstop=4		" Regle l'affichage des tabulations sur 4 espaces
set background=dark	" Utilise des couleurs adaptees pour fond noir
set laststatus=2	" Affiche la bar de status
set cc=80			" Change la couleur de fond a 80 colonnes
set showcmd			" Affiche les commandes incompletes
					" set list set nolist nice caracteres
" set listchars=space:.,tab:▸\ ,eol:¬	
set cursorline
" set cursorcolumn

hi ColorColumn ctermbg=darkgrey
hi Folded ctermbg=NONE "set the folds to not be backgrounded 

"-------------------------------- RECHERCHE ----------------------------------

set ignorecase		" Ignore la casse lors d'une recherche
set smartcase		" Sauf si la recherche contient une majuscule
set incsearch		" Surligne le resultat pendant la saisie
set hlsearch		" Surligne le resultat de la recherche

"---------------------------------- Beep -------------------------------------

set visualbell		" Empeche vim de beeper
set noerrorbells	" Empeche vim de beeper

" Cache les fichiers lors de l'ouverture d'un autre
set hidden

" Desactive les touches directionnelles
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"------------------------------- FUNCTIONS -----------------------------------

" Fonction pour passer la numérotation en mode relative "
function! NumberToggle()
	if(&relativenumber == 1)
		set norelativenumber
		set number
	else
		set relativenumber
	endif
endfunc

" Raccourci permettant d'utiliser la fonction
nnoremap <C-n> :call NumberToggle()<cr>

" fonction pour pouvoir coller du code sans problemes
function! IndentToggle()
	if(&paste ==1)
		set nopaste
	else
		set paste
	endif
endfunc

" Raccourci clavier pour utiliser la fontion
nnoremap <C-l> :call IndentToggle() <cr>

" from 90% without plugins
"set path+=** " not so good idea !
set wildmenu

" Raccourci pour creer les tags dans un fichier
command! MakeTags !ctags -R .

"-------------------------------- NETRW --------------------------------------

" Faire de netrw quelquechose de classe (pas au point)
let g:netrw_banner=0		" disable annoying banner
" let g:netrw_browse_split=4	" open in prior window
let g:netrw_altv=1			" open splits to the right
let g:netrw_liststyle=3		" tree view
" let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_winsize=15
let g:netrw_preview=1

"------------------------------ AIRLINE --------------------------------------

" unicode symbols
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'

" Enable the list of buffers
" let g:airline#extensions#tabline#enabled = 1

" Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':t'

" Fait marcher le copier-coller ( vim compilé avec +clipboard )
" set clipboard=unnamed


" Configuration de vim translate
