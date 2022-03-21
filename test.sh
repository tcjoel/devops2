echo "what is the region of your bucket?"
read b
case "b" in [])
  b=us-east-1
esac
echo "the region of your bucket is $b"