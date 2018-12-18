@echo
set ServerIP=%1
set DBIP=%2
set DBPort=%3
set ESPort=%4
set pyargv=%5

echo update setup.iss mongoIP ,search server ,monitor services
call "C:\ProjectTools\InstallBAT\ChangeIEConfigInfo.bat" %ServerIP% %DBIP% %DBPort% %ESPort%
call "C:\ProjectTools\InstallBAT\ChangeServiceMonitorConfigInfo.bat" %ServerIP%

echo update setup.iss info
call "C:\ProjectTools\InstallBAT\UpdateIESetupConfigInfo.bat" 

echo run python script to update all the config
python C:\ProjectTools\InstallBAT\configUpadte.py %pyargv%

cd c:\Install\IE
pushd c:\Install\IE
IntegratedEdition.exe /s    
popd
echo IE Successfully

call "C:\ProjectTools\InstallBAT\license_config.bat"
echo input license                                                   