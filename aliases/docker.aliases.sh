# General docker commands
alias dls="docker ps"
alias drun="docker run -itd"
alias dexec="docker exec -it"

# GSA-parser project 
gsaroot=~/polymaths
gsa_parser='docker run -itd --name gsa-parser -v nix:/nix '
alias create_mlir='docker run -itd --name gsa-mlir -v llvm:/opt ymherklotz/polyhedral:1.0'
alias start_mlir='docker exec -it gsa-parser /bin/bash'
gsa_parser+="-v $gsaroot/gsa-parser:/gsa-parser ymherklotz/polyhedral:1.0"
alias create_gsa_parser=$gsa_parser
alias start_gsa_parser='docker exec -it gsa-parser /bin/bash'
