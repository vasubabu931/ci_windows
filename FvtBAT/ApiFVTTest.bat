cd C:\Program Files\SmartBear\SoapUI-Pro-5.1.2\bin
testrunner.bat "C:\Jenkins\workspace\DailyNG70APIBVTTest\NBTestAPIProject\NG70-FVT-soapui-project.xml" -s "NG70 FVT TestSuite" -r -j -f "c:\result_fvt" -o -I -E 10.10.7.206
echo Finished Soap UI NG70-FVT-soapui-project.xml Testing