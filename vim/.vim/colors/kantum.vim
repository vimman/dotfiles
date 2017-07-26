set background=dark
highlight clear
if exists("syntax on")
	syntax reset
endif
let g:colors_name="kantum"

" Errors less agressive
highlight ErrorMsg ctermfg=1 ctermbg=0 guifg=Black guibg=Red
