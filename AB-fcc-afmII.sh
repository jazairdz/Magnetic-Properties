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

# save the P structure
cp *super.struct $wdir.struct-cubic-P
cp $wdir.struct-cubic-P $wdir.struct-cubic-P2

# change the symmertry of the structure from cubic to rhombohedral

sed 's/90.000000/89.990000/g' $wdir.struct-cubic-P2 > $wdir.struct-89.99 

rm $wdir.struct-cubic-P2
cp $wdir.struct-89.99 $wdir.struct

# Create the new space group for rhombohedral structure

sgroup -wi $wdir.struct -wo $wdir.struct_sgroup

cp $wdir.struct_sgroup $wdir.struct-rho
cp $wdir.struct_sgroup $wdir.struct

# Change to the hexagonal symmetry
cat <<! | x supercell
$wdir.struct
1
1
1
0
0
0
H
0
0
0
!
# save the hexagonal structure
cp *super.struct $wdir.struct-hex 
cp *super.struct $wdir.struct


# make a supercell 1x1x2
cat <<! | x supercell
$wdir.struct
1
1
2
0
0
0
P
0
0
0
!
# save the hexagonal structure
cp *super.struct $wdir.struct-hex2
cp *super.struct $wdir.struct2

# create the AFM structure

sed -e '7s/./1/3/' -e '13s/./2/3/' -e '19s/./1/3/' -e '25s/./2/3/' \
-e '31 s/Ni/Ni2/' -e '37 s/Ni/Ni1/' $wdir.struct2 > $wdir.struct

rm $wdir.struct2

sgroup -wi $wdir.struct -wo $wdir.struct_sgroup

cp $wdir.struct_sgroup $wdir.struct-afmII

cp $wdir.struct-cubic-F $wdir.struct 
