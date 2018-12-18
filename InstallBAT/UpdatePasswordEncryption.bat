@echo off
cd C:\Program Files\NetBrain\Web Server\nb_publish_server
set a=""
for /f "tokens=1 delims=:" %%i in ('findstr /n "EnablePasswordEncryption" Web.config') do (
set a=%%i
)
echo %a%
set "n=%a%"
set "fn=Web.config"
(for /f "tokens=1* delims=:" %%i in ('findstr/n .* "%fn%"')do (
    if %%i equ %n% (
   setlocal enabledelayedexpansion
   echo/    ^<add key="EnablePasswordEncryption" value="false" /^>
   endlocal)else echo/%%j
))>temp.txt
move temp.txt "%fn%">nul
