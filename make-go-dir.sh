#!/bin/bash
# This is the first script

if [[ ! -z "$1" ]] && [[ ! -z "$2" ]] && [[ -z "$3" ]] && [[ $2 = *".net"* ]]; then
    echo "A directory by the name of $1 will be created"
    read -p 'Do you wish to proceed with this procedure. Enter yes to proceed and no to exit' userinput
    
    while [[ "$userinput" != "yes" ]] && [[ "$userinput" != "no" ]]; do
        echo "$userinput is an invalid input. Please enter yes or no to continue"
        read -p "would you like to proceed?" userinput
    done
	if [[ "$userinput" == "yes" ]]; then
   		echo  "Creating directory structure: "
   		mkdir "$HOME/$1" 
       		mkdir "$HOME/$1/cmd"
   	 	mkdir "$HOME/$1/cmd/api"
   	 	mkdir "$HOME/$1/internals"
   	 	mkdir "$HOME/$1/migrations"
   	 	mkdir "$HOME/$1/remote"
   	 	touch "$HOME/$1/cmd/api/main.go"
   	 	touch "$HOME/$1/Makefile"
   	 	echo 'package main
import "fmt"
func main() {
fmt.Println("Hello world!") 
}'>"$HOME/$1/cmd/api/main.go"
        cd "$HOME/$1"
        go mod init "$1.$2"
        echo "I have created a *main.go* file for you to test this directory that was created"
        echo "Type *go run ./cmd/api* at the root directory to test this file"
        echo "Thank you"
    elif [[ "$userinput" == "no" ]]; then
        echo "aborting the operation. Thank you for using this script" 
    fi
else
    echo "You need to provide 2 arguments to the command line for this script to work" 
    echo "Usage: make-go-dir <root directory name> <identifier name>"
    echo "Ensure that the identifier name ends with a .net"
fi
