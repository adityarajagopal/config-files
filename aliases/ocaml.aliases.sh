# merlin search commands 
queryMerlin(){
    grep -nR $1 "~/.opam/default/share/merlin/vim/"
}
alias qmerlin=queryMerlin
