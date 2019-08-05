#!/bin/sh
AUTH=$1
if [ -z $AUTH ]
then
  echo "Auth Unset"
else
  echo \
    'P:' $(gauth | grep $AUTH | awk '{ print $2 }') \
    'C:' $(gauth | grep $AUTH | awk '{ print $3 }') \
    'N:' $(gauth | grep $AUTH | awk '{ print $4 }') \
    'T:' $(gauth | grep '\[' | awk -F "=" '{print NF-1}')
fi
