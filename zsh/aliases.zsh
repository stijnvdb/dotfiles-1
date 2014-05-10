#!/bin/zsh

### Aliases

  ## Alias
  # Whut? Jup. Alias helper aliases.

    # Grep through the aliases and display the related comment
    alias alig="less ~/.zshrc | grep -B 1 'alias' | grep -B 1 '=*' | grep -B 1" 

  ## cd
  # Change directory commands, mostly custom

    # Change dir to designated Cloud directory
    alias cdc="cd /Volumes/MBP\ -\ Sjugge/Cloud" # @todo: alter hard-coded path to secondary home folder

    # Change dir to OS X' Download folder
    alias cdd="cd ~/Downloads/" # @todo: alter hard-coded path to configurable variable

    # Change dir to designated Sites directory
    alias cds="cd /Volumes/MBP\ -\ Sjugge/Sites/ && clear && ll" # @todo: alter hard-coded path to secondary home folder

    # Change dir ro designated Workspace folder
    alias cdw="cd /Volumes/MBP\ -\ Sjugge/Workspace/ && clear && ll" # @todo: alter hard-coded path to configurable variable

  ## git
  # Helper aliases for Git VCS

    # Go to the root of the current Git directory
    alias cdg="cd $(git rev-parse --show-cdup)" # @todo: stabilize alias, not always working apparently

    # Git status with any and all relevant information
    alias gst="clear; echo '--Location--'; echo ''; pwd; echo ''; echo '--Remotes--'; echo ''; git remote -v; echo ''; echo '--Branches--'; echo ''; git branch -a; echo ''; echo '--Status--'; echo ''; git status"

    # Git add files and or folders
    alias ga="git add" # git add files and or folders

    # Git commit added (or deleted) files
    alias gc="git commit" # git commit added (or deleted) files

    # Git push to remote
    alias gps="git push"

    # Git pull from remote
    alias gpl="git pull"

    # Git checkout files, folders or branch
    alias gco="git checkout"

    # Git branch from current branch
    alias gbr="git branch"

    # List git log entries, fancy
    alias gts="git log --all --graph --decorate --oneline --simplify-by-decoration"

    # List git log entries, with altered files for each log entry
    alias gl="git log --name-status"

    # List git branches, including remotes
    alias gtl="git show-branch --all"

    # Git push all git branches, when feeling cocky
    alias pushall='for i in `git remote`; do git push $i; done;'

    # Git pull all git branches, when you need to catch up on a busy repo
    alias pullall='for i in `git remote`; do git pull $i; done;'

  ## Navigation
  # Helper aliases for system navigation

    # Output the current location with escaped spaces
    alias cwd="pwd | sed 's/ /\\ /g'"

  ## ls
  # List files and directories

    # ls like a boss
    alias ll="clear; pwd; ls -lGHa"

    # ls like a motherfucking boss
    alias ll+="pwd; ls -aFGhlOTs"

    # ls like a minimalist
    alias ll-="clear; ls -1aF && echo ''"

    # ls directories like a minimalist
    alias lsd="ls -d1 */"

    # Show a filetree of the current directory
    alias ft="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"

    # Search the filetree of the current directory
    alias ftg="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/' | grep"

  ## vagrant
  # Helper aliases for vagrant

    # Bring up a vagrant box after getting sudo rights and show a notification center alert when done.
    # See http://sjugge.be/blog/devops/pimped-out-vagrant
    alias vup="sudo echo tnx && vagrant up && terminal-notifier -title 'Vagrant up completed' -message 'Get back to your command line!'"

    # ssh into a running vagrant box
    alias vssh="vagrant ssh"

    # Halt a vagrant box
    alias vha="vagrant halt"

    # Suspend a vagrant box
    alias vsu="vagrant suspend"

    # Reload a vagrant box
    alias vre="vagrant reload"

    # Get the status of a vagrant instance
    alias vst="vagrant global-status && echo '--------------------------------------------------------------------' && vagrant status"

    # Destroy a vagrant instance
    alias vde="vagrant destroy" # destroy a vagrant instance

    # Force destroy a vagrant instance
    alias vdef="vagrant destroy -f"

  ## drush + vagrant
  # Helper aliases for drush on vagrant instances

    # Execute drush commands on a vagrant box
    alias dv="drush @vagrant"

    # A horrible thing to have aliased, set the UID1's of a Drupal site running on vagrant to `admin`.
    # Only used when credentials are not provided on intake or other edge-cases.
    alias dvpw="drush @vagrant upwd admin --password='admin'"

    # Put a drush db dump in the NFS shared db folder
    alias dvdb="drush @vagrant sql-dump --result-file=/home/vagrant/db/vagrant-sql-dump.sql"

  ## Vagrant-ify
  # Helper aliases for vagrantifying projects Wunderkraut style

    # Vagrantify a repo with precise64lamp stuffs
    alias vafy1="cp -r /Volumes/MBP\ -\ Sjugge/Workspace/vagrant/precise64lamp/Vagrantfile .; cp -r /Volumes/MBP\ -\ Sjugge/Workspace/vagrant/precise64lamp/scripts ." # @todo: alter hard-coded path to configurable variable

    # Vagrantify a repo with squeeze64lamp52 stuffs
    alias vafy2="cp -r /Volumes/MBP\ -\ Sjugge/Workspace/vagrant/squeeze64lamp52/Vagrantfile .; cp -r /Volumes/MBP\ -\ Sjugge/Workspace/vagrant/squeeze64lamp52/scripts ." # @todo: alter hard-coded path to configurable variable

    # Vagrantify a repo with precise64lamp + Solr 4 stuffs
    alias vafy3="cp -r /Volumes/MBP\ -\ Sjugge/Workspace/vagrant/precise64lamp-solr46/Vagrantfile .; cp -r /Volumes/MBP\ -\ Sjugge/Workspace/vagrant/precise64lamp-solr46/scripts ." # @todo: alter hard-coded path to configurable variable

  ## Virtualbox
  # Helper aliases for Virtualbox

    # List all virtualbox vm's on the system
    alias vbl="VBoxManage list vms"

    # List all running virtualbox vm's, so usefull to check for running vagrant instances
    alias vbla="VBoxManage list runningvms"

    # Search the listing of all virtualbox vm's on the system
    alias vblg="VBoxManage list vms | grep"

  ## zsh
  # Helper aliases for zsh

    # Source .zshrc
    alias sz="clear && source ~/.zshrc"

    # Run zsh-newuser-install wizard
    alias zwiz="autoload -Uz zsh-newuser-install; zsh-newuser-install -f"
