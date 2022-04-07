#!/bin/bash
#Script developped by Dr Abderrahmane Reggad
#email: abe.reggad@gmail.com


wdir="$(basename $PWD)"
 
 # save the original fcc structure
cp $wdir.struct $wdir.struct-cubic-F

# make the atoms inequivalent by using supercell tool

cat <<! | x supercell
$wdir.struct
1
2
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
cp *super.struct $wdir.struct-P1x2x1
cp $wdir.struct-P1x2x1 $wdir.struct-P1x2x1-2


# create the AFM structure

sed -e '7 s/Ni/Ni1/' -e '13 s/Ni/Ni2/' -e '19 s/Ni/Ni1/' -e '25 s/Ni/Ni1/' \
-e '31 s/Ni/Ni2/' -e '37 s/Ni/Ni2/' -e '43 s/Ni/Ni1/' -e '49 s/Ni/Ni2/' \
$wdir.struct-P1x2x1-2 > $wdir.struct

rm $wdir.struct-P1x2x1-2

cp $wdir.struct $wdir.struct-afmIII-ws

sgroup -wi $wdir.struct -wo $wdir.struct_sgroup

cp $wdir.struct_sgroup $wdir.struct-afmIII

cp $wdir.struct-cubic-F $wdir.struct
