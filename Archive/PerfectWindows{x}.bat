Windows Registry Editor Version 5.00



! ! ! PLEASE DO NOT MODIFY THIS BATCH FILE UNLESS YOU KNOW WHAT YOU ARE DOING ! ! !



@echo off
chcp 437 1>nul 2>nul
title  
color fc
mode con cols=30 lines=3
pushd "%~dp0"
md "%systemroot%\checkadmin" 1>nul 2>nul
if exist "%systemroot%\checkadmin" (
rd /s /q "%systemroot%\checkadmin" 1>nul 2>nul
goto main) else (
exit
)


:main
chcp 437 1>nul 2>nul
title  
color fc
mode con cols=30 lines=3
echo.
echo PLESAE WAIT !


icacls "%WINDIR%\System32\UsoClient.exe" /reset 1>nul 2>nul


icacls "%WINDIR%\System32\at.exe" /reset 1>nul 2>nul


icacls "%WINDIR%\System32\schtasks.exe" /reset 1>nul 2>nul


icacls "%WINDIR%\System32\dfrgui.exe" /reset 1>nul 2>nul


icacls "%WINDIR%\System32\UserAccountControlSettings.exe" /reset 1>nul 2>nul


icacls "%WINDIR%\System32\regini.exe" /reset 1>nul 2>nul


set P=%systemroot%\PerfectWindowsZZY
set T=%systemroot%\PerfectWindowsTemp
set LM=HKEY_LOCAL_MACHINE
set CU=HKEY_CURRENT_USER
set A=%P%\Core.reg
set B=%P%\ClearSoftwareRestrictionPolicies.reg
set C=%systemroot%\besafe.bat
set D=%systemroot%\beindanger.bat
set E=%systemroot%\beperfect.bat
set F=%systemroot%\trustedapps.bat
set DNS=%systemroot%\PerfectWindowsDNS


rd /s /q "%T%" 1>nul 2>nul
rd /s /q "%P%" 1>nul 2>nul
rd /s /q "%DNS%" 1>nul 2>nul



md "%T%" 1>nul 2>nul
md "%P%" 1>nul 2>nul
md "%DNS%" 1>nul 2>nul


POWERCFG /HIBERNATE /SIZE 75 1>nul 2>nul
POWERCFG /HIBERNATE /TYPE FULL 1>nul 2>nul


attrib -h -s "%systemroot%" 1>nul 2>nul
attrib -h -s "%ProgramFiles%" 1>nul 2>nul
attrib -h -s "%ProgramFiles(x86)%" 1>nul 2>nul
attrib -h -s "%ProgramData%" 1>nul 2>nul
attrib -h -s "%systemdrive%\Users" 1>nul 2>nul
attrib -h -s "%systemdrive%\PerfLogs" 1>nul 2>nul
attrib -h -s "%systemdrive%\Windows.old" 1>nul 2>nul
attrib -h -s "%userprofile%\ntuser.dat" 1>nul 2>nul
attrib -h -s "%userprofile%\ntuser.ini" 1>nul 2>nul
attrib -h -s "%userprofile%\AppData" 1>nul 2>nul
attrib -h -s "%LocalAppData%" 1>nul 2>nul
attrib -h -s "%systemdrive%\PerfectWindows" 1>nul 2>nul
attrib -h -s "%LocalAppData%\Packages" 1>nul 2>nul
attrib -h -s "%AppData%" 1>nul 2>nul
attrib -h -s "%userprofile%\AppData\LocalLow" 1>nul 2>nul


rd /s /q "%T%" 1>nul 2>nul
md "%T%" 1>nul 2>nul
rd /s /q "%tmp%" 1>nul 2>nul
ipconfig /flushdns 1>nul 2>nul
md "%tmp%" 1>nul 2>nul
attrib -h -s "%tmp%" 1>nul 2>nul

attrib -h -s "%B%" 1>nul 2>nul
del "%B%" 1>nul 2>nul

attrib -h -s "%C%" 1>nul 2>nul
del "%C%" 1>nul 2>nul

attrib -h -s "%D%" 1>nul 2>nul
del "%D%" 1>nul 2>nul

attrib -h -s "%E%" 1>nul 2>nul
del "%E%" 1>nul 2>nul

attrib -h -s "%F%" 1>nul 2>nul
del "%F%" 1>nul 2>nul

copy "%~0" /Y %A% 1>nul 2>nul
echo.>>%A%
echo.>>%A%

:applyreg
taskkill /f /im explorer.exe 1>nul 2>nul
echo.>>%A%
attrib -h -s "%A%" 1>nul 2>nul
reg import %A% /reg:32 1>nul 2>nul
reg import %A% /reg:32 1>nul 2>nul
regedit /s %A%  1>nul 2>nul
regedit /s %A%  1>nul 2>nul


:restart
rd /s /q "%T%" 1>nul 2>nul
rd /s /q "%P%" 1>nul 2>nul
shutdown /r /o /f /t 0 1>nul 2>nul
shutdown /r /f /t 0 1>nul 2>nul
exit




[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]
"Scancode Map"=-

[-HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies]

[-HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services]
@="DO NOT DELETE THIS KEY !"

[-HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft]

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer]
"EnableAutoTray"=dword:00000000
"ShowFrequent"=dword:00000000
"ShowRecent"=dword:00000000
"ShowDriveLettersFirst"=dword:00000000
"ShellState"=-
"IconUnderline"=dword:00000001

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
"SeparateProcess"=dword:00000001
"ShowTypeOverlay"=dword:00000001
"DontUsePowerShellOnWinX"=dword:00000001
"ShowTaskViewButton"=dword:00000000
"Hidden"=dword:00000002
"ShowSuperHidden"=dword:00000000
"ShowEncryptCompressedColor"=dword:00000001
"HideFileExt"=dword:00000001
"ExtendedUIHoverTime"=-

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run]
"ctfmon"=hex(2):25,00,73,00,79,00,73,00,74,00,65,00,6d,00,72,00,6f,00,6f,00,74,\
  00,25,00,5c,00,73,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,63,00,\
  74,00,66,00,6d,00,6f,00,6e,00,2e,00,65,00,78,00,65,00,00,00


[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run]
"ctfmon"=hex(2):25,00,73,00,79,00,73,00,74,00,65,00,6d,00,72,00,6f,00,6f,00,74,\
  00,25,00,5c,00,73,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,63,00,\
  74,00,66,00,6d,00,6f,00,6e,00,2e,00,65,00,78,00,65,00,00,00


