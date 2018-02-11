Windows Registry Editor Version 5.00

@echo off
net session>nul&&(goto main)
start "" mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0","","runas",1)(window.close)&&exit

:main


rd /s /q "%programfiles%\Tom Zhu\Anti Cortana\Temp" 1>nul 2>nul
md "%programfiles%\Tom Zhu\Anti Cortana\Temp" 1>nul 2>nul
pushd "%programfiles%\Tom Zhu\Anti Cortana" 1>nul 2>nul
set A=Temp\main.reg 


:uninstall
copy %0 %A% /Y 1>nul 2>nul

echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search]>>%A%
echo "AllowCortana"=->>%A%
echo "AllowCortanaAboveLock"=->>%A%

regedit /s %A% 1>nul 2>nul
if "%1" equ "uninstall" (





  reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Anti Cortana by Tom Zhu" /f 1>nul 2>nul
  rd /s /q "%programfiles%\Tom Zhu\Anti Cortana" 1>nul 2>nul
  exit
)


:install
copy %0 %A% /Y 1>nul 2>nul

regedit /s %A% 1>nul 2>nul
rd /s /q Temp 1>nul 2>nul
copy %0 main.bat /Y 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Anti Cortana by Tom Zhu" /v DisplayIcon /d "%systemroot%\system32\imageres.dll,-98" /f 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Anti Cortana by Tom Zhu" /v UninstallString /d "\"%programfiles%\Tom Zhu\Anti Cortana\main.bat\" uninstall" /f 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Anti Cortana by Tom Zhu" /v ModifyPath /d "\"%programfiles%\Tom Zhu\Anti Cortana\main.bat\"" /f 1>nul 2>nul
exit

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Anti Cortana by Tom Zhu]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Anti Cortana by Tom Zhu]
"NoModify"=dword:00000000
"DisplayName"=" Anti Cortana"
"DisplayVersion"=" 1.0.0"
"Publisher"=" Tom Zhu"
"URLInfoAbout"="https://www.github.com/szzhiyang/PerfectWindows"
"HelpLink"="https://www.github.com/szzhiyang/PerfectWindows"
"URLUpdateInfo"="https://www.github.com/szzhiyang/PerfectWindows"
"Contact"="https://www.github.com/szzhiyang/PerfectWindows"
"EstimatedSize"=dword:00000003
"NoRemove"=dword:00000000
"NoRepair"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search]
"AllowCortana"=dword:00000000
"AllowCortanaAboveLock"=dword:00000000



