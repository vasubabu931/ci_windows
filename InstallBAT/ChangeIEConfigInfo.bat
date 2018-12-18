@echo off
set serverIP=%1
set DBIP=%2
set DBPort=%3
set ESPort=%4

cd C:\Install\IE
set a=""
for /f "tokens=1 delims=:" %%i in ('findstr /n "MongoDbServer1" setup.iss') do (
set a=%%i
)
echo %a%
set "n=%a%"
set "fn=setup.iss"
(for /f "tokens=1* delims=:" %%i in ('findstr/n .* "%fn%"')do (
    if %%i equ %n% (
   setlocal enabledelayedexpansion     
   echo/MongoDbServer1=%DBIP%:%DBPort%
   endlocal)else echo/%%j
))>temp.txt
move temp.txt "%fn%">nul

cd C:\Install\IE
set a=""
for /f "tokens=1 delims=:" %%i in ('findstr /n "SearchServer1" setup.iss') do (
set a=%%i
)
echo %a%
set "n=%a%"
set "fn=setup.iss"
(for /f "tokens=1* delims=:" %%i in ('findstr/n .* "%fn%"')do (
    if %%i equ %n% (
   setlocal enabledelayedexpansion     
   echo/SearchServer1=%DBIP%:%ESPort%
   endlocal)else echo/%%j
))>temp.txt
move temp.txt "%fn%">nul

cd C:\Install\IE
set a=""
for /f "tokens=1 delims=:" %%i in ('findstr /n "RedisServer" setup.iss') do (
set a=%%i
)
echo %a%
set "n=%a%"
set "fn=setup.iss"
(for /f "tokens=1* delims=:" %%i in ('findstr/n .* "%fn%"')do (
    if %%i equ %n% (
   setlocal enabledelayedexpansion     
   echo/RedisServer=%ServerIP%
   endlocal)else echo/%%j
))>temp.txt
move temp.txt "%fn%">nul

cd C:\Install\IE
set a=""
for /f "tokens=1 delims=:" %%i in ('findstr /n "RabbitMqServer1" setup.iss') do (
set a=%%i
)
echo %a%
set "n=%a%"
set "fn=setup.iss"
(for /f "tokens=1* delims=:" %%i in ('findstr/n .* "%fn%"')do (
    if %%i equ %n% (
   setlocal enabledelayedexpansion     
   echo/RabbitMqServer1=%ServerIP%
   endlocal)else echo/%%j
))>temp.txt
move temp.txt "%fn%">nul




