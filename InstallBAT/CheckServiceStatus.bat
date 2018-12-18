@echo off
SC QUERY RabbitMQ > null
IF ERRORLEVEL 1060  (
    echo RabbitMQ services not exits
    echo RabbitMQ services not exits >> c:\\build_version.txt    
) else (
    for /f "skip=3 tokens=4" %%i in ('sc query RabbitMQ') do set "zt=%%i" &goto :a
    :a
    if /i "%zt%" EQU "RUNNING" (
      echo RabbitMQ services running 
    ) else (
      echo RabbitMQ services not running
      echo RabbitMQ services not running >> c:\\build_version.txt
   )
)


SC QUERY RedisMaster > null
IF ERRORLEVEL 1060  (
    echo RedisMaster services not exits
    echo RedisMaster services not exits >> c:\\build_version.txt
) else (
    for /f "skip=3 tokens=4" %%i in ('sc query RedisMaster') do set "zt=%%i" &goto :b
    :b
    if /i "%zt%" EQU "RUNNING" (
    echo RedisMaster services running    
) else (
    echo RedisMaster services not running 
    echo RedisMaster services not running >> c:\\build_version.txt
  )
)



SC QUERY NetBrainFrontServerController > null
IF ERRORLEVEL 1060  (
    echo NetBrainFrontServerController services not exits
    echo NetBrainFrontServerController services not exits >> c:\\build_version.txt
) else (
    for /f "skip=3 tokens=4" %%i in ('sc query NetBrainFrontServerController') do set "zt=%%i" &goto :d
    :d
    if /i "%zt%" EQU "RUNNING" (
    echo NetBrainFrontServerController services running    
) else (
    echo NetBrainFrontServerController services not running 
    echo NetBrainFrontServerController services not running >> c:\\build_version.txt
  )
)


SC QUERY NetBrainTaskEngine > null
IF ERRORLEVEL 1060  (
    echo NetBrainTaskEngine services not exits
    echo NetBrainTaskEngine services not exits >> c:\\build_version.txt
) else (
    for /f "skip=3 tokens=4" %%i in ('sc query NetBrainTaskEngine') do set "zt=%%i" &goto :e
    :e
    if /i "%zt%" EQU "RUNNING" (
    echo NetBrainTaskEngine services running    
) else (
    echo NetBrainTaskEngine services not running 
    echo NetBrainTaskEngine services not running >> c:\\build_version.txt
  )
)

SC QUERY NetBrainWorkerServer> null
IF ERRORLEVEL 1060  (
    echo NetBrainWorkerServer services not exits
    echo NetBrainWorkerServer services not exits >> c:\\build_version.txt
) else (
    for /f "skip=3 tokens=4" %%i in ('sc query NetBrainWorkerServer') do set "zt=%%i" &goto :f
    :f
    if /i "%zt%" EQU "RUNNING" (
    echo NetBrainWorkServer services running    
) else (
    echo NetBrainWorkServer services not running 
    echo NetBrainWorkServer services not running >> c:\\build_version.txt
  )
)


SC QUERY NetBrainAgent > null
IF ERRORLEVEL 1060  (
    echo NetBrainAgent services not exits
    echo NetBrainAgent services not exits >> c:\\build_version.txt
) else (
    for /f "skip=3 tokens=4" %%i in ('sc query NetBrainAgent') do set "zt=%%i" &goto :g
    :g
    if /i "%zt%" EQU "RUNNING" (
    echo NetBrainAgent services running    
) else (
    echo NetBrainAgent services not running 
    echo NetBrainAgent services not running >> c:\\build_version.txt
  )
)



