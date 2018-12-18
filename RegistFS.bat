@echo off

cd C:\Program Files\NetBrain\Front Server\bin
FrontServer.exe -regist

sc stop NetBrainFrontServer

SET SLEEP=ping 127.0.0.1 -n
%SLEEP% 60 > nul

sc start NetBrainFrontServer

SET SLEEP=ping 127.0.0.1 -n
%SLEEP% 20 > nul

SC QUERY NetBrainFrontServer > null
IF ERRORLEVEL 1060  (
    echo NetBrainFrontServer services not exits
    echo NetBrainFrontServer services not exits >> c:\\build_version.txt
) else (
    for /f "skip=3 tokens=4" %%i in ('sc query NetBrainFrontServer') do set "zt=%%i" &goto :f
    :f
    if /i "%zt%" EQU "RUNNING" (
    echo NetBrainFrontServer services running   
) else (
    echo NetBrainFrontServer services not running 
    echo NetBrainFrontServer services not running >> c:\\build_version.txt
  )
)
