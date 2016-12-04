just for test
syntax enable
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set hlsearch
set number
set expandtab
:inoremap [ []<ESC>i
:inoremap ( ()<ESC>i
:inoremap { <c-r>=Curly_brace()<ESC>
:inoremap ) <c-r>=SmartClose(')')<ESC>
:inoremap ] <c-r>=SmartClose(']')<ESC>
:inoremap } <c-r>=SmartClose('}')<ESC>
:inoremap <CR> <c-r>=Smart_return()<ESC>
:inoremap jk <ESC>

function! SmartClose(c)
    let Current_line = getline(".")
    if (Current_line[col(".")-1] == a:c)
        return "\<Right>"
    else
        return a:c
    endif
endfunction
function! Curly_brace()
	let Current_line = getline(".")
	let j = 0
	let i = 0
    let first_word1 = ""
    let first_word2 = ""
    let first_word3 = ""
	while (Current_line[j] == ' ')
		let j += 1
    endwhile
	while (i < 4)
        let first_word1 = first_word1 . Current_line[i + j]
        let first_word2 = first_word2 . Current_line[i + j]
        let first_word3 = first_word3 . Current_line[i + j]
        let i += 1
	endwhile
    let first_word2 = first_word2 . Current_line[j + 4]
    let first_word3 = first_word3 . Current_line[j + 4]
    let first_word3 = first_word3 . Current_line[j + 5]
    if (first_word1 == "enum" || first_word2 == "class" || first_word3 == "struct")
        return "{};\<Left>\<Left>"
    else
        return "{}\<Left>"
    endif
endfunction

function! Smart_return()
    let Current_line = getline(".")
    if Current_line[col(".")-2] == '{'
        return "\<CR>\<ESC>O"
    else
        return "\<CR>"
    endif
endfunction

