#!/bin/bash
set -e
function error()
{
echo "error at $1"
}
trap 'error $LINENO' ERR

errors
