@echo off

rem Set Proxy
set proxy="HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" 
reg add %proxy% /v "ProxyEnable" /t REG_DWORD /d 0 /f>nul 
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /f /v AutoConfigURL

start /MAX "" "C:\Program Files (x86)\Microsoft Office\Office15\EXCEL.EXE"
set isWeb=1
if "%1" equ "" (
	set isWeb=0
)
start "" curl "http://f2etest.xxxx.com/applog?userid=%USERNAME%&appid=excel&isweb=%isWeb%"