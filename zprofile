#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='nano'
export VISUAL='nano'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
	$HOME/.cargo/bin
	$HOME/bin
#	$HOME/Documents/src/Kakadu/V810/bin
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# Kakadu

# rm -f /usr/local/lib/libkdu*.dylib # Start by removing all the lib links
# KDU_LIBS=~/Documents/src/Kakadu/v810/bin*/libkdu*.dylib
# for f_path in $~KDU_LIBS
# do
#        f_name="${f_path##*/}"
#        ln -s $f_path /usr/local/lib/$f_name
# done
# LIBRARY_PATH=~/lib:/usr/local/lib:$LIBRARY_PATH
# DYLD_LIBRARY_PATH=.:$DYLD_LIBRARY_PATH
# export LIBRARY_PATH
# export DYLD_LIBRARY_PATH

eval $(brew shellenv)
