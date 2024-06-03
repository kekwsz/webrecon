#!/bin/bash
if [ "$1" == "" ] || [ "$2" == "" ]
then
	echo "----------------------------------------"
	echo "-------MODO DE USO: WEBRECON------------"
	echo "-----./webrecon.sh site.com php---------"
	echo "------------By: kekw--------------------"
	echo "----------------------------------------"
else
for palavra in $(cat wordlist.txt)
do
	resposta1=$(curl -s -o /dev/null -w "%{http_code}" $1/$palavra/)
	resposta2=$(curl -s -o /dev/null -w "%{http_code}" $1/$palavra.$2)
if [ $resposta1 == "200" ]
then
	echo "Diretorio encontrado: $1/$palavra"
fi
if [ $resposta2 == "200" ]
then
	echo "Arquivo encontrado: $1/$palavra.$2"
fi
done
fi
