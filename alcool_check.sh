read -p "Are you 21 or over? y/n: " Answer
case "$Answer" in
 [yY]|[yY][eE][sS])
   echo "you can have a beer :)"
   ;;
 [nN]|[nN][oO])
  echo "sorry, can't drink beer"
   ;;
 *)
  echo "please enter y/yes or n/no"
esac