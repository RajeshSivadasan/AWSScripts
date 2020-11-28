
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

set mysrvid=Administrator

set mysrvpswd=YourPassword

rem echo %mysrvpswd%

cmdkey /generic:%VAR% /user:%mysrvid% /pass:%mysrvpswd%

mstsc.exe /v:%VAR%

cmdkey /delete:%VAR%

rem exit
