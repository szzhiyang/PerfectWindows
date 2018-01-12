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

net user Administrator /active:no 1>nul 2>nul
net user Guest /active:no 1>nul 2>nul
bcdedit /set {default} bootmenupolicy legacy 1>nul 2>nul


icacls "%WINDIR%\System32\UsoClient.exe" /reset 1>nul 2>nul
takeown /f "%WINDIR%\System32\UsoClient.exe" /a 1>nul 2>nul
icacls "%WINDIR%\System32\UsoClient.exe" /inheritance:r /remove "Administrators" "Authenticated Users" "Users" "System" 1>nul 2>nul


icacls "%WINDIR%\System32\at.exe" /reset 1>nul 2>nul

icacls "%WINDIR%\System32\schtasks.exe" /reset 1>nul 2>nul

icacls "%WINDIR%\System32\dfrgui.exe" /reset 1>nul 2>nul

icacls "%WINDIR%\System32\UserAccountControlSettings.exe" /reset 1>nul 2>nul
takeown /f "%WINDIR%\System32\UserAccountControlSettings.exe" /a 1>nul 2>nul
icacls "%WINDIR%\System32\UserAccountControlSettings.exe" /inheritance:r /remove "Administrators" "Authenticated Users" "Users" "System" 1>nul 2>nul

icacls "%WINDIR%\System32\regini.exe" /reset 1>nul 2>nul
takeown /f "%WINDIR%\System32\regini.exe" /a 1>nul 2>nul
icacls "%WINDIR%\System32\regini.exe" /inheritance:r /remove "Administrators" "Authenticated Users" "Users" "System" 1>nul 2>nul

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


sc pause sysmain 1>nul 2>nul
sc stop sysmain 1>nul 2>nul


rd /s /q %systemroot%\Prefetch 1>nul 2>nul


md "%T%" 1>nul 2>nul
md "%P%" 1>nul 2>nul
md "%DNS%" 1>nul 2>nul


POWERCFG /HIBERNATE /SIZE 75 1>nul 2>nul
POWERCFG /HIBERNATE /TYPE FULL 1>nul 2>nul


attrib +h +s "%systemroot%" 1>nul 2>nul
attrib +h +s "%ProgramFiles%" 1>nul 2>nul
attrib +h +s "%ProgramFiles(x86)%" 1>nul 2>nul
attrib +h +s "%ProgramData%" 1>nul 2>nul
attrib +h +s "%systemdrive%\Users" 1>nul 2>nul
attrib +h +s "%systemdrive%\PerfLogs" 1>nul 2>nul
attrib +h +s "%systemdrive%\Windows.old" 1>nul 2>nul
attrib +h +s "%userprofile%\ntuser.dat" 1>nul 2>nul
attrib +h +s "%userprofile%\ntuser.ini" 1>nul 2>nul
attrib +h +s "%userprofile%\AppData" 1>nul 2>nul
attrib +h +s "%LocalAppData%" 1>nul 2>nul
attrib -h -s "%systemdrive%\PerfectWindows" 1>nul 2>nul
attrib +h +s "%LocalAppData%\Packages" 1>nul 2>nul
attrib +h +s "%AppData%" 1>nul 2>nul
attrib +h +s "%userprofile%\AppData\LocalLow" 1>nul 2>nul



attrib -h -s "%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul
del "%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul


attrib -h -s "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul
del "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul


rd /s /q "%T%" 1>nul 2>nul
md "%T%" 1>nul 2>nul
rd /s /q "%tmp%" 1>nul 2>nul
ipconfig /flushdns 1>nul 2>nul
md "%tmp%" 1>nul 2>nul
attrib +h +s "%tmp%" 1>nul 2>nul

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

copy hos*.txt /Y %systemroot%\system32\drivers\etc\hosts 1>nul 2>nul
echo.>>%systemroot%\system32\drivers\etc\hosts
echo 203.208.51.70 dl.google.com>>%systemroot%\system32\drivers\etc\hosts



copy "%~0" /Y %A% 1>nul 2>nul
echo.>>%A%
echo.>>%A%
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon]>>%A%
echo "Userinit"="%systemdrive%\\WINDOWS\\system32\\userinit.exe,">>%A%
echo.>>%A%
echo.>>%A%

:SoftwareRestrictionPolicies


echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{191cd7fa-f240-4a17-8986-94d480a6c8ca}]>>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"="%systemdrive%\\Windows">>%A%
echo.>>%A%


echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{1333c194-73f8-4766-a6af-e2ad4c391626}]>>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"="%systemdrive%\\Program Files (x86)">>%A%
echo.>>%A%


echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{d2c34ab2-529a-46b2-b293-fc853fce72ea}]>>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"="%systemdrive%\\Program Files">>%A%
echo.>>%A%


echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{4d259436-c0ab-2048-b18d-0225eaa8034c}]>>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"="%systemdrive%\\users\\*\\AppData\\Local\\Microsoft\\OneDrive">>%A%
echo.>>%A%


echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{6d259436-c0ab-4186-b18d-0225eaa8034c}]>>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"="%systemdrive%\\users\\*\\AppData\\Local\\Google">>%A%
echo.>>%A%


echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{1333c194-73f8-8888-a6af-e2ad4c391626}]>>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"="PerfectWindows{*}.bat">>%A%
echo.>>%A%


echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers]>>%A%
echo "DefaultLevel"=dword:00000000>>%A%
echo "PolicyScope"=dword:00000001>>%A%
echo.>>%A%

:ExcludeNeededFunctions

if exist PerfectWindows{*p*}.bat (
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power]>>%A%
echo.>>%A%
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings]>>%A%
echo.>>%A%)

if exist PerfectWindows{*n*}.bat (
echo [-HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications]>>%A%
echo.>>%A%)

if exist PerfectWindows{*u*}.bat (
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization]>>%A%
echo.>>%A%
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]>>%A%
echo "Scancode Map"=->>%A%
echo.>>%A%
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System]>>%A%
echo "DisableLogonBackgroundImage"=dword:00000000>>%A%
echo.>>%A%
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%A%
echo "ExtendedUIHoverTime"=dword:00000001>>%A%
echo.>>%A%)


echo.>>%A%
echo.>>%A%


:devicedisablewake
powercfg /devicequery wake_armed >%T%\powercfg.txt
for /f "tokens=* delims= " %%i in (%T%\powercfg.txt) do powercfg /devicedisablewake "%%i" 1>nul 2>nul
rd /s /q "%T%" 1>nul 2>nul
md "%T%" 1>nul 2>nul



:reversemouse
if exist PerfectWindows{*m*}.bat (
set rev=00000000
) else (
set rev=00000001
)
echo Windows Registry Editor Version 5.00>%T%\Reverse.reg
echo. >>%T%\Reverse.reg
reg query %LM%\SYSTEM\CurrentControlSet\Enum\HID /s >%T%\Reverse.txt
findstr Parameter %T%\Reverse.txt > %T%\find.txt

for /f "tokens=* delims= " %%i in (%T%\find.txt) do (
echo [%%i] >>%T%\Reverse.reg
echo "FlipFlopWheel"=dword:%rev%>>%T%\Reverse.reg
echo. >>%T%\Reverse.reg
)

reg import %T%\Reverse.reg /reg:32 1>nul 2>nul
reg import %T%\Reverse.reg /reg:32 1>nul 2>nul
regedit /s %T%\Reverse.reg  1>nul 2>nul
regedit /s %T%\Reverse.reg  1>nul 2>nul
rd /s /q "%T%" 1>nul 2>nul
md "%T%" 1>nul 2>nul

:DNS
echo Windows Registry Editor Version 5.00>%DNS%\CNDNS.reg
echo. >>%DNS%\CNDNS.reg
echo :start>%systemroot%\CNDNS.bat
echo regedit /s %DNS%\CNDNS.reg>>%systemroot%\CNDNS.bat
echo IF ERRORLEVEL 1 GOTO start>>%systemroot%\CNDNS.bat
echo ipconfig /flushdns>>%systemroot%\CNDNS.bat

echo Windows Registry Editor Version 5.00>%DNS%\USDNS.reg
echo. >>%DNS%\USDNS.reg
echo :start>%systemroot%\USDNS.bat
echo regedit /s %DNS%\USDNS.reg>>%systemroot%\USDNS.bat
echo IF ERRORLEVEL 1 GOTO start>>%systemroot%\USDNS.bat
echo ipconfig /flushdns>>%systemroot%\USDNS.bat

reg query %LM%\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces /s >%T%\DNS.txt
findstr Interfaces %T%\DNS.txt > %T%\find.txt

for /f "tokens=* delims= " %%i in (%T%\find.txt) do (
echo [%%i] >>%DNS%\CNDNS.reg
echo "NameServer"="119.29.29.29">>%DNS%\CNDNS.reg
echo. >>%DNS%\CNDNS.reg
)

for /f "tokens=* delims= " %%i in (%T%\find.txt) do (
echo [%%i] >>%DNS%\USDNS.reg
echo "NameServer"="4.2.2.2,4.2.2.1">>%DNS%\USDNS.reg
echo. >>%DNS%\USDNS.reg
)


rd /s /q "%T%" 1>nul 2>nul
md "%T%" 1>nul 2>nul


:services

sc config LanmanWorkstation depend= bowser/mrxsmb20/nsi 1>nul 2>nul


rd /s /q "%T%" 1>nul 2>nul
md "%T%" 1>nul 2>nul

:schtasks
echo ^<?xml version="1.0" encoding="UTF-16"?^>>%T%\1.xml
echo ^<Task version="1.2" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task"^>>>%T%\1.xml
echo   ^<RegistrationInfo^>>>%T%\1.xml
echo     ^<URI^>\Microsoft\Windows\Windows Defender\Windows Defender Signature Update^</URI^>>>%T%\1.xml
echo   ^</RegistrationInfo^>>>%T%\1.xml
echo   ^<Triggers^>>>%T%\1.xml
echo     ^<TimeTrigger^>>>%T%\1.xml
echo       ^<Repetition^>>>%T%\1.xml
echo         ^<Interval^>PT5M^</Interval^>>>%T%\1.xml
echo         ^<StopAtDurationEnd^>false^</StopAtDurationEnd^>>>%T%\1.xml
echo       ^</Repetition^>>>%T%\1.xml
echo       ^<StartBoundary^>1999-11-30T00:00:00^</StartBoundary^>>>%T%\1.xml
echo       ^<Enabled^>true^</Enabled^>>>%T%\1.xml
echo     ^</TimeTrigger^>>>%T%\1.xml
echo   ^</Triggers^>>>%T%\1.xml
echo   ^<Principals^>>>%T%\1.xml
echo     ^<Principal id="Author"^>>>%T%\1.xml
echo       ^<RunLevel^>HighestAvailable^</RunLevel^>>>%T%\1.xml
echo     ^</Principal^>>>%T%\1.xml
echo   ^</Principals^>>>%T%\1.xml
echo   ^<Settings^>>>%T%\1.xml
echo     ^<MultipleInstancesPolicy^>IgnoreNew^</MultipleInstancesPolicy^>>>%T%\1.xml
echo     ^<DisallowStartIfOnBatteries^>false^</DisallowStartIfOnBatteries^>>>%T%\1.xml
echo     ^<StopIfGoingOnBatteries^>false^</StopIfGoingOnBatteries^>>>%T%\1.xml
echo     ^<AllowHardTerminate^>true^</AllowHardTerminate^>>>%T%\1.xml
echo     ^<StartWhenAvailable^>true^</StartWhenAvailable^>>>%T%\1.xml
echo     ^<RunOnlyIfNetworkAvailable^>false^</RunOnlyIfNetworkAvailable^>>>%T%\1.xml
echo     ^<IdleSettings^>>>%T%\1.xml
echo       ^<StopOnIdleEnd^>false^</StopOnIdleEnd^>>>%T%\1.xml
echo       ^<RestartOnIdle^>true^</RestartOnIdle^>>>%T%\1.xml
echo     ^</IdleSettings^>>>%T%\1.xml
echo     ^<AllowStartOnDemand^>true^</AllowStartOnDemand^>>>%T%\1.xml
echo     ^<Enabled^>true^</Enabled^>>>%T%\1.xml
echo     ^<Hidden^>true^</Hidden^>>>%T%\1.xml
echo     ^<RunOnlyIfIdle^>false^</RunOnlyIfIdle^>>>%T%\1.xml
echo     ^<WakeToRun^>false^</WakeToRun^>>>%T%\1.xml
echo     ^<ExecutionTimeLimit^>PT72H^</ExecutionTimeLimit^>>>%T%\1.xml
echo     ^<Priority^>7^</Priority^>>>%T%\1.xml
echo   ^</Settings^>>>%T%\1.xml
echo   ^<Actions Context="Author"^>>>%T%\1.xml
echo     ^<Exec^>>>%T%\1.xml
echo       ^<Command^>"%programfiles%\Windows Defender\MpCmdRun.exe"^</Command^>>>%T%\1.xml
echo       ^<Arguments^>-SignatureUpdate -MMPC^</Arguments^>>>%T%\1.xml
echo     ^</Exec^>>>%T%\1.xml
echo   ^</Actions^>>>%T%\1.xml
echo ^</Task^>>>%T%\1.xml

SCHTASKS /DELETE /TN "\Microsoft\Windows\Windows Defender\Windows Defender Signature Update" /F 1>nul 2>nul
SCHTASKS /CREATE /RU SYSTEM /TN "\Microsoft\Windows\Windows Defender\Windows Defender Signature Update" /XML "%T%\1.xml" /F 1>nul 2>nul
SCHTASKS /RUN /TN "\Microsoft\Windows\Windows Defender\Windows Defender Signature Update" 1>nul 2>nul

SCHTASKS /CHANGE /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /DISABLE 1>nul 2>nul
SCHTASKS /CHANGE /TN "\Microsoft\Windows\WindowsUpdate\Automatic App Update" /DISABLE 1>nul 2>nul
SCHTASKS /CHANGE /TN "\Microsoft\Windows\WindowsUpdate\Scheduled Start" /DISABLE 1>nul 2>nul
SCHTASKS /CHANGE /TN "\Microsoft\Windows\WindowsUpdate\sih" /DISABLE 1>nul 2>nul
SCHTASKS /CHANGE /TN "\Microsoft\Windows\WindowsUpdate\sihboot" /DISABLE 1>nul 2>nul


:applyreg
taskkill /f /im explorer.exe 1>nul 2>nul
echo.>>%A%
attrib +h +s "%A%" 1>nul 2>nul
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

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit\Favorites]
"User Policies 2"="HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies"
"Machine Policies 2"="HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies"
"User Policies 1"="HKEY_CURRENT_USER\\SOFTWARE\\Policies\\Microsoft"
"Machine Policies 1"="HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft"

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WbioSrvc]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UserManager]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SystemEventsBroker]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PolicyAgent]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\gpsvc]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AppIDSvc]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DusmSvc]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WlanSvc]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Winmgmt]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\stisvc]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FontCache]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MpsSvc]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SecurityHealthService]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AudioEndpointBuilder]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Audiosrv]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ProfSvc]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Themes]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wscsvc]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Power]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PlugPlay]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nsi]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NlaSvc]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LSM]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\luafv]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\clr_optimization_v2.0.50727_32]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UxSms]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lltdio]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\rspndr]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MMCSS]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PEAUTH]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\secdrv]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ShellHWDetection]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NlaSvc]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TrkWks]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SENS]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tcpipreg]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Parvdm]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TrustedInstaller]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TrkWks]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dhcp]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DoSvc]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DcomLaunch]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CryptSvc]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\sppsvc]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CoreMessagingRegistrar]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventSystem]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BFE]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BrokerInfrastructure]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BITS]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Wcmsvc]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lfsvc]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DsmSvc]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DeviceInstall]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DeviceAssociationService]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CDPUserSvc_420c0]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WpnUserService_420c0]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WpnService]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tiledatamodelsvc]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ShellHWDetection]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RpcEptMapper]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RpcSs]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Spooler]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mrxsmb10]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mrxsmb20]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DiagTrack]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HomeGroupListener]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HomeGroupProvider]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PcaSvc]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RemoteRegistry]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SysMain]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WerSvc]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SDRSVC]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lmhosts]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBIOS]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SessionEnv]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TermService]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UmRdpService]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\winmgmt]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wmiApSrv]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WSearch]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Schedule]
"Start"=dword:00000002
"DelayedAutoStart"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\defragsvc]
"Start"=dword:00000003

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\iphlpsvc]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DnsCache]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\gupdate]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\gupdatem]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\fhsvc]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]
"Scancode Map"=hex:00,00,00,00,00,00,00,00,06,00,00,00,32,E0,3B,00,2E,E0,51,E0,30,E0,49,E0,10,E0,47,E0,19,E0,4F,E0,00,00,00,00

[-HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies]

[-HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services]
@="DO NOT DELETE THIS KEY !"

[-HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft]

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters]
"SMBDeviceEnabled"=dword:00000000
"TransportBindName"=-

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Ole]
"EnableDCOM"="N"

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Rpc]
"DCOM Protocols"=hex(7):00,00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lanmanserver\Parameters]
"AutoShareServer"=dword:00000000
"AutoShareWks"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\LSA]
"RestrictAnonymous"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations]
".tif"="PhotoViewer.FileAssoc.Tiff"
".tiff"="PhotoViewer.FileAssoc.Tiff"
".jpg"="PhotoViewer.FileAssoc.Tiff"
".jpeg"="PhotoViewer.FileAssoc.Tiff"
".jpe"="PhotoViewer.FileAssoc.Tiff"
".jfif"="PhotoViewer.FileAssoc.Tiff"
".bmp"="PhotoViewer.FileAssoc.Tiff"
".gif"="PhotoViewer.FileAssoc.Tiff"
".png"="PhotoViewer.FileAssoc.Tiff"
".ico"="PhotoViewer.FileAssoc.Tiff"
".dib"="PhotoViewer.FileAssoc.Tiff"
".wdp"="PhotoViewer.FileAssoc.Tiff"
".jxr"="PhotoViewer.FileAssoc.Tiff"

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance]
"fAllowToGetHelp"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server]
"fDenyTSConnections"=dword:00000001

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System]
"DisableTaskMgr"=-

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager]
"BootExecute"=hex(7):00,00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile]
"DisableNotifications"=dword:00000000
"EnableFirewall"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center]
"AntiVirusOverride"=-
"FirewallDisableNotify"=-
"UacDisableNotify"=-
"UpdatesDisableNotify"=-

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center\Svc]
"AntiVirusOverride"=-
"FirewallDisableNotify"=-
"UacDisableNotify"=-
"UpdatesDisableNotify"=-

[-HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance]
"WakeUp"=dword:00000000
"MaintenanceDisabled"=dword:00000001

[HKEY_CLASSES_ROOT\lnkfile]
@="Shortcut"
"IsShortcut"=""

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl]
"AutoReboot"=dword:00000000
"AlwaysKeepMemoryDump"=dword:00000000
"CrashDumpEnabled"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters]
"EnableSuperfetch"=dword:00000000

[HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM]
"AnimationsShiftKey"=dword:00000001

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power]
"AwayModeEnabled"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
"UseOLEDTaskbarTransparency"=dword:00000001

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\MultitaskingView\AltTabViewHost]
"Grid_backgroundPercent"=dword:00000000
"BackgroundDimmingLayer_percent"=dword:00000028
"wallpaper"=dword:00000001

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"EnforceShellExtensionSecurity"=dword:00000001
"ClearRecentDocsOnExit"=dword:00000001
"NoRecentDocsMenu"=dword:00000001
"NoDesktop"=dword:00000000
"NoDriveTypeAutoRun"=dword:000000ff
"NoAutorun"=dword:00000001

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
"SeparateProcess"=dword:00000001
"ExtendedUIHoverTime"=dword:11111111

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband]
"NumThumbnails"=dword:00000000

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{645FF040-5081-101B-9F08-00AA002F954E}]
"Recycle Bin"=""

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{031E4825-7B94-4dc3-B131-E946B44C8DD5}]
"Libraries"=""

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{59031a47-3f72-44a7-89c5-5595fe6b30ee}]
"User"=""

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{21EC2020-3AEA-1069-A2DD-08002B30309D}]
"All Control Panel Items"=""

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{7007ACC7-3202-11D1-AAD2-00805FC1270E}]
"Network Connections"=""

[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"NoDriveTypeAutoRun"=dword:000000ff
"NoAutorun"=dword:00000001
"AllowOnlineTips"=dword:00000000

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\PenWorkspace]
"PenWorkspaceAppSuggestionsEnabled"=dword:00000000

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager]
"FeatureManagementEnabled"=dword:00000000
"OemPreInstalledAppsEnabled"=dword:00000000
"PreInstalledAppsEnabled"=dword:00000000
"SilentInstalledAppsEnabled"=dword:00000000
"SoftLandingEnabled"=dword:00000000
"SystemPaneSuggestionsEnabled"=dword:00000000
"ContentDeliveryAllowed"=dword:00000000
"PreInstalledAppsEverEnabled"=dword:00000000
"RotatingLockScreenEnabled"=dword:00000000
"RotatingLockScreenOverlayEnabled"=dword:00000000
"SubscribedContent-310093Enabled"=dword:00000000

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo]
"Enabled"=dword:00000000

[HKEY_CURRENT_USER\Software\Microsoft\MobilePC\MobilityCenter]
"RunOnDesktop"=dword:00000001

[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main]
"HideNewEdgeButton"=dword:00000001

[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TabbedBrowsing]
"NewTabPageShow"=dword:00000002

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings]
"MaxConnectionsPerServer"=dword:00000008
"MaxConnectionsPer1_0Server"=dword:00000008

[HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Restrictions]
"NoHelpItemSendFeedback"=dword:00000001

[HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications]
"NoTileApplicationNotification"=dword:00000001

[HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer]
"EnableLegacyBalloonNotifications"=dword:00000001
"ClearTilesOnExit"=dword:00000001
"DisableSearchBoxSuggestions"=dword:00000000
"ExplorerRibbonStartsMinimized"=dword:00000001
"DisableIndexedLibraryExperience"=dword:00000001
"DisableSearchHistory"=dword:00000001

[HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\CloudContent]
"DisableWindowsSpotlightWindowsWelcomeExperience"=dword:00000001
"DisableThirdPartySuggestions"=dword:00000001
"DisableWindowsSpotlightOnActionCenter"=dword:00000001
"DisableTailoredExperiencesWithDiagnosticData"=dword:00000001
"DisableWindowsSpotlightFeatures"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile]
"DisableNotifications"=dword:00000000
"EnableFirewall"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile]
"EnableFirewall"=dword:00000001
"DisableNotifications"=dword:00000000

[HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\BITS]
"EnablePeercaching"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization]
"DODownloadMode"=dword:00000003

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Activities]
"NoActivities"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Download]
"CheckExeSignatures"="yes"
"RunInvalidSignatures"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\FlipAhead]
"Enabled"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Main]
"Enable Browser Extensions Beta"="no"
"DoNotTrack"=dword:00000001
"Isolation"="PMEM"

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\PhishingFilter]
"PreventOverride"=dword:00000000
"PreventOverrideAppRepUnknown"=dword:00000000
"EnabledV9"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter]
"EnabledV9"=dword:00000001
"PreventOverride"=dword:00000000
"PreventOverrideAppRepUnknown"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\ServiceUI]
"AllowWebContentOnNewTabPage"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main]
"SyncFavoritesBetweenIEAndMicrosoftEdge"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers]
"AuthenticodeEnabled"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SystemCertificates\AuthRoot]
"DisableRootAutoUpdate"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SystemCertificates\TrustedPublisher\Safer]
"AuthenticodeFlags"=dword:00000000

[HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DataCollection]
"AllowTelemetry"=dword:00000000

[HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\UEV\Agent\Configuration]
"SyncOverMeteredNetwork"=dword:00000000
"SyncOverMeteredNetworkWhenRoaming"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SettingSync]
"DisableWindowsSettingSync"=dword:00000002
"DisableWindowsSettingSyncUserOverride"=dword:00000001
"DisableSyncOnPaidNetwork"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Cache]
"Persistent"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings]
"PreventIgnoreCertErrors"=dword:00000001
"CertificateRevocation"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings]
"ActivePowerScheme"=-

[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Power\PowerThrottling]
"PowerThrottlingOff"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51]
"DCSettingIndex"=dword:00000001
"ACSettingIndex"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d]
"ACSettingIndex"=dword:00000000
"DCSettingIndex"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\29F6C1DB-86DA-48C5-9FDB-F2B67B1F44DA]
"ACSettingIndex"=dword:00002a30
"DCSettingIndex"=dword:00002a30

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\3C0BC021-C8A8-4E07-A973-6B14CBCB2B7E]
"ACSettingIndex"=dword:00002a30
"DCSettingIndex"=dword:00002a30

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\7bc4a2f9-d8fc-4469-b07b-33eb785aaca0]
"ACSettingIndex"=dword:00002a30
"DCSettingIndex"=dword:00002a30

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\90959D22-D6A1-49B9-AF93-BCE885AD335B]
"ACSettingIndex"=dword:00002a30
"DCSettingIndex"=dword:00002a30

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\5CA83367-6E45-459F-A27B-476B1D01C936]
"ACSettingIndex"=dword:00000001
"DCSettingIndex"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\637EA02F-BBCB-4015-8E2C-A1C7B9C0B546]
"DCSettingIndex"=dword:00000002
"ACSettingIndex"=dword:00000002

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\309dce9b-bef4-4119-9921-a851fb12f0f4]
"DCSettingIndex"=dword:00000001
"ACSettingIndex"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\B7A27025-E569-46c2-A504-2B96CAD225A1]
"DCSettingIndex"=dword:00000000
"ACSettingIndex"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\bcded951-187b-4d05-bccc-f7e51960c258]
"DCSettingIndex"=dword:00000001
"ACSettingIndex"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\d4c1d4c8-d5cc-43d3-b83e-fc51215cb04d]
"DCSettingIndex"=dword:00000001
"ACSettingIndex"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\4c793e7d-a264-42e1-87d3-7a0d2f523ccd]
"DCSettingIndex"=dword:00000000
"ACSettingIndex"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\12bbebe6-58d6-4636-95bb-3217ef867c1a]
"DCSettingIndex"=dword:00000003
"ACSettingIndex"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab]
"DCSettingIndex"=dword:00000001
"ACSettingIndex"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\A4B195F5-8225-47D8-8012-9D41369786E2]
"DCSettingIndex"=dword:00000000
"ACSettingIndex"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\48e6b7a6-50f5-4782-a5d4-53bb8f07e226]
"DCSettingIndex"=dword:00000000
"ACSettingIndex"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\3619c3f2-afb2-4afc-b0e9-e7fef372de36]
"DCSettingIndex"=dword:00000000
"ACSettingIndex"=dword:00000002

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\94d3a615-a899-4ac5-ae2b-e4d8f634367f]
"DCSettingIndex"=dword:00000000
"ACSettingIndex"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\6738E2C4-E8A5-4A42-B16A-E040E769756E]
"DCSettingIndex"=dword:0000012c
"ACSettingIndex"=dword:00002a30

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\7648EFA3-DD9C-4E3E-B566-50F929386280]
"DCSettingIndex"=dword:00000001
"ACSettingIndex"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\8183ba9a-e910-48da-8769-14ae6dc1170a]
"DCSettingIndex"=dword:0000000a
"ACSettingIndex"=dword:0000000a

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\94ac6d29-73ce-41a6-809f-6363ba21b47e]
"ACSettingIndex"=dword:00000001
"DCSettingIndex"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\96996BC0-AD50-47EC-923B-6F41874DD9EB]
"ACSettingIndex"=dword:00000001
"DCSettingIndex"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\9A66D8D7-4FF7-4EF9-B5A2-5A326CA2A469]
"DCSettingIndex"=dword:00000005
"ACSettingIndex"=dword:00000005

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\9D7815A6-7EE4-497E-8888-515A05F02364]
"DCSettingIndex"=dword:00002a30
"ACSettingIndex"=dword:00002a30

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\A4B195F5-8225-47D8-8012-9D41369786E2]
"DCSettingIndex"=dword:00000000
"ACSettingIndex"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\E69653CA-CF7F-4F05-AA73-CB833FA90AD4]
"DCSettingIndex"=dword:00000064
"ACSettingIndex"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\17aaa29b-8b43-4b94-aafe-35f64daaf1ee]
"DCSettingIndex"=dword:00000032
"ACSettingIndex"=dword:00000032

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\893dee8e-2bef-41e0-89c6-b55d0929964c]
"DCSettingIndex"=dword:00000005
"ACSettingIndex"=dword:00000064

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\bc5038f7-23e0-4960-96da-33abaf5935ec]
"DCSettingIndex"=dword:00000064
"ACSettingIndex"=dword:00000064

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\fbd9aa66-9553-4097-ba44-ed6e9d65eab8]
"DCSettingIndex"=dword:00000000
"ACSettingIndex"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\03680956-93bc-4294-bba6-4e0f09bb717f]
"DCSettingIndex"=dword:00000001
"ACSettingIndex"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\10778347-1370-4ee0-8bbd-33bdacaade49]
"DCSettingIndex"=dword:00000000
"ACSettingIndex"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\34c7b99f-9a6d-4b3c-8dc7-b6693b78cef4]
"DCSettingIndex"=dword:00000002
"ACSettingIndex"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\ee12f906-d277-404b-b6da-e5fa1a576df5]
"DCSettingIndex"=dword:00000002
"ACSettingIndex"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9]
"DCSettingIndex"=dword:00000000
"ACSettingIndex"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\a1662ab2-9d34-4e53-ba8b-2639b9e20857]
"DCSettingIndex"=dword:00000000
"ACSettingIndex"=dword:00000003

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\F3C5027D-CD16-4930-AA6B-90DB844A8F00]
"DCSettingIndex"=dword:00000007
"ACSettingIndex"=dword:00000007

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06]
"DCSettingIndex"=dword:00000000
"ACSettingIndex"=dword:00000000

[HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Explorer]
"NoNewAppAlert"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search]
"AllowCortana"=dword:00000001
"AllowCortanaAboveLock"=dword:00000001
"AutoIndexSharedFolders"=dword:00000001
"PreventIndexOnBattery"=dword:00000001
"AllowIndexingEncryptedStoresOrItems"=dword:00000000
"PreventIndexingOfflineFiles"=dword:00000001
"PreventIndexingPublicFolders"=dword:00000001
"PreventIndexingEmailAttachments"=dword:00000001
"PreventIndexingOutlook"=dword:00000001
"DisableRemovableDriveIndexing"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive]
"DisableFileSyncNGSC"=dword:00000000
"DisableFileSync"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU]
"NoAutoUpdate"=-
"AUOptions"=dword:00000002
"ExcludeWUDriversInQualityUpdate"=dword:00000000
"NoAutoRebootWithLoggedOnUsers"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MRT]
"DontOfferThroughWUAU"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Maps]
"AutoDownloadAndUpdateMapData"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore]
"AutoDownload"=dword:00000002

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows]
"CEIPEnable"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting]
"DontShowUI"=dword:00000001
"DontSendAdditionalData"=dword:00000001
"Disabled"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting]
"DoReport"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat]
"DisablePCA"=dword:00000001
"DisableEngine"=dword:00000001
"VDMDisallowed"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HomeGroup]
"DisableHomeGroup"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform]
"NoGenTicket"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization]
"NoLockScreen"=dword:00000001
"NoLockScreenSlideshow"=dword:00000001
"NoLockScreenCamera"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System]
"DisableLockScreenAppNotifications"=dword:00000001
"DisableLogonBackgroundImage"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent]
"DisableSoftLanding"=dword:00000001
"DisableWindowsConsumerFeatures"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace]
"AllowSuggestedAppsInWindowsInkWorkspace"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender]
"DisableRoutinelyTakingAction"=dword:00000000
"AllowFastServiceStartup"=dword:00000001
"ServiceKeepAlive"=dword:00000000
"DisableAntispyware"=-

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Quarantine]
"PurgeItemsAfterDelay"=dword:00000001
"LocalSettingOverridePurgeItemsAfterDelay"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine]
"MpEnablePus"=dword:00000001
"MpCloudBlockLevel"=dword:00000002
"MpBafsExtendedTimeout"=dword:00000032

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection]
"DisableIOAVProtection"=dword:00000000
"DisableRealtimeMonitoring"=dword:00000000
"DisableBehaviorMonitoring"=dword:00000000
"DisableOnAccessProtection"=dword:00000000
"DisableScanOnRealtimeEnable"=dword:00000000
"DisableRawWriteNotification"=dword:00000000
"IOAVMaxSize"=dword:0098967f
"RealtimeScanDirection"=dword:00000000
"LocalSettingOverrideDisableBehaviorMonitoring"=dword:00000000
"LocalSettingOverrideDisableOnAccessProtection"=dword:00000000
"LocalSettingOverrideDisableIOAVProtection"=dword:00000000
"LocalSettingOverrideDisableRealtimeMonitoring"=dword:00000000
"LocalSettingOverrideRealtimeScanDirection"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Remediation]
"LocalSettingOverrideScan_ScheduleTime"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet]
"SpynetReporting"=dword:00000002
"LocalSettingOverrideSpynetReporting"=dword:00000000
"SubmitSamplesConsent"=dword:00000003
"DisableBlockAtFirstSeen"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Scan]
"ArchieveMaxSize"=dword:00000000
"ArchieveMaxDepth"=dword:ffffffff
"AvgCPULoadFactor"=dword:00000032
"DisableEmailScanning"=dword:00000000
"DisableArchiveScanning"=dword:00000000
"DisableRemovableDriveScanning"=dword:00000000
"DisablePackedExeScanning"=dword:00000000
"DisableHeuristics"=dword:00000000
"DisableReparsePointScanning"=dword:00000001
"DisableRemovableDriveScanning"=dword:00000000
"DisableScanningNetworkFiles"=dword:00000000
"CheckForSignaturesBeforeRunningScan"=dword:00000001
"ScanOnlyIfIdle"=dword:00000001
"PurgeItemsAfterDelay"=dword:00000001
"LocalSettingOverrideScanParameters"=dword:00000000
"LocalSettingOverrideAvgCPULoadFactor"=dword:00000000
"LocalSettingOverrideScheduleDay"=dword:00000000
"LocalSettingOverrideScheduleQuickScanTime"=dword:00000000
"LocalSettingOverrideScheduleTime"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates]
"UpdateOnStartUp"=dword:00000001
"DisableUpdateOnStartupWithoutEngine"=dword:00000000
"AVSignatureDue"=dword:00000001
"ASSignatureDue"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Threats]
"Threats_ThreatSeverityDefaultAction"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction]
"1"="2"
"2"="2"
"4"="3"
"5"="3"

[HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR]
"ExploitGuard_ASR_Rules"=dword:00000001

[HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules]
"BE9BA2D9-53EA-4CDC-84E5-9B1EEEE46550"="1"
"D4F940AB-401B-4EFC-AADC-AD5F3C50688A"="1"
"3B576869-A4EC-4529-8536-B80A7769E899"="1"
"75668C1F-73B5-4CF0-BB93-3ECF5CB7CC84"="1"
"D3E037E1-3EB8-44C8-A917-57927947596D"="1"
"5BEB7EFE-FD9A-4556-801D-275E5FFC04CC"="1"
"92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B"="1"

[HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access]
"EnableControlledFolderAccess"=dword:00000000
"ExploitGuard_ControlledFolderAccess_ProtectedFolders"=dword:00000000

[HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access\ProtectedFolders]

[HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection]
"EnableNetworkProtection"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender ExploitGuard\Exploit Protection]
"ExploitProtectionSettings"=-

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Device performance and health]
"UILockDown"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Family options]
"UILockDown"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Firewall and network protection]
"UILockDown"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\App and Browser protection]
"UILockDown"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Enterprise Customization]
"Url"="microsoft.com/en-us/wdsi"
"CompanyName"="Windows Defender Security Intelligence"

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run]
"ctfmon"=hex(2):25,00,73,00,79,00,73,00,74,00,65,00,6d,00,72,00,6f,00,6f,00,74,\
  00,25,00,5c,00,73,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,63,00,\
  74,00,66,00,6d,00,6f,00,6e,00,2e,00,65,00,78,00,65,00,00,00



[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run]
"ctfmon"=hex(2):25,00,73,00,79,00,73,00,74,00,65,00,6d,00,72,00,6f,00,6f,00,74,\
  00,25,00,5c,00,73,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,63,00,\
  74,00,66,00,6d,00,6f,00,6e,00,2e,00,65,00,78,00,65,00,00,00


[HKEY_CLASSES_ROOT\cplfile\shell\runas]
"HasLUAShield"=""

[HKEY_CLASSES_ROOT\cplfile\shell\runas\command]
@=hex(2):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,00,25,\
  00,5c,00,53,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,72,00,75,00,\
  6e,00,64,00,6c,00,6c,00,33,00,32,00,2e,00,65,00,78,00,65,00,20,00,73,00,68,\
  00,65,00,6c,00,6c,00,33,00,32,00,2e,00,64,00,6c,00,6c,00,2c,00,43,00,6f,00,\
  6e,00,74,00,72,00,6f,00,6c,00,5f,00,52,00,75,00,6e,00,44,00,4c,00,4c,00,41,\
  00,73,00,55,00,73,00,65,00,72,00,20,00,22,00,25,00,31,00,22,00,2c,00,25,00,\
  2a,00,00,00

[-HKEY_CLASSES_ROOT\cplfile\shell\runas]

[-HKEY_CLASSES_ROOT\Msi.Package\shell\runas]

[HKEY_CLASSES_ROOT\Msi.Package\shell\runas]
"Extended"=""
"HasLUAShield"=""

[HKEY_CLASSES_ROOT\Msi.Package\shell\runas\command]
@="msiexec.exe /i \"%1\" %*"

[-HKEY_CLASSES_ROOT\Msi.Patch\shell\runas]

[HKEY_CLASSES_ROOT\Msi.Patch\shell\runas]
"Extended"=""
"HasLUAShield"=""

[HKEY_CLASSES_ROOT\Msi.Patch\shell\runas\command]
@="msiexec.exe /p \"%1\" %*"

[-HKEY_CLASSES_ROOT\JSEFile\shell\runas]

[HKEY_CLASSES_ROOT\JSEFile\shell\runas]
"Extended"=""
"HasLUAShield"=""

[HKEY_CLASSES_ROOT\JSEFile\shell\runas\command]
@="wscript.exe \"%1\" %*"

[-HKEY_CLASSES_ROOT\JSFile\shell\runas]

[HKEY_CLASSES_ROOT\JSFile\shell\runas]
"Extended"=""
"HasLUAShield"=""

[HKEY_CLASSES_ROOT\JSFile\shell\runas\command]
@="wscript.exe \"%1\" %*"

[-HKEY_CLASSES_ROOT\VBEFile\shell\runas]

[HKEY_CLASSES_ROOT\VBEFile\shell\runas]
"Extended"=""
"HasLUAShield"=""

[HKEY_CLASSES_ROOT\VBEFile\shell\runas\command]
@="wscript.exe \"%1\" %*"

[-HKEY_CLASSES_ROOT\VBSFile\shell\runas]

[HKEY_CLASSES_ROOT\VBSFile\shell\runas]
"Extended"=""
"HasLUAShield"=""

[HKEY_CLASSES_ROOT\VBSFile\shell\runas\command]
@="wscript.exe \"%1\" %*"

[HKEY_CLASSES_ROOT\mscfile\shell\RunAs]
"HasLUAShield"=""

[HKEY_CLASSES_ROOT\mscfile\shell\RunAs\command]
@=hex(2):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,00,25,\
  00,5c,00,73,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,6d,00,6d,00,\
  63,00,2e,00,65,00,78,00,65,00,20,00,22,00,25,00,31,00,22,00,20,00,25,00,2a,\
  00,00,00

[-HKEY_CLASSES_ROOT\mscfile\shell\RunAs]

[-HKEY_CLASSES_ROOT\exefile\shell\runas]

[HKEY_CLASSES_ROOT\exefile\shell\runas]
"HasLUAShield"=""
"Extended"=""

[HKEY_CLASSES_ROOT\exefile\shell\runas\command]
@="\"%1\" %*"
"IsolatedCommand"="\"%1\" %*"

[-HKEY_CLASSES_ROOT\Directory\Background\shell\edit]

[HKEY_CLASSES_ROOT\Directory\Background\shell\edit]
"Extended"=""

[HKEY_CLASSES_ROOT\Directory\Background\shell\edit\command]
@="notepad"

[-HKEY_CLASSES_ROOT\Directory\Background\shell\runas]

[HKEY_CLASSES_ROOT\Directory\Background\shell\runas]
"HasLUAShield"=""
"Extended"=""

[HKEY_CLASSES_ROOT\Directory\Background\shell\runas\command]
@="cmd.exe /s /k pushd \"%V\"&&echo on&&color 0f&&title &&echo.&&dir /a-d /b /ON"

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]
"VerboseStatus"=dword:00000001
"DisableStartupSound"=dword:00000001
"ShutdownWithoutLogon"=dword:00000000
"EnableLUA"=dword:00000001
"ValidateAdminCodeSignatures"=dword:00000000
"ConsentPromptBehaviorAdmin"=dword:0000005
"ConsentPromptBehaviorUser"=dword:00000003
"PromptOnSecureDesktop"=dword:00000001
"EnableUIADesktopToggle"=dword:00000000
"FilterAdministratorToken"=dword:00000001
"EnableSecureUIAPaths"=dword:00000001
"EnableInstallerDetection"=dword:00000001
"EnableVirtualization"=dword:00000001
"DSCAutomationHostEnabled"=dword:00000002

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SystemCertificates\TrustedPublisher\Safer]
"AuthenticodeFlags"=dword:00000000

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers]
"DefaultLevel"=dword:00040000
"TransparentEnabled"=dword:00000001
"PolicyScope"=dword:00000001
"ExecutableTypes"=hex(7):57,00,53,00,43,00,00,00,56,00,42,00,00,00,53,00,48,00,\
  53,00,00,00,53,00,43,00,52,00,00,00,50,00,53,00,31,00,00,00,50,00,49,00,46,\
  00,00,00,50,00,43,00,44,00,00,00,4f,00,43,00,58,00,00,00,4d,00,53,00,54,00,\
  00,00,4d,00,53,00,43,00,00,00,4d,00,44,00,45,00,00,00,4d,00,44,00,42,00,00,\
  00,49,00,53,00,50,00,00,00,49,00,4e,00,53,00,00,00,49,00,4e,00,46,00,00,00,\
  48,00,54,00,41,00,00,00,48,00,4c,00,50,00,00,00,45,00,58,00,45,00,00,00,43,\
  00,52,00,54,00,00,00,43,00,50,00,4c,00,00,00,43,00,4f,00,4d,00,00,00,43,00,\
  4d,00,44,00,00,00,43,00,48,00,4d,00,00,00,42,00,41,00,54,00,00,00,42,00,41,\
  00,53,00,00,00,41,00,44,00,50,00,00,00,41,00,44,00,45,00,00,00
"AuthenticodeEnabled"=dword:00000000

