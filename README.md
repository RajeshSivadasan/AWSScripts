# AWS/Oracle Ubuntu Scripts and Environment Setup
<h2>Step 1. Create an ubuntu instance in EC2/Oracle Cloud</h2>

<h2>Step 2: Change TimeZone to IST (For India users):</h2>
>timedatectl
<br>>sudo ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
<h2>Step 3: Update ubuntu package:</h2>
>sudo apt update
<h2>Step 4: Check python version:</h2>
>python3 --version

<h2>Step 5: Install crontab in ubuntu:</h2>
>sudo apt install cron

<h2>Step 6: Install virtual environment package if needed</h2>
>sudo apt install python3.12-venv

<h2>Step 7: To Create virtual environment env_ab</h2>
>python3 -m venv /home/ubuntu/env_ab

<h2>Step 8: To Activate virtual environment</h2> (Assuming env_ab is the virtual environment created under ubuntu folder)<br>
>source /home/ubuntu/env_ab/bin/activate
<br>To deactivate or come out of the virtual environment
>deactivate
<br>
<h2>Step 9: Install the below required modules: </h2>
>pip install pya3<br>
>pip install Crypto<br>
>pip install pycryptodome<br>
>pip install pyotp<br>

<h2>Step 10: Setup Crontab command to invoke the script from the virtual environment</h2>
Use below command to activate the crontab editor
<br>>crontab -e
<br>Append the line below in the editor. This runs the script everyday at 9.14 AM
<br>14 9 * * * /bin/bash -c 'cd /home/ubuntu/env_ab && source /home/ubuntu/env_ab/bin/activate &&  python3 scripts/ab_options_sell.py >> /home/ubuntu/job_log 2>&1'
<br>Press Ctrl+x to exit and Enter key to save before exit

<h2>Step 11: To copy file from github to the ubuntu instance</h2>
<br>You can get the raw file url by clicking the Raw option after opening a file in github inbuilt editor, top right.
<br>>wget https://raw.githubusercontent.com/RajeshSivadasan/alice-blue-option-selling/refs/heads/main/ab_options_sell.py  

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


1. Start (This will trigger the start lambda function as per the given schedule which is 9:05 AM on weekdays)<br>
Schedule pattern = Recurring schedule<br>
Schedule type = Cron-based schedule<br>
Cron expression = Paste the below corn expression<br> 
5 9 ? * 2-6 *

2. Stop (This will trigger the stop lambda function as per the given schedule 3:40 PM on weekdays)<br>
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
