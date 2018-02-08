Windows Registry Editor Version 5.00

@echo off
set A=%systemroot%\PerfectWindows\PowerKeys.reg
net session 1>nul 2>nul
if errorlevel 1 (
  exit
) else (
  goto main 
)

:main
md "%systemroot%\PerfectWindows" 1>nul 2>nul
copy %0 %A% /Y 1>nul 2>nul
regedit /s %A% 1>nul 2>nul
exit

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ZZY Power Keys]

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]
"Scancode Map"=hex:00,00,00,00,00,00,00,00,07,00,00,00,2e,e0,51,e0,30,e0,49,e0,10,e0,47,e0,19,e0,4f,e0,22,e0,52,e0,21,e0,46,00,00,00,00,00

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ZZY Power Keys]
"UninstallString"="cmd.exe /s /c del %systemroot%\\PerfectWindows\\PowerKeys.reg&&REG DELETE \"HKLM\\SYSTEM\\CurrentControlSet\\Control\\Keyboard Layout\" /v \"Scancode Map\" /f &&REG DELETE \"HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\ZZY Power Keys\" /f"
"ModifyPath"="cmd.exe /s /c regedit /s %systemroot%\\PerfectWindows\\PowerKeys.reg"
"NoModify"=dword:00000000
"DisplayName"=" Power Keys"
"DisplayVersion"=-
"Publisher"=" ZZY"
"URLInfoAbout"="https://www.github.com/szzhiyang"
"HelpLink"="https://www.github.com/szzhiyang"
"URLUpdateInfo"="https://www.github.com/szzhiyang"
"Contact"="https://www.github.com/szzhiyang"
"EstimatedSize"=dword:00000000
"NoRemove"=dword:00000000
"NoRepair"=dword:00000000
"DisplayIcon"=hex(2):25,00,73,00,79,00,73,00,74,00,65,00,6d,00,72,00,6f,00,6f,\
  00,74,00,25,00,5c,00,73,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,\
  73,00,65,00,74,00,75,00,70,00,61,00,70,00,69,00,2e,00,64,00,6c,00,6c,00,2c,\
  00,2d,00,33,00,00,00