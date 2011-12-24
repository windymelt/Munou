#!/bin/sh
echo "(define *ORIGINAL* '(" >_markov
mecab -Owakati $1 | sed -e 's/[ \t]$//g;/^$/d;s/^\(.*\)$/(\1)/g' >> _markov
echo "))" >> _markov
