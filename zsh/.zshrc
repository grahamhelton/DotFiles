export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)


source $ZSH/oh-my-zsh.sh

# Go
export GOROOT=/home/graham/.go
export GOPATH=/home/graham/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin


# Source modules
for file in ~/.config/zsh/modules/*.zsh; do
    [ -r "$file" ] && source "$file"
done
