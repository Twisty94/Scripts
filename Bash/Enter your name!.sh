while true
do
echo "enter your name:"
read -r name
    if [[ -z $name ]]
    then
    echo "bye";exit
    else
    echo "enter your age:"
    read -r age
        if [[ $age -eq 0 ]]
        then
        echo "bye";exit
        elif [[ $age -le 16 ]]
        then
             group="child"
             echo "$name, your group is $g"
        elif [[ ($age -ge 17) && ($age -le 25) ]]
        then
             group="youth"
             echo "$name, your group is $g"
         else
                      group="aduld"
             echo "$name, your group is $g"
        fi
    fi
continue
done