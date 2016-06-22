#!/bin/bash

# Força o reinicio do processo caja 
# Versão 1: Inclui os usos de parâmetros para mostrar versão e  ajuda
#
# Autor: tiago.moreno01@fatec.sp.gov.br

MENSAGEM_AJUDA="
Uso: $(basename "$0") [OPÇÕES ]
Reinicia todos os processos \"Caja\"
		-H, --help, --ajuda 	Mostra essa tela de ajuda e sai
		-V, --version, --versao  Mostra a versão do programa e sai
"
# Tratamento das opções que podem ser enviadas na linha de comando
while test -n "$1"
do
	case "$1" in
		-H | --help | --ajuda)  
			echo "$MENSAGEM_AJUDA"  
			exit 0 
		;;
		
		-V | --version | versao) 	
			echo  $(basename "$0")  "Versão 1"
			
			exit 0 	
		;; 

		*)
		
			if test -n "$1"
			then
				echo Opção Invalida: $1
				exit 1
			fi
		;;	
	esac
	
	shift
done

killall -HUP caja
