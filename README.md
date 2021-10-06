# AWSScripts
Helper Scripts for AWS Platform.

Prerequisites:
You would need to install AWS CLI (Command Line Interface) on your windows os from the amazon website https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html

aws_lambda_function_start.py: 
  This is the AWS lambda function script which starts a specific was instance that is mentioned in the code. You need to create AWS Rules (Eventbridge) and call these functions from there on a specific schedule.

aws_lambda_function_stop.py: 
  This is the AWS lambda function stops the instance. 

aws_start_instance.bat : 
  This is windows batch script to start the aws instnace from windows command line, get the IP Address and update the ssh config file used by visual studio code editor 

aws_stop_instance.bat : 
  This one stops the instance.
