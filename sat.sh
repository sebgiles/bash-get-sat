#!/bin/bash
mkdir ~/Desktop/sat
COUNTER=1
N=100
RES=5 #multiples of 5 only
DATE=`echo $(($(date -u +%Y%m%d%H%M) - ($(date +%M)%5)))`
while [ $COUNTER -le $N ]; do
  DATE=`date -v-${RES}M -j -f %Y%m%d%H%M +%Y%m%d%H%M $DATE`
  echo Downloading image $COUNTER/$N, $DATE
  if [ ! -e ~/Desktop/sat/$DATE.jpeg ]
  then
    curl -o ~/Desktop/sat/$DATE.jpeg "http://it.sat24.com/image?type=visual5HDComplete&region=eu&timestamp="$DATE
  else
    echo Already got it!
  fi
  echo
  let COUNTER=COUNTER+1
done
open ~/Desktop/sat/*
