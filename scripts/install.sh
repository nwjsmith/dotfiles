#!/usr/bin/env bash
set -e

for source in $(find $PWD -name \*.symlink); do
  destination="${HOME}/.$(basename ${source%.*})"

  if [ -f $destination ] || [ -d $destination ] || [ -L $destination ]; then
    printf "File already exists: ${destination}, do you want to overwrite it? [y/n]: "
    read -n 1 overwrite
    echo ""

    case "${overwrite}" in
      y )
        echo "Overwriting ${destination}"
        rm -rf $destination && ln -s $source $destination;;
      n )
        echo "Skipping ${destination}"
        ;;
      * )
        ;;
    esac
  else
    echo "Linking ${source} to ${destination}"
    ln -s $source $destination
  fi
done

echo "Initializing submodules."
git submodule init
git submodule update
git submodule foreach git pull origin master

echo ""
echo "Done!"
