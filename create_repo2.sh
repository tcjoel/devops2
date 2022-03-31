#!/bin/bash

# This script to create the S3 bucket with few conditions 

echo " enter a s3_bucket_name that follow those 3 policies: "
sleep 3
echo -e "\n"
echo " 1- Bucket names must be between 3 (min) and 63 (max) characters long."
echo " 2- Bucket names can consist only of lowercase letters, numbers, dots (.), and hyphens (-)."
echo " 3- Bucket names must begin and end with a letter or number"
sleep 3
echo " enter a s3_bucket_name:"
read name
var=$name-$RANDOM

echo " now let's create s3 bucket named $name"

#### check if this bucket already exist or created 

BUCKET_EXISTS=$(aws s3api head-bucket --bucket $name 2>&1 || true)
if [ -z "$BUCKET_EXISTS" ]; then 
  echo "This bucket exist already "
  create_repo2.sh
else 
   aws s3api create-bucket --bucket $name
   echo "bucket creation"  
   BUCKET_EXISTS=$(aws s3api head-bucket --bucket $name 2>&1 || true)
   if [ -z "$BUCKET_EXISTS" ]; then
     echo "your bucket is successfully created"
   else 
     echo "your bucket isn't successfully created because you didn't follow the above policies "
     sleep 3
     echo "let's try to create the bucket again"
     create_repo2.sh
   fi 
fi 