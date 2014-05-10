#!/bin/zsh

### .zshrc by sjugge

  ## All possible zsh config and tweaks, build from scratch and with proper documentation.

    # Don't drop it in and start using it. If you have any concerns or suggestions,
    # do not hold back to let me know where there is room for improvement.
    # Don't mind the markdown-esque formatting, it makes for nice code-folding.

  ## Author

    # Jurgen Verhasselt - sjugge
    # sjugge.be
    # github.com/sjugge
    # sjugge[*]heretiksambrosia[*]net

### Helpers

  # Readable color config
  source ~/.zsh/config-color.zsh

### Autoload

  # Autoloading here so all the requirments can be met later on.
  # Note that some autoloading may done later in functionality specific conf.

  ## Complist
  zmodload zsh/complist

  ## Compinit
  autoload -Uz compinit
  compinit

  ## Prompt
  autoload -Uz compinit promptinit
  promptinit

  ## VCS information
  autoload -Uz vcs_info

### Plugins

  # Source plugins
  source ~/.zsh/plugins.zsh

### Configuration

  ## ZSH configuration

    source ~/.zsh/config-zsh.zsh

  ## Parameters & config used by the shell

    # Docs: http://zsh.sourceforge.net/Doc/Release/Parameters.html#Parameters-Used-By-The-Shell

    # The default argument for the cd command. This is not set automatically by the shell in sh, ksh or csh emulation,
    # but it is typically present in the environment anyway, and if it becomes set it has its usual special behaviour.
    # Note that altering this to `~` may result in unextpected behaviour.
    # Also note that this should be set before the HISTFILE parameter is set.
    HOME="/Users/sjugge/"

    # File where history is saved.
    # Note that using ~/.zsh_history will fail.
    # Also note that prepending the HOME parameter resolves history not writing to file.
    HISTFILE="$HOME/.zsh_history"

    # Number of lines of history kept within the shell.
    # HISTSIZE=1000 # @todo: determing if causing issue or conflict with SAVEHIST in writing hist file

    # Number of lines of history to save to $HISTFILE.
    SAVEHIST=5000

    # PATH
    # Set here instead of ~/.zshenv for easy maintenance.
    export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin"

    # Completion config.
    zstyle :compinstall filename '/Users/sjugge/.zshrc'
    zstyle ':completion:*' use-cache off
    zstyle ':completion:*' cache-path ~/.zsh/cache
    zstyle ':completion:*' completer _complete _match _approximate
    zstyle ':completion:*' max-errors 1 numeric
    zstyle ':completion:*:match:*' original only
    zstyle ':completion:*' matcher-list 'l:|=* r:|=*' '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[.]=** r:|=**'
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
    zstyle ':completion:*' menu select=0
    zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
    zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
    zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
    zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'
    zstyle ':completion:*:cd:*' tag-order local-directories path-directories

  ## Parameters used by Vagrant

    # Docs: http://docs.vagrantup.com/v2/cli/index.html

    # To enable detailed logging, set the VAGRANT_LOG environmental variable to the desired log level name,
    # which is one of debug (loud), info (normal), warn (quiet), and error (very quiet).
    VAGRANT_LOG=INFO

### Source stuffs

  # Source aliases
  source ~/.zsh/aliases.zsh

### Functions

  ##
  source ~/.zsh/functions.custom.zsh

### Prompt

  ## Prompt tools

    # Prompt VCS information

      # Version control indication for any prompt
      # Proper read: http://arjanvandergaag.nl/blog/customize-zsh-prompt-with-vcs-info.html
      # See also: http://stackoverflow.com/a/1128583
      zstyle ':vcs_info:*' enable git svn
      zstyle ':vcs_info:*' check-for-changes true
      # zstyle ':vcs_info:git*' actionformats "%%s  %r/%S %b (%a) %m%u%c "
      zstyle ':vcs_info:git*' formats "%{$fg_yellow%}%r%{$at_normal%}:%{$fg_green%}%b%{$at_normal%}:%{$fg_lblue%}%S%{$at_normal%}"

  ## Prompt construction

    # Helpers

      # VI prompt information

        # Set VI_MODE according to the current mode
        # Source: http://hamberg.no/erlend/posts/2010-10-17-show-current-vi-mode-in-zsh-prompt.html
        function zle-line-init zle-keymap-select {
          VI_MODE="-- INSERT --"
          RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
          zle reset-prompt
        }
        zle -N zle-line-init
        zle -N zle-keymap-select

    # Additional prompts

      # Configurable prompts
      # Listing of aliases that allow the prompt to be altered on the fly.
      # @todo: implement if old bash use-cases are still valid

      # alias p1="export PS1=' %{$reset_color%} ${vcs_info_msg_0_} %{$fg[red]%}%(!.#.»)%{$reset_color%} '"# The following lines were added by compinstall

    # Prompt dump

      # Misc snippets

      # [%D{%Y-%m-%d %H:%M:%S}]
      # [2014-05-05 19:02:40]

### Hook functions

  # Docs: http://zsh.sourceforge.net/Doc/Release/Functions.html

  # precmd()
  source ~/.zsh/function.hook-precmd.zsh
