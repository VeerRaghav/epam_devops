fun2(){
echo $1
echo 'Length of arguments'$#
echo 'all arguments:'$@
echo 'second one :'$@|cut -d ' ' -f4
}
fun2 l1 l2 l3 l4 l5 l6
