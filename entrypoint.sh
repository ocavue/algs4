sex -ex

file=$1

print "Compiling"
javac-algs4 $file

print "Executing"
java-algs4 $file

print "Finding bug"
findbugs-algs4 $file 
pmd-algs4 $file 

print "Checking style"
checkstyle-algs4 $file 


