#!/bin/bash

# Developped by Dr Abderrahmane Reggad 
# email: abde.reggad@gmail.com

wdir="$(basename $PWD)"


# Creation of AFM I structure
cp $wdir.struct-split $wdir.struct-splitI
sed -e '16s/./1/3' -e '44s/./1/3' -e '48s/./2/3' -e '54s/./2/3' $wdir.struct-splitI > $wdir.struct-afmIws
cp $wdir.struct-afmIws $wdir.struct
sgroup -wi $wdir.struct -wo $wdir.struct_sgroup
cp $wdir.struct_sgroup $wdir.struct-afmI
rm $wdir.struct-splitI


# Creation of AFM II structure
cp $wdir.struct-split $wdir.struct-splitII
sed -e '16s/./1/3' -e '44s/./2/3' -e '48s/./1/3' -e '54s/./2/3' $wdir.struct-splitII > $wdir.struct-afmIIws
cp $wdir.struct-afmIIws $wdir.struct
sgroup -wi $wdir.struct -wo $wdir.struct_sgroup
cp $wdir.struct_sgroup $wdir.struct-afmII
rm $wdir.struct-splitII


# Creation of AFM III structure
cp $wdir.struct-split $wdir.struct-splitIII
sed -e '16s/./1/3' -e '44s/./2/3' -e '48s/./2/3' -e '54s/./1/3' $wdir.struct-splitIII > $wdir.struct-afmIIIws
cp $wdir.struct-afmIIIws $wdir.struct
sgroup -wi $wdir.struct -wo $wdir.struct_sgroup
cp $wdir.struct_sgroup $wdir.struct-afmIII
rm $wdir.struct-splitIII
