

func1(){
for i in $*
do
if [ -f $i ]
then
        echo "$i is a file"
elif [ -d $i ]
then 
        echo $i" is a directory"
else
        echo $i" is not a file nor directory "
fi
done
}
file_count(){
echo `wc -w $1`
func3 $1
}

