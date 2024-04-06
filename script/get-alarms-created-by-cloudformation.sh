# Get a list of CloudWatch alarms
alarms=$(aws cloudwatch describe-alarms --query "MetricAlarms[*].[AlarmName, AlarmArn]" --output text)
# aws cloudformation describe-stack-resources --stack-name <your-stack-name> | jq -r '.StackResources[] | select(.ResourceType == "AWS::CloudWatch::Alarm") | .PhysicalResourceId'

# Iterate through each alarm
for alarm in $alarms; do
    alarm_name=$(echo $alarm | cut -f1)
    alarm_arn=$(echo $alarm | cut -f2)

    # Extract the CloudFormation stack name from the alarm's configuration
    stack_name=$(aws cloudwatch describe-alarm --alarm-name $alarm_name --query "MetricAlarms[*].AlarmActions[0]" --output text | grep -oP '(?<=StackName=).*')

    # Check if the CloudFormation stack exists
    if aws cloudformation describe-stacks --stack-name $stack_name &>/dev/null; then
        # Check if the CloudFormation stack created the alarm
        if aws cloudformation describe-stack-resources --stack-name $stack_name --query "StackResources[?ResourceName=='$alarm_name']" &>/dev/null; then
            echo "Alarm '$alarm_name' is created by CloudFormation stack '$stack_name'."
        fi
    fi
done
