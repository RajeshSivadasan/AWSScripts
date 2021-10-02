import boto3
client=boto3.client("ec2")

def stop_ec2(event, context):
    id = ['<instance id>']
    client.stop_instances(InstanceIds=id)
    return("stop_ec2 done")