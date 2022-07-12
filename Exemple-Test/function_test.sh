#!/bin/bash

function Test ()
{
TEST=$(cat /etc/debian_version)

return 2
}

function Test2 ()
{
echo $TEST
}

function OS ()
{
  if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
    ID=$ID
    VARIANT=$VARIANT
  fi
}


echo $TEST
Test
echo $?
Test2
echo $?

OS
echo "-------- Data --------"
echo -e " $NAME \n $VERSION_ID \n $ID \n $VARIANT"
echo "----------------------"
