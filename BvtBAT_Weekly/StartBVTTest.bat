@echo
echo Start BVT Automation Test
call "C:\ProjectTools\BvtBAT_Weekly\ApiBvtTest.bat"
echo BVT Automation Test Completely

echo Srart TestResult zip 
call "C:\ProjectTools\zip.bat" c:\result_bvt.zip c:\result_bvt
echo TestResult zip Completely

echo Start Send Email
call "C:\ProjectTools\BvtBAT_Weekly\BVTSendMail\SendAutoAPITestResults.exe"
echo Send Email Completly