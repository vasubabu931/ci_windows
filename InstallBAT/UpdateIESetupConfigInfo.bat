@echo off
cd C:\Install\IE
set a=""
for /f "tokens=1 delims=:" %%i in ('findstr /n "Component-count" setup.iss') do (
set a=%%i
)
echo %a%
set "n=%a%"
set "fn=setup.iss"
(for /f "tokens=1* delims=:" %%i in ('findstr/n .* "%fn%"')do (
    if %%i equ %n% (
   setlocal enabledelayedexpansion
   echo/Component-count=3
   endlocal)else echo/%%j
))>temp.txt
move temp.txt "%fn%">nul

set a=""
for /f "tokens=1 delims=:" %%i in ('findstr /n "Component-1" setup.iss') do (
set a=%%i
)
echo %a%
set "n=%a%"
set "fn=setup.iss"
(for /f "tokens=1* delims=:" %%i in ('findstr/n .* "%fn%"')do (
    if %%i equ %n% (
   setlocal enabledelayedexpansion
   echo/Component-1=WebAPIService
   endlocal)else echo/%%j
))>temp.txt
move temp.txt "%fn%">nul

set a=""
for /f "tokens=1 delims=:" %%i in ('findstr /n "Component-2" setup.iss') do (
set a=%%i
)
echo %a%
set "n=%a%"
set "fn=setup.iss"
(for /f "tokens=1* delims=:" %%i in ('findstr/n .* "%fn%"')do (
    if %%i equ %n% (
   setlocal enabledelayedexpansion
   echo/Component-2=WebServer
   endlocal)else echo/%%j
))>temp.txt
move temp.txt "%fn%">nul


set a=""
for /f "tokens=1 delims=:" %%i in ('findstr /n "Component-3" setup.iss') do (
set a=%%i
)
echo %a%
set "n=%a%"
set "fn=setup.iss"
(for /f "tokens=1* delims=:" %%i in ('findstr/n .* "%fn%"')do (
    if %%i equ %n% (
   setlocal enabledelayedexpansion
   echo/
   endlocal)else echo/%%j
))>temp.txt
move temp.txt "%fn%">nul