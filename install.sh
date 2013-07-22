#! /bin/bash

set -e

repo_dir=configs

cd $HOME

if [ -d ${repo_dir} ]; then
  echo "The directory ${repo_dir} exists, assuming it contains the configs repo."
else
  git clone https://github.com/christoffer/configs.git ${repo_dir}
fi


for configfile in $( ls ${repo_dir}/configs ); do
  dotfile=".${configfile}"
  echo ${dotfile}

  if [ -L $dotfile ]; then
    # Symlink already exists, drop it
    echo "Dropping symlinked ${dotfile}"
    rm $dotfile
  elif [ -e $dotfile ]; then
    # File exists, but is not a symlink
    mv -v ${dotfile} ${dotfile}_old
  fi

  ln -s ${repo_dir}/configs/${configfile} $dotfile
done
