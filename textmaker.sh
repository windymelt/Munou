#!/bin/sh
mecab -Owakati $1 | sed -e 's/\(.*\)/(\1)/g'> _marcov
