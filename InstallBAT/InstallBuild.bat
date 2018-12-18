@echo
SET SLEEP=ping 127.0.0.1 -n
%SLEEP% 20 > nul 
echo begian to install Rabbitmq
cd C:\Install\RABBITMQ
pushd C:\Install\RABBITMQ
rabbitmq-server-windows-3.7.7.exe /s	
popd										
echo Install RABBITMQ Successfully


echo begian to install REDIS
cd c:\Install\REDIS
pushd c:\Install\REDIS
redis-windows-3.0.504.exe /s    
popd
echo Install REDIS Successfully


echo begian to install IE
cd c:\Install\IE
pushd c:\Install\IE
netbrain-ie-windows-x86_64.exe /s    
popd
echo IE Successfully


echo begian to install FE
cd c:\Install\FE
pushd c:\Install\FE
netbrain-taskengine-windows-x86_64.exe /s    
popd
echo Install FE Successfully

echo begian to install FS
cd c:\Install\FS
pushd c:\Install\FS
netbrain-frontserver-windows-x86_64.exe /s    
popd
echo Install FS Successfully

echo begian to install FSC
cd c:\Install\FSC
pushd c:\Install\FSC
netbrain-frontservercontroller-windows-x86_64.exe /s    
popd
echo Install FSC Successfully

echo begain to install MONITOR
cd c:\Install\MONITOR
pushd c:\Install\MONITOR
netbrain-servicemonitoragent-windows-x86_64.exe /s    
popd
echo Install MONITOR Successfully


                                                              