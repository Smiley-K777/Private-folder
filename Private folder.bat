@ECHO OFF
title Folder Private
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
if NOT EXIST Private goto MDLOCKER
:LOCK
ren Private "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo Folder locked
goto End
:UNLOCK
echo please enter your password to unlock the folder
set/p "pass=>"
if NOT %pass%== Password123 goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" Private
goto End
:FAIL
cls
ECHO.
echo Invalid password.
ECHO.
echo To keep my stuff private I have decided to SHUT THE COMPUTER DOWN, or you can try again.
echo.
echo Want to give it another try ???(Y/N)
timeout /t 10
set/p "cho=>"
if %cho%==Y goto UNLOCK
if %cho%==y goto UNLOCK
if not %cho%==Y goto SHUTDOWN
if not %cho%==y goto SHUTDOWN
:MDLOCKER
md Private
echo Private created successfully
goto End
:SHUTDOWN
Shutdown.exe -s -t 10
cls
msg * Due to Unaothorized Entry this PC will be Shut Down.
:End

