import boto3
from datetime import date

def lambda_handler(event, context):
    client=boto3.client("ec2")

    #Need yearly update
    nse_holidays=["2025-03-31","2025-04-10","2025-04-14","2025-04-18","2025-05-01"]

    strMsg="start_ec2 done"

    if date.today().isoformat() in nse_holidays:
        strMsg="NSE Holiday today. start_ec2 not done"
    else:
        id = ['i-008babb7cd3097249'] 
        client.start_instances(InstanceIds=id)

    return(strMsg)
