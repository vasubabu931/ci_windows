@echo
echo begain to install build
set ServerIP=%1
set DBIP=%2
set PCName=%3
set DBPort=%4
set ESPort=%5
set pyargv=%6

echo change IE,MOGNODB,REDIS,MQ FE ISS FILE 
call "C:\ProjectTools\InstallBAT\ChangeIEConfigInfo.bat" %ServerIP% %DBIP% %DBPort% %ESPort%
call "C:\ProjectTools\InstallBAT\ChangeFEConfigInfo.bat" %ServerIP% %DBIP% %DBPort% %PCName%
call "C:\ProjectTools\InstallBAT\ChangeFSCConfigInfo.bat" %ServerIP% %DBIP% %DBPort% 
call "C:\ProjectTools\InstallBAT\ChangeServiceMonitorConfigInfo.bat" %ServerIP%

echo run python script to update all the config
python C:\ProjectTools\InstallBAT\configUpadte.py %pyargv%

call "C:\ProjectTools\InstallBAT\InstallBuild.bat" 
echo install build successfully

echo check services install status
call "C:\ProjectTools\InstallBAT\CheckServiceStatus.bat"

call "C:\ProjectTools\InstallBAT\license_config.bat"
echo input license

call "C:\ProjectTools\InstallBAT\UpdatePasswordEncryption.bat"
echo change PasswordEncryption false

call "C:\ProjectTools\InstallBAT\restart_W3.bat"
echo restart w3 server successfully