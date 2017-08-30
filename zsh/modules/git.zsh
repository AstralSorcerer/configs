## Aliases
alias g='git'
alias gs='git status'
alias gl='git log --oneline'
alias gll='git log'
alias gc='git commit'
alias gca='git commit -a'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias ga='git add'
alias ga.='git add .'
alias gb='git branch'
alias gco='git checkout'
alias gp='git push'
alias gf='git fetch'
alias gm='git merge'
alias gfm='git pull'
alias gd='git diff'
alias gdc='git diff --cached'
alias gds='git diff --cached'

## Prompt
function git_prompt_status() {
    local mods color
    if mods=$(git status -z --ignore-submodules 2>/dev/null)
    then
        if [[ -z $mods ]]
        then
            color=green
        else
            color=red
        fi
        printf ' %%F{%s}(%s%%)%%f' $color "$(git branch | grep '^*' | cut -c3-)"
    fi
}

prompt_status_funcs+=git_prompt_status
