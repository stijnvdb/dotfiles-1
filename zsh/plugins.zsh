#!/bin/zsh

# Plugins

## Brew zsh-history-substring-search

  # Source brew installed zsh-history-substring-search plugin
  if [[ -f /usr/local/opt/zsh-history-substring-search/zsh-history-substring-search.zsh ]]; then
    source /usr/local/opt/zsh-history-substring-search/zsh-history-substring-search.zsh
    echo "Sourced zsh-history-substring-search plugin"
  else
    echo "No zsh-history-substring-search plugin found..."
  fi

  ## zmodload, autoload and bindkeys for history substring search
  # Source of winning tip for getting this to work: https://bbs.archlinux.org/viewtopic.php?pid=1198550#p1198550
  # Stock documentation may not work for certain environments.
  zmodload zsh/terminfo
  autoload up-line-or-beginning-search
  autoload down-line-or-beginning-search
  zle -N up-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "\e[A" up-line-or-beginning-search
  bindkey "\e[B" down-line-or-beginning-search

## Brew zsh-syntax-highlighting

  # source brew installed zsh-syntax-highlighting plugin
  # Docs: https://github.com/zsh-users/zsh-syntax-highlighting/tree/master/highlighters
  # Moar docs: https://github.com/zsh-users/zsh-syntax-highlighting/tree/master/highlighters
  if [[ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    echo "Sourced zsh-syntax-highlighting plugin"
  else
    echo "No zsh-syntax-highlighting plugin found..."
  fi
