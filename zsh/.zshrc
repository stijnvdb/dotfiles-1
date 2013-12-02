# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Config

  ## PATH

    export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin"

  ## Plugins

    # Which plugins to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
    # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
    plugins=(git)

  ## Theme

    # Set name of the theme to load
    # Look in ~/.oh-my-zsh/themes/ or https://www.dropbox.com/sh/u532agyv1hyash1/LS9yNESRlQ?lst#/ for screenshots
    # Optionally, if you set this to "random", it'll load a random theme each time that oh-my-zsh is loaded

    ZSH_THEME="sjugge-02" # hack of jreese theme

  ## oh my zsh config path

    ZSH=~/.oh-my-zsh

# Stuffs

  # Ruby mgmt with rbenv, http://thedrearlight.com/blog/compass-sass-drupal.html
  eval "$(rbenv init -)"

# source stuff

  ## source oh-my-zsh
  source ~/.oh-my-zsh/oh-my-zsh.sh

  ## sz source alias
  alias sz="source ~/.zshrc"

  # source shell aliasses
  if [ -f ~/.shrc ]; then
    source ~/.shrc
  else
    print "Error: ~/.shrc not found."
  fi
