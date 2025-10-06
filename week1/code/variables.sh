#!/bin/sh

##Illustrates the use of variables

# Special variables

echo "This script was called with $# paramters"
echo "The script's name is $0"
echo "The arguments are $@"
echo "The first arguement is $1"
echo "The second argument is $2"

# Assinged Variables; Explicit declaration:
MY_VAR='some string'
echo 'the current value of the variables is:' $MY_VAR
echo
echo 'Please enter a new string'
read MY_VAR
echo
echo 'the current value of the variable is:' $MY_VAR
echo

## Assinged Variables; Reading (multiple values) from user inputs:
echo 'Enter two numbers separates by space(s)'
read a b
echo 'you entered' $a 'and' $b '; Their sum is:'

## Assinged Variables: Command substitution
MY_SUM=$(expr $a + $b)
echo $MY_SUM