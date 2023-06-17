# Quick reference lookout for working on the University of Pretoria Cluster 
# echoing the current present working dir  
echo $(pwd)
# using the cut on the comma delimiter files the sample data can be found in the main directory named iris
cat iris.csv| cut -f 1 -d "," # you can use any delimited here
# if you want to select from the first column and then select the numbers starting with the specific number or the alphanumeral
cat iris.csv| cut -f 1 -d "," | grep "^4"
# string sort based on the start of the string
cat iris.csv| cut -f 1 -d "," | grep "^Pretoria" 
# alphanumeral sort based on the end of the string
cat iris.csv | cut -f 1 -d "," | grep "7$"
# looking out for the multiple variables at one time 
cat iris.csv | cut -f 1 -d "," | grep "7$" | grep "^4"
# counting the number of the occurences of the specific variables present in the datsets
cat iris.csv | cut -f 1 -d "," | grep "7$" | grep "^4" | wc -l
# checking out the listing of the specific files in the present working directory
for i in $(pwd)/*csv; do echo $i; done
# checking out the listing of all the files in the present working directory
for i in $(pwd)/*; do echo $i; done
# iterative command loops for a dry run simply echoing the command to check how it runs
for i in $(pwd)/*csv; do echo wc -l $i; done # on specific files
for i in $(pwd)/*; do echo wc -l $i; done # one all the files with in the present given directory
# running the iteration on the specific files
for i in $(pwd)/*csv; do wc -l $i; done 
# running the iteration on all the files 
for i in $(pwd)/*; do wc -l $i; done
# printing a quick range for the iterations
for i in {1..10}; do echo $i; done
# extacting all the columns starting with the particular regular expression and sorting it out and counting the unique ones
cat iris.csv | grep "^4" | sort | uniq -c
# exporting the PATH environment 
echo $PATH
# Adding a installed extenal library to your PATH
export PATH="PATH_to_the_installed_library":$PATH
#checking the length variable 
variable=teststring
echo ${#variable}
#cutting the string for the variables
echo ${#variable=-$num} # where num is how much you want to cut the string
# sorting the specific columns based on the import
cat iris.csv | cut -f 1,2 -d "," | sort -k 2,2
# sorting the specific import and then listing the required variable 
cat iris.csv | cut -f 1,2 -d "," | sort -k 2,2 | grep "^4" # list the variable starting with the given value
cat iris.csv | cut -f 1,2 -d "," | sort -k 2,2 | grep "^Pretoria" # list the variable starting with the given string
cat iris.csv | cut -f 1,2 -d "," | sort -k 2,2 | grep "7$" # list the variable ending with the given conditon
