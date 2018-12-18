@echo off
cd C:\Program Files\NetBrain\Web Server\nb_publish_server\Conf
set line=2
set file=licenseManager.ini

setlocal enabledelayedexpansion
set l=1
for /f "delims=" %%a in ('type "%file%"') do (
if !l!==%line% echo Server=10.10.10.40>>"new_%file%"
if !l!==%line% echo TrialServer=10.10.10.40 >>"new_%file%"
if !l!==%line% echo SSL=0 >>"new_%file%"

echo %%~a>>"new_%file%"
set /a l+=1
)
move "new_%file%" "%file%">nul


