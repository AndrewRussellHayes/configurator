#!/bin/bash
# sets up dotfiles
# By: Andrew Hayes

#NOTE: this program should be able to be ran on any system and only install all my dotfile and non-mac config non-distructively... work in progress

DRYRUN='' # make '' to run and 'yes' to perform dryrun
SOURCEPARENT=$HOME/.dotfiles
OLD_file_dir="$HOME/oldDotfiles-`date +%y%m%d_%s`"
OLD_directory_dir="$HOME/oldDirs-`date +%y%m%d_%s`"

l
#make dir to store saved older config files
if [ $DRYRUN ] ; then
  echo mkdir $OLD_file_dir
else
  mkdir $OLD_file_dir
fi

linkdotfiles() {
  sourcePath=$SOURCEPARENT/$1
  originalPath=$HOME/$2

  if [ $DRYRUN ] ; then
    if [ -e $originalPath ]; then     # If the File exists
      if [ -h $originalPath ]; then     # AND is a symlink
        echo rm $originalPath             # print Delete the symlink
      else                              # Otherwise
        echo mv $originalPath $OLD_file_dir/$2 # print move the file to $OLD_file_dir
      fi
    fi
    echo ln -s $sourcePath $originalPath # print make new symlink
  else
    if [ -e $originalPath ]; then     # If the File exists
      if [ -h $originalPath ]; then     # AND is a symlink
        rm $originalPath                  # Delete the symlink
      else                              # Otherwise
        mv $originalPath $OLD_file_dir/$2 # move the file to $OLD_file_dir
      fi
    fi
    ln -s $sourcePath $originalPath   # make new symlink
  fi
}

############### Program
# the left side is where it is in dotfiles right side is its filename inside $HOME
# linkdotfiles  ''                 .dotfiles #this is a special case JUST for .dotfiles
linkdotfiles private/antigen     .antigen
linkdotfiles appconfigs          .appconfigs
linkdotfiles private/aws         .aws
# linkdotfiles private/babyconfig  .babyconfig
linkdotfiles bash/bash_profile   .bash_profile
linkdotfiles bash/bashrc         .bashrc
linkdotfiles private/config      .config
linkdotfiles docker              .docker
linkdotfiles git/gitconfig       .gitconfig
linkdotfiles private/gnupg       .gnupg
linkdotfiles appconfigs/iterm/iterm2_shell_integration.bash  .iterm2_shell_integration.bash
linkdotfiles appconfigs/iterm/iterm2_shell_integration.zsh   .iterm2_shell_integration.zsh
linkdotfiles private/lpass       .lpass
# linkdotfiles private/m2          .m2
# linkdotfiles private/npmrc       .npmrc
# linkdotfiles private/openvpn-connect.json                    .openvpn-connect.json
linkdotfiles private/password-store                          .password-store
linkdotfiles private/scripts     .scripts
linkdotfiles private/ssh         .ssh
linkdotfiles tmux.conf           .tmux.conf
linkdotfiles vim                 .vim
linkdotfiles private/z           .z
linkdotfiles zsh/zshrc           .zshrc
