# source this .bash_profile
alias sb="source ~/.bash_profile"

HISTFILESIZE="999999999999999"
HISTIGNORE="ls:pwd:exit:mount"

# custom scripts
alias ?="sh ~/Workspace/shell_scripts/wip/?.sh"
alias death2svn="sh ~/Workspace/shell_scripts/death_to_svn.sh"
alias ndr="sh ~/Workspace/scripts/drupal_repo_structure_setup.sh"
alias rms="sh ~/Workspace/scripts/wip/rum_multisite.sh"
alias mamp_info="sh ~/Workspace/shell_scripts/mamp_info.sh"
alias mamp_tail="sh ~/Workspace/shell_scripts/mamp_tail.sh"
alias tail+="sh ~/Workspace/shell_scripts/tail+.sh"
alias tar+="sh ~/Workspace/shell_scripts/tar+.sh"
alias sqlp="sh ~/Workspace/shell_scripts/mysql_processlist.sh"
  
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
alias pushall='for i in `git remote`; do git push $i; done;'
alias pullall='for i in `git remote`; do git pull $i; done;'

# helpers
alias ali="alias"
alias alig="alias | grep"
alias ll="ls -aFGhls"
alias ls+="ls -aFGhlTs"
alias rm-="rm -rf"
alias rm+="rm -rfv"
alias flushdns="sudo killall -HUP mDNSResponder"
alias etcexg="less /etc/exports | grep"
alias etchog="less /etc/hosts | grep"
alias lbahg="less .bash_history | grep"
alias ft="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
alias ftg="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/' | grep"

# navigation
alias cdd="cd ~/Downloads/"
alias cds="cd ~/Sites/"
alias cdw="cd ~/Workspace/"

# vagrant
alias vafy1="cp -r ~/Workspace/Vagrant/vagrant-park/precise64lamp/Vagrantfile .; cp -r ~/Workspace/Vagrant/vagrant-park/precise64lamp/scripts ."
alias vafy2="cp -r ~/Workspace/Vagrant/vagrant-park/squeeze64lamp52/Vagrantfile .; cp -r ~/Workspace/Vagrant/vagrant-park/squeeze64lamp52/scripts ."
alias vlog="VAGRANT_LOG=INFO "
alias vup="vagrant up"
alias vssh="vagrant ssh"
# alias svup="sudo vagrant up" # should not be used, see https://github.com/mitchellh/vagrant/issues/1185#issuecomment-12317237
alias vha="vagrant halt"
alias vsu="vagrant suspend"
alias vre="vagrant reload"
alias vst="vagrant status"
alias vde="vagrant destroy"
alias vdef="vagrant destroy -f"

# drush remote @vagrant
alias d@v="drush @vagrant"

# virtual box
alias vbl="VBoxManage list vms"
alias vblg="VBoxManage list vms | grep "
