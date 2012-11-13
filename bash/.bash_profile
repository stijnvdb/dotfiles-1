# source this .bash_profile
alias sb="source ~/.bash_profile"

HISTFILESIZE="999999999999999"
HISTIGNORE="ls:pwd:exit:mount"

# custom scripts
alias ?="sh ~/Workspace/scripts/shell_scripts/wip/?.sh"
alias death2svn="sh ~/Workspace/scripts/shell_scripts/death_to_svn.sh"
alias ndr="sh ~/Workspace/scripts/shell_scripts/drupal_repo_structure_setup.sh"
alias rms="sh ~/Workspace/scripts/shell_scripts/wip/rum_multisite.sh"
alias mamp_info="sh ~/Workspace/scripts/shell_scripts/mamp_info.sh"
alias mamp_tail="sh ~/Workspace/scripts/shell_scripts/mamp_tail.sh"
alias tail+="sh ~/Workspace/scripts/shell_scripts/tail+.sh"
alias tar+="sh ~/Workspace/scripts/shell_scripts/tar+.sh"
alias sqlp="sh ~/Workspace/scripts/shell_scripts/mysql_processlist.sh"
  
# drush
alias dral="drush cc all"
alias dccd="drush cc drush"
alias drep="drush help | grep"
alias dron="drush cron"
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
alias lsmod="ls -al|awk '{k=0;s=0;for(i=0;i<=8;i++){;k+=((substr(\$1,i+2,1)~/[rwxst]/)*2^(8-i));};j=4;fo‌​r(i=4;i<=10;i+=3){;s+=((substr(\$1,i,1)~/[stST]/)*j);j/=2;};if(k){;printf(\"%0o%0‌​o \",s,k);};print;}'"
alias rm-="rm -rf"
alias rm+="rm -rfv"
alias flushdns='sudo killall -HUP mDNSResponder'
# alias bash10="history | awk '{print $2}' | awk 'BEGIN {FS="|"} {print $1}' | sort | uniq -c | sort -rn | head -10"

# navigation
alias cds="cd ~/Sites"
alias cdw="cd ~/Workspace"
