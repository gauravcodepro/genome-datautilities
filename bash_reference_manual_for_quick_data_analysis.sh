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

# PBS alloc file 



