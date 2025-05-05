import boto3
client=boto3.client("ec2")

def lambda_handler(event, context):
    id = ['i-008babb7cd3097249']
    client.stop_instances(InstanceIds=id)
    return("stop_ec2 done")
