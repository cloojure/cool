#!/bin/zsh
if [[ $(uname -a) == *Darwin* ]]; then
  echo "found Darwin"
else
  echo "not found"
fi
