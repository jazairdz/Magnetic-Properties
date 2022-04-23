#!/bin/bash
#Script developped by Dr Abderrahmane Reggad
#email: abde.reggad@gmail.com


wdir="$(basename $PWD)"
 
 # save the original fcc structure
cp $wdir.struct $wdir.struct-cubic-F

# Creation of the AFM I structure

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

# Creation of the AFM II structure

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

# Creation of the AFM III structure

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
