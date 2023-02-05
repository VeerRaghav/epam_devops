fun(){
	return 10
}

fun

ret=$?

echo 'Return value is '$ret

a= `expr 5 + $ret`


echo $a
