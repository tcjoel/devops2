num=$(cat /var/lib/jenkins/workspace/clone_repo/numb.txt) 
docker login -u tcjoel -p $dockerhub_pw
echo $num
docker push tcjoel/first-web:$num