read -p 'Enter an operand: ' inp
read -p "enter another operand :" inp2
func1(){
res=`expr $1 + $2`
return $res
}
func2(){
res=`expr $1 / 2`
echo "Average is :"$res
}
func1 $inp $inp2
func2 $?

