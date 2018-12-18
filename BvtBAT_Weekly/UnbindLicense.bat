@echo 
echo Start Soap UI Testing

cd C:\Program Files\SmartBear\ReadyAPI-2.2.0\bin
testrunner.bat "C:\Jenkins\workspace\WeeklyNG70APIBVTTest\NBTestAPIProject\NG71-BVT-soapui-project-Weekly.xml" -s "NG71 UNBIND TestSuite" -r -j -f "c:\result" -o -I -E 10.10.7.209
echo Finished Soap UI NG71-BVT-soapui-project-Weekly.xml Testing


