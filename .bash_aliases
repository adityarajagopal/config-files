# ssh commands
alias sshgw='ssh ar4414@sshgw.ic.ac.uk'
alias sleipnir='ssh -X ar4414@ee-sleipnir.ee.ic.ac.uk'
alias tarrasque='ssh -X ar4414@ee-tarrasque.ee.ic.ac.uk'

# docker commands
alias create_mlir='docker run -itd --name gsa-mlir -v llvm:/opt ymherklotz/polyhedral:1.0'
alias start_mlir='docker exec -it gsa-parser /bin/bash'

gsa_parser='docker run -itd --name gsa-parser -v nix:/nix '
gsa_parser+='-v /home/ar4414/Documents/polymaths/gsa-parser:/gsa-parser ymherklotz/polyhedral:1.0'
alias create_gsa_parser=$gsa_parser
alias start_gsa_parser='docker exec -it gsa-parser /bin/bash'

# directory access commands
alias gsa_parser='cd /home/ar4414/Documents/polymaths/gsa-parser'

# general commands
alias restart_network='sudo /etc/init.d/network-manager restart'

# zettel commands
alias zk='nvim -c :ZettelOpen'
alias view_zk='firefox /home/ar4414/Documents/zettelkasten_html/2204171124_toc.html'

# fzf commands
[ ! -p ~/.fzf-pipe ] && mkfifo ~/.fzf-pipe
alias fzpdf='xargs -i{} zathura {} <~/.fzf-pipe & fzf >~/.fzf-pipe'
alias fzvim="nvim -c ':FZF ~/'"

# merlin search commands 
queryMerlin(){
    grep -nR $1 "/home/ar4414/.opam/default/share/merlin/vim/"
}
alias qmerlin=queryMerlin

alias vsim=/opt/intelFPGA/18.1/modelsim_ase/bin/vsim

