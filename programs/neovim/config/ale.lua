vim.cmd [[
let g:ale_java_checkstyle_options = '-c $HOME/.config/checkstyle.xml'
let g:ale_java_checkstyle_executable = 'checkstyle'  " Assumes 'checkstyle' is in your PATH
let g:ale_linters = {
\ 'java': ['checkstyle'],
\}
]]
