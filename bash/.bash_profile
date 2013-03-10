# Config

  ## history settings
    HISTFILESIZE="999999999999999"
    HISTIGNORE="cd:ls:ll:ll+:ll-:pwd:exit:mount"

  ## shell
    export PS1="\W » " # default

    ###  alter prompt
      #### sensible defaults
        alias ps="export PS1='\W » '" # ~/foo/bar »
        alias psl="export PS1='\w » '" # bar »
        alias psu="export PS1='\u@\H » '" # user@host »
        alias psul="PS1='\u@\h:\w » '" # user@host:~/foo/bar »
     
      #### special characters 
        alias pst="export PS1='> '"
        alias pstt="export PS1='» '"
        alias pss="export PS1='$ '"
        alias psp="export PS1='# '"

      #### fancy pants
        alias psfp=""

# Aliases

  ## source this .bash_profile
    alias sb="source ~/.bash_profile"

  ## command line tools

    ### drush

      #### local
        alias dral="drush cc all"
        alias dccd="drush cc drush"
        alias drep="drush help | grep"
        alias dron="drush cron"
        alias drumr="drush rc repository"
        alias drumd="drush rd"

      #### vagrant
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

    ### git
      alias gst="git status"
      alias gad="git add"
      alias gcm="git commit"
      alias gps="git push"
      alias gpl="git pull"
      alias gco="git checkout"
      alias gbr="git branch"
      alias pushall='for i in `git remote`; do git push $i; done;'
      alias pullall='for i in `git remote`; do git pull $i; done;'


  ## custom scripts

    ### misc
      alias death2svn="sh ~/Workspace/shell_scripts/death_to_svn.sh"
      alias ndr="sh ~/Workspace/scripts/drupal_repo_structure_setup.sh"
      alias tar+="sh ~/Workspace/shell_scripts/tar+.sh"

    ### mamp # depracted
      alias rms="sh ~/Workspace/scripts/wip/rum_multisite.sh"
      alias mamp_info="sh ~/Workspace/shell_scripts/mamp_info.sh"
      alias mamp_tail="sh ~/Workspace/shell_scripts/mamp_tail.sh"
      alias tail+="sh ~/Workspace/shell_scripts/tail+.sh"
      alias sqlp="sh ~/Workspace/shell_scripts/mysql_processlist.sh"

    ### vagrant
      alias vafy1="cp -r ~/Workspace/Vagrant/vagrant-park/precise64lamp/Vagrantfile .; cp -r ~/Workspace/Vagrant/vagrant-park/precise64lamp/scripts ."
      alias vafy2="cp -r ~/Workspace/Vagrant/vagrant-park/squeeze64lamp52/Vagrantfile .; cp -r ~/Workspace/Vagrant/vagrant-park/squeeze64lamp52/scripts ."


  ## helpers & tweaks

    ### list and search 
    alias ali="alias"
    alias alig="alias | grep"
    alias etcexg="less /etc/exports | grep"
    alias etchog="less /etc/hosts | grep"
    alias lbahg="less .bash_history | grep"

    ### list directory content
    alias ll="ls -aFGlT"
    alias ll+="pwd && ls -aFGhlOTs"
    alias ll-="clear && ls -1aF && echo ''"
    alias ft="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
    alias ftg="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/' | grep"

    ### remove content
    alias rmf="rm -rf"
    alias rmfv="rm -rfv"
    
    alias flushdns="sudo killall -HUP mDNSResponder"
    alias line="printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -"

  # navigation
    alias cdd="cd ~/Downloads/"
    alias cds="cd ~/Sites/"
    alias cdw="cd ~/Workspace/"


## Settings

  # misc
    HISTFILESIZE="999999999999999"
    HISTIGNORE="ls:pwd:exit:mount"

  # shell
    export PS1="\W » "
