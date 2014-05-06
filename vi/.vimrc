filetype indent on
syntax on

set ruler              " always show cursor
set expandtab          " tabs are converted to spaces, use only when required
set softtabstop=2
set shiftwidth=2		
set smartindent
set tabstop=2          " 2 spaced tabs
set title              " title in console
set hlsearch           " highlight all search matches
set incsearch          " incremental searches
set paste

set number             " show line numbers
set ignorecase         " ignore case when searching

set ttyfast            " smooth

" Change cursor shape between insert and normal mode in iTerm2.app
" Source: http://hamberg.no/erlend/posts/2014-03-09-change-vim-cursor-in-iterm.html
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
