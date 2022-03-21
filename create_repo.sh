### This script will create a bucket base on 3 different input that you will provide

echo "what is you country"
read a
echo "your country is $a"
sleep 2

echo "what is your first name"
read b
echo "your first name is $b"
sleep 2

echo "what is your favorite fruit"
read c
echo "your favorite fruit is $c"
sleep 2

echo "now will creat for your a bucket named $a-$b-$c"
var=$a-$b-$c

### check if this bucket allready exist or if it is successfully created

BUCKET_EXISTS=$(aws s3api head-bucket --bucket $var 2>&1 || true)
if [ -z "$BUCKET_EXISTS" ]; then
  echo "This bucket exist already, you need to change at least one of your input in order to create a new bucket"
  sleep 4
  bash create_repo.sh
else
   aws s3 mb s3://$var
   echo "please give us 5 seconds to create your s3 bucket"
   sleep 5
   BUCKET_EXISTS=$(aws s3api head-bucket --bucket $var 2>&1 || true)

   if [ -z "$BUCKET_EXISTS" ]; then
     echo "Your bucket is successfully created"

   else
     echo "Your bucket isn't successfully created, your need to change at least one of your previous input"
  bash create_repo.sh
    fi
fi