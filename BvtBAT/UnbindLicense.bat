@echo 
echo Start Soap UI Testing

cd C:\Program Files\SmartBear\ReadyAPI-2.2.0\bin
testrunner.bat "C:\Jenkins\workspace\DailyNG70APIBVTTest\NBTestAPIProject\NG70-BVT-soapui-project.xml" -s "NG70 UNBIND TestSuite" -r -j -f "c:\result" -o -I -E 10.10.7.206
echo Finished Soap UI NG70-BVT-soapui-project.xml Testing


