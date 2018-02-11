Windows Registry Editor Version 5.00

@echo off
net session>nul&&(goto main)
start "" mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0","","runas",1)(window.close)&&exit

:main


rd /s /q "%programfiles%\Tom Zhu\Power Keys\Temp" 1>nul 2>nul
md "%programfiles%\Tom Zhu\Power Keys\Temp" 1>nul 2>nul
pushd "%programfiles%\Tom Zhu\Power Keys" 1>nul 2>nul
set A=Temp\main.reg 


:uninstall
copy %0 %A% /Y 1>nul 2>nul

echo [-HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]>>%A%

regedit /s %A% 1>nul 2>nul
if "%1" equ "uninstall" (





  reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Power Keys by Tom Zhu" /f 1>nul 2>nul
  rd /s /q "%programfiles%\Tom Zhu\Power Keys" 1>nul 2>nul
  exit
)


:install
copy %0 %A% /Y 1>nul 2>nul
regedit /s %A% 1>nul 2>nul

rd /s /q Temp 1>nul 2>nul
copy %0 main.bat /Y 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Power Keys by Tom Zhu" /v DisplayIcon /d "%systemroot%\system32\setupapi.dll,-3" /f 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Power Keys by Tom Zhu" /v UninstallString /d "\"%programfiles%\Tom Zhu\Power Keys\main.bat\" uninstall" /f 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Power Keys by Tom Zhu" /v ModifyPath /d "\"%programfiles%\Tom Zhu\Power Keys\main.bat\"" /f 1>nul 2>nul
exit

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Power Keys by Tom Zhu]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Power Keys by Tom Zhu]
"NoModify"=dword:00000000
"DisplayName"=" Power Keys"
"DisplayVersion"=" 1.0.0"
"Publisher"=" Tom Zhu"
"URLInfoAbout"="https://www.github.com/szzhiyang/PerfectWindows"
"HelpLink"="https://www.github.com/szzhiyang/PerfectWindows"
"URLUpdateInfo"="https://www.github.com/szzhiyang/PerfectWindows"
"Contact"="https://www.github.com/szzhiyang/PerfectWindows"
"EstimatedSize"=dword:00000003
"NoRemove"=dword:00000000
"NoRepair"=dword:00000000



[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]
"Scancode Map"=hex:00,00,00,00,00,00,00,00,07,00,00,00,2e,e0,51,e0,30,e0,49,e0,10,e0,47,e0,19,e0,4f,e0,22,e0,52,e0,21,e0,46,00,00,00,00,00


