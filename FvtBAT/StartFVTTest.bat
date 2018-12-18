@echo
echo Start FVT Automation Test
call "C:\ProjectTools\FvtBAT\ApiFVTTest.bat"
echo FVT Automation Test Completely

echo Start FVT TestResult zip
call "C:\ProjectTools\zip.bat" c:\result_fvt.zip c:\result_fvt
echo FVT TestResult zip Completely

echo Start FVT test result Email send
call "C:\ProjectTools\FvtBAT\FVTSendMail\SendAutoAPITestResults.exe"
echo FVT test result Email send completely
