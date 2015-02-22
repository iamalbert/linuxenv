#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


list=$( cat <<DOC
  ssh.conf  $HOME/.ssh/config
  tmux.conf $HOME/.tmux.conf
  zshrc     $HOME/.zshrc
  vimrc     $HOME/.vimrc

DOC
)

echo "$list" | while read src dst; do
  mv $dst{,bak}
  ln -s $DIR/$src $dst
done
