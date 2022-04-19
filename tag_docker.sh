cd /var/lib/jenkins/workspace/clone_repo
docker images
v=$(docker images | grep first-web | awk '{print $2}' | head -n 1)
echo $v
a="$(echo $v | cut -d. -f1)"
b="$(echo $v | cut -d. -f2)"

if [ -n $v ]
then
   if [ $b -lt 10 ]
   then
      b=$(( $b + 1 ))
      numb=$a.$b
   else
    a=$(( $a + 1 ))
    b=0
    numb=$a.$b
   fi
else
   numb=2.0
fi
docker build . -t tcjoel/first-web:$numb
echo $numb > numb.txt
pwd