## Widgets
function le_insert() {
    LBUFFER+=$1
}

function le_delete() {
    RBUFFER=${RBUFFER:$1}
}

function le_insert_or_delete_at {
    local -i pos=$CURSOR
    CURSOR=${2:-0}
    if [[ ${RBUFFER:0:$#1} == $1 ]]
    then
        le_delete $#1
        if (($pos < $CURSOR))
        then
            CURSOR=$pos
        elif (($pos > $CURSOR + $#1))
        then
            CURSOR=$pos-$#1
        fi
    else
        le_insert $1
        if (($pos < $CURSOR - $#1))
        then
            CURSOR=$pos
        else
            CURSOR=$pos+$#1
        fi
    fi
}

function le_man() {
    le_insert_or_delete_at 'man '
}
zle -N man le_man

function le_sudo() {
    le_insert_or_delete_at 'sudo '
}
zle -N sudo le_sudo

#function le_test() {
#    le_insert_or_delete_at 'test_string' 8
#}
#zle -N le_test

## For convenience
alias bk='bindkey'
alias bka='bindkey -M astral'

## Make the keymap
bk -N astral

## Default everything to self-insert
bka -R '^@-\M^?' self-insert

## Accept line on CR/LF (Return key press)
bka '^J' accept-line
bka '^M' accept-line

## Navigation
bka '\e[C' vi-forward-char
bka '\e[1;5C' vi-forward-word
bka '\e[1;2C' vi-forward-blank-word
bka '\e[D' vi-backward-char
bka '\e[1;5D' vi-backward-word
bka '\e[1;2D' vi-backward-blank-word
bka '\e[H' vi-beginning-of-line
bka '\e[F' vi-end-of-line
bka '\e[A' up-line-or-history
bka '\e[1;5A' up-history
bka '\e[1;5B' down-history
bka '\e[B' down-line-or-history

## Editing
bka '\e[3~' delete-char
bka '\e[3;5~' delete-word
bka '^H' backward-delete-char
bka '^?' backward-delete-word
bka '\em' man
bka '\es' sudo
#bka '\et' le_test
bka -s '\e[200~' ''
bka -s '\e[201~' ''

## Completion
bka '^I' expand-or-complete

## Bind our keymap to main
bk -A astral main

## Unset aliases
unalias bka
unalias bk
