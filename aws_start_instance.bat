
@ECHO OFF

rem Please ensure to use your AWS VM userid and password values
rem This script has been build and tested in win 7 only
rem aws ec2 describe-instance-status --instance-ids i-0c29ba5dc04fa6a35


SET myCMD1=aws ec2 describe-instances --query "Reservations[*].Instances[*].[State.Code]" --output text
FOR /F "tokens=*" %%g IN ('%myCMD1%') do (SET VAR1=%%g)

rem echo myCMD1=%myCMD1%

echo State=%VAR1%


SET myCMD2=aws ec2 start-instances --instance-ids i-0c29ba5dc04fa6a35
rem echo myCMD2=%myCMD2%

IF NOT "%VAR1%"=="16" (
echo Starting AWS Instance...
rem echo myCMD2=%myCMD2%
FOR /F "tokens=*" %%g IN ('%myCMD2%') do (SET VAR2=%%g)
echo VAR2=%VAR2%
set flag=1
)


SET myCMD1=aws ec2 describe-instance-status --query "InstanceStatuses[0].InstanceStatus.Details[0].Status" 

:loop
echo Checking AWS Instance status...
rem echo Runnig cmd %myCMD1%
FOR /F "tokens=*" %%g IN ('%myCMD1%') do (SET VAR1=%%g)
echo Status=%VAR1%
IF NOT %VAR1%=="passed" (
timeout /T 10 /NOBREAK
goto :loop
)

echo AWS instance should be running and reachable


echo Getting AWS IP Address...

SET myCMD=aws ec2 describe-instances --query "Reservations[*].Instances[*].[PublicIpAddress]" --output text

REM echo %myCMD%


FOR /F "tokens=*" %%g IN ('%myCMD%') do (SET VAR=%%g)

echo Public IP = %VAR%

rem Start code block For Windows RDP
set mysrvid=Administrator

set mysrvpswd=YourPassword

rem echo %mysrvpswd%

cmdkey /generic:%VAR% /user:%mysrvid% /pass:%mysrvpswd%

mstsc.exe /v:%VAR%

cmdkey /delete:%VAR%

rem End code block For Windows RDP


rem for setting the config file host and ip to connect to linux using visual studio code
( 
echo Host ubuntu 
echo HostName %VAR% 
echo User ubuntu 
echo IdentityFile C:\Users\RajeshSivadasan\.ssh\ubuntu.pem 
echo[ 
)> C:\Users\RajeshSivadasan\.ssh\config 
echo Config file updated with IP address 
REM in case of multiple hosts use the below (for 3 hosts) for merging into one
REM type C:\Users\Admin\.ssh\config1 > C:\Users\Admin\.ssh\config 
REM type C:\Users\Admin\.ssh\config2 >> C:\Users\Admin\.ssh\config 
REM type C:\Users\Admin\.ssh\config3 >> C:\Users\Admin\.ssh\config 
echo merged config files 
PAUSE REM "D:\Program Files\Microsoft VS Code\Code.exe"

rem exit
