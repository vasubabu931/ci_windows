@echo 
echo Start Soap UI Testing
cd C:\Program Files\SmartBear\ReadyAPI-2.2.0\bin
testrunner.bat "C:\Jenkins\workspace\DailyNG70APIBVTTest\NBTestAPIProject\V7.1a\NG71A-BVT-soapui-project.xml" -s "NG71a BVT TestSuite" -r -j -f "c:\result_bvt" -o -I -E 10.10.7.206
echo Finished Soap UI NG71-BVT-soapui-project.xml Testing


