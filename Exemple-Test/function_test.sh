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

Test
echo $?
Test2
echo $?
