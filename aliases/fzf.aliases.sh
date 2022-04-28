[ ! -p ~/.fzf-pipe ] && mkfifo ~/.fzf-pipe
alias fzpdf='xargs -i{} zathura {} <~/.fzf-pipe & fzf >~/.fzf-pipe'
alias fzvim="nvim -c ':FZF ~/'"
