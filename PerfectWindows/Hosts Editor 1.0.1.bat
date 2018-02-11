Windows Registry Editor Version 5.00

@echo off
net session>nul&&(goto main)
start "" mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0","","runas",1)(window.close)&&exit

:main
if "%~n0" equ "hosts" goto edit

rd /s /q "%programfiles%\Tom Zhu\Hosts Editor\Temp" 1>nul 2>nul
md "%programfiles%\Tom Zhu\Hosts Editor\Temp" 1>nul 2>nul
pushd "%programfiles%\Tom Zhu\Hosts Editor" 1>nul 2>nul
set A=Temp\main.reg 


:uninstall
copy %0 %A% /Y 1>nul 2>nul

del %systemroot%\hosts.bat /F 1>nul 2>nul

regedit /s %A% 1>nul 2>nul
if "%1" equ "uninstall" (





  reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hosts Editor by Tom Zhu" /f 1>nul 2>nul
  rd /s /q "%programfiles%\Tom Zhu\Hosts Editor" 1>nul 2>nul
  exit
)


:install
copy %0 %A% /Y 1>nul 2>nul
copy %0 %systemroot%\hosts.bat /Y 1>nul 2>nul
regedit /s %A% 1>nul 2>nul
rd /s /q Temp 1>nul 2>nul
copy %0 main.bat /Y 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hosts Editor by Tom Zhu" /v DisplayIcon /d "%systemroot%\notepad.exe" /f 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hosts Editor by Tom Zhu" /v UninstallString /d "\"%programfiles%\Tom Zhu\Hosts Editor\main.bat\" uninstall" /f 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hosts Editor by Tom Zhu" /v ModifyPath /d "\"%programfiles%\Tom Zhu\Hosts Editor\main.bat\"" /f 1>nul 2>nul
exit

:edit
title  
color fc
mode con cols=30 lines=1
notepad %systemroot%\system32\drivers\etc\hosts
ipconfig /flushdns 1>nul 2>nul
exit

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hosts Editor by Tom Zhu]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hosts Editor by Tom Zhu]
"NoModify"=dword:00000000
"DisplayName"=" Hosts Editor"
"DisplayVersion"=" 1.0.1"
"Publisher"=" Tom Zhu"
"URLInfoAbout"="https://www.github.com/szzhiyang/PerfectWindows"
"HelpLink"="https://www.github.com/szzhiyang/PerfectWindows"
"URLUpdateInfo"="https://www.github.com/szzhiyang/PerfectWindows"
"Contact"="https://www.github.com/szzhiyang/PerfectWindows"
"EstimatedSize"=dword:00000003
"NoRemove"=dword:00000000
"NoRepair"=dword:00000000






