@echo off
setlocal enabledelayedexpansion
SET SLEEP=ping 127.0.0.1 -n
set BuildBasePath=%1
set SpecialBuildBasePath=%2
set fileTime=""

net use * /del /y

if %BuildBasePath% == -s (

net use X: %SpecialBuildBasePath% netbrain/user:netbrain
cd /d X:\
echo  %SpecialBuildBasePath%
echo %SpecialBuildBasePath% >> C:\build_version.txt
if not exist "c:\Install" mkdir "c:\Install"
xcopy /s /q %SpecialBuildBasePath% c:\Install
)

if %BuildBasePath% == -d (
set typepath=%3
net use X: %SpecialBuildBasePath% netbrain/user:netbrain
cd /d X:\

set /a count=0
for /l %%a in (1,1,60) do (
for /f "delims=" %%i in ('dir /b /ad /od') do (set "var=%%i" ) 
set NewestBuildFolder=%SpecialBuildBasePath%\!var!
echo !NewestBuildFolder!

set build_dir=!NewestBuildFolder!\!typepath!\IE\setup.exe
for /f %%i in ('dir /s /b !build_dir!') do (
set str_data=%%~ti
set fileTime=!str_data!
)
set date1=!fileTime:~0,10!
REM set date1_utx=!date1:-=!
echo !fileTime!
echo !date1!
REM echo !date1_utx!

REM set date2=!date:~0,10!
REM set date2_utx=!date2:-=!
REM echo !date2!
REM echo !date2_utx!
echo !date!

echo !date!|findstr !date1! >nul
if %errorlevel% equ 0 (
echo !NewestBuildFolder!\!typepath! >> C:\build_version.txt
if not exist "c:\Install" mkdir "c:\Install"
xcopy /s /q !NewestBuildFolder!\!typepath! c:\Install
echo Copy today Build Finished
exit
)else (
echo hava no today's latest build 
%SLEEP% 60 > nul
set /a count+=1
echo !count!

if '!count!'=='60' (
echo have no build today
)
)
)
)

if %BuildBasePath% == -l (
set typepath=%3
net use X: %SpecialBuildBasePath% netbrain/user:netbrain
cd /d X:\

for /f "delims=" %%i in ('dir /b /ad /od') do (set "var=%%i" ) 
set NewestBuildFolder=%SpecialBuildBasePath%\!var!
echo !NewestBuildFolder!\!typepath!
echo !NewestBuildFolder!\!typepath! >> C:\build_version.txt
if not exist "c:\Install" mkdir "c:\Install"
xcopy /s /q !NewestBuildFolder!\!typepath! c:\Install
echo Copy latest Build Finished
)
