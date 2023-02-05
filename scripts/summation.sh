res=0
sum(){
for i in $*
do
	res=`expr $res + $i`
done
avg=`expr $res / $#`
echo "The average is :"$avg
return $res
}
sum 5 6 3 4
b=$?
a=4
echo "The sum is :"$b



