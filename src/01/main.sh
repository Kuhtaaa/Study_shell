#!/bin/bash

re='^[+-]?[0-9]+([.][0-9]+)?$'

if ! [[ $1 =~ $re ]] ; then
   echo $1; exit 1
fi
   echo "error: This is a number"; exit 1
