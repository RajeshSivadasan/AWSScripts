@ECHO OFF

REM Script to stop instance

SET myCMD1=aws ec2 describe-instances --query "Reservations[*].Instances[*].[State.Code]" --output text
FOR /F "tokens=*" %%g IN ('%myCMD1%') do (SET VAR1=%%g)

echo State=%VAR1%

REM aws ec2 stop-instances --instance-ids i-1234567890abcdef0


IF NOT "%VAR1%"=="80" (
echo Stopping aws instance...
SET myCMD2=aws ec2 stop-instances --instance-ids i-0c29ba5dc04fa6a35
rem echo myCMD2=%myCMD2%
FOR /F "tokens=*" %%g IN ('%myCMD2%') do (SET VAR2=%%g)
rem echo VAR2=%VAR2%
)

:loop
rem echo in loop
FOR /F "tokens=*" %%g IN ('%myCMD1%') do (SET VAR1=%%g)
echo State=%VAR1%
IF NOT "%VAR1%"=="80" (
timeout /T 10 /NOBREAK
goto :loop
)

echo aws instance should be stopped by now
