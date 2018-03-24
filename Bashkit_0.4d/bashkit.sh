#!/bin/bash

# Bash Kit - TUI script for Bash.
# By Ludovic Tual - Dec@2017
# ludovic.tual@gmail.com

# +--------------------------------------+
# | variables & fonctions natives.       |
# +--------------------------------------+

## SIZE SSH WINDOWS.
printf '\e[8;50;75t'
printf '\e[3;0;0t'

## VERSION BASHKIT.
version="v0.4d RC1"

## GET ENV INFOS.
user_bashkit=$(whoami)
env_bashkit=$(pwd)

# affichage banniere.
bann ()
{
echo ""
cat modules/ascii_loadme/ascii_ban
echo "  "$version
}


# +--------------------------------------+
# | appels aux fichiers modules & vars.  |
# +--------------------------------------+

# Chargement automatique des nouveaux modules.
for foldername in $(ls modules | grep "_loadme")
do
	ls modules/$foldername > tmp_runtime/files_list
	for file2load in $(cat tmp_runtime/files_list)
		do
			. modules/$foldername/$file2load
		done
done

# . core_func/*
# . ascii_forms/*
# . menu_a/*
# . menu_b/*

# +-------------------------------------+
# | nettoyage de l'environnement exec.  |
# +-------------------------------------+

rm -f tmp_runtime/*

# +-------------------------------------+
# | demarre Bashkit.  		        |
# +-------------------------------------+

menu_a
