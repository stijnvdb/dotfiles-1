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

  ## Readable color config

    # Docs: http://www.understudy.net/custom.html#Z_color

    # Prompt Color Table Z shell
    fg_black=$'\e[0;30m'
    fg_red=$'\e[0;31m'
    fg_green=$'\e[0;32m'
    fg_brown=$'\e[0;33m'
    fg_blue=$'\e[0;34m'
    fg_purple=$'\e[0;35m'
    fg_cyan=$'\e[0;36m'
    fg_lgray=$'\e[0;37m'
    fg_dgray=$'\e[1;30m'
    fg_lred=$'\e[1;31m'
    fg_lgreen=$'\e[1;32m'
    fg_yellow=$'\e[1;33m'
    fg_lblue=$'\e[1;34m'
    fg_pink=$'\e[1;35m'
    fg_lcyan=$'\e[1;36m'
    fg_white=$'\e[1;37m'

    # Text Background Colors
    bg_red=$'\e[0;41m'
    bg_green=$'\e[0;42m'
    bg_brown=$'\e[0;43m'
    bg_blue=$'\e[0;44m'
    bg_purple=$'\e[0;45m'
    bg_cyan=$'\e[0;46m'
    bg_gray=$'\e[0;47m'

    # Attributes
    at_normal=$'\e[0m'
    at_bold=$'\e[1m'
    at_italics=$'\e[3m'
    at_underl=$'\e[4m'
    at_blink=$'\e[5m'
    at_outline=$'\e[6m'
    at_reverse=$'\e[7m'
    at_nondisp=$'\e[8m'
    at_strike=$'\e[9m'
    at_boldoff=$'\e[22m'
    at_italicsoff=$'\e[23m'
    at_underloff=$'\e[24m'
    at_blinkoff=$'\e[25m'
    at_reverseoff=$'\e[27m'
    at_strikeoff=$'\e[29m'

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

### Configuration

  ## ZSH options
    # Source docs: http://linux.die.net/man/1/zshoptions
    # See also http://linux.die.net/man/1/zshmisc for zshmisc(1) references

    # Changing directories

      # If a command is issued that can't be executed as a normal command, and the command is the name of a directory,
      # perform the cd command to that directory.
      setopt autocd

      # Make cd push the old directory onto the directory stack.
      # setopt AUTO_PUSHD

      # If the argument to a cd command (or an implied cd with the AUTO_CD option set) is not a directory,
      # and does not begin with a slash, try to expand the expression as if it were preceded by a '~' (see the section 'Filename Expansion').
      setopt CDABLE_VARS

      # When changing to a directory containing a path segment '..' which would otherwise be treated as canceling the previous segment
      # in the path (in other words, 'foo/..' would be removed from the path, or if '..' is the first part of the path,
      # the last part of $PWD would be deleted), instead resolve the path to the physical directory. This option is overridden by CHASE_LINKS.
      # For example, suppose /foo/bar is a link to the directory /alt/rod. Without this option set, 'cd /foo/bar/..' changes to /foo; with it set,
      # it changes to /alt. The same applies if the current directory is /foo/bar and 'cd ..' is used.
      # Note that all other symbolic links in the path will also be resolved.
      # setopt CHASE_DOTS

      # Resolve symbolic links to their true values when changing directory. This also has the effect of CHASE_DOTS, i.e. a '..' path segment
      # will be treated as referring to the physical parent, even if the preceding path segment is a symbolic link.
      setopt CHASE_LINKS

      # Don't push multiple copies of the same directory onto the directory stack.
      setopt PUSHD_IGNORE_DUPS

      # Exchanges the meanings of '+' and '-' when used with a number to specify a directory in the stack.
      # setopt PUSHD_MINUS

      # Do not print the directory stack after pushd or popd.
      # setopt PUSHD_SILENT

      # Have pushd with no arguments act like 'pushd $HOME'.
      # Set by default.
      # unsetopt PUSHD_TO_HOME

    # Completion

      # If unset, key functions that list completions try to return to the last prompt if given a numeric argument.
      # If set these functions try to return to the last prompt if given no numeric argument.
      # Set by default.
      # unsetopt ALWAYS_LAST_PROMPT

      # If a completion is performed with the cursor within a word, and a full completion is inserted, the cursor is moved to the end of the word.
      # That is, the cursor is moved to the end of the word if either a single match is inserted or menu completion is performed.
      setopt ALWAYS_TO_END

      # Automatically list choices on an ambiguous completion.
      # Set by default.
      # unsetopt AUTO_LIST

      # Automatically use menu completion after the second consecutive request for completion, for example by pressing the tab key repeatedly.
      # This option is overridden by MENU_COMPLETE.
      # Set by default.
      unsetopt AUTO_MENU

      # Any parameter that is set to the absolute name of a directory immediately becomes a name for that directory,
      # that will be used by the '%~' and related prompt sequences, and will be available when completion is performed on a word starting with '~'. (
      # Otherwise, the parameter must be used in the form '~param' first.)
      # setopt AUTO_NAME_DIRS

      # If a parameter name was completed and a following character (normally a space) automatically inserted,
      # and the next character typed is one of those that have to come directly after the name (like '}', ':', etc.),
      # the automatically added character is deleted, so that the character typed comes immediately after the parameter name.
      # Completion in a brace expansion is affected similarly: the added character is a ',', which will be removed if '}' is typed next.
      # Set by default.
      # unsetopt AUTO_PARAM_KEYS

      # If a parameter is completed whose content is the name of a directory, then add a trailing slash instead of a space.
      # Set by default.
      unsetopt AUTO_PARAM_SLASH

      # When the last character resulting from a completion is a slash and the next character typed is a word delimiter, a slash,
      # or a character that ends a command (such as a semicolon or an ampersand), remove the slash.
      # Set by default.
      # unsetopt AUTO_REMOVE_SLASH

      # On an ambiguous completion, automatically list choices when the completion function is called twice in succession.
      # This takes precedence over AUTO_LIST. The setting of LIST_AMBIGUOUS is respected. If AUTO_MENU is set,
      # the menu behaviour will then start with the third press. Note that this will not work with MENU_COMPLETE,
      # since repeated completion calls immediately cycle through the list in that case.
      # setopt BASH_AUTO_LIST

      # Prevents aliases on the command line from being internally substituted before completion is attempted.
      # The effect is to make the alias a distinct command for completion purposes.
      setopt COMPLETE_ALIASES

      # If unset, the cursor is set to the end of the word if completion is started. Otherwise it stays there and completion is done from both ends.
      unsetopt COMPLETE_IN_WORD

      # When the current word has a glob pattern, do not insert all the words resulting from the expansion but generate matches as for completion
      # and cycle through them like MENU_COMPLETE. The matches are generated as if a '*' was added to the end of the word,
      # or inserted at the cursor when COMPLETE_IN_WORD is set. This actually uses pattern matching, not globbing,
      # so it works not only for files but for any completion, such as options, user names, etc.
      # Note that when the pattern matcher is used, matching control (for example, case-insensitive or anchored matching) cannot be used.
      # This limitation only applies when the current word contains a pattern; simply turning on the GLOB_COMPLETE option does not have this effect.
      # setopt GLOB_COMPLETE

      # Whenever a command completion is attempted, make sure the entire command path is hashed first. This makes the first completion slower.
      # Set by default.
      # unsetopt HASH_LIST_ALL

      # This option works when AUTO_LIST or BASH_AUTO_LIST is also set. If there is an unambiguous prefix to insert on the command line,
      # that is done without a completion list being displayed; in other words, auto-listing behaviour only takes place when nothing would be inserted.
      # In the case of BASH_AUTO_LIST, this means that the list will be delayed to the third call of the function.
      # Set by default.
      # unsetopt LIST_AMBIGUOUS

      # Beep on an ambiguous completion. More accurately, this forces the completion widgets to return status 1 on an ambiguous completion,
      # which causes the shell to beep if the option BEEP is also set; this may be modified if completion is called from a user-defined widget.
      # Set by default.
      # unsetopt LIST_BEEP

      # Try to make the completion list smaller (occupying less lines) by printing the matches in columns with different widths.
      # setopt LIST_PACKED

      # Lay out the matches in completion lists sorted horizontally, that is, the second match is to the right of the first one, not under it as usual.
      # setopt LIST_ROWS_FIRST

      # When listing files that are possible completions, show the type of each file with a trailing identifying mark.
      # Set by default.
      # unsetopt LIST_TYPES

      # On an ambiguous completion, instead of listing possibilities or beeping, insert the first match immediately.
      # Then when completion is requested again, remove the first match and insert the second match, etc.
      # When there are no more matches, go back to the first one again. reverse-menu-complete may be used to loop through the list in the other direction.
      # Is option overrides AUTO_MENU.
      setopt MENU_COMPLETE

      # In completion, recognize exact matches even if they are ambiguous.
      setopt REC_EXACT

    # Expansion and Globbing

      # If a pattern for filename generation is badly formed, print an error message. (If this option is unset, the pattern will be left unchanged.)
      setopt BAD_PATTERN

      # In a glob pattern, treat a trailing set of parentheses as a qualifier list, if it contains no '|', '(' or (if special) '~' characters.
      # See the section 'Filename Generation'.
      setopt BARE_GLOB_QUAL

      # Expand expressions in braces which would not otherwise undergo brace expansion to a lexically ordered list of all the characters.
      # See the section 'Brace Expansion'.
      # setopt BRACE_CCL

      # Make globbing (filename generation) sensitive to case. Note that other uses of patterns are always sensitive to case.
      # If the option is unset, the presence of any character which is special to filename generation will cause case-insensitive matching.
      # For example, cvs(/) can match the directory CVS owing to the presence of the globbing flag (unless the option BARE_GLOB_QUAL is unset).
      # Set by default.
      unsetopt CASE_GLOB

      # Make regular expressions using the zsh/regex module (including matches with =~) sensitive to case. On  by default.
      # unsetopt CASE_MATCH

      # If a pattern for filename generation has no matches, delete the pattern from the argument list;
      # do not report an error unless all the patterns in a command have no matches.
      # Overrides NOMATCH.
      # setopt CSH_NULL_GLOB

      # Perform = filename expansion. (See the section 'Filename Expansion'.)
      # setopt EQUALS

      # Treat the '#', '~' and '^' characters as part of patterns for filename generation, etc.
      # An initial unquoted '~' always produces named directory expansion.)
      # setopt EXTENDED_GLOB

      # Perform filename generation (globbing). (See the section 'Filename Generation'.) Set by default
      # unsetopt GLOB

      # If this option is set, filename generation (globbing) is performed on the right hand side of scalar parameter assignments of
      # the form 'name=pattern (e.g. 'foo=*'). If the result has more than one word the parameter will become an array with those words as arguments.
      # This option is provided for backwards compatibility only: globbing is always performed on the right hand side of array assignments of
      # the form 'name=(value)' (e.g. 'foo=(*)') and this form is recommended for clarity; with this option set, it is not possible to predict
      # whether the result will be an array or a scalar.
      # setopt GLOB_ASSIGN

      # Do not require a leading '.' in a filename to be matched explicitly.
      setopt GLOB_DOTS

      # Treat any characters resulting from parameter expansion as being eligible for file expansion and filename generation,
      # and any characters resulting from command substitution as being eligible for filename generation.
      # Braces (and commas in between) do not become eligible for expansion.
      # setopt GLOB_SUBST

      # Substitutions using the :s and :& history modifiers are performed with pattern matching instead of string matching.
      # This occurs wherever history modifiers are valid, including glob qualifiers and parameters.
      # See the section Modifiers in zshexp(1).
      # setopt HIST_SUBST_PATTERN

      # Do not perform brace expansion.
      # setopt IGNORE_BRACES

      # In pattern matching, the interpretation of parentheses is affected by a preceding '@', '*', '+', '?' or '!'.
      # See the section 'Filename Generation'.
      # setopt KSH_GLOB

      # All unquoted arguments of the form 'anything=expression' appearing after the command name have filename expansion
      # (that is, where expression has a leading '~' or '=') performed on expression as if it were a parameter assignment.
      # The argument is not otherwise treated specially; it is passed to the command as a single argument, and not used as
      # an actual parameter assignment. For example, in echo foo=~/bar:~/rod, both occurrences of ~ would be replaced.
      # Note that this happens anyway with typeset and similar statements. This option respects the setting of the KSH_TYPESET option.
      # In other words, if both options are in effect, arguments looking like assignments will not undergo word splitting.
      # setopt MAGIC_EQUAL_SUBST

      # Append a trailing '/' to all directory names resulting from filename generation (globbing).
      setopt MARK_DIRS

      # Respect multibyte characters when found in strings. When this option is set, strings are examined using
      # the system library to determine how many bytes form a character, depending on the current locale.
      # This affects the way characters are counted in pattern matching, parameter values and various delimiters.
      # The option is Set by default if the shell was compiled with MULTIBYTE_SUPPORT except in sh emulation;
      # otherwise it is off by default and has no effect if turned on.
      # The mode is off in sh emulation for compatibility but for interactive use may need to be turned on if the terminal
      # interprets multibyte characters.If the option is off a single byte is always treated as a single character.
      # This setting is designed purely for examining strings known to contain raw bytes or other values that may not be characters in the current locale.
      # Is not necessary to unset the option merely because the character set for the current locale does not contain multibyte characters.
      # The option does not affect the shell's editor, which always uses the locale to determine multibyte characters.
      # This is because the character set displayed by the terminal emulator is independent of shell settings.
      # setopt MULTIBYTE

      # If a pattern for filename generation has no matches, print an error, instead of leaving it unchanged in the argument list.
      # This also applies to file expansion of an initial '~' or '='.
      # setopt NOMATCH

      # If a pattern for filename generation has no matches, delete the pattern from the argument list instead of reporting an error.
      # Overrides NOMATCH.
      # setopt NULL_GLOB

      # If numeric filenames are matched by a filename generation pattern, sort the filenames numerically rather than lexicographically.
      # setopt NUMERIC_GLOB_SORT

      # Array expansions of the form 'foo${xx}bar', where the parameter xx is set to (a b c), are substituted with 'fooabar foobbar foocbar'
      # instead of the default 'fooa b cbar'. Note that an empty array will therefore cause all arguments to be removed.
      # setopt RC_EXPAND_PARAM

      # If set, regular expression matching with the =~ operator will use Perl-Compatible Regular Expressions from the PCRE library, if available.
      # If not set, regular expressions will use the extended regexp syntax provided by the system libraries.
      # setopt REMATCH_PCRE

      # Disables the special meaning of '(', '|', ')' and '<' for globbing the result of parameter and command substitutions,
      # and in some other places where the shell accepts patterns. This option is set by default if zsh is invoked as sh or ksh.
      # setopt SH_GLOB

      # Treat unset parameters as if they were empty when substituting. Otherwise they are treated as an error.
      # setopt UNSET

      # Print a warning message when a global parameter is created in a function by an assignment.
      # This often indicates that a parameter has not been declared local when it should have been.
      # Parameters explicitly declared global from within a function using typeset -g do not cause a warning.
      # Note that there is no warning when a local parameter is assigned to in a nested function, which may also indicate an error.
      # setopt WARN_CREATE_GLOBAL

    # History

      # If this is set, zsh sessions will append their history list to the history file, rather than replace it.
      # Thus, multiple parallel zsh sessions will all have the new entries from their history lists added to the history file,
      # in the order that they exit. The file will still be periodically re-written to trim it when the number of lines grows 20% beyond
      # the value specified by $SAVEHIST (see also the HIST_SAVE_BY_COPY option).
      # Set by default.
      # unsetopt APPEND_HISTORY

      # Perform textual history expansion, csh-style, treating the character '!' specially.
      # setopt BANG_HIST

      # Save each command's beginning timestamp (in seconds since the epoch) and the duration (in seconds) to the history file.
      # The format of this prefixed data is: ':<beginning time>:<elapsed seconds>:<command>'.
      setopt EXTENDED_HISTORY

      # Add '|' to output redirections in the history. This allows history references to clobber files even when CLOBBER is unset.
      # setopt HIST_ALLOW_CLOBBER

      # Beep when an attempt is made to access a history entry which isn't there. Set by default.
      # unsetopt HIST_BEEP

      # If the internal history needs to be trimmed to add the current command line, setting this option will cause
      # the oldest history event that has a duplicate to be lost before losing a unique event from the list.
      # You should be sure to set the value of HISTSIZE to a larger number than SAVEHIST in order to give you some room for the duplicated events,
      # otherwise this option will behave just like HIST_IGNORE_ALL_DUPS once the history fills up with unique events.
      setopt HIST_EXPIRE_DUPS_FIRST

      # When writing out the history file, by default zsh uses ad-hoc file locking to avoid known problems with locking on some operating systems.
      # With this option locking is done by means of the system's fcntl call, where this method is available.
      # On recent operating systems this may provide better performance, in particular avoiding history corruption when files are stored on NFS.
      setopt HIST_FCNTL_LOCK

      # When searching for history entries in the line editor, do not display duplicates of a line previously found,
      # even if the duplicates are not contiguous.
      # setopt HIST_FIND_NO_DUPS

      # If a new command line being added to the history list duplicates an older one, the older command is removed from the list
      # (even if it is not the previous event).
      setopt HIST_IGNORE_ALL_DUPS

      # Do not enter command lines into the history list if they are duplicates of the previous event.
      # setopt HIST_IGNORE_DUPS

      # Remove command lines from the history list when the first character on the line is a space, or when one of the expanded aliases
      # contains a leading space. Note that the command lingers in the internal history until the next command is entered before it vanishes,
      # allowing you to briefly reuse or edit the line. If you want to make it vanish right away without entering another command,
      # type a space and press return.
      setopt HIST_IGNORE_SPACE

      # Remove function definitions from the history list. Note that the function lingers in the internal history until the next command
      # is entered before it vanishes, allowing you to briefly reuse or edit the definition.
      # setopt HIST_NO_FUNCTIONS

      # Remove the history (fc -l) command from the history list when invoked. Note that the command lingers in the internal history until
      # the next command is entered before it vanishes, allowing you to briefly reuse or edit the line.
      # setopt HIST_NO_STORE

      # Remove superfluous blanks from each command line being added to the history list.
      setopt HIST_REDUCE_BLANKS

      # When the history file is re-written, we normally write out a copy of the file named $HISTFILE.new and then rename it over the old one.
      # However, if this option is unset, we instead truncate the old history file and write out the new version in-place.
      # If one of the history-appending options is enabled, this option only has an effect when the enlarged history file needs to be re-written
      # to trim it down to size. Disable this only if you have special needs, as doing so makes it possible to lose history entries if zsh gets
      # interrupted during the save. When writing out a copy of the history file, zsh preserves the old file's permissions and group information,
      # but will refuse to write out a new file if it would change the history file's owner.
      # Set by default.
      # unsetopt HIST_SAVE_BY_COPY

      # When writing out the history file, older commands that duplicate newer ones are omitted.
      # setopt HIST_SAVE_NO_DUPS

      # Whenever the user enters a line with history expansion, don't execute the line directly; instead, perform history expansion and
      # reload the line into the editing buffer.
      setopt HIST_VERIFY

      # This options works like APPEND_HISTORY except that new history lines are added to the $HISTFILE incrementally (as soon as they are entered),
      # rather than waiting until the shell exits. The file will still be periodically re-written to trim it when the number of lines grows 20% beyond
      # the value specified by $SAVEHIST (see also the HIST_SAVE_BY_COPY option).
      # setopt INC_APPEND_HISTORY # @todo: determing if causing issue in writing hist file

      # This option both imports new commands from the history file, and also causes your typed commands to be appended to the history file
      # (the latter is like specifying INC_APPEND_HISTORY). The history lines are also output with timestamps ala EXTENDED_HISTORY
      # (which makes it easier to find the spot where we left off reading the file after it gets re-written).
      # By default, history movement commands visit the imported lines as well as the local lines, but you can toggle this on and off with
      # the set-local-history zle binding. It is also possible to create a zle widget that will make some commands ignore imported commands,
      # and some include them. If you find that you want more control over when commands get imported, you may wish to turn SHARE_HISTORY off,
      # INC_APPEND_HISTORY on, and then manually import commands whenever you need them using 'fc -RI'.
      setopt SHARE_HISTORY

    # Initialisation

      # All parameters subsequently defined are automatically exported.
      # setopt ALL_EXPORT

      # If this option is set, passing the -x flag to the builtins declare, float, integer, readonly and typeset (but not local) will also set
      # the -g flag; hence parameters exported to the environment will not be made local to the enclosing function, unless they were already or
      # the flag +g is given explicitly. If the option is unset, exported parameters will be made local in just the same way as any other parameter.
      # This option is set by default for backward compatibility; it is not recommended that its behaviour be relied upon.
      # Note that the builtin export always sets both the -x and -g flags, and hence its effect extends beyond the scope of the enclosing function;
      # this is the most portable way to achieve this behaviour.
      # setopt GLOBAL_EXPORT

      # If this option is unset, the startup files /etc/zprofile, /etc/zshrc, /etc/zlogin and /etc/zlogout will not be run.
      # It can be disabled and re-enabled at any time, including inside local startup files (.zshrc, etc.).
      # Set by default.
      # unsetopt GLOBAL_RCS

      # After /etc/zshenv is sourced on startup, source the
      # .zshenv, /etc/zprofile, .zprofile, /etc/zshrc, .zshrc, /etc/zlogin, .zlogin, and .zlogout files,
      # as described in the section 'Files'.
      # If this option is unset, the /etc/zshenv file is still sourced, but any of the others will not be;
      # it can be set at any time to prevent the remaining startup files after the currently executing one from being sourced.
      # Set by default.
      # unsetopt RCS

    # Input/Output

      # Expand aliases.
      # Set by default.
      # unsetopt ALIASES

      # Allows '>' redirection to truncate existing files, and '>>' to create files. Otherwise '>!' or '>|' must be used to truncate a file,
      # and '>>!' or '>>|' to create a file.
      # Set by default.
      # unsetopt CLOBBER

      # Try to correct the spelling of commands. Note that, when the HASH_LIST_ALL option is not set or when some directories in the path are not readable,
      # this may falsely report spelling errors the first time some commands are used.
      # The shell variable CORRECT_IGNORE may be set to a pattern to match words that will never be offered as corrections.
      # setopt CORRECT

      # Try to correct the spelling of all arguments in a line.
      setopt CORRECT_ALL

      # Use the Dvorak keyboard instead of the standard qwerty keyboard as a basis for examining spelling mistakes
      # for the CORRECT and CORRECT_ALL options and the spell-word editor command.
      # setopt DVORAK

      # If this option is unset, output flow control via start/stop characters (usually assigned to ^S/^Q) is disabled in the shell's editor.
      # Set by default.
      # unsetopt FLOW_CONTROL

      # Do not exit on end-of-file. Require the use of exit or logout instead. However, ten consecutive EOFs will cause the shell to exit anyway,
      # to avoid the shell hanging if its tty goes away. Also, if this option is set and the Zsh Line Editor is used, widgets implemented by
      # shell functions can be bound to EOF (normally Control-D) without printing the normal warning message.
      # This works only for normal widgets, not for completion widgets.
      # setopt IGNORE_EOF

      # Allow comments even in interactive shells.
      setopt INTERACTIVE_COMMENTS

      # Note the location of each command the first time it is executed. Subsequent invocations of the same command will use the saved location,
      # avoiding a path search. If this option is unset, no path hashing is done at all. However, when CORRECT is set, commands whose names do
      # not appear in the functions or aliases hash tables are hashed in order to avoid reporting them as spelling errors.
      # Set by default.
      # unsetopt HASH_CMDS

      # Whenever a command name is hashed, hash the directory containing it, as well as all directories that occur earlier in the path.
      # Has no effect if neither HASH_CMDS nor CORRECT is set.
      # Set by default.
      # unsetopt HASH_DIRS

      # Print a warning message if a mail file has been accessed since the shell last checked.
      # setopt MAIL_WARNING

      # Perform a path search even on command names with slashes in them. Thus if '/usr/local/bin' is in the user's path,
      # and he or she types 'X11/xinit', the command '/usr/local/bin/X11/xinit' will be executed (assuming it exists).
      # Commands explicitly beginning with '/', './' or '../' are not subject to the path search. This also applies to the '.' builtin.
      # Note that subdirectories of the current directory are always searched for executables specified in this form.
      # This takes place before any search indicated by this option, and regardless of whether '.' or the current directory appear in the command search path.
      # setopt PATH_DIRS

      # Print eight bit characters literally in completion lists, etc. This option is not necessary if
      # your system correctly returns the printability of eight bit characters (see ctype(3)).
      # setopt PRINT_EIGHT_BIT

      # Print the exit value of programs with non-zero exit status.
      # setopt PRINT_EXIT_VALUE

      # Allow the character sequence '''' to signify a single quote within singly quoted strings.
      # Note this does not apply in quoted strings using the format $'...', where a backslashed single quote can be used.
      # setopt RC_QUOTES

      # Do not query the user before executing 'rm *' or 'rm path/*'.
      setopt RM_STAR_SILENT

      # If querying the user before executing 'rm *' or 'rm path/*', first wait ten seconds and ignore anything typed in that time.
      # This avoids the problem of reflexively answering 'yes' to the query when one didn't really mean it.
      # The wait and query can always be avoided by expanding the '*' in ZLE (with tab).
      # setopt RM_STAR_WAIT

      # Allow the short forms of for, repeat, select, if, and function constructs.
      # setopt SHORT_LOOPS

      # If a line ends with a backquote, and there are an odd number of backquotes on the line, ignore the trailing backquote.
      # This is useful on some keyboards where the return key is too small, and the backquote key lies annoyingly close to it.
      setopt SUN_KEYBOARD_HACK

    # Job Control

      # With this option set, stopped jobs that are removed from the job table with the disown builtin command are
      # automatically sent a CONT signal to make them running.
      # setopt AUTO_CONTINUE

      # Treat single word simple commands without redirection as candidates for resumption of an existing job.
      # setopt AUTO_RESUME

      # Run all background jobs at a lower priority. This option is set by default.
      # setopt BG_NICE

      # Report the status of background and suspended jobs before exiting a shell with job control; a second attempt to exit the shell will succeed.
      # NO_CHECK_JOBS is best used only in combination with NO_HUP, else such jobs will be killed automatically.
      # The check is omitted if the commands run from the previous command line included a 'jobs' command, since it is assumed the user
      # is aware that there are background or suspended jobs. A 'jobs' command run from one of the hook functions defined in the section
      # SPECIAL FUNCTIONS in zshmisc(1) is not counted for this purpose.
      # setopt CHECK_JOBS

      # Send the HUP signal to running jobs when the shell exits.
      # setopt HUP

      # List jobs in the long format by default.
      # setopt LONG_LIST_JOBS

      # Allow job control. Set by default in interactive shells.
      # setopt MONITOR

      # Report the status of background jobs immediately, rather than waiting until just before printing a prompt.
      # setopt NOTIFY

    # Prompting

      # If set, '!' is treated specially in prompt expansion. See EXPANSION OF PROMPT SEQUENCES in zshmisc(1).
      # setopt PROMPT_BANG

      # Print a carriage return just before printing a prompt in the line editor.
      # This is on by default as multi-line editing is only possible if the editor knows where the start of the line appears.
      # setopt PROMPT_CR

      # Attempt to preserve a partial line (i.e. a line that did not end with a newline) that would otherwise be covered up by the
      # command prompt due to the PROMPT_CR option. This works by outputting some cursor-control characters, including a series of spaces,
      # that should make the terminal wrap to the next line when a partial line is present (note that this is only successful if your terminal
      # has automatic margins, which is typical).
      # When a partial line is preserved, by default you will see an inverse+bold character at the end of the partial line: a "%" for a
      # normal user or a "#" for root. If set, the shell parameter PROMPT_EOL_MARK can be used to customize how the end of partial lines are shown.
      # NOTE: if the PROMPT_CR option is not set, enabling this option will have no effect. This option is on by default.
      # Set by default.
      # unsetopt PROMPT_SP

      # If set, '%' is treated specially in prompt expansion. See EXPANSION OF PROMPT SEQUENCES in zshmisc(1).
      # setopt PROMPT_PERCENT

      # If set, parameter expansion, command substitution and arithmetic expansion are performed in prompts.
      # Substitutions within prompts do not affect the command status.
      # Note: recommended for `vcs_info`.
      setopt PROMPT_SUBST

      # Remove any right prompt from display when accepting a command line. This may be useful with terminals with other cut/paste methods.
      # setopt TRANSIENT_RPROMPT

    # Scripts and Functions

      # Output hexadecimal numbers in the standard C format, for example '0xFF' instead of the usual '16#FF'.
      # If the option OCTAL_ZEROES is also set (it is not by default), octal numbers will be treated similarly and hence appear
      # as '077' instead of '8#77'. This option has no effect on the choice of the output base, nor on the output of bases other
      # than hexadecimal and octal. Note that these formats will be understood on input irrespective of the setting of C_BASES.
      # setopt C_BASES

      # This alters the precedence of arithmetic operators to be more like C and other programming languages;
      # the section ARITHMETIC EVALUATION in zshmisc(1) has an explicit list.
      # setopt C_PRECEDENCES

      # Run the DEBUG trap before each command; otherwise it is run after each command.
      # Setting this option mimics the behaviour of ksh 93; with the option unset the behaviour is that of ksh 88.
      # setopt DEBUG_BEFORE_CMD

      # If a command has a non-zero exit status, execute the ZERR trap, if set, and exit. This is disabled while running initialization scripts.
      # The behaviour is also disabled inside DEBUG traps. In this case the option is handled specially: it is unset on entry to the trap.
      # If the option DEBUG_BEFORE_CMD is set, as it is by default, and the option ERR_EXIT is found to have been set on exit, then the command
      # for which the DEBUG trap is being executed is skipped. The option is restored after the trap exits.
      # setopt ERR_EXIT

      # If a command has a non-zero exit status, return immediately from the enclosing function.
      # The logic is identical to that for ERR_EXIT, except that an implicit return statement is executed instead of an exit.
      # This will trigger an exit at the outermost level of a non-interactive script.
      # setopt ERR_RETURN

      # If set, line numbers of expressions evaluated using the builtin eval are tracked separately of the enclosing environment.
      # This applies both to the parameter LINENO and the line number output by the prompt escape %i.
      # If the option is set, the prompt escape %N will output the string '(eval)' instead of the script or function name as an indication.
      # (The two prompt escapes are typically used in the parameter PS4 to be output when the option XTRACE is set.)
      # If EVAL_LINENO is unset, the line number of the surrounding script or function is retained during the evaluation.
      # setopt EVAL_LINENO

      # Do execute commands. Without this option, commands are read and checked for syntax errors, but not executed.
      # This option cannot be turned off in an interactive shell, except when '-n' is supplied to the shell at startup.
      # Set by default
      # unsetopt EXEC

      # When executing a shell function or sourcing a script, set $0 temporarily to the name of the function/script.
      # setopt FUNCTION_ARGZERO

      # If this option is set at the point of return from a shell function, most options (including this one) which were in
      # force upon entry to the function are restored; options that are not restored are PRIVILEGED and RESTRICTED.
      # Otherwise, only this option and the XTRACE and PRINT_EXIT_VALUE options are restored. Hence if this is explicitly unset by a
      # shell function the other options in force at the point of return will remain so. A shell function can also guarantee itself a
      # known shell configuration with a formulation like 'emulate -L zsh'; the -L activates LOCAL_OPTIONS.
      # setopt LOCAL_OPTIONS

      # If this option is set when a signal trap is set inside a function, then the previous status of the trap for that signal
      # will be restored when the function exits. Note that this option must be set prior to altering the trap behaviour in a function;
      # unlike LOCAL_OPTIONS, the value on exit from the function is irrelevant. However, it does not need to be set before any global
      # trap for that to be correctly restored by a function. For example,
        # `unsetopt localtraps`
        # `trap - INT`
        # `fn() { setopt localtraps; trap '' INT; sleep 3; }`
      # will restore normally handling of SIGINT after the function exits.
      # setopt LOCAL_TRAPS

      # Allow definitions of multiple functions at once in the form 'fn1 fn2...()'; if the option is not set, this causes a parse error.
      # Definition of multiple functions with the function keyword is always allowed. Multiple function definitions are not often used and
      # can cause obscure errors.
      # setopt MULTI_FUNC_DEF

      # Perform implicit tees or cats when multiple redirections are attempted (see the section 'Redirection').
      # setopt MULTIOS

      # Interpret any integer constant beginning with a 0 as octal, per IEEE Std 1003.2-1992 (ISO 9945-2:1993).
      # This is not enabled by default as it causes problems with parsing of, for example, date and time strings with leading zeroes.
      # Sequences of digits indicating a numeric base such as the '08' component in '08#77' are always interpreted as decimal, regardless of leading zeroes.
      # setopt OCTAL_ZEROES

      # If this is unset, executing any of the 'typeset' family of commands with no options and a list of parameters that have no values to be
      # assigned but already exist will display the value of the parameter. If the option is set, they will only be shown when parameters are
      # selected with the '-m' option. The option '-p' is available whether or not the option is set.
      # unsetopt TYPESET_SILENT

      # Print shell input lines as they are read.
      # setopt VERBOSE

      # Print commands and their arguments as they are executed.
      # setopt XTRACE

    # Shell Emulation

      # When set, matches performed with the =~ operator will set the BASH_REMATCH array variable,
      # instead of the default MATCH and match variables. The first element of the BASH_REMATCH array will contain
      # the entire matched text and subsequent elements will contain extracted substrings.
      # This option makes more sense when KSH_ARRAYS is also set, so that the entire matched portion is stored at
      # index 0 and the first substring is at index 1. Without this option, the MATCH variable contains the entire
      # matched text and the match array variable contains substrings.
      # setopt BASH_REMATCH


      # Make the echo builtin compatible with the BSD echo command.
      # This disables backslashed escape sequences in echo strings unless the -e option is specified.
      # setopt BSD_ECHO

      # A history reference without an event specifier will always refer to the previous command.
      # Without this option, such a history reference refers to the same event as the previous history reference, defaulting to the previous command.
      # setopt CSH_JUNKIE_HISTORY

      # Allow loop bodies to take the form 'list; end' instead of 'do list; done'.
      # setopt CSH_JUNKIE_LOOPS

      # Changes the rules for single- and double-quoted text to match that of csh.
      # These require that embedded newlines be preceded by a backslash; unescaped newlines will cause an error message.
      # In double-quoted strings, it is made impossible to escape '$', ''' or '"' (and '\' itself no longer needs escaping).
      # Command substitutions are only expanded once, and cannot be nested.
      # setopt CSH_JUNKIE_QUOTES

      # Do not use the values of NULLCMD and READNULLCMD when running redirections with no command.
      # This make such redirections fail (see the section 'Redirection').
      # setopt CSH_NULLCMD

      # Emulate ksh array handling as closely as possible. If this option is set, array elements are numbered from zero,
      # an array parameter without subscript refers to the first element instead of the whole array, and braces are required
      # to delimit a subscript ('${path[2]}' rather than just '$path[2]').
      # setopt KSH_ARRAYS

      # Emulate ksh function autoloading. This means that when a function is autoloaded, the corresponding file is merely executed,
      # and must define the function itself. (By default, the function is defined to the contents of the file. However,
      # the most common ksh-style case - of the file containing only a simple definition of the function - is always handled in the ksh-compatible manner.)
      # setopt KSH_AUTOLOAD

      # Alters the way options settings are printed: instead of separate lists of set and unset options, all options are shown,
      # marked 'on' if they are in the non-default state, 'off' otherwise.
      # setopt KSH_OPTION_PRINT

      # Alters the way arguments to the typeset family of commands, including declare, export, float, integer, local and readonly, are processed.
      # Without this option, zsh will perform normal word splitting after command and parameter expansion in arguments of an assignment;
      # with it, word splitting does not take place in those cases.
      # setopt KSH_TYPESET

      # Treat use of a subscript of value zero in array or string expressions as a reference to the first element, i.e. the element that usually
      # has the subscript 1. Ignored if KSH_ARRAYS is also set.
      # If neither this option nor KSH_ARRAYS is set, accesses to an element of an array or string with subscript zero return an empty
      # element or string, while attempts to set element zero of an array or string are treated as an error. However, attempts to set an
      # otherwise valid subscript range that includes zero will succeed. For example, if KSH_ZERO_SUBSCRIPT is not set,
      # `array[0]=(element)` is an error, while `array[0,1]=(element)` is not and will replace the first element of the array.
      # This option is for compatibility with older versions of the shell and is not recommended in new code.
      # setopt KSH_ZERO_SUBSCRIPT

      # When this option is set, reserved words are not candidates for alias expansion: it is still possible to declare any of them as an alias,
      # but the alias will never be expanded. Reserved words are described in the section RESERVED WORDS in zshmisc(1).
      # Alias expansion takes place while text is being read; hence when this option is set it does not take effect until the end of
      # any function or other piece of shell code parsed as one unit. Note this may cause differences from other shells even when the option is in effect.
      # For example, when running a command with 'zsh -c', or even 'zsh -o posixaliases -c', the entire command argument is parsed as one unit,
      # so aliases defined within the argument are not available even in later lines. If in doubt, avoid use of aliases in non-interactive code.
      # setopt POSIX_ALIASES

      # When this option is set the command builtin can be used to execute shell builtin commands.
      # Parameter assignments specified before shell functions and special builtins are kept after the command completes unless the special builtin is
      # prefixed with the command builtin.
      # Special builtins are ., :, break, continue, declare, eval, exit, export, integer, local, readonly, return, set, shift, source, times, trap and unset.
      # setopt POSIX_BUILTINS

      # When this option is set, only the ASCII characters a to z, A to Z, 0 to 9 and _ may be used in identifiers (names of shell parameters and modules).
      # When the option is unset and multibyte character support is enabled (i.e. it is compiled in and the option MULTIBYTE is set),
      # then additionally any alphanumeric characters in the local character set may be used in identifiers. Note that scripts and
      # functions written with this feature are not portable, and also that both options must be set before the script or function is parsed;
      # setting them during execution is not sufficient as the syntax variable=value has already been parsed as a command rather than an assignment.
      # If multibyte character support is not compiled into the shell this option is ignored; all octets with the top bit set may be used in identifiers.
      # This is non-standard but is the traditional zsh behaviour.
      # setopt POSIX_IDENTIFIERS

      # Perform filename expansion (e.g., ~ expansion) before parameter expansion, command substitution,
      # arithmetic expansion and brace expansion. If this option is unset, it is performed after brace expansion,
      # so things like '~$USERNAME' and '~{pfalstad,rc}' will work.
      # Set by default. @todo: check if actually set by default.
      # unsetopt SH_FILE_EXPANSION

      # Do not use the values of NULLCMD and READNULLCMD when doing redirections, use ':' instead (see the section 'Redirection').
      # setopt SH_NULLCMD

      # If this option is set the shell tries to interpret single letter options (which are used with set and setopt) like ksh does.
      # This also affects the value of the - special parameter.
      # setopt SH_OPTION_LETTERS

      # Causes field splitting to be performed on unquoted parameter expansions.
      # Note that this option has nothing to do with word splitting. (See the section 'Parameter Expansion'.)
      # setopt SH_WORD_SPLIT

      # While waiting for a program to exit, handle signals and run traps immediately.
      # Otherwise the trap is run after a child process has exited.
      # Note this does not affect the point at which traps are run for any case other than when the shell is waiting for a child process.
      # setopt TRAPS_ASYNC

    # Shell State

      # This is an interactive shell. This option is set upon initialisation if the standard input is a tty and commands
      # are being read from standard input. (See the discussion of SHIN_STDIN.) This heuristic may be overridden by specifying
      # a state for this option on the command line. The value of this option can only be changed via flags supplied at invocation of the shell.
      # It cannot be changed once zsh is running.
      # setopt INTERACTIVE

      # This is a login shell. If this option is not explicitly set, the shell is a login shell if
      # the first character of the argv[0] passed to the shell is a '-'.
      # setopt LOGIN

      # Turn on privileged mode. This is enabled automatically on startup if the effective user (group) ID is not equal to
      # the real user (group) ID. Turning this option off causes the effective user and group IDs to be set to the real user and group IDs.
      # This option disables sourcing user startup files. If zsh is invoked as 'sh' or 'ksh' with this option set, /
      # etc/suid_profile is sourced (after /etc/profile on interactive shells).
      # Sourcing ~/.profile is disabled and the contents of the ENV variable is ignored.
      # This option cannot be changed using the -m option of setopt and unsetopt, and changing it inside a function always changes it
      # globally regardless of the LOCAL_OPTIONS option.
      # setopt PRIVILEGED

      # Enables restricted mode. This option cannot be changed using unsetopt, and setting it inside a function always changes it globally
      # regardless of the LOCAL_OPTIONS option. See the section 'Restricted Shell'.
      # setopt RESTRICTED

      # Commands are being read from the standard input. Commands are read from standard input if no command is specified with -c and no
      # file of commands is specified. If SHIN_STDIN is set explicitly on the command line, any argument that would otherwise have been
      # taken as a file to run will instead be treated as a normal positional parameter.
      # Note that setting or unsetting this option on the command line does not necessarily affect the state the option will
      # have while the shell is running - that is purely an indicator of whether on not commands are actually being read from standard input.
      # The value of this option can only be changed via flags supplied at invocation of the shell.
      # It cannot be changed once zsh is running.
      # setopt SHIN_STDIN

      # If the shell is reading from standard input, it exits after a single command has been executed.
      # This also makes the shell non-interactive, unless the INTERACTIVE option is explicitly set on the command line.
      # The value of this option can only be changed via flags supplied at invocation of the shell.
      # It cannot be changed once zsh is running.
      # setopt SINGLE_COMMAND

    # Zle

      # See also: http://www.cs.elte.hu/zsh-manual/zsh_14.html

      # Beep on error in ZLE.
      # On by default.
      # unsetopt BEEP

      # Assume that the terminal displays combining characters correctly. Specifically, if a base alphanumeric character is
      # followed by one or more zero-width punctuation characters, assume that the zero-width characters will be displayed as
      # modifications to the base character within the same width. Not all terminals handle this. If this option is not set,
      # zero-width characters are displayed separately with special mark-up.
      # If this option is set, the pattern test [[:WORD:]] matches a zero-width punctuation character on the assumption
      # that it will be used as part of a word in combination with a word character.
      # Otherwise the base shell does not handle combining characters specially.
      # setopt COMBINING_CHARS

      # If ZLE is loaded, turning on this option has the equivalent effect of 'bindkey -e'.
      # In addition, the VI option is unset. Turning it off has no effect.
      # The option setting is not guaranteed to reflect the current keymap.
      # This option is provided for compatibility; bindkey is the recommended interface.
      # setopt EMACS

      # Start up the line editor in overstrike mode.
      # setopt OVERSTRIKE

      # Use single-line command line editing instead of multi-line.
      # Note that although this is on by default in ksh emulation it only provides superficial compatibility with
      # the ksh line editor and reduces the effectiveness of the zsh line editor.
      # As it has no effect on shell syntax, many users may wish to disable this option when using ksh emulation interactively.
      # setopt SINGLE_LINE_ZLE

      # If ZLE is loaded, turning on this option has the equivalent effect of 'bindkey -v'.
      # In addition, the EMACS option is unset. Turning it off has no effect.
      # The option setting is not guaranteed to reflect the current keymap.
      # This option is provided for compatibility; bindkey is the recommended interface.
      setopt VI

      # By default, there is a 0.4 second delay after you hit the <ESC> key and when the mode change is registered.
      # This results in a very jarring and frustrating transition between modes. Let's reduce this delay to 0.1 seconds.
      # Source: http://dougblack.io/words/zsh-vi-mode.html
      export KEYTIMEOUT=1

      # Use the zsh line editor. Set by default in interactive shells connected to a terminal.
      # Set by default.
      # unsetopt ZLE

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
    SAVEHIST=1500

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

### Aliases

  ## Alias
  # Whut? Jup. Alias helper aliases.

    # Grep through the aliases and display the related comment
    alias alig="less ~/.zshrc | grep -B 1 'alias =' | grep -B 1"

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

### Functions

  ## cdf

    # Change directory to the current Finder directory
    # http://brettterpstra.com/2013/02/09/quick-tip-jumping-to-the-finder-location-in-terminal/
    cdf() {
        target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
        if [ "$target" != "" ]; then
          cd "$target"; pwd
        else
          echo 'No Finder window found' >&2
        fi
    }

  ## ip

    # Get host info and only have the IP returned
    # NOTE: doesn't pick up /etc/hosts file overrides!
    ip() {
      host $1 | grep -m 1 address | cut -d \  -f 4
    }

  ## man

    # Colourful man pages
    # Source: http://apple.stackexchange.com/a/96810/63784
    man() {
      env \
      LESS_TERMCAP_mb=$(printf "\e[1;31m") \
      LESS_TERMCAP_md=$(printf "\e[1;31m") \
      LESS_TERMCAP_me=$(printf "\e[0m") \
      LESS_TERMCAP_se=$(printf "\e[0m") \
      LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
      LESS_TERMCAP_ue=$(printf "\e[0m") \
      LESS_TERMCAP_us=$(printf "\e[1;32m") \
      man "$@"
    }

  ## Insert sudo

    # Alt-S inserts "sudo " at the start of line # @todo: maketh it work
    # Source: http://stackoverflow.com/a/970202
    insert_sudo (){
      zle beginning-of-line; zle -U "sudo "
    }
    zle -N insert-sudo insert_sudo
    bindkey "^[s" insert-sudo

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

  ## precmd

    # Executed before each prompt. Note that precommand functions are not re-executed simply because the command line is redrawn,
    # as happens, for example, when a notification about an exiting job is displayed.
    precmd() {
      # sudo check
      # Based on: http://superuser.com/a/486435
      HAS_SUDO_CHECK=$(sudo -n uptime 2>&1|grep "load"|wc -l)
      if [ ${HAS_SUDO_CHECK} -gt 0 ]; then
        SUDO_PROMPT="(sudo) "
      else
        SUDO_PROMPT=" "
      fi

      # git check + prompt selection
      if git rev-parse --git-dir > /dev/null 2>&1; then
        PROMPT='${vcs_info_msg_0_}%{$at_normal%}%{$fg_red%} »%{$at_normal%} '
        export GIT_HASH="$(git log --pretty=format:'%h' -n 1)"
        export RPROMPT="$SUDO_PROMPT [%{$fg_red%} $GIT_HASH %{$at_normal%}] $VI_MODE"
        vcs_info
      else
        PROMPT='%{$at_normal%} %~%{$fg_red%} »%{$at_normal%} '
        export GIT_HASH=""
        export RPROMPT="$SUDO_PROMPT $VI_MODE"
        unset vcs_info_msg_${i}_
      fi
    }
