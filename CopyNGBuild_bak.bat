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
)else (
net use X: %BuildBasePath% netbrain/user:netbrain
cd /d X:\

set /a count=0
for /l %%a in (1,1,60) do (
for /f "delims=" %%i in ('dir /b /ad /od') do (set "var=%%i" ) 
set NewestBuildFolder=%BuildBasePath%\!var!
echo !NewestBuildFolder!

set build_dir=!NewestBuildFolder!\!SpecialBuildBasePath!\IE\setup.exe
for /f %%i in ('dir /s /b !build_dir!') do (
set str_data=%%~ti
set fileTime=!str_data!
)
set date1=!fileTime:~0,10!
set date1_utx=!date1:-=!
echo !date1_utx!
echo !fileTime!

set date2=!date:~0,10!
set date2_utx=!date2:-=!
echo !date2_utx!
echo !date2! !time!


if !date1_utx! EQU !date2_utx! (
echo !NewestBuildFolder!\!SpecialBuildBasePath! >> C:\build_version.txt
if not exist "c:\Install" mkdir "c:\Install"
xcopy /s /q !NewestBuildFolder!\!SpecialBuildBasePath! c:\Install
echo Copy today Build Finished
exit
)else (
echo no latest build 
%SLEEP% 60 > nul
set /a count+=1
echo !count!

if '!count!'=='60' (
echo !NewestBuildFolder!\!SpecialBuildBasePath! >> C:\build_version.txt
if not exist "c:\Install" mkdir "c:\Install"
xcopy /s /q !NewestBuildFolder!\!SpecialBuildBasePath! c:\Install
exit
)
)
)
)
