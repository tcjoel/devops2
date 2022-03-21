### This script is to delete the bucket

echo "what is the bucket that you want to delete?"
read a
echo "you want to delete the bucket $a"
sleep 3

echo "now let's check if we can delete the bucket named $a :)"

BUCKET_EXISTS=$(aws s3api head-bucket --bucket $a 2>&1 || true)
if [ -z "$BUCKET_EXISTS" ]; then
  echo "Your bucket exist, we will delete it"
  aws s3api delete-bucket --bucket $a  --region us-east-1
else
  echo "Your bucket don't exist, /
  look at your spelling,
  we will display your different bucket name/
  and let's try one more time"
  
  sleep 5
  aws s3 ls

  sleep 5
  bash delete_repo.sh
fi
