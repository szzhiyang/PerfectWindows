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
bcdedit /set {default} bootmenupolicy legacy 1>nul 2>nul
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
rd /s /q "%P%" 1>nul 2>nul
rd /s /q "%T%" 1>nul 2>nul
sc pause sysmain 1>nul 2>nul
sc stop sysmain 1>nul 2>nul
rd /s /q %systemroot%\Prefetch 1>nul 2>nul
md "%P%" 1>nul 2>nul
md "%T%" 1>nul 2>nul
md "%systemdrive%\PerfectWindows" 1>nul 2>nul
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
echo.>%T%\startup
rd /s /q "%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul
copy %T%\startup "%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul
attrib +h +s "%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul
rd /s /q "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul
copy %T%\startup "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul
attrib +h +s "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul
rd /s /q "%T%" 1>nul 2>nul
md "%T%" 1>nul 2>nul
rd /s /q "%tmp%" 1>nul 2>nul
ipconfig /flushdns 1>nul 2>nul
md "%tmp%" 1>nul 2>nul
attrib +h +s "%tmp%" 1>nul 2>nul


copy hos*.txt /Y %systemroot%\system32\drivers\etc\hosts 1>nul 2>nul


if exist %systemdrive%\PerfectWindows\PerfectWindows{*}.bat (
goto createreg) else (
copy "%~0" /Y "%systemdrive%\PerfectWindows\PerfectWindows{}.bat" 1>nul 2>nul
)



:createreg
echo Windows Registry Editor Version 5.00>%B%
echo.>>%B%
echo [-%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer]>>%B%
echo.>>%B%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers]>>%B%
echo "AuthenticodeEnabled"=dword:00000000>>%B%
echo.>>%B%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%B%
echo "NoTrayItemsDisplay"=dword:00000000>>%B%
echo.>>%B%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer]>>%B%
echo "ShellState"=hex:24,00,00,00,3e,38,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\>>%B%
echo    01,00,00,00,13,00,00,00,00,00,00,00,6b,00,00,00>>%B%
echo "IconUnderline"=dword:00000001>>%B%
echo.>>%B%
echo [%LM%\Software\Microsoft\Windows\CurrentVersion\Policies\System]>>%B%
echo "LegalNoticeCaption"="YOUR PC IS IN DANGER NOW ! ! !">>%B%
echo "LegalNoticeText"="PLEASE DO REMEMBER TO RUN [ BESAFE ] FROM START MENU TO BRING YOUR PC BACK TO SAFETY ! ! !">>%B%
echo.>>%B%
echo [%CU%\Control Panel\International]>>%B%
echo "sShortTime"="H:m">>%B%
echo "sLongTime"="H:m:s">>%B%
echo "sShortTime"="tt H:mm">>%B%
echo "sLongTime"="H:mm:ss">>%B%
echo "s1159"=->>%B%
echo "s2359"=->>%B%
echo "s1159"=" IN DANGER! ">>%B%
echo "s2359"=" IN DANGER! ">>%B%
echo.>>%B%
echo [-%LM%\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection]>>%B%
echo.>>%B%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%B%
echo "SeparateProcess"=dword:00000001>>%B%
echo "Hidden"=dword:00000001>>%B%
echo "ShowSuperHidden"=dword:00000001>>%B%
echo "HideFileExt"=dword:00000000>>%B%
echo.>>%B%
echo [%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]>>%B%
echo "VerboseStatus"=dword:00000001>>%B%
echo "DisableStartupSound"=dword:00000001>>%B%
echo "EnableLUA"=dword:00000001>>%B%
echo "ValidateAdminCodeSignatures"=dword:00000000>>%B%
echo "ConsentPromptBehaviorAdmin"=dword:0000001>>%B%
echo "ConsentPromptBehaviorUser"=dword:00000003>>%B%
echo "PromptOnSecureDesktop"=dword:00000001>>%B%
echo "EnableUIADesktopToggle"=dword:00000000>>%B%
echo "FilterAdministratorToken"=dword:00000001>>%B%
echo "EnableSecureUIAPaths"=dword:00000001>>%B%
echo "EnableInstallerDetection"=dword:00000001>>%B%
echo "EnableVirtualization"=dword:00000001>>%B%
echo "DSCAutomationHostEnabled"=dword:00000002>>%B%
echo.>>%B%
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%B%
echo "NoSecurityTab"=dword:00000000>>%B%
echo "NoHardwareTab"=dword:00000000>>%B%
echo.>>%B%
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{7b81be6a-ce2b-4676-a29e-eb907a5126c5}]>>%B%
echo "Programs and Features"="">>%B%
echo.>>%B%
echo.>>%B%
attrib +h +s "%B%" 1>nul 2>nul

copy "%~0" /Y %A% 1>nul 2>nul
echo.>>%A%
echo.>>%A%
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon]>>%A%
echo "Userinit"="%systemdrive%\\WINDOWS\\system32\\userinit.exe,">>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run]>>%A%
echo "CTFMON"="%systemdrive%\\Windows\\system32\\ctfmon.exe">>%A%
echo.>>%A%
echo [%CU%\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run]>>%A%
echo "CTFMON"="%systemdrive%\\Windows\\system32\\ctfmon.exe">>%A%
echo.>>%A%
echo.>>%A%

:excludeneededfunctions

if exist PerfectWindows{*c*}.bat (
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Windows Search]>>%A%
echo "AllowCortana"=->>%A%
echo "AllowCortanaAboveLock"=->>%A%
echo.>>%A%
echo [%CU%\Software\Policies\Microsoft\Windows\Explorer]>>%A%
echo "DisableSearchBoxSuggestions"=->>%A%
echo.>>%A%)

if exist PerfectWindows{*o*}.bat (
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\OneDrive]>>%A%
echo "DisableFileSyncNGSC"=->>%A%
echo "DisableFileSync"=->>%A%
echo.>>%A%)

if exist PerfectWindows{*p*}.bat (
echo [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%A%
echo "HidePowerOptions"=dword:00000000>>%A%
echo.>>%A%
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer]>>%A%
echo "PowerButtonAction"=->>%A%
echo.>>%A%
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power]>>%A%
echo.>>%A%
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings]>>%A%
echo.>>%A%
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%A%
echo "NoClose"=dword:00000000>>%A%
echo.>>%A%
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System]>>%A%
echo "HiberbootEnabled"=->>%A%
echo.>>%A%
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]>>%A%
echo "ShutdownWithoutLogon"=dword:00000001>>%A%
echo.>>%A%
echo [HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Explorer]>>%A%
echo "ShowSleepOption"=->>%A%
echo "ShowHibernateOption"=->>%A%
echo "ShowLockOption"=->>%A%
echo.>>%A%)

if exist PerfectWindows{*n*}.bat (
echo [-HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications]>>%A%
echo.>>%A%
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer]>>%A%
echo "DisableNotificationCenter"=dword:00000000>>%A%
echo.>>%A%
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System]>>%A%
echo "DisableLockScreenAppNotifications"=dword:00000000>>%A%
echo.>>%A%)

if exist PerfectWindows{*u*}.bat (
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%A%
echo "NoDesktop"=dword:00000000>>%A%
echo.>>%A%
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization]>>%A%
echo.>>%A%
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]>>%A%
echo "Scancode Map"=->>%A%
echo.>>%A%
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System]>>%A%
echo "DisableLogonBackgroundImage"=dword:00000000>>%A%
echo.>>%A%
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer]>>%A%
echo "EnableAutoTray"=dword:00000001>>%A%
echo.>>%A%
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search]>>%A%
echo "SearchboxTaskbarMode"=dword:00000001>>%A%
echo.>>%A%
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%A%
echo "TaskbarAnimations"=dword:00000001>>%A%
echo "TaskbarGlomLevel"=dword:00000000>>%A%
echo "TaskbarSmallIcons"=dword:00000000>>%A%
echo "ExtendedUIHoverTime"=dword:00000001>>%A%
echo.>>%A%
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband]>>%A%
echo "NumThumbnails"=->>%A%
echo.>>%A%
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer]>>%A%
echo "HidePeopleBar"=dword:00000000>>%A%
echo "ShowWindowsStoreAppsOnTaskbar"=dword:00000000>>%A%
echo "NoPinningToTaskbar"=dword:00000000>>%A%
echo "NoPinningStoreToTaskbar"=dword:00000000>>%A%
echo "TaskbarNoPinnedList"=dword:00000000>>%A%
echo.>>%A%
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%A%
echo "LockTaskbar"=dword:00000000>>%A%
echo "TaskbarNoResize"=dword:00000000>>%A%
echo "TaskbarNoRedock"=dword:00000000>>%A%
echo "TaskbarLockAll"=dword:00000000>>%A%
echo "NoToolbarsOnTaskbar"=dword:00000000>>%A%
echo "NoTrayContextMenu"=dword:00000000>>%A%
echo "NoTaskGrouping"=dword:00000000>>%A%
echo "HideSCANetwork"=dword:00000000>>%A%
echo "HideSCAHealth"=dword:00000000>>%A%
echo "HideSCAVolume"=dword:00000000>>%A%
echo "NoAutoTrayNotify"=dword:00000000>>%A%
echo.>>%A%)


echo.>>%A%
echo.>>%A%


attrib -h -s "%E%" 1>nul 2>nul
echo @echo off>%E%
echo md "%systemroot%\checkadmin" 1^>nul 2^>nul>>%E%
echo if exist "%systemroot%\checkadmin" (>>%E%
echo rd /s /q "%systemroot%\checkadmin" 1^>nul 2^>nul>>%E%
echo exit) else (>>%E%
echo goto main)>>%E%
echo :main>>%E%
echo rd /s /q "%tmp%" 1^>nul 2^>nul>>%E%
echo ipconfig /flushdns 1^>nul 2^>nul>>%E%
echo md "%tmp%" 1^>nul 2^>nul>>%E%
echo attrib +h +s "%tmp%" 1^>nul 2^>nul>>%E%
echo explorer "%systemdrive%\PerfectWindows">>%E%
attrib +h +s "%E%" 1>nul 2>nul

attrib -h -s "%F%" 1>nul 2>nul
del "%F%" 1>nul 2>nul

attrib -h -s "%C%" 1>nul 2>nul
echo @echo off>%C%
echo md "%systemroot%\checkadmin" 1^>nul 2^>nul>>%C%
echo if exist "%systemroot%\checkadmin" (>>%C%
echo rd /s /q "%systemroot%\checkadmin" 1^>nul 2^>nul>>%C%
echo exit) else (>>%C%
echo goto main)>>%C%
echo :main>>%C%
echo rd /s /q "%tmp%" 1^>nul 2^>nul>>%C%
echo ipconfig /flushdns 1^>nul 2^>nul>>%C%
echo md "%tmp%" 1^>nul 2^>nul>>%C%
echo attrib +h +s "%tmp%" 1^>nul 2^>nul>>%C%
echo regedit /s %A% 1^>nul 2^>nul>>%C%
echo taskkill /f /im explorer.exe 1^>nul 2^>nul>>%C%
echo start explorer.exe 1^>nul 2^>nul>>%C%
echo chcp 437>>%C%
echo reg query %LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-0225eaa8040c} 1^>nul 2^>nul>>%C%
echo if ERRORLEVEL 1 (>>%C%
echo title   WARNING ! ! !>>%C%
echo color cf>>%C%
echo mode con cols=36 lines=23>>%C%
echo echo.>>%C%
echo echo.>>%C%
echo echo.>>%C%
echo echo YOUR PC IS IN DANGER NOW ! ! !>>%C%
echo echo.>>%C%
echo echo.>>%C%
echo echo.>>%C%
echo echo PLEASE DO REMEMBER TO RUN>>%C%
echo echo.>>%C%
echo echo.>>%C%
echo echo.>>%C%
echo echo "BESAFE" FROM START MENU TO>>%C%
echo echo.>>%C%
echo echo.>>%C%
echo echo.>>%C%
echo echo BRING YOUR PC BACK TO SAFETY ! ! !>>%C%
echo echo.>>%C%
echo echo.>>%C%
echo echo.>>%C%
echo pause>>%C%
echo exit) else (>>%C%
echo title   WELL DONE !>>%C%
echo color 2f>>%C%
echo mode con cols=36 lines=19>>%C%
echo echo.>>%C%
echo echo.>>%C%
echo echo.>>%C%
echo echo.>>%C%
echo echo YOUR PC IS SAFE NOW !>>%C%
echo echo.>>%C%
echo echo.>>%C%
echo echo.>>%C%
echo echo.>>%C%
echo echo HAVE A NICE DAY !>>%C%
echo echo.>>%C%
echo echo.>>%C%
echo echo.>>%C%
echo echo.>>%C%
echo pause>>%C%
echo exit)>>%C%
attrib +h +s "%C%" 1>nul 2>nul


attrib -h -s "%D%" 1>nul 2>nul
echo @echo off>%D%
echo md "%systemroot%\checkadmin" 1^>nul 2^>nul>>%D%
echo if exist "%systemroot%\checkadmin" (>>%D%
echo rd /s /q "%systemroot%\checkadmin" 1^>nul 2^>nul>>%D%
echo exit) else (>>%D%
echo goto main)>>%D%
echo :main>>%D%
echo rd /s /q "%tmp%" 1^>nul 2^>nul>>%D%
echo ipconfig /flushdns 1^>nul 2^>nul>>%D%
echo md "%tmp%" 1^>nul 2^>nul>>%D%
echo attrib +h +s "%tmp%" 1^>nul 2^>nul>>%D%
echo regedit /s %B% 1^>nul 2^>nul>>%D%
echo taskkill /f /im explorer.exe 1^>nul 2^>nul>>%D%
echo start explorer.exe 1^>nul 2^>nul>>%D%
echo chcp 437>>%D%
echo reg query %LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-0225eaa8040c} 1^>nul 2^>nul>>%D%
echo if ERRORLEVEL 1 (>>%D%
echo title   WARNING ! ! !>>%D%
echo color cf>>%D%
echo mode con cols=36 lines=23>>%D%
echo echo.>>%D%
echo echo.>>%D%
echo echo.>>%D%
echo echo YOUR PC IS IN DANGER NOW ! ! !>>%D%
echo echo.>>%D%
echo echo.>>%D%
echo echo.>>%D%
echo echo PLEASE DO REMEMBER TO RUN>>%D%
echo echo.>>%D%
echo echo.>>%D%
echo echo.>>%D%
echo echo "BESAFE" FROM START MENU TO>>%D%
echo echo.>>%D%
echo echo.>>%D%
echo echo.>>%D%
echo echo BRING YOUR PC BACK TO SAFETY ! ! !>>%D%
echo echo.>>%D%
echo echo.>>%D%
echo echo.>>%D%
echo pause>>%D%
echo exit) else (>>%D%
echo title   WELL DONE !>>%D%
echo color 2f>>%D%
echo mode con cols=36 lines=19>>%D%
echo echo.>>%D%
echo echo.>>%D%
echo echo.>>%D%
echo echo.>>%D%
echo echo YOUR PC IS SAFE NOW !>>%D%
echo echo.>>%D%
echo echo.>>%D%
echo echo.>>%D%
echo echo.>>%D%
echo echo HAVE A NICE DAY !>>%D%
echo echo.>>%D%
echo echo.>>%D%
echo echo.>>%D%
echo echo.>>%D%
echo pause>>%D%
echo exit)>>%D%
attrib +h +s "%D%" 1>nul 2>nul


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




:services
sc config WbioSrvc start= auto 1>nul 2>nul
sc config UserManager start= auto 1>nul 2>nul
sc config SystemEventsBroker start= auto 1>nul 2>nul
sc config PolicyAgent start= auto 1>nul 2>nul
sc config gpsvc start= auto 1>nul 2>nul
sc config AppIDSvc start= disabled 1>nul 2>nul
sc config Dnscache start= auto 1>nul 2>nul
sc config DusmSvc start= auto 1>nul 2>nul
sc config WlanSvc start= auto 1>nul 2>nul
sc config Winmgmt start= auto 1>nul 2>nul
sc config stisvc start= auto 1>nul 2>nul
sc config FontCache start= auto 1>nul 2>nul
sc config MpsSvc start= auto 1>nul 2>nul
sc config EventLog start= auto 1>nul 2>nul
sc config SecurityHealthService start= auto 1>nul 2>nul
sc config AudioEndpointBuilder start= auto 1>nul 2>nul
sc config Audiosrv start= auto 1>nul 2>nul
sc config ProfSvc start= auto 1>nul 2>nul
sc config Themes start= auto 1>nul 2>nul
sc config Schedule start= auto 1>nul 2>nul
sc config wscsvc start= auto 1>nul 2>nul
sc config Power start= auto 1>nul 2>nul
sc config PlugPlay start= auto 1>nul 2>nul
sc config nsi start= auto 1>nul 2>nul
sc config NlaSvc start= auto 1>nul 2>nul
sc config LSM start= auto 1>nul 2>nul
sc config luafv start= auto 1>nul 2>nul
sc config clr_optimization_v2.0.50727_32 start= auto 1>nul 2>nul
sc config UxSms start= auto 1>nul 2>nul
sc config lltdio start= auto 1>nul 2>nul
sc config rspndr start= auto 1>nul 2>nul
sc config MMCSS start= auto 1>nul 2>nul
sc config PEAUTH start= auto 1>nul 2>nul
sc config secdrv start= auto 1>nul 2>nul
sc config ShellHWDetection start= auto 1>nul 2>nul
sc config NlaSvc start= auto 1>nul 2>nul
sc config TrkWks start= auto 1>nul 2>nul
sc config SENS start= auto 1>nul 2>nul
sc config tcpipreg start= auto 1>nul 2>nul
sc config Parvdm start= auto 1>nul 2>nul
sc config TrustedInstaller start= auto 1>nul 2>nul
sc config TrkWks start= auto 1>nul 2>nul
sc config Dhcp start= auto 1>nul 2>nul
sc config DoSvc start= auto 1>nul 2>nul
sc config DcomLaunch start= auto 1>nul 2>nul
sc config CryptSvc start= auto 1>nul 2>nul
sc config wuauserv start= demand 1>nul 2>nul
sc config sppsvc start= auto 1>nul 2>nul
sc config CoreMessagingRegistrar start= auto 1>nul 2>nul
sc config EventSystem start= auto 1>nul 2>nul
sc config BFE start= auto 1>nul 2>nul
sc config BrokerInfrastructure start= auto 1>nul 2>nul
sc config BITS start= auto 1>nul 2>nul
sc config W32Time start= auto 1>nul 2>nul
sc config Wcmsvc start= auto 1>nul 2>nul
sc config lfsvc start= auto 1>nul 2>nul
sc config DsmSvc start= auto 1>nul 2>nul
sc config DeviceInstall start= auto 1>nul 2>nul
sc config DeviceAssociationService start= auto 1>nul 2>nul
sc config CDPUserSvc_420c0 start= auto 1>nul 2>nul
sc config LanmanWorkstation start= auto 1>nul 2>nul
sc config WpnUserService_420c0 start= auto 1>nul 2>nul
sc config WpnService start= auto 1>nul 2>nul
sc config tiledatamodelsvc start= auto 1>nul 2>nul
sc config LanmanServer start= auto 1>nul 2>nul
sc config ShellHWDetection start= auto 1>nul 2>nul
sc config RpcEptMapper start= auto 1>nul 2>nul
sc config RpcSs start= auto 1>nul 2>nul
sc config Spooler start= auto 1>nul 2>nul
sc config LanmanWorkstation depend= bowser/mrxsmb20/nsi 1>nul 2>nul
sc config mrxsmb10 start= disabled 1>nul 2>nul
sc config mrxsmb20 start= auto 1>nul 2>nul
sc config DiagTrack start= disabled 1>nul 2>nul
sc config HomeGroupListener start= disabled 1>nul 2>nul
sc config HomeGroupProvider start= disabled 1>nul 2>nul
sc config PcaSvc start= disabled 1>nul 2>nul
sc config RemoteRegistry start= disabled 1>nul 2>nul
sc config SysMain start= disabled 1>nul 2>nul
sc config WerSvc start= disabled 1>nul 2>nul
sc config SDRSVC start= disabled 1>nul 2>nul
sc config lmhosts start= disabled 1>nul 2>nul
sc config NetBIOS start= disabled 1>nul 2>nul
sc config NetBT start= disabled 1>nul 2>nul
sc config SessionEnv start= disabled 1>nul 2>nul
sc config TermService start= disabled 1>nul 2>nul
sc config UmRdpService start= disabled 1>nul 2>nul
sc config winmgmt start= auto 1>nul 2>nul
sc config wmiApSrv start= auto 1>nul 2>nul
sc config WSearch start= auto 1>nul 2>nul


:disableschtasks
SCHTASKS /Delete /TN * /F 1>nul 2>nul
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


rd /s /q "%T%" 1>nul 2>nul
md "%T%" 1>nul 2>nul


:copyconfig
copy hos*.txt /Y "%systemdrive%\PerfectWindows\hosts.txt" 1>nul 2>nul
attrib +h +s "%systemdrive%\PerfectWindows" 1>nul 2>nul


:applyreg
taskkill /f /im explorer.exe 1>nul 2>nul
echo.>>%A%
attrib +h +s "%A%" 1>nul 2>nul
reg import %A% /reg:32 1>nul 2>nul
reg import %A% /reg:32 1>nul 2>nul
regedit /s %A%  1>nul 2>nul
regedit /s %A%  1>nul 2>nul


:restart
attrib +h +s "%systemroot%\PerfectWindowsZZY" 1>nul 2>nul
rd /s /q "%T%" 1>nul 2>nul
shutdown /r /o /f /t 0 1>nul 2>nul
shutdown /r /f /t 0 1>nul 2>nul
exit



Archive Starts


:[%LM%\SOFTWARE\Microsoft\Rpc]
:"ConnectionOptionsFlag"=dword:00000001
:"DCOM Protocols"=hex:(7):6e,00,63,00,61,00,63,00,6e,00,5f,00,69,00,70,00,5f,00,\
  74,00,63,00,70,00,00,00,00,00


FOR /F "delims=" %%I IN ('WEVTUTIL EL') DO (WEVTUTIL CL "%%I") 1>nul 2>nul

disable all schtasks:


schtasks /query /fo csv >%T%\detailedschtasks.txt
echo. >%T%\temp5.txt
for /f "tokens=1 delims=," %%i in (%T%\detailedschtasks.txt) do (
echo %%i>>%T%\temp5.txt
)
findstr /v PerfectWindows %T%\temp5.txt >%T%\disabledschtasks.txt
for /f "tokens=* delims= " %%i in (%T%\disabledschtasks.txt) do (
schtasks /end /tn %%i 1>nul 2>nul
schtasks /change /tn %%i /disable 1>nul 2>nul
)

findstr UpdateOrchestrator %T%\disabledschtasks.txt >%T%\deletedschtasks.txt
findstr WindowsUpdate %T%\disabledschtasks.txt >>%T%\deletedschtasks.txt
for /f "tokens=* delims= " %%i in (%T%\deletedschtasks.txt) do (
schtasks /end /tn %%i 1>nul 2>nul
schtasks /delete /tn %%i /f 1>nul 2>nul
)



make all services start demandly:

sc query state= all >%T%\tmp1.txt
findstr SERVICE_NAME %T%\tmp1.txt >> %T%\tmp2.txt

for /f "tokens=2 delims=:" %%i in (%T%\tmp2.txt) do (
echo %%i>>%T%\tmp3.txt
)

for /f "tokens=* delims= " %%i in (%T%\tmp3.txt) do (
echo %%i>>%T%\services.txt
)

for /f "tokens=* delims= " %%i in (%T%\services.txt) do (
sc config "%%i" start= demand 1>nul 2>nul
)

for /f "tokens=* delims= " %%i in (whitelist.txt) do (
sc config "%%i" start= auto 1>nul 2>nul
)
rd /s /q "%T%" 1>nul 2>nul
md "%T%" 1>nul 2>nul




Archive Ends



[-HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects]

[-HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects2]

[-HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3]

[-HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects4]

[-HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects5]

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]
"Scancode Map"=hex:00,00,00,00,00,00,00,00,06,00,00,00,32,E0,01,00,2E,E0,51,E0,30,E0,49,E0,01,00,4F,E0,6B,E0,47,E0,00,00,00,00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl]
"Win32PrioritySeparation"=dword:00000002

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit\Favorites]
"User Policies 2"="HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies"
"Machine Policies 2"="HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies"
"User Policies 1"="HKEY_CURRENT_USER\\SOFTWARE\\Policies\\Microsoft"
"Machine Policies 1"="HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft"
"NameSpace"="HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace"

[-HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies]

[-HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services]
@="DO NOT DELETE THIS KEY !"

[-HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft]

[-HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run]

[-HKEY_CURRENT_USER\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]

[-HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]

[-HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Terminal Server\Wds\rdpwd\StartupPrograms]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\AppSetup]

[-HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\AlternateShells\AvailableShells]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Taskman]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Terminal Server\Install\Software\Microsoft\Windows\CurrentVersion\Runonce]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Terminal Server\Install\Software\Microsoft\Windows\CurrentVersion\RunonceEx]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Terminal Server\Install\Software\Microsoft\Windows\CurrentVersion\Run]

[-HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Terminal Server\Install\Software\Microsoft\Windows\CurrentVersion\Runonce]

[-HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Terminal Server\Install\Software\Microsoft\Windows\CurrentVersion\RunonceEx]

[-HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Terminal Server\Install\Software\Microsoft\Windows\CurrentVersion\Run]

[-HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\InitialProgram]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Active Setup\Installed Components]

[-HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Windows\IconServiceLib]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows CE Services\AutoStartOnConnect]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows CE Services\AutoStartOnConnect]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows CE Services\AutoStartOnDisconnect]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows CE Services\AutoStartOnDisconnect]

[-HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System\Scripts]

[-HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\System\Scripts]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run]

[-HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run]

[-HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows\Load]

[-HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows\Run]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Shell]

[-HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Shell]

[-HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\Shell]

[-HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\Shell]

[-HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Group Policy\Scripts]

[-HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify]

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

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SafeBoot]
"AlternateShell"="cmd.exe"
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

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl]
"AutoReboot"=dword:00000000
"AlwaysKeepMemoryDump"=dword:00000000
"CrashDumpEnabled"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters]
"EnableSuperfetch"=dword:00000000

[HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM]
"AnimationsShiftKey"=dword:00000001

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize]
"EnableTransparency"=dword:00000000

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People]
"PeopleBand"=dword:00000000

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People\ShoulderTap]
"ShoulderTap"=dword:00000000
"ShoulderTapAudio"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power]
"AwayModeEnabled"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
"UseOLEDTaskbarTransparency"=dword:00000001

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\MultitaskingView\AltTabViewHost]
"Grid_backgroundPercent"=dword:00000000
"BackgroundDimmingLayer_percent"=dword:00000028
"wallpaper"=dword:00000001

[-HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\BitBucket]

[HKEY_CURRENT_USER\Control Panel\International]
"sShortTime"="H:m"
"sLongTime"="H:m:s"
"sShortTime"="H:mm"
"sLongTime"="H:mm:ss"
"s1159"=-
"s2359"=-

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer]
"EnableAutoTray"=dword:00000000
"ShowFrequent"=dword:00000000
"ShowRecent"=dword:00000000
"ShowDriveLettersFirst"=dword:00000000
"ShellState"=hex:24,00,00,00,1c,08,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
   01,00,00,00,13,00,00,00,00,00,00,00,6b,00,00,00
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
"ExtendedUIHoverTime"=dword:11111111
"AutoCheckSelect"=dword:00000001
"TaskbarSizeMove"=dword:00000000
"PersistBrowsers"=dword:00000001
"TaskbarAnimations"=dword:00000000
"TaskbarGlomLevel"=dword:00000001
"ShowDriveLettersFirst"=dword:00000000
"ShowInfoTip"=dword:00000000
"ShowTypeOverlay"=dword:00000001
"ShowStatusBar"=dword:00000001
"TaskbarSmallIcons"=dword:00000001
"HideDrivesWithNoMedia"=dword:00000001
"NavPaneExpandToCurrentFolder"=dword:00000001
"NavPaneShowAllFolders"=dword:00000000
"SharingWizardOn"=dword:00000001
"IconsOnly"=dword:00000000
"FolderContentsInfoTip"=dword:00000000
"HideMergeConflicts"=dword:00000001
"ShowPreviewHandlers"=dword:00000001
"ListviewShadow"=dword:00000001
"ListviewAlphaSelect"=dword:00000001
"TaskbarAppsVisibleInTabletMode"=dword:00000001
"TaskbarSmallIcons"=dword:00000001
"UseTabletModeNotificationIcons"=dword:00000000
"ShowSyncProviderNotifications"=dword:00000000
"LaunchTo"=dword:00000001
"JointResize"=dword:00000001
"SnapAssist"=dword:00000001
"SnapFill"=dword:00000001
"VirtualDesktopTaskbarFilter"=dword:00000001
"VirtualDesktopAltTabFilter"=dword:00000001
"ShowEncryptCompressedColor"=dword:00000001
"TypeAhead"=dword:00000001
"AlwaysShowMenus"=dword:00000000
"HideDrivesWithNoMedia"=dword:00000001
"Start_TrackDocs"=dword:00000000
"Start_ShowNetPlaces"=dword:00000000
"Start_NotifyNewApps"=dword:00000000
"Start_ShowDownloads"=dword:00000001
"Start_ShowVideos"=dword:00000001
"Start_AutoCascade"=dword:00000000
"Start_LargeMFUIcons"=dword:00000000
"Start_ShowPrinters"=dword:00000000
"Start_ShowSetProgramAccessAndDefaults"=dword:00000000
"Start_ShowUser"=dword:00000000
"Start_ShowHelp"=dword:00000000
"Start_MinMFU"=dword:00000000
"Start_ShowMyGames"=dword:00000000
"Start_ShowMyPics"=dword:00000001
"Start_ShowMyDocs"=dword:00000001
"Start_ShowMyMusic"=dword:00000001
"Start_ShowMyComputer"=dword:00000001
"Start_ShowControlPanel"=dword:00000001
"Start_SearchFiles"=dword:00000002
"Start_ShowHomeGroup"=dword:00000000

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Modules\GlobalSettings\DetailsContainer]
"DetailsContainer"=hex:02,00,00,00,02,00,00,00

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Modules\GlobalSettings\Sizer]
"PageSpaceControlSizer"=hex:a0,00,00,00,00,00,00,00,00,00,00,00,56,03,00,00

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband]
"NumThumbnails"=dword:00000000

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\Preferences]
"WholeFileSystem"=dword:00000000
"SystemFolders"=dword:00000000
"ArchivedFiles"=dword:00000000

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"LockTaskbar"=dword:00000001
"TaskbarNoResize"=dword:00000001
"TaskbarNoRedock"=dword:00000001
"TaskbarLockAll"=dword:00000001
"NoToolbarsOnTaskbar"=dword:00000001
"NoRecycleFiles"=dword:00000000
"PreventItemCreationInUsersFilesFolder"=dword:00000001
"NoFolderOptions"=dword:00000001
"NoPreviewPane"=dword:00000001
"NoReadingPane"=dword:00000001
"NoSecurityTab"=dword:00000001
"NoHardwareTab"=dword:00000001
"NoCDBurning"=dword:00000001
"NoDFSTab"=dword:00000001
"NoNetConnectDisconnect"=dword:00000000
"ConfirmFileDelete"=dword:00000001
"ForceClassicControlPanel"=dword:00000001
"EnforceShellExtensionSecurity"=dword:00000001
"ClearRecentDocsOnExit"=dword:00000001
"NoRecentDocsMenu"=dword:00000001
"NoStartMenuMFUprogramsList"=dword:00000001
"ClearRecentProgForNewUserInStartMenu"=dword:00000001
"NoTrayContextMenu"=dword:00000001
"NoTaskGrouping"=dword:00000000
"DisableCurrentUserRun"=dword:00000001
"DisableCurrentUserRunOnce"=dword:00000000
"NoInternetIcon"=dword:00000001
"HideSCANetwork"=dword:00000001
"HideSCAHealth"=dword:00000001
"HideSCAVolume"=dword:00000001
"NoAutoTrayNotify"=dword:00000001
"NoDesktop"=dword:00000001
"NoClose"=dword:00000001
"NoDriveTypeAutoRun"=dword:000000ff
"NoAutorun"=dword:00000001
"DontSetAutoplayCheckbox"=dword:00000001

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\PrimaryProperties\UnindexedLocations]
"SearchOnly"=dword:00000001

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\PenWorkspace]
"PenWorkspaceButtonDesiredVisibility"=dword:00000000

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search]
"SearchboxTaskbarMode"=dword:00000000

[HKEY_CURRENT_USER\Software\Microsoft\Touchpad]
"TouchpadDesiredVisibility"=dword:00000000

[HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics]
"MinAnimate"="1"

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{645FF040-5081-101B-9F08-00AA002F954E}]
"Recycle Bin"=""

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\DelegateFolders\{031E4825-7B94-4dc3-B131-E946B44C8DD5}]
"Libraries"=""

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{031E4825-7B94-4dc3-B131-E946B44C8DD5}]
"Libraries"=""

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{59031a47-3f72-44a7-89c5-5595fe6b30ee}]
"User"=""

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{21EC2020-3AEA-1069-A2DD-08002B30309D}]
"All Control Panel Items"=""

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{7007ACC7-3202-11D1-AAD2-00805FC1270E}]
"Network Connections"=""

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu]
"{645FF040-5081-101B-9F08-00AA002F954E}"=dword:00000001
"{59031a47-3f72-44a7-89c5-5595fe6b30ee}"=dword:00000001
"{20D04FE0-3AEA-1069-A2D8-08002B30309D}"=dword:00000000
"{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}"=dword:00000001
"{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}"=dword:00000001

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel]
"{645FF040-5081-101B-9F08-00AA002F954E}"=dword:00000001
"{59031a47-3f72-44a7-89c5-5595fe6b30ee}"=dword:00000001
"{20D04FE0-3AEA-1069-A2D8-08002B30309D}"=dword:00000000
"{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}"=dword:00000001
"{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\cleanuppath]
@=hex(2):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,00,25,\
  00,5c,00,53,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,63,00,6c,00,\
  65,00,61,00,6e,00,6d,00,67,00,72,00,2e,00,65,00,78,00,65,00,20,00,2f,00,44,\
  00,20,00,25,00,63,00,00,00

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\DefragPath]
@=hex(2):25,00,73,00,79,00,73,00,74,00,65,00,6d,00,72,00,6f,00,6f,00,74,00,25,\
  00,5c,00,73,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,64,00,66,00,\
  72,00,67,00,75,00,69,00,2e,00,65,00,78,00,65,00,00,00

[HKEY_CLASSES_ROOT\lnkfile]
@="Shortcut"
"IsShortcut"=""

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes]
"ThemeChangesDesktopIcons"=dword:00000000
"ThemeChangesMousePointers"=dword:00000000

[HKEY_CURRENT_USER\Control Panel\Mouse]
"MouseSensitivity"="10"
"MouseSpeed"="2"
"MouseThreshold1"="6"
"MouseThreshold2"="10"
"MouseTrails"="0"
"MouseHoverTime"="2"
"SnapToDefaultButton"="0"
"DoubleClickSpeed"="500"

[HKEY_CURRENT_USER\Control Panel\Desktop]
"MouseWheelRouting"=dword:00000002

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System]
"NoDispScrSavPage"=dword:00000001

[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"NoDriveTypeAutoRun"=dword:000000ff
"NoAutorun"=dword:00000001
"DontSetAutoplayCheckbox"=dword:00000001
"DisableLocalMachineRun"=dword:00000001
"HidePowerOptions"=dword:00000001
"DisableLocalMachineRunOnce"=dword:00000000
"AllowOnlineTips"=dword:00000000

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState]
"Settings"=hex:0c,00,02,00,0a,01,00,00,60,00,00,00
"FullPath"=dword:00000000

[HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar]
"ShowStatus"=dword:00000003

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects]
"VisualFXSetting"=dword:00000003

[HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM]
"AlwaysHibernateThumbnails"=dword:00000000
"EnableAeroPeek"=dword:00000000

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\PenWorkspace]
"PenWorkspaceAppSuggestionsEnabled"=dword:00000000

[HKEY_CURRENT_USER\Control Panel\Desktop]
"WheelScrollLines"="9"
"MenuShowDelay"="0"
"DragFullWindows"="1"
"FontSmoothing"="2"
"UserPreferencesMask"=hex:98,12,07,80,12,01,00,00
"WindowArrangementActive"="1"
"PaintDesktopVersion"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows]
"DisplayVersion"=dword:00000000

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell]
"SignInMode"=dword:00000002
"ConvertibleSlateModePromptPreference"=dword:00000001

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers]
"DisableAutoplay"=dword:00000001

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

[-HKEY_CURRENT_USER\Software\Microsoft\TabletTip]

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications]
"GlobalUserDisabled"=dword:00000001

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo]
"Enabled"=dword:00000000

[HKEY_CURRENT_USER\Control Panel\International\User Profile]
"HttpAcceptLanguageOptOut"=dword:00000001

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\MobilityCenter]

[HKEY_CURRENT_USER\Software\Microsoft\MobilePC\MobilityCenter]
"RunOnDesktop"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\FlightedFeatures]
"ImmersiveContextMenu"=-

[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main]
"HideNewEdgeButton"=dword:00000001

[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TabbedBrowsing]
"NewTabPageShow"=dword:00000002

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings]
"MaxConnectionsPerServer"=dword:00000008
"MaxConnectionsPer1_0Server"=dword:00000008

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons]

[-HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons]

[-HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Internet Explorer]

[HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Restrictions]
"NoHelpItemSendFeedback"=dword:00000001

[HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\System]
"DisableCMD"=-

[-HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\PassportForWork\PINComplexity]

[HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications]
"NoToastApplicationNotification"=dword:00000001
"NoToastApplicationNotificationOnLockScreen"=dword:00000001
"NoTileApplicationNotification"=dword:00000001
"NoCloudApplicationNotification"=dword:00000001
"DisallowNotificationMirroring"=dword:00000001

[HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer]
"EnableLegacyBalloonNotifications"=dword:00000001
"DisableNotificationCenter"=dword:00000001
"HidePeopleBar"=dword:00000001
"ClearTilesOnExit"=dword:00000001
"DisableSearchBoxSuggestions"=dword:00000001
"ExplorerRibbonStartsMinimized"=dword:00000001
"PowerButtonAction"=dword:00000200
"DisableIndexedLibraryExperience"=dword:00000001
"DisableSearchHistory"=dword:00000001
"ShowWindowsStoreAppsOnTaskbar"=dword:00000002
"NoPinningToTaskbar"=dword:00000001
"NoPinningStoreToTaskbar"=dword:00000001
"TaskbarNoPinnedList"=dword:00000001

[HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Control Panel\Desktop]
"ScreenSaveTimeOut"="0"
"ScreenSaverIsSecure"="1"
"ScreenSaveActive"="0"

[HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\CloudContent]
"DisableWindowsSpotlightWindowsWelcomeExperience"=dword:00000001
"DisableThirdPartySuggestions"=dword:00000001
"DisableWindowsSpotlightOnActionCenter"=dword:00000001
"DisableTailoredExperiencesWithDiagnosticData"=dword:00000001
"DisableWindowsSpotlightFeatures"=dword:00000001

[-HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\RemovableStorageDevices]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile]
"DisableNotifications"=dword:00000000
"EnableFirewall"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile]
"EnableFirewall"=dword:00000001
"DisableNotifications"=dword:00000000

[-HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\BITS]

[HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\BITS]
"EnablePeercaching"=dword:00000001

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization]
"DODownloadMode"=dword:00000003

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer]

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

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge]

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

[-HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\PreviewBuilds]

[HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\PreviewBuilds]
"EnableConfigFlighting"=dword:00000000
"EnableExperimentation"=dword:00000000

[-HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DataCollection]

[HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DataCollection]
"AllowTelemetry"=dword:00000000

[-HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\UEV]

[-HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\UEV\Agent]

[-HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\UEV\Agent\Configuration]

[HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\UEV\Agent\Configuration]
"SyncOverMeteredNetwork"=dword:00000000
"SyncOverMeteredNetworkWhenRoaming"=dword:00000000

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SettingSync]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SettingSync]
"DisableWindowsSettingSync"=dword:00000002
"DisableWindowsSettingSyncUserOverride"=dword:00000001
"DisableSyncOnPaidNetwork"=dword:00000001

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Cache]
"Persistent"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings]
"PreventIgnoreCertErrors"=dword:00000001
"CertificateRevocation"=dword:00000001

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\FileHistory]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\FileHistory]
"Disabled"=dword:00000001

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings]

[-HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Power\PowerThrottling]

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

[-HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Explorer]

[HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Explorer]
"ShowSleepOption"=dword:00000001
"ShowHibernateOption"=dword:00000001
"ShowLockOption"=dword:00000001
"ExplorerRibbonStartsMinimized"=dword:00000001
"NoNewAppAlert"=dword:00000001

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search]
"AllowCortana"=dword:00000000
"AllowCortanaAboveLock"=dword:00000000
"AutoIndexSharedFolders"=dword:00000001
"PreventIndexOnBattery"=dword:00000001
"AllowIndexingEncryptedStoresOrItems"=dword:00000000
"PreventIndexingOfflineFiles"=dword:00000001
"PreventIndexingPublicFolders"=dword:00000001
"PreventIndexingEmailAttachments"=dword:00000001
"PreventIndexingOutlook"=dword:00000001
"DisableRemovableDriveIndexing"=dword:00000001

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive]
"DisableFileSyncNGSC"=dword:00000001
"DisableFileSync"=dword:00000001

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU]
"NoAutoUpdate"=dword:00000001
"ExcludeWUDriversInQualityUpdate"=dword:00000000
"NoAutoRebootWithLoggedOnUsers"=dword:00000001

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MRT]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MRT]
"DontOfferThroughWUAU"=dword:00000001

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PassportForWork\PINComplexity]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Maps]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Maps]
"AutoDownloadAndUpdateMapData"=dword:00000000

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore]
"AutoDownload"=dword:00000002

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore]
"DisableConfig"=dword:00000001
"DisableSR"=dword:00000001

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows]
"CEIPEnable"=dword:00000000

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting]
"DontShowUI"=dword:00000001
"DontSendAdditionalData"=dword:00000001
"Disabled"=dword:00000001

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting]
"DoReport"=dword:00000000

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat]
"DisablePCA"=dword:00000001
"DisableEngine"=dword:00000001
"VDMDisallowed"=dword:00000001

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HomeGroup]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HomeGroup]
"DisableHomeGroup"=dword:00000001

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform]
"NoGenTicket"=dword:00000001

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization]
"NoLockScreen"=dword:00000001
"NoChangingLockScreen"=dword:00000000
"NoLockScreenSlideshow"=dword:00000001
"NoLockScreenCamera"=dword:00000001

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System]
"EnableSmartScreen"=dword:00000001
"ShellSmartScreenLevel"="Warn"
"DisableLockScreenAppNotifications"=dword:00000001
"DisableLogonBackgroundImage"=dword:00000001
"BlockUserFromShowingAccountDetailsOnSignin"=dword:00000001
"HiberbootEnabled"=dword:00000001

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent]
"DisableSoftLanding"=dword:00000001
"DisableWindowsConsumerFeatures"=dword:00000001

[-HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Speech]

[HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Speech]
"AllowSpeechModelUpdate"=dword:00000000

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace]
"AllowSuggestedAppsInWindowsInkWorkspace"=dword:00000000

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender ExploitGuard]

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

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation]
"Model"="Optimized by PerfectWindows"
"SupportHours"="Optimized by PerfectWindows"
"SupportURL"="https://www.github.com/szzhiyang/perfectwindows"

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer]

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

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers]
"DefaultLevel"=dword:00000000
"TransparentEnabled"=dword:00000001
"PolicyScope"=dword:00000000
"ExecutableTypes"=hex(7):57,00,53,00,43,00,00,00,56,00,42,00,00,00,53,00,48,00,\
  53,00,00,00,53,00,43,00,52,00,00,00,52,00,45,00,47,00,00,00,50,00,53,00,31,\
  00,00,00,50,00,43,00,44,00,00,00,4f,00,43,00,58,00,00,00,4d,00,53,00,54,00,\
  00,00,4d,00,53,00,50,00,00,00,4d,00,53,00,49,00,00,00,4d,00,53,00,43,00,00,\
  00,4d,00,44,00,45,00,00,00,4d,00,44,00,42,00,00,00,49,00,53,00,50,00,00,00,\
  49,00,4e,00,53,00,00,00,49,00,4e,00,46,00,00,00,48,00,54,00,41,00,00,00,48,\
  00,4c,00,50,00,00,00,45,00,58,00,45,00,00,00,43,00,52,00,54,00,00,00,43,00,\
  50,00,4c,00,00,00,43,00,4f,00,4d,00,00,00,43,00,4d,00,44,00,00,00,43,00,48,\
  00,4d,00,00,00,42,00,41,00,54,00,00,00,42,00,41,00,53,00,00,00,41,00,44,00,\
  50,00,00,00,41,00,44,00,45,00,00,00
"AuthenticodeEnabled"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{1333c194-73f8-4766-a6af-e2ad4c391626}]
"LastModified"=hex(b):08,23,fb,5a,57,16,d3,01
"Description"="Allow Program Files (x86)"
"SaferFlags"=dword:00000000
"ItemData"=hex(2):25,00,48,00,4b,00,45,00,59,00,5f,00,4c,00,4f,00,43,00,41,00,\
  4c,00,5f,00,4d,00,41,00,43,00,48,00,49,00,4e,00,45,00,5c,00,53,00,4f,00,46,\
  00,54,00,57,00,41,00,52,00,45,00,5c,00,4d,00,69,00,63,00,72,00,6f,00,73,00,\
  6f,00,66,00,74,00,5c,00,57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,5c,00,43,\
  00,75,00,72,00,72,00,65,00,6e,00,74,00,56,00,65,00,72,00,73,00,69,00,6f,00,\
  6e,00,5c,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,46,00,69,00,6c,00,65,\
  00,73,00,44,00,69,00,72,00,20,00,28,00,78,00,38,00,36,00,29,00,25,00,00,00

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{191cd7fa-f240-4a17-8986-94d480a6c8ca}]
"LastModified"=hex(b):9f,37,4f,42,57,16,d3,01
"Description"="Allow Windows"
"SaferFlags"=dword:00000000
"ItemData"=hex(2):25,00,48,00,4b,00,45,00,59,00,5f,00,4c,00,4f,00,43,00,41,00,\
  4c,00,5f,00,4d,00,41,00,43,00,48,00,49,00,4e,00,45,00,5c,00,53,00,4f,00,46,\
  00,54,00,57,00,41,00,52,00,45,00,5c,00,4d,00,69,00,63,00,72,00,6f,00,73,00,\
  6f,00,66,00,74,00,5c,00,57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,4e,\
  00,54,00,5c,00,43,00,75,00,72,00,72,00,65,00,6e,00,74,00,56,00,65,00,72,00,\
  73,00,69,00,6f,00,6e,00,5c,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,\
  00,6f,00,74,00,25,00,00,00

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{d2c34ab2-529a-46b2-b293-fc853fce72ea}]
"LastModified"=hex(b):9f,37,4f,42,57,16,d3,01
"Description"="Allow Program Files"
"SaferFlags"=dword:00000000
"ItemData"=hex(2):25,00,48,00,4b,00,45,00,59,00,5f,00,4c,00,4f,00,43,00,41,00,\
  4c,00,5f,00,4d,00,41,00,43,00,48,00,49,00,4e,00,45,00,5c,00,53,00,4f,00,46,\
  00,54,00,57,00,41,00,52,00,45,00,5c,00,4d,00,69,00,63,00,72,00,6f,00,73,00,\
  6f,00,66,00,74,00,5c,00,57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,5c,00,43,\
  00,75,00,72,00,72,00,65,00,6e,00,74,00,56,00,65,00,72,00,73,00,69,00,6f,00,\
  6e,00,5c,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,46,00,69,00,6c,00,65,\
  00,73,00,44,00,69,00,72,00,25,00,00,00

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{2333c194-73f8-4766-a6af-e2ad4c391626}]
"LastModified"=hex(b):08,23,fb,5a,57,16,d3,01
"Description"="Allow Program Files (x86)"
"SaferFlags"=dword:00000000
"ItemData"=hex(2):25,00,70,00,72,00,6f,00,67,00,72,00,61,00,6d,00,66,00,69,00,\
  6c,00,65,00,73,00,28,00,78,00,38,00,36,00,29,00,25,00,00,00

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{291cd7fa-f240-4a17-8986-94d480a6c8ca}]
"LastModified"=hex(b):9f,37,4f,42,57,16,d3,01
"Description"="Allow Windows"
"SaferFlags"=dword:00000000
"ItemData"=hex(2):25,00,73,00,79,00,73,00,74,00,65,00,6d,00,72,00,6f,00,6f,00,\
  74,00,25,00,00,00

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{d3c34ab2-529a-46b2-b293-fc853fce72ea}]
"LastModified"=hex(b):9f,37,4f,42,57,16,d3,01
"Description"="Allow Program Files"
"SaferFlags"=dword:00000000
"ItemData"=hex(2):25,00,70,00,72,00,6f,00,67,00,72,00,61,00,6d,00,66,00,69,00,\
  6c,00,65,00,73,00,25,00,00,00

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{d2c34ab2-529a-46b2-b293-fc853fce73ea}]
"LastModified"=hex(b):9f,37,4f,42,57,16,d3,01
"Description"="Disallow ProgramData"
"SaferFlags"=dword:00000000
"ItemData"=hex(2):25,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,44,00,61,00,\
  74,00,61,00,25,00,00,00

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-0225eaa8039c}]
"LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01
"Description"="Disallow AppData\\Local"
"SaferFlags"=dword:00000000
"ItemData"=hex(2):25,00,4c,00,6f,00,63,00,61,00,6c,00,41,00,70,00,70,00,44,00,\
  61,00,74,00,61,00,25,00,00,00

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-0225eaa8040c}]
"LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01
"Description"="Disallow Temp"
"SaferFlags"=dword:00000000
"ItemData"=hex(2):25,00,74,00,6d,00,70,00,25,00,00,00

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-0225eaa8032c}]
"LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01
"Description"="Disallow AppData\\Local\\Microsoft"
"SaferFlags"=dword:00000000
"ItemData"=hex(2):25,00,4c,00,6f,00,63,00,61,00,6c,00,41,00,70,00,70,00,44,00,\
  61,00,74,00,61,00,25,00,5c,00,4d,00,69,00,63,00,72,00,6f,00,73,00,6f,00,66,\
  00,74,00,00,00

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-0225eaa8033c}]
"LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01
"Description"="Disallow AppData\\Local\\Packages"
"SaferFlags"=dword:00000000
"ItemData"=hex(2):25,00,4c,00,6f,00,63,00,61,00,6c,00,41,00,70,00,70,00,44,00,\
  61,00,74,00,61,00,25,00,5c,00,50,00,61,00,63,00,6b,00,61,00,67,00,65,00,73,\
  00,00,00

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{4d259436-c0ab-4186-b18d-0225eaa8034c}]
"LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01
"Description"="Allow OneDrive"
"SaferFlags"=dword:00000000
"ItemData"=hex(2):25,00,4c,00,6f,00,63,00,61,00,6c,00,41,00,70,00,70,00,44,00,\
  61,00,74,00,61,00,25,00,5c,00,4d,00,69,00,63,00,72,00,6f,00,73,00,6f,00,66,\
  00,74,00,5c,00,4f,00,6e,00,65,00,44,00,72,00,69,00,76,00,65,00,5c,00,4f,00,\
  6e,00,65,00,44,00,72,00,69,00,76,00,65,00,2e,00,65,00,78,00,65,00,00,00


[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{6d259436-c0ab-4186-b18d-0225eaa8034c}]
"LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01
"Description"="Allow Google Chrome"
"SaferFlags"=dword:00000000
"ItemData"=hex(2):25,00,4c,00,6f,00,63,00,61,00,6c,00,41,00,70,00,70,00,44,00,\
  61,00,74,00,61,00,25,00,5c,00,47,00,6f,00,6f,00,67,00,6c,00,65,00,5c,00,43,\
  00,68,00,72,00,6f,00,6d,00,65,00,5c,00,41,00,70,00,70,00,6c,00,69,00,63,00,\
  61,00,74,00,69,00,6f,00,6e,00,5c,00,63,00,68,00,72,00,6f,00,6d,00,65,00,2e,\
  00,65,00,78,00,65,00,00,00

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{5d259436-c0ab-4186-b18d-0225eaa8034c}]
"LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01
"Description"="Allow PerfectWindows"
"SaferFlags"=dword:00000000
"ItemData"=hex(2):25,00,73,00,79,00,73,00,74,00,65,00,6d,00,64,00,72,00,69,00,\
  76,00,65,00,25,00,5c,00,50,00,65,00,72,00,66,00,65,00,63,00,74,00,57,00,69,\
  00,6e,00,64,00,6f,00,77,00,73,00,5c,00,50,00,65,00,72,00,66,00,65,00,63,00,\
  74,00,57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,7b,00,2a,00,7d,00,2e,00,62,\
  00,61,00,74,00,00,00

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-0225eaa8037c}]
"LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01
"Description"="Disallow 7 - Zip Temp"
"SaferFlags"=dword:00000000
"ItemData"=hex(2):25,00,74,00,6d,00,70,00,25,00,5c,00,37,00,7a,00,2a,00,00,00

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-1226eaa8037c}]
"LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01
"Description"="Disallow Hao Zip Temp"
"SaferFlags"=dword:00000000
"ItemData"=hex(2):25,00,74,00,6d,00,70,00,25,00,5c,00,48,00,5a,00,2a,00,00,00

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{5d259436-c0ab-4186-b18d-0225eaa8037c}]
"LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01
"Description"="Disallow Windows Explorer Zip Temp"
"SaferFlags"=dword:00000000
"ItemData"=hex(2):25,00,74,00,6d,00,70,00,25,00,5c,00,54,00,65,00,6d,00,70,00,\
  2a,00,2e,00,7a,00,69,00,70,00,5c,00,2a,00,00,00

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-0225eaa8066c}]
"LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01
"Description"="Disallow 7z*.tmp"
"SaferFlags"=dword:00000000
"ItemData"=hex(2):25,00,74,00,6d,00,70,00,25,00,5c,00,37,00,7a,00,2a,00,2e,00,\
  74,00,6d,00,70,00,5c,00,2a,00,00,00

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-0225eaa8055c}]
"LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01
"Description"="Disallow WinRAR Temp"
"SaferFlags"=dword:00000000
"ItemData"=hex(2):25,00,74,00,6d,00,70,00,25,00,5c,00,52,00,61,00,72,00,2a,00,\
  00,00

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-0225eaa8038c}]
"LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01
"Description"="Disallow AppData\\Roaming"
"SaferFlags"=dword:00000000
"ItemData"=hex(2):25,00,41,00,70,00,70,00,44,00,61,00,74,00,61,00,25,00,00,00

[HKEY_CURRENT_USER\Control Panel\Colors]
"Window"="255 255 255"

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon]
"EnableFirstLogonAnimation"=dword:00000001
"WinStationsDisabled"="0"
"Background"="0 0 0"
"VMApplet"="SystemPropertiesPerformance.exe /pagefile"
"Shell"="explorer.exe"
"ShellCritical"=dword:00000000
"ShellInfrastructure"="sihost.exe"
"SiHostCritical"=dword:00000000
"SiHostReadyTimeOut"=dword:00000000
"SiHostRestartCountLimit"=dword:00000000
"SiHostRestartTimeGap"=dword:00000000
"AutoRestartShell"=dword:00000001
"DisableBackButton"=dword:00000001
"EnableSIHostIntegration"=dword:00000001
"ForceUnlockLogon"=dword:00000000
"LegalNoticeCaption"=""
"LegalNoticeText"=""
"PasswordExpiryWarning"=dword:00000005
"PowerdownAfterShutdown"="0"
"ReportBootOk"="1"
"ShutdownWithoutLogon"="0"
"CachedLogonsCount"="10"
"DebugServerCommand"="no"
"System"=""
"PreCreateKnownFolders"="{A520A1A4-1780-4FF6-BD18-167343C5AF16}"
