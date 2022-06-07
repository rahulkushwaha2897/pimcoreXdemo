curInstanceId=`wget -q -O - http://169.254.169.254/latest/meta-data/instance-id`
availabilityZone=`wget -q -O - http://169.254.169.254/latest/meta-data/placement/availability-zone`
region=`echo $availabilityZone | rev | cut -c 2- | rev`

autoscalingGrp=`aws autoscaling describe-tags  --region us-east-1 --output text |grep "guardian-stage" |awk '{print $4}' |tail -1`
autoscalingInstanceId=`/usr/bin/aws autoscaling describe-auto-scaling-groups --auto-scaling-group-names $autoscalingGrp --query 'AutoScalingGroups[].Instances[].InstanceId' --output text --region $region | awk '{print $1}'`

if [ $curInstanceId == $autoscalingInstanceId ]; then
   cd /var/www/html && sudo -u webapp bin/console grd:api-scheduler
fi