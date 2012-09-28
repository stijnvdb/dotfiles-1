# source this .bash_profile
alias sb="source ~/.bash_profile"

HISTFILESIZE="999999999999999"
HISTIGNORE="ls:pwd:exit:mount"

# custom scripts
alias ?="sh ~/Workspace/scripts/shell_scripts/wip/?.sh"
alias death2svn="sh ~/Workspace/scripts/shell_scripts/death_to_svn.sh"
alias ndr="sh ~/Workspace/scripts/shell_scripts/drupal_repo_structure_setup.sh"
alias mamp_tail+="sh ~/Workspace/scripts/shell_scripts/mamp_tail.sh"
alias tar+="sh ~/Workspace/scripts/shell_scripts/tar+.sh"
  
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