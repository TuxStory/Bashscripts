#!/bin/bash

function Test ()
{
TEST=$(cat /etc/debian_version)
}

function Test2 ()
{
echo $TEST
}

Test
Test2
