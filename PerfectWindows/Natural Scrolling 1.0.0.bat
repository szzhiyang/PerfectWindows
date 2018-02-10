Windows Registry Editor Version 5.00

@echo off
net session 1>nul 2>nul
if errorlevel 1 (
  exit
)


rd /s /q "%programfiles%\Tom Zhu\Natural Scrolling\Temp" 1>nul 2>nul
md "%programfiles%\Tom Zhu\Natural Scrolling\Temp" 1>nul 2>nul
pushd "%programfiles%\Tom Zhu\Natural Scrolling" 1>nul 2>nul
set A=Temp\main.reg 


:uninstall
copy %0 %A% /Y 1>nul 2>nul

reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\HID /s >Temp\Reverse.txt
findstr Parameter Temp\Reverse.txt > Temp\find.txt


for /f "tokens=* delims= " %%i in (Temp\find.txt) do (
echo [%%i] >>%A%
echo "FlipFlopWheel"=dword:00000000>>%A%
echo. >>%A%
)




regedit /s %A% 1>nul 2>nul
if "%1" equ "uninstall" (





  reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Natural Scrolling by Tom Zhu" /f 1>nul 2>nul
  rd /s /q "%programfiles%\Tom Zhu\Natural Scrolling" 1>nul 2>nul
  exit
)


:install
copy %0 %A% /Y 1>nul 2>nul

reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\HID /s >Temp\Reverse.txt
findstr Parameter Temp\Reverse.txt > Temp\find.txt


for /f "tokens=* delims= " %%i in (Temp\find.txt) do (
echo [%%i] >>%A%
echo "FlipFlopWheel"=dword:00000001>>%A%
echo. >>%A%
)





regedit /s %A% 1>nul 2>nul
rd /s /q Temp 1>nul 2>nul
copy %0 main.bat /Y 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Natural Scrolling by Tom Zhu" /v DisplayIcon /d "%systemroot%\system32\setupapi.dll,-2" /f 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Natural Scrolling by Tom Zhu" /v UninstallString /d "\"%programfiles%\Tom Zhu\Natural Scrolling\main.bat\" uninstall" /f 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Natural Scrolling by Tom Zhu" /v ModifyPath /d "\"%programfiles%\Tom Zhu\Natural Scrolling\main.bat\"" /f 1>nul 2>nul
exit

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Natural Scrolling by Tom Zhu]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Natural Scrolling by Tom Zhu]
"NoModify"=dword:00000000
"DisplayName"=" Natural Scrolling"
"DisplayVersion"=" 1.0.0"
"Publisher"=" Tom Zhu"
"URLInfoAbout"="https://www.github.com/szzhiyang/PerfectWindows"
"HelpLink"="https://www.github.com/szzhiyang/PerfectWindows"
"URLUpdateInfo"="https://www.github.com/szzhiyang/PerfectWindows"
"Contact"="https://www.github.com/szzhiyang/PerfectWindows"
"EstimatedSize"=dword:00000003
"NoRemove"=dword:00000000
"NoRepair"=dword:00000000



