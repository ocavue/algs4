set -e

# tail -f /dev/null

file=$1 # Hello.java
base=$(basename $file .java) # Hello
echo $file

echo ">>>>>>>>>>    Compiling   <<<<<<<<<<"
javac-algs4 $file

echo ">>>>>>>>>>    Executing   <<<<<<<<<<"
java-algs4 $base

echo ">>>>>>>>>>   Finding bug  <<<<<<<<<<"
findbugs-algs4 $file 
pmd-algs4 $file 

echo ">>>>>>>>>> Checking style <<<<<<<<<<"
checkstyle-algs4 $file 


