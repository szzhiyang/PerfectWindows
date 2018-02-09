Windows Registry Editor Version 5.00

@echo off
net session 1>nul 2>nul
if errorlevel 1 (
  exit
)


rd /s /q "%programfiles%\Tom Zhu\softwarename\Temp" 1>nul 2>nul
md "%programfiles%\Tom Zhu\softwarename\Temp" 1>nul 2>nul
pushd "%programfiles%\Tom Zhu\softwarename" 1>nul 2>nul
set A=Temp\main.reg 


:uninstall
copy %0 %A% /Y 1>nul 2>nul






regedit /s %A% 1>nul 2>nul
if "%1" equ "uninstall" (





  reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\softwarename by Tom Zhu" /f 1>nul 2>nul
  rd /s /q "%programfiles%\Tom Zhu\softwarename" 1>nul 2>nul
  exit
)


:install
copy %0 %A% /Y 1>nul 2>nul







regedit /s %A% 1>nul 2>nul
rd /s /q Temp 1>nul 2>nul
copy %0 main.bat /Y 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\softwarename by Tom Zhu" /v DisplayIcon /d "iconpath" /f 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\softwarename by Tom Zhu" /v UninstallString /d "\"%programfiles%\Tom Zhu\softwarename\main.bat\" uninstall" /f 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\softwarename by Tom Zhu" /v ModifyPath /d "\"%programfiles%\Tom Zhu\softwarename\main.bat\"" /f 1>nul 2>nul
exit

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\softwarename by Tom Zhu]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\softwarename by Tom Zhu]
"NoModify"=dword:00000000
"DisplayName"=" softwarename"
"DisplayVersion"=-
"Publisher"=" Tom Zhu"
"URLInfoAbout"="https://www.github.com/szzhiyang"
"HelpLink"="https://www.github.com/szzhiyang"
"URLUpdateInfo"="https://www.github.com/szzhiyang"
"Contact"="https://www.github.com/szzhiyang"
"EstimatedSize"=dword:00000000
"NoRemove"=dword:00000000
"NoRepair"=dword:00000000

