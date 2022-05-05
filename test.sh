v="2:12:midi"
h=$(echo $v | sed -e 's/:/<>/g')
a=$(echo $v | cut -d: -f1)
c=$(echo $v | cut -d: -f3)
echo $v
echo $a
echo $c
echo $h