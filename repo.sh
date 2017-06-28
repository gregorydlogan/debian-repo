#!/bin/bash

REPO_DIR="repo"
REPREPRO_COMMON="-Vb $REPO_DIR"
SUITES="jessie stretch xenial"

mkdir -p $REPO_DIR
if [ ! -d $REPO_DIR/conf ]; then
  cp -rv conf $REPO_DIR
fi

addToComponent() {
  for suite in $SUITES
  do
    if [[ $2 =~ deb$ ]]; then
      echo "Processing deb $2"
      reprepro $REPREPRO_COMMON --component $1 includedeb $suite $2
    elif [[ $2 =~ changes$ ]]; then
      echo "Processing changes $2"
      reprepro $REPREPRO_COMMON --component $1 include $suite $2
    elif [[ $2 =~ dsc$ ]]; then
      echo "Processing dsc $2"
      reprepro $REPREPRO_COMMON --component $1 includedsc $suite $2
    #This doesn't work
    #elif [[ $2 == *".orig.tar."* ]]; then
    #  echo "Processing source tarball $2"
    #  reprepro $REPREPRO_COMMON --component $1 includesrc $suite $2
    fi
  done
}

removeFromComponent() {
  for suite in $SUITES
  do
    #Get the list of items
    reprepro $REPREPRO_COMMON list $suite | while read line
    do
      #Get the item name, then remove it
      item=$(echo $line | cut -f 2 -d " ")
      reprepro $REPREPRO_COMMON --component $1 remove $suite $item
    done
  done
}

#./createRepo.sh add testing ../debs/*.deb
if [ $# -ge 3 -a "$1" == "add" ]
then
  shift
  component=$1
  shift
  while (($#)); do
    addToComponent $component $1
    shift
  done
#./createRepo.sh del testing
elif [ $# -ge 2 -a "$1" == "del" ]
then
  shift
  component=$1
  shift
  removeFromComponent $component
fi
