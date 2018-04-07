#!/bin/bash

clear
trazo=( $(cat $1 | tr -d '\r' | tr -d  '\n' | tr -d '\t' | tr -d ' ' | grep -o "<path[^<>]*/>") )
#echo ${#array[@]} # numero de elementos en array

if [ -f nodes.cpp ]; then
	rm nodes.cpp
fi

gcc nodes.c -o nodes.exe

for i in ${trazo[@]}; do
	firstNodes=( $(echo $i | grep -o "[^i]d=\"[^=]*\"" | tr -d 'd=' | tr -d '"' | grep -o "M[0-9]*\.*[0-9]*,[0-9]*\.*[0-9]*" | tr -d 'M' | tr ',' '\n') )
	#echo ${#firstNodes[@]}
	#echo ${firstNodes[@]}
	otherNodes=( $(echo $i | grep -o "[^i]d=\"[^=]*\"" | tr -d 'd=' | tr -d '"' | grep -o "c[-]\{0,1\}[0-9]*\.*[0-9]*[,-][0-9]*\.*[0-9]*[,-][0-9]*\.*[0-9]*[,-][0-9]*\.*[0-9]*[,-][0-9]*\.*[0-9]*[,-][0-9]*\.*[0-9]*" | tr -d 'c' | tr ',' ' ' | sed 's/-/ -/g' | sed 's/^ //g' | cut -d' ' -f5,6 | tr ' ' '\n' ) )
	#echo ${#otherNodes[@]}
	#echo ${otherNodes[@]}
	#echo ${firstNodes[@]} ${otherNodes[@]}
	#./a.out ${firstNodes[@]} ${otherNodes[@]}
   echo float $(echo $i | grep -o "id=\"[^=]*\"" | cut -d= -f2 | tr -d '"') "[]" = "{" $(./nodes.exe ${firstNodes[@]} ${otherNodes[@]}) "} ;" >> nodes.cpp
done
cat nodes.cpp