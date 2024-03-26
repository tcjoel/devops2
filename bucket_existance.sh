S3_BUCKET=j-first-bucket
BUCKET_EXISTS=$(aws s3api head-bucket --bucket j-second-bucket-pub 2>&1 || true)
if [ -z "$BUCKET_EXISTS" ]; then
  echo "Bucket exists"
else
  echo "Bucket does not exist"
fi
