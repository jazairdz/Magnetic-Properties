#!/bin/bash
#Script developped by Dr Abderrahmane Reggad
#email: abde.reggad@gmail.com


wdir="$(basename $PWD)"
 
 # save the original fcc structure
cp $wdir.struct $wdir.struct-cubic-F

# make the atoms inequivalent by using supercell tool

cat <<! | x supercell
$wdir.struct
1
1
1
0
0
0
P
0
0
0
!

# save the P1x2x1 structure
cp *super.struct $wdir.struct-P 
cp $wdir.struct-P $wdir.struct-P2


# create the AFM structure


sed -e '7s/./1/3' -e '13s/./1/3' -e '19s/./2/3' -e '25s/./2/3' $wdir.struct-P2 > $wdir.struct

cp $wdir.struct $wdir.struct-afmI-ws

sgroup -wi $wdir.struct -wo $wdir.struct_sgroup

cp $wdir.struct_sgroup $wdir.struct-afmI

cp $wdir.struct-cubic-F $wdir.struct
