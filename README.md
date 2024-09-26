# AWSScripts and Environment Setup

<h2>To Change TimeZone to IST:</h2>
>sudo ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

<h2>To Activate virtual environment</h2>
>source /home/ubuntu/env_kite/bin/activate
<br>
(Assuming env_kite is the virtual environment created under ubuntu folder)

<h2>Crontab command to invoke the script from the virtual environment</h2>
>source /home/ubuntu/env_kite/bin/activate && cd /home/ubuntu/env_kite && python scripts/kite_options_sell.py

<h1>Helper Scripts for AWS Platform:<h1>
<h2>To Start and Stop AWS instance automatically:</h2>

<b>aws_lambda_function_start.py:</b> 
  This is the AWS lambda function script which starts a specific was instance that is mentioned in the code. You need to create AWS Rules (Eventbridge) and call these functions from there on a specific schedule.

<b>aws_lambda_function_stop.py:</b> 
  This is the AWS lambda function stops the instance. 

<h2>To Start and Stop AWS instance from local windows:</h2>

<b>Prerequisites:</b>

You would need to install AWS CLI (Command Line Interface) on your windows os from the amazon website https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html

<b>aws_start_instance.bat :</b>
  This is windows batch script to start the aws instance from windows command line, get the IP Address and update the ssh config file used by visual studio code editor 

<b>aws_stop_instance.bat :</b> 
  This one stops the instance.
