import boto3
from datetime import date

client=boto3.client("ec2")

#Need yearly update
nse_holidays=["2021-05-13","2021-06-20","2021-08-19","2021-09-10","2021-10-15","2021-11-04","2021-11-19"]

def start_ec2(event, context):
    strMsg="start_ec2 done"
    if date.today().isoformat() in nse_holidays:
        strMsg="NSE Holiday today. start_ec2 not done"
    else:
        id = ['<instance id>']
        #client.start_instances(InstanceIds=id)

    return(strMsg)