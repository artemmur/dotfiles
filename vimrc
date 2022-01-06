source ~/.vim/plugins.vim
source ~/.vim/mapping.vim

set encoding=utf-8

set number
set relativenumber
set cursorline
set scrolloff=3

set expandtab
set tabstop=4
set shiftwidth=4

set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

set hlsearch
set incsearch
set smartcase
set ignorecase

set wildmenu
set wildmode=list:full
set wildignore+=*.d,*.o,*.out,*.bin
set wildignorecase

set hidden
set splitbelow
set splitright

set nobackup
set noswapfile
set noshowmode
set autoread

let g:jellybeans_use_term_background_color = 1
syntax on
set t_Co=256
colorscheme jellybeans

set laststatus=2
let g:airline_theme = 'minimalist'
let g:airline_powerline_fonts = 1

let g:bufferline_echo           = 0
let g:bufferline_show_bufnr     = 0
let g:bufferline_solo_highlight = 1
let g:cpp_class_scope_highlight = 1

set autowrite

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Map keys for most used commands.
" Ex: `\b` for building, `\r` for running and `\b` for running test.
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" Show whitespaces
set linebreak
set listchars=space:·
hi SpecialKey guibg=NONE ctermbg=NONE
set list

" Python
let python_highlight_all = 1

set completeopt=menuone
map <C-]> ;YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf   = '~/.vim/.ycm_extra_conf.py'
let g:ycm_key_invoke_completion   = '<C-p>'
let g:ycm_use_ultisnips_completer = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_cache_omnifunc          = 0
let g:echodoc#enable_at_startup   = 1
let g:ycm_disable_signature_help  = 1
let g:ycm_clangd_args             = ['--header-insertion=never']
let g:ycm_update_diagnostics_in_insert_mode = 0

function Trim()
    let save_cursor = getpos(".")
    silent! %s/\s\+$//e
    silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction

autocmd BufWritePre * call Trim()
