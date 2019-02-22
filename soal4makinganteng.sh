#!/bin/bash

read sokin

A=ABCDEFGHIJKLMNOPQRSTUVWXYZ
B=abcdefghijklmnopqrstuvwxyz

A2=($(echo ${A[@]})$(echo ${A[@]}))
B2=($(echo ${B[@]})$(echo ${B[@]}))
hour=${sokin:0:2}
rot=$hour

ganteng=($(echo ${A[@]})$(echo ${B[@]}))
baruA=$(echo $A | tr "${A:0:26}" "${A2:${rot}:26}")
baruB=$(echo $B | tr "${B:0:26}" "${B2:${rot}:26}")
ganteng2=($(echo ${baruA[@]})$(echo ${baruB[@]}))

< "$sokin" > "$sokin dec" tr "$ganteng2" "$ganteng"
