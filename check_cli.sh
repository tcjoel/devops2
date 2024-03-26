if ! grep default_output_region ~/.aws/config; 
then
   echo "Your default outpout and region were found"
    if ! grep aws_keys_id ~/.aws/credentials;
    then
        echo "Your aws access and secret access keys were found"
    fi    
else
    echo " You need to install your aws_cli on your local"
fi
