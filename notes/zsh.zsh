#!/bin/zsh

set -e      # abort on error
set -u      # abort on use of undefined variable
# set -x    # debug flag

echo ""
echo "-----------------------------------------------------------------------------"
origPath=${path}
echo ""
echo "  original path  = [ ${path} ]"
echo "  original PATH  = [ ${PATH} ]"
path=( /usr/local/bin  /usr/bin  /bin )
echo ""
echo "  modified path  = [ ${path} ]"
echo "  modified PATH  = [ ${PATH} ]"
path=( $origPath )
echo ""
echo "restoring path   = [ ${path} ]"
echo "restoring PATH   = [ ${PATH} ]"

path=( . ~/bin )
path=( $path /usr/local/opt  /opt/bin )
path=( $path /usr/local/bin  /usr/bin  /bin )
path=( $path /usr/local/sbin /usr/sbin /sbin )

echo ""
echo "-----------------------------------------------------------------------------"
echo "Alias:"
alias sampleAlias="echo 'Any command will work, just avoid any spaces at the = sign!!!' "
sampleAlias

echo ""
echo "-----------------------------------------------------------------------------"
echo "local variables:"
myStr1="Again, no spaces are allowed at the equals sign!"
myStr2="Using curly braces is usually optional, but often clearest."
echo "myStr1=$myStr1"
echo "myStr1=${myStr1}"

echo ""
echo "-----------------------------------------------------------------------------"
echo "Environment variables: Set & export a var"
export XYZ="my-xyz-value"
echo -n "result:  "
env | grep XYZ
echo "UnSet the var to 'delete' it"
unset XYZ
echo -n "result:  "
env | grep XYZ

echo ""
echo "-----------------------------------------------------------------------------"
echo "If statement:"
if [[ $(uname -a) == *Linux* ]]; then
  echo "Linux: found"
else
  echo "Linux: not found"
fi

if true; then   # bash: /bin/true & /bin/false;   zsh: shell built-in's
  echo "yes"    # this will print
else
  echo "no"
fi


echo ""
echo "-----------------------------------------------------------------------------"
echo "Calling: uname --all"
uname --all
echo ""
echo "Calling: lsb_release --all"
lsb_release --all

echo ""
echo "-----------------------------------------------------------------------------"
echo "For statement:"
for it in Hi Hello "How are you?" ; do
  echo "${it}"
done

echo ""
echo "-----------------------------------------------------------------------------"
echo "loops:"
for ((ii=0; i<5; i++)); do
  echo "C-style i: " $i
done
echo ""
echo "-----------------------------------------------------------------------------"
echo "seq function:"
for i in $(seq 1 5); do 
  echo "i: " $i
done

echo ""
echo "-----------------------------------------------------------------------------"
echo "arithmetic:"
myVal=6
((myVal = $myVal * 7))
echo "((   6 * 7 )) = " ${myVal}
myDouble=0.6
((myDouble = $myDouble * 7))
echo "(( 0.6 * 7 )) = " ${myDouble}

testFn () {
  echo "number of args=$#"
  echo "arg 1='$1'"
  echo "arg 2='$2'"
  echo "arg 3='$3'"
  echo "arg 4='$4'"
  echo "arg 5='$5'"
}
echo ""
echo "-----------------------------------------------------------------------------"
echo "calling testFn() as: 'tstFn a b c' "
testFn a b c

