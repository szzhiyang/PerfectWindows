@echo off
mode con cols=45 lines=7
color fc
pushd "%~dp0"
chcp 437 1>nul 2>nul
(echo check>"%systemroot%"\check.check) 1>nul 2>nul
if exist "%systemroot%"\check.check (
del "%systemroot%"\check.check 1>nul 2>nul
goto main) else (
title   ERROR !
mode con cols=70 lines=7
color fc
echo.
echo Elevated privileges are required to optimize Windows !
echo.
echo Please right click on me and click on "Run as administrator".
echo.
pause
exit
)


:main
mode con cols=45 lines=7
title READY ?
color fc
pushd "%~dp0"
chcp 437 1>nul 2>nul
echo.
echo To ensure the optimization works,
echo your PC will be restarted automatically.
echo.
echo If you are ready to restart your PC,
pause
taskkill /f /im explorer.exe 1>nul 2>nul
bcdedit /set {default} bootmenupolicy legacy 1>nul 2>nul
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
set P=%systemroot%\PerfectWindows
set T=%systemroot%\PerfectWindowsTemp
set LM=HKEY_LOCAL_MACHINE
set CU=HKEY_CURRENT_USER
set A=%P%\Core.reg
set B=%P%\ClearSoftwareRestrictionPolicies.reg
rd /s /q %P% 1>nul 2>nul
rd /s /q %T% 1>nul 2>nul
md %P% 1>nul 2>nul
md %T% 1>nul 2>nul
md %LocalAppdata%\PerfectWindows 1>nul 2>nul
powercfg /hibernate /size 75 1>nul 2>nul
powercfg /hibernate /type full 1>nul 2>nul
rd /s /q %T% 1>nul 2>nul
md %P% 1>nul 2>nul
md %T% 1>nul 2>nul
powercfg /hibernate /size 75 1>nul 2>nul
powercfg /hibernate /type full 1>nul 2>nul




:services
title OPTIMIZING . . .
mode con cols=45 lines=7
color fc
echo.
echo.
echo.
echo OPTIMIZING SERVICES . . .
echo.
echo.
del %T%\tmp1.txt 1>nul 2>nul
del %T%\tmp2.txt 1>nul 2>nul
del %T%\tmp3.txt 1>nul 2>nul
del %T%\services.txt 1>nul 2>nul
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

del %T%\tmp1.txt 1>nul 2>nul
del %T%\tmp2.txt 1>nul 2>nul
del %T%\tmp3.txt 1>nul 2>nul


sc config etdservice start= auto 1>nul 2>nul
sc config ClickToRunSvc start= auto 1>nul 2>nul


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
sc config LanmanWorkstation depend= bowser/nsi 1>nul 2>nul
sc config mrxsmb10 start= disabled 1>nul 2>nul
sc config mrxsmb20 start= disabled 1>nul 2>nul
sc config DiagTrack start= disabled 1>nul 2>nul
sc config HomeGroupListener start= disabled 1>nul 2>nul
sc config HomeGroupProvider start= disabled 1>nul 2>nul
sc config iphlpsvc start= disabled 1>nul 2>nul
sc config PcaSvc start= disabled 1>nul 2>nul
sc config RemoteRegistry start= disabled 1>nul 2>nul
sc config SysMain start= disabled 1>nul 2>nul
sc config WerSvc start= disabled 1>nul 2>nul
sc config LanmanWorkstation start= disabled 1>nul 2>nul
sc config LanmanServer start= disabled 1>nul 2>nul
sc config SDRSVC start= disabled 1>nul 2>nul
sc config lmhosts start= disabled 1>nul 2>nul
sc config NetBIOS start= disabled 1>nul 2>nul
sc config NetBT start= disabled 1>nul 2>nul
sc config winmgmt start= auto 1>nul 2>nul
sc config wmiApSrv start= auto 1>nul 2>nul
sc config WSearch start= auto 1>nul 2>nul



:makereg
title OPTIMIZING . . .
mode con cols=45 lines=7
color fc
echo.
echo.
echo.
echo OPTIMIZING WINDOWS SETTINGS . . .
echo.
echo.


echo explorer %LocalAppdata%\PerfectWindows\>%systemroot%\beperfect.bat


echo @echo off>%systemroot%\besafe.bat
echo taskkill /f /im explorer.exe 1^>nul 2^>nul>>%systemroot%\besafe.bat
echo start regedit /s %A%>>%systemroot%\besafe.bat
echo chcp 437>>%systemroot%\besafe.bat
echo reg query %LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-0225eaa8040c} 1^>nul 2^>nul>>%systemroot%\besafe.bat
echo if ERRORLEVEL 1 (>>%systemroot%\besafe.bat
echo title   WARNING ! ! !>>%systemroot%\besafe.bat
echo color cf>>%systemroot%\besafe.bat
echo mode con cols=36 lines=23>>%systemroot%\besafe.bat
echo start explorer.exe 1^>nul 2^>nul>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo echo YOUR PC IS IN DANGER NOW ! ! !>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo echo PLEASE DO REMEMBER TO RUN>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo echo "BESAFE" FROM START MENU TO>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo echo BRING YOUR PC BACK TO SAFETY ! ! !>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo pause>>%systemroot%\besafe.bat
echo exit) else (>>%systemroot%\besafe.bat
echo title   WELL DONE !>>%systemroot%\besafe.bat
echo color 2f>>%systemroot%\besafe.bat
echo mode con cols=36 lines=19>>%systemroot%\besafe.bat
echo start explorer.exe 1^>nul 2^>nul>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo echo YOUR PC IS SAFE NOW !>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo echo HAVE A NICE DAY !>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo echo.>>%systemroot%\besafe.bat
echo pause>>%systemroot%\besafe.bat
echo exit)>>%systemroot%\besafe.bat


echo @echo off>%systemroot%\beindanger.bat
echo taskkill /f /im explorer.exe 1^>nul 2^>nul>>%systemroot%\beindanger.bat
echo start regedit /s %B%>>%systemroot%\beindanger.bat
echo chcp 437>>%systemroot%\beindanger.bat
echo reg query %LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-0225eaa8040c} 1^>nul 2^>nul>>%systemroot%\beindanger.bat
echo if ERRORLEVEL 1 (>>%systemroot%\beindanger.bat
echo title   WARNING ! ! !>>%systemroot%\beindanger.bat
echo color cf>>%systemroot%\beindanger.bat
echo mode con cols=36 lines=23>>%systemroot%\beindanger.bat
echo start explorer.exe 1^>nul 2^>nul>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo echo YOUR PC IS IN DANGER NOW ! ! !>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo echo PLEASE DO REMEMBER TO RUN>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo echo "BESAFE" FROM START MENU TO>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo echo BRING YOUR PC BACK TO SAFETY ! ! !>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo pause>>%systemroot%\beindanger.bat
echo exit) else (>>%systemroot%\beindanger.bat
echo title   WELL DONE !>>%systemroot%\beindanger.bat
echo color 2f>>%systemroot%\beindanger.bat
echo mode con cols=36 lines=19>>%systemroot%\beindanger.bat
echo start explorer.exe 1^>nul 2^>nul>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo echo YOUR PC IS SAFE NOW !>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo echo HAVE A NICE DAY !>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo echo.>>%systemroot%\beindanger.bat
echo pause>>%systemroot%\beindanger.bat
echo exit)>>%systemroot%\beindanger.bat



echo Windows Registry Editor Version 5.00>%B%
echo.>>%B%
echo [-%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer]>>%B%
echo.>>%B%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers]>>%B%
echo "AuthenticodeEnabled"=dword:00000000>>%B%
echo.>>%B%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%B%
echo "NoTrayItemsDisplay"=dword:00000001>>%B%
echo.>>%B%
echo [%LM%\Software\Microsoft\Windows\CurrentVersion\Policies\System]>>%B%
echo "LegalNoticeCaption"="YOUR PC IS IN DANGER NOW ! ! !">>%B%
echo "LegalNoticeText"="PLEASE DO REMEMBER TO RUN [ BESAFE ] FROM START MENU TO BRING YOUR PC BACK TO SAFETY ! ! !">>%B%
echo.>>%B%
echo [%CU%\Control Panel\International]>>%B%
echo "sShortTime"="tt H:mm">>%B%
echo "s1159"="IN DANGER!  ">>%B%
echo "s2359"="IN DANGER!  ">>%B%
echo.>>%B%
echo [-%LM%\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection]>>%B%
echo.>>%B%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%B%
echo "SeparateProcess"=dword:00000001>>%B%
echo "Hidden"=dword:00000002>>%B%
echo "ShowSuperHidden"=dword:00000000>>%B%
echo "HideFileExt"=dword:00000000>>%B%
echo "TaskbarSizeMove"=dword:00000000>>%B%
echo "TaskbarGlomLevel"=dword:00000001>>%B%
echo "TaskbarGlomming"=dword:00000000>>%B%
echo "TaskbarSmallIcons"=dword:00000001>>%B%
echo.>>%B%
echo.>>%B%
echo.>>%B%
echo.>>%B%


echo Windows Registry Editor Version 5.00>%A%
echo.>>%A%
echo [%LM%\SYSTEM\CurrentControlSet\Control\Keyboard Layout]>>%A%
echo "Scancode Map"=hex:00,00,00,00,00,00,00,00,40,00,00,00,32,E0,3B,00,2E,E0,51,E0,30,E0,49,E0,00,00,00,00>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit\Favorites]>>%A%
echo "User Policies 2"="%CU%\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies">>%A%
echo "Machine Policies 2"="%LM%\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies">>%A%
echo "User Policies 1"="%CU%\\SOFTWARE\\Policies\\Microsoft">>%A%
echo "Machine Policies 1"="%LM%\\SOFTWARE\\Policies\\Microsoft">>%A%
echo.>>%A%
echo [-%LM%\Software\Microsoft\Windows\CurrentVersion\Policies]>>%A%
echo.>>%A%
echo [-%CU%\Software\Microsoft\Windows\CurrentVersion\Policies]>>%A%
echo.>>%A%
echo [-%CU%\SOFTWARE\Policies\Microsoft]>>%A%
echo.>>%A%
echo [-%LM%\SOFTWARE\Policies\MicrosoftBeta]>>%A%
echo.>>%A%
echo [-%LM%\System\CurrentControlSet\Control\Terminal Server\Wds\rdpwd\StartupPrograms]>>%A%
echo.>>%A%
echo [-%LM%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\AppSetup]>>%A%
echo.>>%A%
echo [-%LM%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Userinit]>>%A%
echo.>>%A%
echo [-%LM%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\VmApplet]>>%A%
echo.>>%A%
echo [-%LM%\SYSTEM\CurrentControlSet\Control\SafeBoot\AlternateShell]>>%A%
echo.>>%A%
echo [-%LM%\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\AlternateShells\AvailableShells]>>%A%
echo.>>%A%
echo [-%LM%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Taskman]>>%A%
echo.>>%A%
echo [-%LM%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Terminal Server\Install\Software\Microsoft\Windows\CurrentVersion\Runonce]>>%A%
echo.>>%A%
echo [-%LM%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Terminal Server\Install\Software\Microsoft\Windows\CurrentVersion\RunonceEx]>>%A%
echo.>>%A%
echo [-%LM%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Terminal Server\Install\Software\Microsoft\Windows\CurrentVersion\Run]>>%A%
echo.>>%A%
echo [-%CU%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Terminal Server\Install\Software\Microsoft\Windows\CurrentVersion\Runonce]>>%A%
echo.>>%A%
echo [-%CU%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Terminal Server\Install\Software\Microsoft\Windows\CurrentVersion\RunonceEx]>>%A%
echo.>>%A%
echo [-%CU%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Terminal Server\Install\Software\Microsoft\Windows\CurrentVersion\Run]>>%A%
echo.>>%A%
echo [-%LM%\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\InitialProgram]>>%A%
echo.>>%A%
echo [-%LM%\SOFTWARE\Microsoft\Active Setup\Installed Components]>>%A%
echo.>>%A%
echo [-%LM%\SOFTWARE\Wow6432Node\Microsoft\Active Setup\Installed Components]>>%A%
echo.>>%A%
echo [-%LM%\Software\Microsoft\Windows NT\CurrentVersion\Windows\IconServiceLib]>>%A%
echo.>>%A%
echo [-%LM%\SOFTWARE\Microsoft\Windows CE Services\AutoStartOnConnect]>>%A%
echo.>>%A%
echo [-%LM%\SOFTWARE\Wow6432Node\Microsoft\Windows CE Services\AutoStartOnConnect]>>%A%
echo.>>%A%
echo [-%LM%\SOFTWARE\Microsoft\Windows CE Services\AutoStartOnDisconnect]>>%A%
echo.>>%A%
echo [-%LM%\SOFTWARE\Wow6432Node\Microsoft\Windows CE Services\AutoStartOnDisconnect]>>%A%
echo.>>%A%
echo [-%LM%\Software\Policies\Microsoft\Windows\System\Scripts]>>%A%
echo.>>%A%
echo [-%CU%\Software\Policies\Microsoft\Windows\System\Scripts]>>%A%
echo.>>%A%
echo [-%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run]>>%A%
echo.>>%A%
echo [-%CU%\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run]>>%A%
echo.>>%A%
echo [-%CU%\Software\Microsoft\Windows NT\CurrentVersion\Windows\Load]>>%A%
echo.>>%A%
echo [-%CU%\Software\Microsoft\Windows NT\CurrentVersion\Windows\Run]>>%A%
echo.>>%A%
echo [-%LM%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Shell]>>%A%
echo.>>%A%
echo [-%CU%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Shell]>>%A%
echo.>>%A%
echo [-%LM%\Software\Microsoft\Windows\CurrentVersion\Policies\System\Shell]>>%A%
echo.>>%A%
echo [-%CU%\Software\Microsoft\Windows\CurrentVersion\Policies\System\Shell]>>%A%
echo.>>%A%
echo [-%LM%\Software\Microsoft\Windows\CurrentVersion\Group Policy\Scripts]>>%A%
echo.>>%A%
echo [%LM%\SYSTEM\CurrentControlSet\Services\NetBT\Parameters]>>%A%
echo "SMBDeviceEnabled"=dword:00000000>>%A%
echo "TransportBindName"=->>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Microsoft\Ole]>>%A%
echo "EnableDCOM"="N">>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Microsoft\Rpc]>>%A%
echo "DCOM Protocols"=hex(7):00,00>>%A%
echo.>>%A%
echo [%LM%\SYSTEM\CurrentControlSet\Services\lanmanserver\Parameters]>>%A%
echo "AutoShareServer"=dword:00000000>>%A%
echo "AutoShareWks"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SYSTEM\CurrentControlSet\Control\LSA]>>%A%
echo "RestrictAnonymous"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon]>>%A%
echo "EnableFirstLogonAnimation"=dword:00000001>>%A%
echo "WinStationsDisabled"="0">>%A%
echo "Userinit"="%systemdrive%\\WINDOWS\\system32\\userinit.exe,">>%A%
echo "Shell"="explorer.exe">>%A%
echo "ShellCritical"=dword:00000000>>%A%
echo "ShellInfrastructure"="sihost.exe">>%A%
echo "SiHostCritical"=dword:00000000>>%A%
echo "SiHostReadyTimeOut"=dword:00000000>>%A%
echo "SiHostRestartCountLimit"=dword:00000000>>%A%
echo "SiHostRestartTimeGap"=dword:00000000>>%A%
echo "AutoRestartShell"=dword:00000001>>%A%
echo "DisableBackButton"=dword:00000001>>%A%
echo "EnableSIHostIntegration"=dword:00000001>>%A%
echo "ForceUnlockLogon"=dword:00000000>>%A%
echo "LegalNoticeCaption"="">>%A%
echo "LegalNoticeText"="">>%A%
echo "PowerdownAfterShutdown"="0">>%A%
echo "ReportBootOk"="1">>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations]>>%A%
echo ".tif"="PhotoViewer.FileAssoc.Tiff">>%A%
echo ".tiff"="PhotoViewer.FileAssoc.Tiff">>%A%
echo ".jpg"="PhotoViewer.FileAssoc.Tiff">>%A%
echo ".jpeg"="PhotoViewer.FileAssoc.Tiff">>%A%
echo ".jpe"="PhotoViewer.FileAssoc.Tiff">>%A%
echo ".jfif"="PhotoViewer.FileAssoc.Tiff">>%A%
echo ".bmp"="PhotoViewer.FileAssoc.Tiff">>%A%
echo ".gif"="PhotoViewer.FileAssoc.Tiff">>%A%
echo ".png"="PhotoViewer.FileAssoc.Tiff">>%A%
echo ".ico"="PhotoViewer.FileAssoc.Tiff">>%A%
echo ".dib"="PhotoViewer.FileAssoc.Tiff">>%A%
echo ".wdp"="PhotoViewer.FileAssoc.Tiff">>%A%
echo ".jxr"="PhotoViewer.FileAssoc.Tiff">>%A%
echo.>>%A%
echo [%LM%\SYSTEM\CurrentControlSet\Control\Remote Assistance]>>%A%
echo "fAllowToGetHelp"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SYSTEM\CurrentControlSet\Control\Terminal Server]>>%A%
echo "fDenyTSConnections"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\Software\Policies\Microsoft\Windows\BITS]>>%A%
echo "EnablePeercaching"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization]>>%A%
echo "DODownloadMode"=dword:00000003>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Internet Explorer\PhishingFilter]>>%A%
echo "PreventOverride"=dword:00000000>>%A%
echo "PreventOverrideAppRepUnknown"=dword:00000000>>%A%
echo "EnabledV9"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter]>>%A%
echo "EnabledV9"=dword:00000001>>%A%
echo "PreventOverride"=dword:00000000>>%A%
echo "PreventOverrideAppRepUnknown"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\System]>>%A%
echo "EnableSmartScreen"=dword:00000001>>%A%
echo "ShellSmartScreenLevel"="Warn">>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Policies\System]>>%A%
echo "DisableTaskMgr"=->>%A%
echo.>>%A%
echo [%CU%\Software\Policies\Microsoft\Windows\System]>>%A%
echo "DisableCMD"=->>%A%
echo.>>%A%
echo [%LM%\SYSTEM\CurrentControlSet\Control\Session Manager]>>%A%
echo "BootExecute"=hex(7):00,00>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]>>%A%
echo "VerboseStatus"=dword:00000001>>%A%
echo "EnableLUA"=dword:00000001>>%A%
echo "ConsentPromptBehaviorAdmin"=dword:00000005>>%A%
echo "ConsentPromptBehaviorUser"=dword:00000003>>%A%
echo "PromptOnSecureDesktop"=dword:00000001>>%A%
echo "EnableUIADesktopToggle"=dword:00000000>>%A%
echo "FilterAdministratorToken"=dword:00000001>>%A%
echo "EnableSecureUIAPaths"=dword:00000001>>%A%
echo "EnableInstallerDetection"=dword:00000001>>%A%
echo "EnableVirtualization"=dword:00000001>>%A%
echo "ValidateAdminCodeSignatures"=dword:00000000>>%A%
echo "DSCAutomationHostEnabled"=dword:00000002>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers]>>%A%
echo "AuthenticodeEnabled"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\SystemCertificates\AuthRoot]>>%A%
echo "DisableRootAutoUpdate"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\SystemCertificates\TrustedPublisher\Safer]>>%A%
echo "AuthenticodeFlags"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile]>>%A%
echo "DisableNotifications"=dword:00000000>>%A%
echo "EnableFirewall"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile]>>%A%
echo "EnableFirewall"=dword:00000001>>%A%
echo "DisableNotifications"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile]>>%A%
echo "DisableNotifications"=dword:00000000>>%A%
echo "EnableFirewall"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Microsoft\Security Center]>>%A%
echo "AntiVirusOverride"=->>%A%
echo "FirewallDisableNotify"=->>%A%
echo "UacDisableNotify"=->>%A%
echo "UpdatesDisableNotify"=->>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Microsoft\Security Center\Svc]>>%A%
echo "AntiVirusOverride"=->>%A%
echo "FirewallDisableNotify"=->>%A%
echo "UacDisableNotify"=->>%A%
echo "UpdatesDisableNotify"=->>%A%
echo.>>%A%
echo [-%LM%\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate]>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU]>>%A%
echo "NoAutoUpdate"=dword:00000001>>%A%
echo "ExcludeWUDriversInQualityUpdate"=dword:00000000>>%A%
echo "NoAutoRebootWithLoggedOnUsers"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\MRT]>>%A%
echo "DontOfferThroughWUAU"=dword:00000001>>%A%
echo.>>%A%
echo [-%LM%\SOFTWARE\Policies\Microsoft\PassportForWork\PINComplexity]>>%A%
echo.>>%A%
echo [-%CU%\SOFTWARE\Policies\Microsoft\PassportForWork\PINComplexity]>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\PassportForWork\PINComplexityBeta]>>%A%
echo.>>%A%
echo [-%CU%\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization]>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance]>>%A%
echo "WakeUp"=dword:00000000>>%A%
echo "MaintenanceDisabled"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SYSTEM\CurrentControlSet\Control\CrashControl]>>%A%
echo "AutoReboot"=dword:00000000>>%A%
echo "AlwaysKeepMemoryDump"=dword:00000000>>%A%
echo "CrashDumpEnabled"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Maps]>>%A%
echo "AutoDownloadAndUpdateMapData"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\WindowsStore]>>%A%
echo "AutoDownload"=dword:00000002>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore]>>%A%
echo "DisableConfig"=dword:00000001>>%A%
echo "DisableSR"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\SQMClient\Windows]>>%A%
echo "CEIPEnable"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting]>>%A%
echo "DontShowUI"=dword:00000001>>%A%
echo "DontSendAdditionalData"=dword:00000001>>%A%
echo "Disabled"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting]>>%A%
echo "DoReport"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters]>>%A%
echo "EnableSuperfetch"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\AppCompat]>>%A%
echo "DisablePCA"=dword:00000001>>%A%
echo "DisableEngine"=dword:00000001>>%A%
echo "VDMDisallowed"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\HomeGroup]>>%A%
echo "DisableHomeGroup"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform]>>%A%
echo "NoGenTicket"=dword:00000001>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\DWM]>>%A%
echo "AnimationsShiftKey"=dword:00000001>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%A%
echo "NoToolbarsOnTaskbar"=dword:00000001>>%A%
echo.>>%A%
echo [%CU%\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications]>>%A%
echo "NoToastApplicationNotification"=dword:00000001>>%A%
echo "NoToastApplicationNotificationOnLockScreen"=dword:00000001>>%A%
echo "NoTileApplicationNotification"=dword:00000001>>%A%
echo "NoCloudApplicationNotification"=dword:00000001>>%A%
echo "DisallowNotificationMirroring"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Personalization]>>%A%
echo "NoLockScreen"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%A%
echo "AllowOnlineTips"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\System]>>%A%
echo "DisableLockScreenAppNotifications"=dword:00000001>>%A%
echo "DisableLogonBackgroundImage"=dword:00000001>>%A%
echo "BlockUserFromShowingAccountDetailsOnSignin"=dword:00000001>>%A%
echo "HiberbootEnabled"=dword:00000001>>%A%
echo.>>%A%
echo [%CU%\Software\Policies\Microsoft\Windows\Explorer]>>%A%
echo "EnableLegacyBalloonNotifications"=dword:00000001>>%A%
echo "DisableNotificationCenter"=dword:00000001>>%A%
echo "HidePeopleBar"=dword:00000001>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize]>>%A%
echo "EnableTransparency"=dword:00000000>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People]>>%A%
echo "PeopleBand"=dword:00000000>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People\ShoulderTap]>>%A%
echo "ShoulderTap"=dword:00000000>>%A%
echo "ShoulderTapAudio"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SYSTEM\CurrentControlSet\Control\Session Manager\Power]>>%A%
echo "AwayModeEnabled"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%A%
echo "UseOLEDTaskbarTransparency"=dword:00000001>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\MultitaskingView\AltTabViewHost]>>%A%
echo "Grid_backgroundPercent"=dword:00000000>>%A%
echo "BackgroundDimmingLayer_percent"=dword:00000028>>%A%
echo "wallpaper"=dword:00000001>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer]>>%A%
echo "EnableAutoTray"=dword:00000000>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%A%
echo "DontUsePowerShellOnWinX"=dword:00000001>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%A%
echo "Start_TrackDocs"=dword:00000000>>%A%
echo.>>%A%
echo [%CU%\Control Panel\International]>>%A%
echo "sShortTime"=->>%A%
echo "s1159"=->>%A%
echo "s2359"=->>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%A%
echo "LaunchTo"=dword:00000001>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer]>>%A%
echo "ShowFrequent"=dword:00000000>>%A%
echo "ShowRecent"=dword:00000000>>%A%
echo "ShellState"=hex:24,00,00,00,1c,08,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\>>%A%
echo    01,00,00,00,13,00,00,00,00,00,00,00,6b,00,00,00>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Modules\GlobalSettings\DetailsContainer]>>%A%
echo "DetailsContainer"=hex:02,00,00,00,02,00,00,00>>%A%
echo.>>%A%
echo [%CU%\Software\Policies\Microsoft\Windows\Explorer]>>%A%
echo "ClearTilesOnExit"=dword:00000001>>%A%
echo.>>%A%
echo [%CU%\Software\Policies\Microsoft\Windows\Explorer]>>%A%
echo "DisableSearchBoxSuggestions"=dword:00000001>>%A%
echo "ExplorerRibbonStartsMinimized"=dword:00000001>>%A%
echo "DisableIndexedLibraryExperience"=dword:00000001>>%A%
echo "DisableSearchHistory"=dword:00000001>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%A%
echo "ForceClassicControlPanel"=dword:00000001>>%A%
echo "EnforceShellExtensionSecurity"=dword:00000001>>%A%
echo "ClearRecentDocsOnExit"=dword:00000001>>%A%
echo "NoRecentDocsMenu"=dword:00000001>>%A%
echo "NoStartMenuMFUprogramsList"=dword:00000001>>%A%
echo "ClearRecentProgForNewUserInStartMenu"=dword:00000001>>%A%
echo "NoTrayContextMenu"=dword:00000001>>%A%
echo "NoTaskGrouping"=dword:00000000>>%A%
echo "DisableCurrentUserRun"=dword:00000001>>%A%
echo "DisableCurrentUserRunOnce"=->>%A%
echo.>>%A%
echo [%LM%\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%A%
echo "DisableLocalMachineRun"=dword:00000001>>%A%
echo "HidePowerOptions"=dword:00000001>>%A%
echo "DisableLocalMachineRunOnce"=->>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Modules\GlobalSettings\Sizer]>>%A%
echo "PageSpaceControlSizer"=hex:a0,00,00,00,00,00,00,00,00,00,00,00,56,03,00,00>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%A%
echo "ExtendedUIHoverTime"=dword:01111111>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband]>>%A%
echo "NumThumbnails"=dword:00000000>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%A%
echo "ShowTaskViewButton"=dword:00000000>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\Preferences]>>%A%
echo "WholeFileSystem"=dword:00000000>>%A%
echo "SystemFolders"=dword:00000000>>%A%
echo "ArchivedFiles"=dword:00000000>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\PrimaryProperties\UnindexedLocations]>>%A%
echo "SearchOnly"=dword:00000001>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\PenWorkspace]>>%A%
echo "PenWorkspaceButtonDesiredVisibility"=dword:00000000>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Search]>>%A%
echo "SearchboxTaskbarMode"=dword:00000000>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Touchpad]>>%A%
echo "TouchpadDesiredVisibility"=dword:00000000>>%A%
echo.>>%A%
echo [%CU%\Software\Policies\Microsoft\Windows\Explorer]>>%A%
echo "ShowWindowsStoreAppsOnTaskbar"=dword:00000002>>%A%
echo "NoPinningToTaskbar"=dword:00000001>>%A%
echo "NoPinningStoreToTaskbar"=dword:00000001>>%A%
echo "TaskbarNoPinnedList"=dword:00000001>>%A%
echo.>>%A%
echo [%CU%\Control Panel\Desktop\WindowMetrics]>>%A%
echo "MinAnimate"="1">>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu]>>%A%
echo "{645FF040-5081-101B-9F08-00AA002F954E}"=dword:00000001>>%A%
echo "{59031a47-3f72-44a7-89c5-5595fe6b30ee}"=dword:00000001>>%A%
echo "{20D04FE0-3AEA-1069-A2D8-08002B30309D}"=dword:00000000>>%A%
echo "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}"=dword:00000001>>%A%
echo "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}"=dword:00000001>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel]>>%A%
echo "{645FF040-5081-101B-9F08-00AA002F954E}"=dword:00000001>>%A%
echo "{59031a47-3f72-44a7-89c5-5595fe6b30ee}"=dword:00000001>>%A%
echo "{20D04FE0-3AEA-1069-A2D8-08002B30309D}"=dword:00000000>>%A%
echo "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}"=dword:00000001>>%A%
echo "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\cleanuppath]>>%A%
echo @=hex(2):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,00,25,\>>%A%
echo   00,5c,00,53,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,63,00,6c,00,\>>%A%
echo   65,00,61,00,6e,00,6d,00,67,00,72,00,2e,00,65,00,78,00,65,00,20,00,2f,00,44,\>>%A%
echo   00,20,00,25,00,63,00,00,00>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\DefragPath]>>%A%
echo @=hex(2):25,00,73,00,79,00,73,00,74,00,65,00,6d,00,72,00,6f,00,6f,00,74,00,25,\>>%A%
echo   00,5c,00,73,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,64,00,66,00,\>>%A%
echo   72,00,67,00,75,00,69,00,2e,00,65,00,78,00,65,00,00,00>>%A%
echo.>>%A%
echo [HKEY_CLASSES_ROOT\lnkfile]>>%A%
echo @="Shortcut">>%A%
echo "IsShortcut"="">>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Themes]>>%A%
echo "ThemeChangesDesktopIcons"=dword:00000000>>%A%
echo "ThemeChangesMousePointers"=dword:00000000>>%A%
echo.>>%A%
echo [%CU%\Control Panel\Mouse]>>%A%
echo "MouseSensitivity"="10">>%A%
echo "MouseSpeed"="2">>%A%
echo "MouseThreshold1"="6">>%A%
echo "MouseThreshold2"="10">>%A%
echo "MouseTrails"="0">>%A%
echo "MouseHoverTime"="2">>%A%
echo "SnapToDefaultButton"="0">>%A%
echo "DoubleClickSpeed"="500">>%A%
echo.>>%A%
echo [%CU%\Control Panel\Desktop]>>%A%
echo "MouseWheelRouting"=dword:00000002>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%A%
echo "NoInternetIcon"=dword:00000001>>%A%
echo "HideSCANetwork"=dword:00000001>>%A%
echo "HideSCAHealth"=dword:00000001>>%A%
echo "HideSCAVolume"=dword:00000001>>%A%
echo "NoAutoTrayNotify"=dword:00000001>>%A%
echo.>>%A%
echo [%CU%\Software\Policies\Microsoft\Windows\Control Panel\Desktop]>>%A%
echo "ScreenSaveTimeOut"="0">>%A%
echo "ScreenSaverIsSecure"="1">>%A%
echo "ScreenSaveActive"="0">>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Policies\System]>>%A%
echo "NoDispScrSavPage"=dword:00000001>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%A%
echo "NoDesktop"=dword:00000001>>%A%
echo "NoClose"=dword:00000001>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%A%
echo "SeparateProcess"=dword:00000001>>%A%
echo "ShowTypeOverlay"=dword:00000001>>%A%
echo "Hidden"=dword:00000002>>%A%
echo "ShowSuperHidden"=dword:00000000>>%A%
echo "ShowEncryptCompressedColor"=dword:00000001>>%A%
echo "HideFileExt"=dword:00000001>>%A%
echo "AutoCheckSelect"=dword:00000001>>%A%
echo "TaskbarSizeMove"=dword:00000000>>%A%
echo "PersistBrowsers"=dword:00000001>>%A%
echo "TaskbarAnimations"=dword:00000000>>%A%
echo "TaskbarGlomLevel"=dword:00000001>>%A%
echo "TaskbarGlomming"=dword:00000000>>%A%
echo "IconsOnly"=dword:00000000>>%A%
echo "ListviewShadow"=dword:00000001>>%A%
echo "ListviewAlphaSelect"=dword:00000001>>%A%
echo "TaskbarAppsVisibleInTabletMode"=dword:00000001>>%A%
echo "TaskbarSmallIcons"=dword:00000001>>%A%
echo "UseTabletModeNotificationIcons"=dword:00000000>>%A%
echo "ShowSyncProviderNotifications"=dword:00000000>>%A%
echo "JointResize"=dword:00000001>>%A%
echo "SnapAssist"=dword:00000001>>%A%
echo "SnapFill"=dword:00000001>>%A%
echo "VirtualDesktopTaskbarFilter"=dword:00000001>>%A%
echo "VirtualDesktopAltTabFilter"=dword:00000001>>%A%
echo "ShowEncryptCompressedColor"=dword:00000001>>%A%
echo "TypeAhead"=dword:00000001>>%A%
echo "AlwaysShowMenus"=dword:00000000>>%A%
echo "HideDrivesWithNoMedia"=dword:00000001>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState]>>%A%
echo "Settings"=hex:0c,00,02,00,0a,01,00,00,60,00,00,00>>%A%
echo "FullPath"=dword:00000000>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\CTF\LangBar]>>%A%
echo "ShowStatus"=dword:00000003>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects]>>%A%
echo "VisualFXSetting"=dword:00000003>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\DWM]>>%A%
echo "AlwaysHibernateThumbnails"=dword:00000000>>%A%
echo "EnableAeroPeek"=dword:00000000>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\PenWorkspace]>>%A%
echo "PenWorkspaceAppSuggestionsEnabled"=dword:00000000>>%A%
echo.>>%A%
echo [%CU%\Control Panel\Desktop]>>%A%
echo "WheelScrollLines"="9">>%A%
echo "MenuShowDelay"="0">>%A%
echo "DragFullWindows"="1">>%A%
echo "FontSmoothing"="2">>%A%
echo "UserPreferencesMask"=hex:98,52,07,80,12,01,00,00>>%A%
echo "WindowArrangementActive"="1">>%A%
echo "PaintDesktopVersion"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows]>>%A%
echo "DisplayVersion"=dword:00000000>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell]>>%A%
echo "SignInMode"=dword:00000002>>%A%
echo "ConvertibleSlateModePromptPreference"=dword:00000001>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers]>>%A%
echo "DisableAutoplay"=dword:00000001>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager]>>%A%
echo "FeatureManagementEnabled"=dword:00000000>>%A%
echo "OemPreInstalledAppsEnabled"=dword:00000000>>%A%
echo "PreInstalledAppsEnabled"=dword:00000000>>%A%
echo "SilentInstalledAppsEnabled"=dword:00000000>>%A%
echo "SoftLandingEnabled"=dword:00000000>>%A%
echo "SystemPaneSuggestionsEnabled"=dword:00000000>>%A%
echo "ContentDeliveryAllowed"=dword:00000000>>%A%
echo "PreInstalledAppsEverEnabled"=dword:00000000>>%A%
echo "RotatingLockScreenEnabled"=dword:00000000>>%A%
echo "RotatingLockScreenOverlayEnabled"=dword:00000000>>%A%
echo "SubscribedContent-310093Enabled"=dword:00000000>>%A%
echo.>>%A%
echo [%CU%\Software\Policies\Microsoft\Windows\CloudContent]>>%A%
echo "DisableWindowsSpotlightWindowsWelcomeExperience"=dword:00000001>>%A%
echo "DisableThirdPartySuggestions"=dword:00000001>>%A%
echo "DisableWindowsSpotlightOnActionCenter"=dword:00000001>>%A%
echo "DisableTailoredExperiencesWithDiagnosticData"=dword:00000001>>%A%
echo "DisableWindowsSpotlightFeatures"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\CloudContent]>>%A%
echo "DisableSoftLanding"=dword:00000001>>%A%
echo "DisableWindowsConsumerFeatures"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\Software\Policies\Microsoft\Speech]>>%A%
echo "AllowSpeechModelUpdate"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace]>>%A%
echo "AllowSuggestedAppsInWindowsInkWorkspace"=dword:00000000>>%A%
echo.>>%A%
echo [-%CU%\Software\Microsoft\TabletTip]>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Windows Search]>>%A%
echo "AllowCortana"=dword:00000000>>%A%
echo "AllowCortanaAboveLock"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\OneDrive]>>%A%
echo "DisableFileSyncNGSC"=dword:00000001>>%A%
echo "DisableFileSync"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%A%
echo "NoDriveTypeAutoRun"=dword:000000ff>>%A%
echo "NoAutorun"=dword:00000001>>%A%
echo "DontSetAutoplayCheckbox"=dword:00000001>>%A%
echo.>>%A%
echo [%CU%\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%A%
echo "NoDriveTypeAutoRun"=dword:000000ff>>%A%
echo.>>%A%
echo [%CU%\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%A%
echo "NoAutorun"=dword:00000001>>%A%
echo.>>%A%
echo [%CU%\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%A%
echo "DontSetAutoplayCheckbox"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Windows Search]>>%A%
echo "AutoIndexSharedFolders"=dword:00000001>>%A%
echo "PreventIndexOnBattery"=dword:00000001>>%A%
echo "AllowIndexingEncryptedStoresOrItems"=dword:00000000>>%A%
echo "PreventIndexingOfflineFiles"=dword:00000001>>%A%
echo "PreventIndexingPublicFolders"=dword:00000001>>%A%
echo "PreventIndexingEmailAttachments"=dword:00000001>>%A%
echo "PreventIndexingOutlook"=dword:00000001>>%A%
echo "DisableRemovableDriveIndexing"=dword:00000001>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications]>>%A%
echo "GlobalUserDisabled"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]>>%A%
echo "VerboseStatus"=dword:00000001>>%A%
echo "DisableStartupSound"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings]>>%A%
echo "ShowSleepOption"=dword:00000001>>%A%
echo "ShowHibernateOption"=dword:00000001>>%A%
echo "ShowLockOption"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\Software\Policies\Microsoft\Windows\Explorer]>>%A%
echo "ShowSleepOption"=dword:00000001>>%A%
echo "ShowHibernateOption"=dword:00000001>>%A%
echo "ShowLockOption"=dword:00000001>>%A%
echo.>>%A%
echo [%CU%\Software\Policies\Microsoft\Windows\Explorer]>>%A%
echo "PowerButtonAction"=dword:00000200>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]>>%A%
echo "ShutdownWithoutLogon"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51]>>%A%
echo "DCSettingIndex"=dword:00000001>>%A%
echo "ACSettingIndex"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\29F6C1DB-86DA-48C5-9FDB-F2B67B1F44DA]>>%A%
echo "ACSettingIndex"=dword:00000000>>%A%
echo "DCSettingIndex"=dword:00002a30>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\3C0BC021-C8A8-4E07-A973-6B14CBCB2B7E]>>%A%
echo "ACSettingIndex"=dword:00000000>>%A%
echo "DCSettingIndex"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\5CA83367-6E45-459F-A27B-476B1D01C936]>>%A%
echo "ACSettingIndex"=dword:00000001>>%A%
echo "DCSettingIndex"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\637EA02F-BBCB-4015-8E2C-A1C7B9C0B546]>>%A%
echo "DCSettingIndex"=dword:00000002>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\6738E2C4-E8A5-4A42-B16A-E040E769756E]>>%A%
echo "DCSettingIndex"=dword:0000012c>>%A%
echo "ACSettingIndex"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\7648EFA3-DD9C-4E3E-B566-50F929386280]>>%A%
echo "DCSettingIndex"=dword:00000002>>%A%
echo "ACSettingIndex"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\8183ba9a-e910-48da-8769-14ae6dc1170a]>>%A%
echo "DCSettingIndex"=dword:0000000a>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\94ac6d29-73ce-41a6-809f-6363ba21b47e]>>%A%
echo "DCSettingIndex"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\96996BC0-AD50-47EC-923B-6F41874DD9EB]>>%A%
echo "ACSettingIndex"=dword:00000001>>%A%
echo "DCSettingIndex"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\9A66D8D7-4FF7-4EF9-B5A2-5A326CA2A469]>>%A%
echo "DCSettingIndex"=dword:00000005>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\9D7815A6-7EE4-497E-8888-515A05F02364]>>%A%
echo "DCSettingIndex"=dword:00002a30>>%A%
echo "ACSettingIndex"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\A4B195F5-8225-47D8-8012-9D41369786E2]>>%A%
echo "DCSettingIndex"=dword:00000000>>%A%
echo "ACSettingIndex"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\B7A27025-E569-46c2-A504-2B96CAD225A1]>>%A%
echo "ACSettingIndex"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\E69653CA-CF7F-4F05-AA73-CB833FA90AD4]>>%A%
echo "DCSettingIndex"=dword:00000014>>%A%
echo "ACSettingIndex"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\17aaa29b-8b43-4b94-aafe-35f64daaf1ee]>>%A%
echo "DCSettingIndex"=dword:00000032>>%A%
echo "ACSettingIndex"=dword:00000032>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f1fbfde2-a960-4165-9f88-50667911ce96]>>%A%
echo "DCSettingIndex"=dword:00000032>>%A%
echo "ACSettingIndex"=dword:00000032>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9]>>%A%
echo "DCSettingIndex"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\F3C5027D-CD16-4930-AA6B-90DB844A8F00]>>%A%
echo "DCSettingIndex"=dword:00000007>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%A%
echo "Start_ShowNetPlaces"=dword:00000000>>%A%
echo "Start_NotifyNewApps"=dword:00000000>>%A%
echo "Start_ShowDownloads"=dword:00000001>>%A%
echo "Start_ShowVideos"=dword:00000001>>%A%
echo "Start_AutoCascade"=dword:00000000>>%A%
echo "Start_LargeMFUIcons"=dword:00000000>>%A%
echo "Start_ShowPrinters"=dword:00000000>>%A%
echo "Start_ShowSetProgramAccessAndDefaults"=dword:00000000>>%A%
echo "Start_ShowUser"=dword:00000000>>%A%
echo "Start_ShowHelp"=dword:00000000>>%A%
echo "Start_MinMFU"=dword:00000000>>%A%
echo "Start_ShowMyGames"=dword:00000000>>%A%
echo "Start_ShowMyPics"=dword:00000001>>%A%
echo "Start_ShowMyDocs"=dword:00000001>>%A%
echo "Start_ShowMyMusic"=dword:00000001>>%A%
echo "Start_ShowMyComputer"=dword:00000001>>%A%
echo "Start_ShowControlPanel"=dword:00000001>>%A%
echo "Start_SearchFiles"=dword:00000002>>%A%
echo "Start_ShowHomeGroup"=dword:00000000>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer]>>%A%
echo "IconUnderline"=dword:00000002>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo]>>%A%
echo "Enabled"=dword:00000000>>%A%
echo [%CU%\Control Panel\International\User Profile]>>%A%
echo "HttpAcceptLanguageOptOut"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\FileHistory]>>%A%
echo "Disabled"=dword:00000001>>%A%
echo.>>%A%
echo [-%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\MobilityCenter]>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\MobilePC\MobilityCenter]>>%A%
echo "RunOnDesktop"=dword:00000001>>%A%
echo.>>%A%
echo [-%LM%\SOFTWARE\Policies\Microsoft\Internet Explorer]>>%A%
echo.>>%A%
echo [-%CU%\SOFTWARE\Policies\Microsoft\Internet Explorer]>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Internet Explorer\Activities]>>%A%
echo "NoActivities"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Internet Explorer\Download]>>%A%
echo "CheckExeSignatures"="yes">>%A%
echo "RunInvalidSignatures"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Internet Explorer\FlipAhead]>>%A%
echo "Enabled"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Internet Explorer\Main]>>%A%
echo "Enable Browser Extensions Beta"="no">>%A%
echo "DoNotTrack"=dword:00000001>>%A%
echo "Isolation"="PMEM">>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings]>>%A%
echo "PreventIgnoreCertErrors"=dword:00000001>>%A%
echo "CertificateRevocation"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Cache]>>%A%
echo "Persistent"=dword:00000000>>%A%
echo.>>%A%
echo [%CU%\Software\Policies\Microsoft\Internet Explorer\Restrictions]>>%A%
echo "NoHelpItemSendFeedback"=dword:00000001>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Internet Explorer\Main]>>%A%
echo "HideNewEdgeButton"=dword:00000001>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Internet Explorer\TabbedBrowsing]>>%A%
echo "NewTabPageShow"=dword:00000002>>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Internet Settings]>>%A%
echo "MaxConnectionsPerServer"=dword:00000008>>%A%
echo "MaxConnectionsPer1_0Server"=dword:00000008>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\SettingSync]>>%A%
echo "DisableWindowsSettingSync"=dword:00000002>>%A%
echo "DisableWindowsSettingSyncUserOverride"=dword:00000001>>%A%
echo "DisableSyncOnPaidNetwork"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\Software\Policies\Microsoft\UEV\Agent\Configuration]>>%A%
echo "SyncOverMeteredNetwork"=dword:00000000>>%A%
echo "SyncOverMeteredNetworkWhenRoaming"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main]>>%A%
echo "SyncFavoritesBetweenIEAndMicrosoftEdge"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\MicrosoftEdge\ServiceUI]>>%A%
echo "AllowWebContentOnNewTabPage"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\Software\Policies\Microsoft\Windows\DataCollection]>>%A%
echo "AllowTelemetry"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\Software\Policies\Microsoft\Windows\PreviewBuilds]>>%A%
echo "EnableConfigFlighting"=dword:00000000>>%A%
echo "EnableExperimentation"=dword:00000000>>%A%
echo.>>%A%
echo [-%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons]>>%A%
echo.>>%A%
echo [-%CU%\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons]>>%A%
echo.>>%A%
echo [-%LM%\SOFTWARE\Policies\Microsoft\Windows Defender]>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender]>>%A%
echo "DisableRoutinelyTakingAction"=dword:00000000>>%A%
echo "AllowFastServiceStartup"=dword:00000001>>%A%
echo "ServiceKeepAlive"=dword:00000000>>%A%
echo "DisableAntispyware"=->>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender\Quarantine]>>%A%
echo "PurgeItemsAfterDelay"=dword:00000001>>%A%
echo "LocalSettingOverridePurgeItemsAfterDelay"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine]>>%A%
echo "MpEnablePus"=dword:00000001>>%A%
echo "MpCloudBlockLevel"=dword:00000002>>%A%
echo "MpBafsExtendedTimeout"=dword:00000032>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection]>>%A%
echo "DisableIOAVProtection"=dword:00000000>>%A%
echo "DisableRealtimeMonitoring"=dword:00000000>>%A%
echo "DisableBehaviorMonitoring"=dword:00000000>>%A%
echo "DisableOnAccessProtection"=dword:00000000>>%A%
echo "DisableScanOnRealtimeEnable"=dword:00000000>>%A%
echo "DisableRawWriteNotification"=dword:00000000>>%A%
echo "IOAVMaxSize"=dword:0098967f>>%A%
echo "RealtimeScanDirection"=dword:00000000>>%A%
echo "LocalSettingOverrideDisableBehaviorMonitoring"=dword:00000000>>%A%
echo "LocalSettingOverrideDisableOnAccessProtection"=dword:00000000>>%A%
echo "LocalSettingOverrideDisableIOAVProtection"=dword:00000000>>%A%
echo "LocalSettingOverrideDisableRealtimeMonitoring"=dword:00000000>>%A%
echo "LocalSettingOverrideRealtimeScanDirection"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender\Remediation]>>%A%
echo "LocalSettingOverrideScan_ScheduleTime"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet]>>%A%
echo "SpynetReporting"=dword:00000002>>%A%
echo "LocalSettingOverrideSpynetReporting"=dword:00000000>>%A%
echo "SubmitSamplesConsent"=dword:00000003>>%A%
echo "DisableBlockAtFirstSeen"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender\Scan]>>%A%
echo "ArchieveMaxSize"=dword:00000000>>%A%
echo "ArchieveMaxDepth"=dword:ffffffff>>%A%
echo "AvgCPULoadFactor"=dword:00000032>>%A%
echo "DisableEmailScanning"=dword:00000000>>%A%
echo "DisableArchiveScanning"=dword:00000000>>%A%
echo "DisableRemovableDriveScanning"=dword:00000000>>%A%
echo "DisablePackedExeScanning"=dword:00000000>>%A%
echo "DisableHeuristics"=dword:00000000>>%A%
echo "DisableReparsePointScanning"=dword:00000001>>%A%
echo "DisableRemovableDriveScanning"=dword:00000000>>%A%
echo "DisableScanningNetworkFiles"=dword:00000000>>%A%
echo "CheckForSignaturesBeforeRunningScan"=dword:00000001>>%A%
echo "ScanOnlyIfIdle"=dword:00000001>>%A%
echo "PurgeItemsAfterDelay"=dword:00000001>>%A%
echo "LocalSettingOverrideScanParameters"=dword:00000000>>%A%
echo "LocalSettingOverrideAvgCPULoadFactor"=dword:00000000>>%A%
echo "LocalSettingOverrideScheduleDay"=dword:00000000>>%A%
echo "LocalSettingOverrideScheduleQuickScanTime"=dword:00000000>>%A%
echo "LocalSettingOverrideScheduleTime"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates]>>%A%
echo "UpdateOnStartUp"=dword:00000001>>%A%
echo "DisableUpdateOnStartupWithoutEngine"=dword:00000000>>%A%
echo "AVSignatureDue"=dword:00000001>>%A%
echo "ASSignatureDue"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender\Threats]>>%A%
echo "Threats_ThreatSeverityDefaultAction"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction]>>%A%
echo "1"="2">>%A%
echo "2"="2">>%A%
echo "4"="3">>%A%
echo "5"="3">>%A%
echo.>>%A%
echo [%LM%\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR]>>%A%
echo "ExploitGuard_ASR_Rules"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules]>>%A%
echo "BE9BA2D9-53EA-4CDC-84E5-9B1EEEE46550"="1">>%A%
echo "D4F940AB-401B-4EFC-AADC-AD5F3C50688A"="1">>%A%
echo "3B576869-A4EC-4529-8536-B80A7769E899"="1">>%A%
echo "75668C1F-73B5-4CF0-BB93-3ECF5CB7CC84"="1">>%A%
echo "D3E037E1-3EB8-44C8-A917-57927947596D"="1">>%A%
echo "5BEB7EFE-FD9A-4556-801D-275E5FFC04CC"="1">>%A%
echo "92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B"="1">>%A%
echo.>>%A%
echo [%LM%\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access]>>%A%
echo "EnableControlledFolderAccess"=dword:00000000>>%A%
echo "ExploitGuard_ControlledFolderAccess_ProtectedFolders"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access\ProtectedFolders]>>%A%
echo.>>%A%
echo [%LM%\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection]>>%A%
echo "EnableNetworkProtection"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender ExploitGuard\Exploit Protection]>>%A%
echo "ExploitProtectionSettings"=->>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Device performance and health]>>%A%
echo "UILockDown"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Family options]>>%A%
echo "UILockDown"=dword:00000001>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Firewall and network protection]>>%A%
echo "UILockDown"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\App and Browser protection]>>%A%
echo "UILockDown"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Enterprise Customization]>>%A%
echo "Url"="microsoft.com/en-us/wdsi">>%A%
echo "CompanyName"="Windows Defender Security Intelligence">>%A%
echo.>>%A%
echo [-%LM%\Software\Policies\Microsoft\Windows\RemovableStorageDevices]>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation]>>%A%
echo "Model"="Optimized by Tom Zhu">>%A%
echo "SupportHours"="Optimized by Tom Zhu">>%A%
echo "SupportURL"="support.microsoft.com/windows">>%A%
echo.>>%A%



echo [-%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer]>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]>>%A%
echo "EnableLUA"=dword:00000001>>%A%
echo "ValidateAdminCodeSignatures"=dword:00000000>>%A%
echo "ConsentPromptBehaviorAdmin"=dword:0000005>>%A%
echo "ConsentPromptBehaviorUser"=dword:00000003>>%A%
echo "PromptOnSecureDesktop"=dword:00000001>>%A%
echo "EnableUIADesktopToggle"=dword:00000000>>%A%
echo "FilterAdministratorToken"=dword:00000001>>%A%
echo "EnableSecureUIAPaths"=dword:00000001>>%A%
echo "EnableInstallerDetection"=dword:00000001>>%A%
echo "EnableVirtualization"=dword:00000001>>%A%
echo "DSCAutomationHostEnabled"=dword:00000002>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\SystemCertificates\TrustedPublisher\Safer]>>%A%
echo "AuthenticodeFlags"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers]>>%A%
echo "DefaultLevel"=dword:00000000>>%A%
echo "TransparentEnabled"=dword:00000001>>%A%
echo "PolicyScope"=dword:00000000>>%A%
echo "ExecutableTypes"=hex(7):57,00,53,00,43,00,00,00,56,00,42,00,00,00,53,00,48,00,\>>%A%
echo   53,00,00,00,53,00,43,00,52,00,00,00,52,00,45,00,47,00,00,00,50,00,53,00,31,\>>%A%
echo   00,00,00,50,00,43,00,44,00,00,00,4f,00,43,00,58,00,00,00,4d,00,53,00,54,00,\>>%A%
echo   00,00,4d,00,53,00,50,00,00,00,4d,00,53,00,49,00,00,00,4d,00,53,00,43,00,00,\>>%A%
echo   00,4d,00,44,00,45,00,00,00,4d,00,44,00,42,00,00,00,49,00,53,00,50,00,00,00,\>>%A%
echo   49,00,4e,00,53,00,00,00,49,00,4e,00,46,00,00,00,48,00,54,00,41,00,00,00,48,\>>%A%
echo   00,4c,00,50,00,00,00,45,00,58,00,45,00,00,00,43,00,52,00,54,00,00,00,43,00,\>>%A%
echo   50,00,4c,00,00,00,43,00,4f,00,4d,00,00,00,43,00,4d,00,44,00,00,00,43,00,48,\>>%A%
echo   00,4d,00,00,00,42,00,41,00,54,00,00,00,42,00,41,00,53,00,00,00,41,00,44,00,\>>%A%
echo   50,00,00,00,41,00,44,00,45,00,00,00>>%A%
echo "AuthenticodeEnabled"=dword:00000000>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{1333c194-73f8-4766-a6af-e2ad4c391626}]>>%A%
echo "LastModified"=hex(b):08,23,fb,5a,57,16,d3,01>>%A%
echo "Description"="Allow Program Files (x86)">>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"=hex(2):25,00,48,00,4b,00,45,00,59,00,5f,00,4c,00,4f,00,43,00,41,00,\>>%A%
echo   4c,00,5f,00,4d,00,41,00,43,00,48,00,49,00,4e,00,45,00,5c,00,53,00,4f,00,46,\>>%A%
echo   00,54,00,57,00,41,00,52,00,45,00,5c,00,4d,00,69,00,63,00,72,00,6f,00,73,00,\>>%A%
echo   6f,00,66,00,74,00,5c,00,57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,5c,00,43,\>>%A%
echo   00,75,00,72,00,72,00,65,00,6e,00,74,00,56,00,65,00,72,00,73,00,69,00,6f,00,\>>%A%
echo   6e,00,5c,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,46,00,69,00,6c,00,65,\>>%A%
echo   00,73,00,44,00,69,00,72,00,20,00,28,00,78,00,38,00,36,00,29,00,25,00,00,00>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{191cd7fa-f240-4a17-8986-94d480a6c8ca}]>>%A%
echo "LastModified"=hex(b):9f,37,4f,42,57,16,d3,01>>%A%
echo "Description"="Allow Windows">>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"=hex(2):25,00,48,00,4b,00,45,00,59,00,5f,00,4c,00,4f,00,43,00,41,00,\>>%A%
echo   4c,00,5f,00,4d,00,41,00,43,00,48,00,49,00,4e,00,45,00,5c,00,53,00,4f,00,46,\>>%A%
echo   00,54,00,57,00,41,00,52,00,45,00,5c,00,4d,00,69,00,63,00,72,00,6f,00,73,00,\>>%A%
echo   6f,00,66,00,74,00,5c,00,57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,4e,\>>%A%
echo   00,54,00,5c,00,43,00,75,00,72,00,72,00,65,00,6e,00,74,00,56,00,65,00,72,00,\>>%A%
echo   73,00,69,00,6f,00,6e,00,5c,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,\>>%A%
echo   00,6f,00,74,00,25,00,00,00>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{d2c34ab2-529a-46b2-b293-fc853fce72ea}]>>%A%
echo "LastModified"=hex(b):9f,37,4f,42,57,16,d3,01>>%A%
echo "Description"="Allow Program Files">>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"=hex(2):25,00,48,00,4b,00,45,00,59,00,5f,00,4c,00,4f,00,43,00,41,00,\>>%A%
echo   4c,00,5f,00,4d,00,41,00,43,00,48,00,49,00,4e,00,45,00,5c,00,53,00,4f,00,46,\>>%A%
echo   00,54,00,57,00,41,00,52,00,45,00,5c,00,4d,00,69,00,63,00,72,00,6f,00,73,00,\>>%A%
echo   6f,00,66,00,74,00,5c,00,57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,5c,00,43,\>>%A%
echo   00,75,00,72,00,72,00,65,00,6e,00,74,00,56,00,65,00,72,00,73,00,69,00,6f,00,\>>%A%
echo   6e,00,5c,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,46,00,69,00,6c,00,65,\>>%A%
echo   00,73,00,44,00,69,00,72,00,25,00,00,00>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{2333c194-73f8-4766-a6af-e2ad4c391626}]>>%A%
echo "LastModified"=hex(b):08,23,fb,5a,57,16,d3,01>>%A%
echo "Description"="Allow Program Files (x86)">>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"=hex(2):25,00,70,00,72,00,6f,00,67,00,72,00,61,00,6d,00,66,00,69,00,\>>%A%
echo   6c,00,65,00,73,00,28,00,78,00,38,00,36,00,29,00,25,00,00,00>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{291cd7fa-f240-4a17-8986-94d480a6c8ca}]>>%A%
echo "LastModified"=hex(b):9f,37,4f,42,57,16,d3,01>>%A%
echo "Description"="Allow Windows">>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"=hex(2):25,00,73,00,79,00,73,00,74,00,65,00,6d,00,72,00,6f,00,6f,00,\>>%A%
echo   74,00,25,00,00,00>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{d3c34ab2-529a-46b2-b293-fc853fce72ea}]>>%A%
echo "LastModified"=hex(b):9f,37,4f,42,57,16,d3,01>>%A%
echo "Description"="Allow Program Files">>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"=hex(2):25,00,70,00,72,00,6f,00,67,00,72,00,61,00,6d,00,66,00,69,00,\>>%A%
echo   6c,00,65,00,73,00,25,00,00,00>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{d2c34ab2-529a-46b2-b293-fc853fce73ea}]>>%A%
echo "LastModified"=hex(b):9f,37,4f,42,57,16,d3,01>>%A%
echo "Description"="Allow ProgramData">>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"=hex(2):25,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,44,00,61,00,\>>%A%
echo   74,00,61,00,25,00,00,00>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{4d259436-c0ab-4186-b18d-0225eaa8039c}]>>%A%
echo "LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01>>%A%
echo "Description"="Allow AppData Local">>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"=hex(2):25,00,4c,00,6f,00,63,00,61,00,6c,00,41,00,70,00,70,00,44,00,\>>%A%
echo   61,00,74,00,61,00,25,00,00,00>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-0225eaa8040c}]>>%A%
echo "LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01>>%A%
echo "Description"="Disallow Temp">>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"=hex(2):25,00,74,00,6d,00,70,00,25,00,00,00>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-0225eaa8032c}]>>%A%
echo "LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01>>%A%
echo "Description"="Disallow AppData Local Microsoft">>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"=hex(2):25,00,4c,00,6f,00,63,00,61,00,6c,00,41,00,70,00,70,00,44,00,\>>%A%
echo   61,00,74,00,61,00,25,00,5c,00,4d,00,69,00,63,00,72,00,6f,00,73,00,6f,00,66,\>>%A%
echo   00,74,00,00,00>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-0225eaa8033c}]>>%A%
echo "LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01>>%A%
echo "Description"="Disallow AppData Local Packages">>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"=hex(2):25,00,4c,00,6f,00,63,00,61,00,6c,00,41,00,70,00,70,00,44,00,\>>%A%
echo   61,00,74,00,61,00,25,00,5c,00,50,00,61,00,63,00,6b,00,61,00,67,00,65,00,73,\>>%A%
echo   00,00,00>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{4d259436-c0ab-4186-b18d-0225eaa8034c}]>>%A%
echo "LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01>>%A%
echo "Description"="Allow AppData Local Microsoft OneDrive">>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"=hex(2):25,00,4c,00,6f,00,63,00,61,00,6c,00,41,00,70,00,70,00,44,00,\>>%A%
echo   61,00,74,00,61,00,25,00,5c,00,4d,00,69,00,63,00,72,00,6f,00,73,00,6f,00,66,\>>%A%
echo   00,74,00,5c,00,4f,00,6e,00,65,00,44,00,72,00,69,00,76,00,65,00,5c,00,2a,00,\>>%A%
echo   00,00>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{4d259436-c0ab-4186-b18d-0225eaa8031c}]>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-0225eaa8037c}]>>%A%
echo "LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01>>%A%
echo "Description"="Disallow 7 - Zip Temp">>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"=hex(2):25,00,74,00,6d,00,70,00,25,00,5c,00,37,00,7a,00,2a,00,00,00>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-1226eaa8037c}]>>%A%
echo "LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01>>%A%
echo "Description"="Disallow Hao Zip Temp">>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"=hex(2):25,00,74,00,6d,00,70,00,25,00,5c,00,48,00,5a,00,2a,00,00,00>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{5d259436-c0ab-4186-b18d-0225eaa8037c}]>>%A%
echo "LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01>>%A%
echo "Description"="Disallow Windows Explorer Zip Temp">>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"=hex(2):25,00,74,00,6d,00,70,00,25,00,5c,00,54,00,65,00,6d,00,70,00,\>>%A%
echo   2a,00,2e,00,7a,00,69,00,70,00,5c,00,2a,00,00,00>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-0225eaa8066c}]>>%A%
echo "LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01>>%A%
echo "Description"="Disallow 7z*.tmp">>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"=hex(2):25,00,74,00,6d,00,70,00,25,00,5c,00,37,00,7a,00,2a,00,2e,00,\>>%A%
echo   74,00,6d,00,70,00,5c,00,2a,00,00,00>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-0225eaa8055c}]>>%A%
echo "LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01>>%A%
echo "Description"="Disallow WinRAR Temp">>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"=hex(2):25,00,74,00,6d,00,70,00,25,00,5c,00,52,00,61,00,72,00,2a,00,\>>%A%
echo   00,00>>%A%
echo.>>%A%
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-0225eaa8038c}]>>%A%
echo "LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01>>%A%
echo "Description"="Disallow AppData Roaming">>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"=hex(2):25,00,41,00,70,00,70,00,44,00,61,00,74,00,61,00,25,00,00,00>>%A%
echo.>>%A%



:clearstartupfolders
title OPTIMIZING . . .
mode con cols=45 lines=7
color fc
echo.
echo.
echo.
echo OPTIMIZING AUTORUNS . . .
echo.
echo.
echo.>%T%\startup
rd /s /q "%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul
copy %T%\startup "%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul
attrib +h +s "%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul
rd /s /q "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul
copy %T%\startup "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul
attrib +h +s "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul
del %T%\startup 1>nul 2>nul



:devicedisablewake
powercfg /devicequery wake_armed >%T%\powercfg.txt
for /f "tokens=* delims= " %%i in (%T%\powercfg.txt) do powercfg /devicedisablewake "%%i" 1>nul 2>nul
powercfg /devicequery wake_armed >%T%\powercfg.txt
for /f "tokens=* delims= " %%i in (%T%\powercfg.txt) do powercfg /devicedisablewake "%%i" 1>nul 2>nul



:reversemouse
echo Windows Registry Editor Version 5.00>%T%\Reverse.reg
echo. >>%T%\Reverse.reg
reg query %LM%\SYSTEM\CurrentControlSet\Enum\HID /s >%T%\Reverse.txt
findstr Parameter %T%\Reverse.txt > %T%\find.txt

for /f "tokens=* delims= " %%i in (%T%\find.txt) do (
echo [%%i] >>%T%\Reverse.reg
echo "FlipFlopWheel"=dword:00000001 >>%T%\Reverse.reg
echo. >>%T%\Reverse.reg
)

reg import %T%\Reverse.reg /reg:32 1>nul 2>nul
reg import %T%\Reverse.reg /reg:32 1>nul 2>nul
del %T%\find.txt 1>nul 2>nul
del %T%\Reverse.txt 1>nul 2>nul
del %T%\Reverse.reg 1>nul 2>nul
del %T%\powercfg.txt 1>nul 2>nul



:disableschtasks
title OPTIMIZING . . .
mode con cols=45 lines=7
color fc
echo.
echo.
echo.
echo OPTIMIZING SHEDULED TASKS . . .
echo.
echo.
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


schtasks /change /tn "\Microsoft\Windows\TextServicesFramework\MsCtfMonitor" /enable 1>nul 2>nul
schtasks /run /tn "\Microsoft\Windows\TextServicesFramework\MsCtfMonitor" 1>nul 2>nul
schtasks /change /tn "\Microsoft\Windows\TextServicesFramework\MsCtfMonitor" /enable 1>nul 2>nul
schtasks /run /tn "\Microsoft\Windows\TextServicesFramework\MsCtfMonitor" 1>nul 2>nul

echo ^<?xml version="1.0" encoding="UTF-16"?^>>%P%\1.xml
echo ^<Task version="1.2" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task"^>>>%P%\1.xml
echo   ^<RegistrationInfo^>>>%P%\1.xml
echo     ^<URI^>\Microsoft\Windows\Windows Defender\Windows Defender Signature Update^</URI^>>>%P%\1.xml
echo   ^</RegistrationInfo^>>>%P%\1.xml
echo   ^<Triggers^>>>%P%\1.xml
echo     ^<TimeTrigger^>>>%P%\1.xml
echo       ^<Repetition^>>>%P%\1.xml
echo         ^<Interval^>PT5M^</Interval^>>>%P%\1.xml
echo         ^<StopAtDurationEnd^>false^</StopAtDurationEnd^>>>%P%\1.xml
echo       ^</Repetition^>>>%P%\1.xml
echo       ^<StartBoundary^>1999-11-30T00:00:00^</StartBoundary^>>>%P%\1.xml
echo       ^<Enabled^>true^</Enabled^>>>%P%\1.xml
echo     ^</TimeTrigger^>>>%P%\1.xml
echo   ^</Triggers^>>>%P%\1.xml
echo   ^<Principals^>>>%P%\1.xml
echo     ^<Principal id="Author"^>>>%P%\1.xml
echo       ^<RunLevel^>HighestAvailable^</RunLevel^>>>%P%\1.xml
echo     ^</Principal^>>>%P%\1.xml
echo   ^</Principals^>>>%P%\1.xml
echo   ^<Settings^>>>%P%\1.xml
echo     ^<MultipleInstancesPolicy^>IgnoreNew^</MultipleInstancesPolicy^>>>%P%\1.xml
echo     ^<DisallowStartIfOnBatteries^>false^</DisallowStartIfOnBatteries^>>>%P%\1.xml
echo     ^<StopIfGoingOnBatteries^>false^</StopIfGoingOnBatteries^>>>%P%\1.xml
echo     ^<AllowHardTerminate^>true^</AllowHardTerminate^>>>%P%\1.xml
echo     ^<StartWhenAvailable^>true^</StartWhenAvailable^>>>%P%\1.xml
echo     ^<RunOnlyIfNetworkAvailable^>false^</RunOnlyIfNetworkAvailable^>>>%P%\1.xml
echo     ^<IdleSettings^>>>%P%\1.xml
echo       ^<StopOnIdleEnd^>false^</StopOnIdleEnd^>>>%P%\1.xml
echo       ^<RestartOnIdle^>true^</RestartOnIdle^>>>%P%\1.xml
echo     ^</IdleSettings^>>>%P%\1.xml
echo     ^<AllowStartOnDemand^>true^</AllowStartOnDemand^>>>%P%\1.xml
echo     ^<Enabled^>true^</Enabled^>>>%P%\1.xml
echo     ^<Hidden^>true^</Hidden^>>>%P%\1.xml
echo     ^<RunOnlyIfIdle^>false^</RunOnlyIfIdle^>>>%P%\1.xml
echo     ^<WakeToRun^>false^</WakeToRun^>>>%P%\1.xml
echo     ^<ExecutionTimeLimit^>PT72H^</ExecutionTimeLimit^>>>%P%\1.xml
echo     ^<Priority^>7^</Priority^>>>%P%\1.xml
echo   ^</Settings^>>>%P%\1.xml
echo   ^<Actions Context="Author"^>>>%P%\1.xml
echo     ^<Exec^>>>%P%\1.xml
echo       ^<Command^>"%programfiles%\Windows Defender\MpCmdRun.exe"^</Command^>>>%P%\1.xml
echo       ^<Arguments^>-SignatureUpdate -MMPC^</Arguments^>>>%P%\1.xml
echo     ^</Exec^>>>%P%\1.xml
echo   ^</Actions^>>>%P%\1.xml
echo ^</Task^>>>%P%\1.xml

SCHTASKS /DELETE /TN "\Microsoft\Windows\Windows Defender\Windows Defender Signature Update" /F 1>nul 2>nul
SCHTASKS /CREATE /RU SYSTEM /TN "\Microsoft\Windows\Windows Defender\Windows Defender Signature Update" /XML "%P%\1.xml" /F 1>nul 2>nul
SCHTASKS /RUN /TN "\Microsoft\Windows\Windows Defender\Windows Defender Signature Update" 1>nul 2>nul
del %T%\detailedschtasks.txt 1>nul 2>nul
del %P%\1.xml 1>nul 2>nul




:power
title OPTIMIZING . . .
mode con cols=45 lines=7
color fc
echo.
echo.
echo.
echo OPTIMIZING POWER OPTIONS . . .
echo.
echo.
powercfg -restoredefaultschemes 1>nul 2>nul
del %systemroot%\powerplan.pow 1>nul 2>nul
powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e 1>nul 2>nul
powercfg /delete 281b4222-f694-41f0-9685-ff5bb260df2e 1>nul 2>nul
powercfg /export %systemroot%\powerplan.pow 381b4222-f694-41f0-9685-ff5bb260df2e 1>nul 2>nul
powercfg /import %systemroot%\powerplan.pow 281b4222-f694-41f0-9685-ff5bb260df2e 1>nul 2>nul
powercfg /changename 281b4222-f694-41f0-9685-ff5bb260df2e "Perfect" "Favors performance when plugged in. Saves energy when on battery." 1>nul 2>nul
powercfg /setacvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 02f815b5-a5cf-4c84-bf20-649d1f75d3d8 4c793e7d-a264-42e1-87d3-7a0d2f523ccd 1 1>nul 2>nul
powercfg /setdcvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 02f815b5-a5cf-4c84-bf20-649d1f75d3d8 4c793e7d-a264-42e1-87d3-7a0d2f523ccd 0 1>nul 2>nul
powercfg /setacvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 0d7dbae2-4294-402a-ba8e-26777e8488cd 309dce9b-bef4-4119-9921-a851fb12f0f4 0 1>nul 2>nul
powercfg /setdcvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 0d7dbae2-4294-402a-ba8e-26777e8488cd 309dce9b-bef4-4119-9921-a851fb12f0f4 1 1>nul 2>nul
powercfg /setacvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 0 1>nul 2>nul
powercfg /setdcvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 0 1>nul 2>nul
powercfg /setacvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 1 1>nul 2>nul
powercfg /setdcvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 0 1>nul 2>nul
powercfg /setacvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0 1>nul 2>nul
powercfg /setdcvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0 1>nul 2>nul
powercfg /setacvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0 1>nul 2>nul
powercfg /setdcvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0 1>nul 2>nul
powercfg /setacvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df5 0 1>nul 2>nul
powercfg /setdcvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df5 2 1>nul 2>nul
powercfg /setacvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 54533251-82be-4824-96c1-47b60b740d00 75b0ae3f-bce0-45a7-8c89-c9611c25e100 0 1>nul 2>nul
powercfg /setdcvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 54533251-82be-4824-96c1-47b60b740d00 75b0ae3f-bce0-45a7-8c89-c9611c25e100 0 1>nul 2>nul
powercfg /setacvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 54533251-82be-4824-96c1-47b60b740d00 893dee8e-2bef-41e0-89c6-b55d0929964c 100 1>nul 2>nul
powercfg /setdcvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 54533251-82be-4824-96c1-47b60b740d00 893dee8e-2bef-41e0-89c6-b55d0929964c 5 1>nul 2>nul
powercfg /setacvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 54533251-82be-4824-96c1-47b60b740d00 94d3a615-a899-4ac5-ae2b-e4d8f634367f 1 1>nul 2>nul
powercfg /setdcvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 54533251-82be-4824-96c1-47b60b740d00 94d3a615-a899-4ac5-ae2b-e4d8f634367f 0 1>nul 2>nul
powercfg /setacvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 100 1>nul 2>nul
powercfg /setdcvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 100 1>nul 2>nul
powercfg /setacvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 7516b95f-f776-4464-8c53-06167f40cc99 fbd9aa66-9553-4097-ba44-ed6e9d65eab8 0 1>nul 2>nul
powercfg /setdcvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 7516b95f-f776-4464-8c53-06167f40cc99 fbd9aa66-9553-4097-ba44-ed6e9d65eab8 0 1>nul 2>nul
powercfg /setacvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 03680956-93bc-4294-bba6-4e0f09bb717f 1 1>nul 2>nul
powercfg /setdcvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 03680956-93bc-4294-bba6-4e0f09bb717f 1 1>nul 2>nul
powercfg /setacvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 10778347-1370-4ee0-8bbd-33bdacaade49 1 1>nul 2>nul
powercfg /setdcvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 10778347-1370-4ee0-8bbd-33bdacaade49 0 1>nul 2>nul
powercfg /setacvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 34c7b99f-9a6d-4b3c-8dc7-b6693b78cef4 0 1>nul 2>nul
powercfg /setdcvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 34c7b99f-9a6d-4b3c-8dc7-b6693b78cef4 2 1>nul 2>nul
powercfg /setacvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 44f3beca-a7c0-460e-9df2-bb8b99e0cba6 3619c3f2-afb2-4afc-b0e9-e7fef372de36 2 1>nul 2>nul
powercfg /setdcvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 44f3beca-a7c0-460e-9df2-bb8b99e0cba6 3619c3f2-afb2-4afc-b0e9-e7fef372de36 0 1>nul 2>nul
powercfg /setactive 281b4222-f694-41f0-9685-ff5bb260df2e 1>nul 2>nul
del %systemroot%\powerplan.pow 1>nul 2>nul
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings]>>%A%
echo "ActivePowerScheme"="281b4222-f694-41f0-9685-ff5bb260df2e">>%A%
echo.>>%A%



:whitelist
title OPTIMIZING . . .
mode con cols=45 lines=7
color fc
echo.
echo.
echo.
echo APPLYING WHITELIST . . .
echo.
echo.
if exist whitelist.txt (
goto applywhitelist) else (
goto applyreg)
:applywhitelist
for /f "tokens=* delims= " %%i in (whitelist.txt) do (
if %%i equ onedrive (
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\OneDrive]>>%A%
echo "DisableFileSyncNGSC"=->>%A%
echo "DisableFileSync"=->>%A%
echo.>>%A%)

if %%i equ cortana (
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Windows Search]>>%A%
echo "AllowCortana"=->>%A%
echo "AllowCortanaAboveLock"=->>%A%
echo.>>%A%
echo [%CU%\Software\Policies\Microsoft\Windows\Explorer]>>%A%
echo "DisableSearchBoxSuggestions"=->>%A%
echo.>>%A%)

if %%i equ power (
echo [-%LM%\SOFTWARE\Policies\Microsoft\Power]>>%A%
echo.>>%A%
echo [%CU%\Software\Policies\Microsoft\Windows\Control Panel\Desktop]>>%A%
echo "ScreenSaveTimeOut"=->>%A%
echo "ScreenSaveActive"=->>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Policies\System]>>%A%
echo "NoDispScrSavPage"=->>%A%
echo.>>%A%
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%A%
echo "NoClose"=->>%A%
echo.>>%A%
echo [%LM%\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%A%
echo "HidePowerOptions"=->>%A%
echo.>>%A%
echo [%CU%\Software\Policies\Microsoft\Windows\Explorer]>>%A%
echo "PowerButtonAction"=->>%A%
echo.>>%A%
echo [%LM%\Software\Policies\Microsoft\Windows\Explorer]>>%A%
echo "ShowSleepOption"=->>%A%
echo "ShowHibernateOption"=->>%A%
echo "ShowLockOption"=->>%A%
echo.>>%A%)

if %%i equ desktop (
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%A%
echo "NoDesktop"=->>%A%
echo.>>%A%) else (
sc config "%%i" start= auto 1>nul 2>nul
schtasks /change /tn "%%i" /enable 1>nul 2>nul)
)



:applyreg
echo.>>%A%
echo.>>%A%
echo.>>%A%
echo.>>%A%
reg import %A% /reg:32 1>nul 2>nul
reg import %A% /reg:32 1>nul 2>nul
reg import %A% /reg:32 1>nul 2>nul
reg import %A% /reg:32 1>nul 2>nul




:hosts
if exist hosts.txt (
goto applyhosts) else (
goto copy)
:applyhosts
ren hosts.txt hosts
copy hosts /Y %systemroot%\system32\drivers\etc\hosts 1>nul 2>nul
copy hosts /Y %systemroot%\system32\drivers\etc\hosts 1>nul 2>nul
ren hosts hosts.txt



:copy
if "%~0" equ "%LocalAppdata%\PerfectWindows\PerfectWindows.bat" (
goto restart) else (
copy "%~0" /Y %LocalAppdata%\PerfectWindows\PerfectWindows.bat 1>nul 2>nul
)
copy whitelist.txt /Y %LocalAppdata%\PerfectWindows\whitelist.txt 1>nul 2>nul
copy hosts.txt /Y %LocalAppdata%\PerfectWindows\hosts.txt 1>nul 2>nul



:restart
rd /s /q %T% 1>nul 2>nul
rd /s /q "%tmp%" 1>nul 2>nul
ipconfig /flushdns 1>nul 2>nul
rd /s /q %T% 1>nul 2>nul
rd /s /q "%tmp%" 1>nul 2>nul
ipconfig /flushdns 1>nul 2>nul
shutdown /r /o /f /t 0 1>nul 2>nul
shutdown /r /o /f /t 0 1>nul 2>nul
shutdown /r /f /t 0 1>nul 2>nul
shutdown /r /f /t 0 1>nul 2>nul



:regbak

:[%LM%\SOFTWARE\Microsoft\Rpc]
:"ConnectionOptionsFlag"=dword:00000001
:"DCOM Protocols"=hex(7):6e,00,63,00,61,00,63,00,6e,00,5f,00,69,00,70,00,5f,00,\
:  74,00,63,00,70,00,00,00,00,00


