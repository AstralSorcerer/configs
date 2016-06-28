# Set up prompt

setopt prompt_subst

prompt_status_funcs=()

function prompt_status() {
    for func in $prompt_status_funcs
    do
        $func
    done
}

function base_prompt_status() {
    printf '%%B%%F{green}%%n@%%m%%f%%b:%%B%%F{blue}%%~%%f%%b'
}

prompt_status_funcs+=base_prompt_status

PS1='$(prompt_status)%# '
