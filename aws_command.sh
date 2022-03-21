## some commande to describe your aws environemnt

echo "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
echo "Let's see your different S3 buckets"
sleep 3
aws s3 ls

echo "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU"
echo "Let's see your different aim users"
sleep 3
aws iam list-users

echo "VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV"
echo "Let's see your different volumes"
sleep 3
aws ec2 describe-volumes

echo "KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK"
echo "Let's see your different key-pairs"
sleep 3
aws ec2 describe-key-pairs
