set background=dark
highlight clear

if exists("syntax on")
	syntax reset
endif
let g:colors_name="kantum"

" Errors less agressive
hi	ErrorMsg ctermfg=1 ctermbg=0 guifg=Black guibg=Red

" SetNumber color
hi  LineNr ctermfg=12

" Statement color
hi  Statement ctermfg=13

" Constant color
hi	Constant ctermfg=37

" ColorColumn at 80 characters
hi	ColorColumn ctermbg=darkblue

" Set the folds to not be backgrounded
hi	Folded ctermbg=NONE

" Set invisisble split separators
hi	VertSplit ctermfg=black
set fillchars="$"

" Set tabs colors

" Unselected tab
hi Tabline ctermbg=black
hi Tabline ctermfg=grey

" Selected tab
hi TablineSel ctermfg=magenta
hi TablineSel ctermbg=black

hi TabLinefill ctermfg=0
