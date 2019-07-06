sex -ex

echo "entrypoint"
file=$1

echo "Compiling"
javac-algs4 $file

echo "Executing"
java-algs4 $file

echo "Finding bug"
findbugs-algs4 $file 
pmd-algs4 $file 

echo "Checking style"
checkstyle-algs4 $file 


