#!/bin/bash

if [[ $# != 1 ]]; then
  echo "[ERROR] $0 <path to PX4-Autopilot>" && exit 1
fi

PX4_MSG_PATH="$(readlink -f $1)/msg"
MSG_PATH="./msg"

if [[ ! -d $PX4_MSG_PATH ]]; then
  echo "[ERROR] $PX4_MSG_PATH doesnt exist" && exit 1
fi

rm -r $MSG_PATH/*

for msg in $(find $PX4_MSG_PATH -name "*.msg" ) ; do
  cp $msg $MSG_PATH
done
