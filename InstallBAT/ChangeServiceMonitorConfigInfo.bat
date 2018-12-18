@echo off
set DBIP=%1

cd C:\Install\MONITOR
set a=""
for /f "tokens=1 delims=:" %%i in ('findstr /n "szEdit1" setup.iss') do (
set a=%%i
)
echo %a%
set "n=%a%"
set "fn=setup.iss"
(for /f "tokens=1* delims=:" %%i in ('findstr/n .* "%fn%"')do (
    if %%i equ %n% (
   setlocal enabledelayedexpansion     
   echo/szEdit1=https://%DBIP%/ServicesAPI
   endlocal)else echo/%%j
))>temp.txt
move temp.txt "%fn%">nul