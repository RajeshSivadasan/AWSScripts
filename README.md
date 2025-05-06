# AWSScripts and Environment Setup
<h2>Step 1. Create an ubuntu instance in EC2</h2>

<h2>Step 2: Change TimeZone to IST (For India users):</h2>
>timedatectl
<br>>sudo ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
<h2>Step 3: Update ubuntu package:</h2>
>sudo apt update
<h2>Step 4: Check python version:</h2>
>python3 --version

<h2>Install virtual environment package if needed</h2>
>sudo apt install python3.12-venv

<h2>To Create virtual environment env_ab</h2>
>python -m venv /home/ubuntu/env_ab

<h2>To Activate virtual environment</h2> (Assuming env_ab is the virtual environment created under ubuntu folder)
>source /home/ubuntu/env_ab/bin/activate
<br>

Install the below modules: <br>
>pip install pya3<br>
>pip install Crypto<br>
>pip install pycryptodome<br>
>pip install pyotp<br>

<h2>Crontab command to invoke the script from the virtual environment</h2>
Use below command to activate the crontab editor
<br>>crontab -e
<br>Append the line below in the editor. This runs the script everyday at 9.15 AM
<br>15 9 * * * /bin/bash -c 'cd /home/ubuntu/env_ab && source /home/ubuntu/env_ab/bin/activate &&  python3 scripts/ab_options_sell.py >> /home/ubuntu/job_log 2>&1'
<br>Press Ctrl+x to exit and Enter key to save before exit

<h1>Helper Scripts for AWS Platform:<h1>
<h2>To Start and Stop AWS instance automatically:</h2>

In the AWS Console, go to Lambda Service and create the below 2 functions:

<b>aws_lambda_function_start.py:</b> 
  This is the AWS lambda function script which starts a specific was instance that is mentioned in the code. You need to create AWS Rules (Eventbridge) and call these functions from there on a specific schedule.

<b>aws_lambda_function_stop.py:</b> 
  This is the AWS lambda function stops the instance. 

<b>
To Schedule the above 2 lambda functions, got to Schedules (Inside Scheduler) under the AWS Eventbridge service and create 2 schedules as below:
</b>


1. Start (This will trigger the start lambda function as per the given schedule)<br>
Schedule pattern = Recurring schedule<br>
Schedule type = Cron-based schedule<br>
Cron expression = Paste the below corn expression<br> 
5 9 ? * 2-6 *

2. Stop (This will trigger the stop lambda function as per the given schedule)<br>
Schedule pattern = Recurring schedule<br>
Schedule type = Cron-based schedule<br>
Cron expression = Paste the below corn expression<br> 
40 15 ? * 2-6 *

<h2>To Start and Stop AWS instance from local windows:</h2>

<b>Prerequisites:</b>

You would need to install AWS CLI (Command Line Interface) on your windows os from the amazon website https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html

<b>aws_start_instance.bat :</b>
  This is windows batch script to start the aws instance from windows command line, get the IP Address and update the ssh config file used by visual studio code editor 

<b>aws_stop_instance.bat :</b> 
  This one stops the instance.
