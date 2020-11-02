#!/bin/bash

while :; do printf \\$(printf '%o' $[47+45*(RANDOM%2)]); done
#while :; do printf \\$(printf '%o' $[123+(RANDOM%4)]); done
#while :; do printf \\$(printf '%o' $[45+79*(RANDOM%2)]); done
