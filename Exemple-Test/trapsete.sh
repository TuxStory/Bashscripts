#!/bin/bash
set -e
function error()
{
echo "error at $1"
}
trap 'error $LINENO' ERR

errors

#Set –e is used within the Bash to stop execution instantly as a query
#exits while having a non-zero status. This function is also used when
#you need to know the error location in the running code.
