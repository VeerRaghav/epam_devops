fun_odd(){
a=`expr $1 % 2`

if [ $a == 0 ]
then
	echo "even "
else
	echo "odd"
fi
}
fun_odd 9

