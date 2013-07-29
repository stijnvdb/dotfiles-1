# Config

## prompt
    export PS1="\W » " # default

    ### alter prompt
      #### sensible defaults
        alias ps="export PS1='\W » '" # ~/foo/bar »
        alias psl="export PS1='\w » '" # bar »
        alias psu="export PS1='\u@\H » '" # user@host »
        alias psul="export PS1='\u@\h:\w » '" # user@host:~/foo/bar »
     
      #### special characters 
        alias pst="export PS1='> '"
        alias pstt="export PS1='» '"
        alias pss="export PS1='$ '"
        alias psp="export PS1='# '"

      #### fancy pants
        alias psfp=""

  ## history settings
    HISTFILESIZE="999999999999999"
    HISTIGNORE="cd:ls:ll:ll+:ll-:pwd:exit:mount"

  ## environment variables

    export LC_ALL=en_GB # fix for cathode.app pearl locale warnings
    export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin"

# Aliasses

  alias sb="source .bash_profile"

# Functions

  ### ssh config autocomplete

    function _ssh_completion() {
    perl -ne 'print "$1 " if /^Host (.+)$/' ~/.ssh/config
    }
    complete -W "$(_ssh_completion)" ssh

# Include .shrc
if [ -f ~/.shrc ]; then
  source ~/.shrc
else
  print "Error: ~/.shrc not found."
fi
