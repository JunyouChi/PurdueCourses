#! /bin/bash
#
#   $Author: ee364d08 $
#   $Date: 2015-09-29 15:28:23 -0400 (Tue, 29 Sep 2015) $
#   $HeadURL: svn+ssh://ece364sv@ecegrid-thin1/home/ecegrid/a/ece364sv/svn/F15/students/ee364d08/Lab05/benchmarks.bash $
#   $Revision: 82247 $

printf "Enter the array size(s): "
read s
printf "Enter the algorithm(s) to run: "
read a
alg=($a)
size=($s)
let i=0
while ((i < ${#a[*]}))
do
    sorting ${size[$i]} ${alg[$i]} > $1
    let i=i+1
done



