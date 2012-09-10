# source this .bash_profile
alias sb="source ~/.bash_profile"

# custom scripts
alias ndr="sh ~/Workspace/scripts/shell_scripts/drupal_repo_structure_setup.sh"
alias rms="sh ~/Workspace/scripts/shell_scripts/wip/rum_multisite.sh"

# drush
alias dcca="drush cc all"
alias dccd="drush cc drush"
alias dhg="drush help | grep"
alias drumr="drush rc repository"
alias drumd="drush rd"

# git
alias gst="git status"
alias gad="git add"
alias gcm="git commit"
alias gps="git push"
alias gpl="git pull"
alias gco="git checkout"
alias gbr="git branch"

# helpers
alias ls+="ls -aFhlG"
alias flushdns='sudo killall -HUP mDNSResponder'

# navigation
alias cds="cd ~/Sites"
alias cdw="cd ~/Workspace"