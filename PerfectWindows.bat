@echo off
mode con cols=45 lines=7
color fc
pushd "%~dp0"
chcp 437 1>nul 2>nul
(echo check>"%systemroot%"\check.check) 1>nul 2>nul
if exist "%systemroot%"\check.check (
del "%systemroot%"\check.check 1>nul 2>nul
goto main) else (
title Elevated Privileges Required!
mode con cols=70 lines=7
color fc
echo.
echo Elevated privileges are required to optimize Windows!
echo.
echo Please right click on me and click on "Run as administrator".
echo.
pause
exit
)


:main
mode con cols=45 lines=7
title Are you ready?
color fc
pushd "%~dp0"
chcp 437 1>nul 2>nul
echo.
echo To ensure the optimization works,
echo your PC will be restarted automatically.
echo.
echo If you are ready to restart your PC,
pause
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
SCHTASKS /END /TN "\Perfect Windows\Refresh Local Machine Reg" 1>nul 2>nul
SCHTASKS /END /TN "\Perfect Windows\Refresh Current User Reg" 1>nul 2>nul
SCHTASKS /DELETE /TN "\Perfect Windows\Refresh Local Machine Reg" /F 1>nul 2>nul
SCHTASKS /DELETE /TN "\Perfect Windows\Refresh Current User Reg" /F 1>nul 2>nul
rd /s /q %P% 1>nul 2>nul
rd /s /q %T% 1>nul 2>nul
md %P% 1>nul 2>nul
md %T% 1>nul 2>nul
md %systemdrive%\TrustedApps 1>nul 2>nul
powercfg /hibernate /size 75 1>nul 2>nul
powercfg /hibernate /type full 1>nul 2>nul
rd /s /q %T% 1>nul 2>nul
md %P% 1>nul 2>nul
md %T% 1>nul 2>nul
powercfg /hibernate /size 75 1>nul 2>nul
powercfg /hibernate /type full 1>nul 2>nul




:services
title Optimizing Windows...
mode con cols=45 lines=7
color fc
echo.
echo.
echo.
echo Optimizing services...
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
title Optimizing Windows...
mode con cols=45 lines=7
color fc
echo.
echo.
echo.
echo Optimizing Windows settings...

echo @echo off>%systemroot%\restore.bat
echo start regedit /s %P%\1.reg>>%systemroot%\restore.bat
echo chcp 437>>%systemroot%\restore.bat
echo title CONGRATULATIONS !>>%systemroot%\restore.bat
echo color 2f>>%systemroot%\restore.bat
echo mode con cols=38 lines=19>>%systemroot%\restore.bat
echo echo.>>%systemroot%\restore.bat
echo echo.>>%systemroot%\restore.bat
echo echo.>>%systemroot%\restore.bat
echo echo.>>%systemroot%\restore.bat
echo echo YOUR PC IS SAFE AND SOUND !>>%systemroot%\restore.bat
echo echo.>>%systemroot%\restore.bat
echo echo.>>%systemroot%\restore.bat
echo echo.>>%systemroot%\restore.bat
echo echo.>>%systemroot%\restore.bat
echo echo HAVE A NICE DAY, %USERNAME% !>>%systemroot%\restore.bat
echo echo.>>%systemroot%\restore.bat
echo echo.>>%systemroot%\restore.bat
echo echo.>>%systemroot%\restore.bat
echo echo.>>%systemroot%\restore.bat
echo pause>>%systemroot%\restore.bat
echo exit>>%systemroot%\restore.bat


echo @echo off>%systemroot%\pause.bat
echo start regedit /s %P%\2.reg>>%systemroot%\pause.bat
echo chcp 437>>%systemroot%\pause.bat
echo title WARNING !>>%systemroot%\pause.bat
echo color cf>>%systemroot%\pause.bat
echo mode con cols=38 lines=23>>%systemroot%\pause.bat
echo echo.>>%systemroot%\pause.bat
echo echo.>>%systemroot%\pause.bat
echo echo.>>%systemroot%\pause.bat
echo echo YOUR PC IS NOT SAFE NOW !>>%systemroot%\pause.bat
echo echo.>>%systemroot%\pause.bat
echo echo.>>%systemroot%\pause.bat
echo echo.>>%systemroot%\pause.bat
echo echo PLEASE DO REMEMBER TO RUN>>%systemroot%\pause.bat
echo echo.>>%systemroot%\pause.bat
echo echo.>>%systemroot%\pause.bat
echo echo.>>%systemroot%\pause.bat
echo echo "RESTORE" FROM START MENU TO>>%systemroot%\pause.bat
echo echo.>>%systemroot%\pause.bat
echo echo.>>%systemroot%\pause.bat
echo echo.>>%systemroot%\pause.bat
echo echo BRING YOUR PC BACK TO SAFETY !>>%systemroot%\pause.bat
echo echo.>>%systemroot%\pause.bat
echo echo.>>%systemroot%\pause.bat
echo echo.>>%systemroot%\pause.bat
echo pause>>%systemroot%\pause.bat
echo exit>>%systemroot%\pause.bat


echo Windows Registry Editor Version 5.00>%P%\2.reg
echo.>>%P%\2.reg
echo [-%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer]>>%P%\2.reg
echo.>>%P%\2.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers]>>%P%\2.reg
echo "AuthenticodeEnabled"=dword:00000000>>%P%\2.reg
echo.>>%P%\2.reg
echo.>>%P%\2.reg
echo.>>%P%\2.reg
echo.>>%P%\2.reg


echo Windows Registry Editor Version 5.00>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SYSTEM\CurrentControlSet\Control\Keyboard Layout]>>%P%\1.reg
echo "Scancode Map"=hex:00,00,00,00,00,00,00,00,40,00,00,00,32,E0,3B,00,2E,E0,51,E0,30,E0,49,E0,00,00,00,00>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit\Favorites]>>%P%\1.reg
echo "User Policies 2"="%CU%\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies">>%P%\1.reg
echo "Machine Policies 2"="%LM%\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies">>%P%\1.reg
echo "User Policies 1"="%CU%\\SOFTWARE\\Policies\\Microsoft">>%P%\1.reg
echo "Machine Policies 1"="%LM%\\SOFTWARE\\Policies\\Microsoft">>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\Software\Microsoft\Windows\CurrentVersion\Policies]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%CU%\Software\Microsoft\Windows\CurrentVersion\Policies]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%CU%\SOFTWARE\Policies\Microsoft]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\SOFTWARE\Policies\MicrosoftBeta]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\System\CurrentControlSet\Control\Terminal Server\Wds\rdpwd\StartupPrograms]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\AppSetup]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Userinit]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\VmApplet]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\SYSTEM\CurrentControlSet\Control\SafeBoot\AlternateShell]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\AlternateShells\AvailableShells]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Taskman]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Terminal Server\Install\Software\Microsoft\Windows\CurrentVersion\Runonce]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Terminal Server\Install\Software\Microsoft\Windows\CurrentVersion\RunonceEx]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Terminal Server\Install\Software\Microsoft\Windows\CurrentVersion\Run]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%CU%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Terminal Server\Install\Software\Microsoft\Windows\CurrentVersion\Runonce]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%CU%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Terminal Server\Install\Software\Microsoft\Windows\CurrentVersion\RunonceEx]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%CU%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Terminal Server\Install\Software\Microsoft\Windows\CurrentVersion\Run]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\InitialProgram]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\SOFTWARE\Microsoft\Active Setup\Installed Components]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\SOFTWARE\Wow6432Node\Microsoft\Active Setup\Installed Components]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\Software\Microsoft\Windows NT\CurrentVersion\Windows\IconServiceLib]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\SOFTWARE\Microsoft\Windows CE Services\AutoStartOnConnect]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\SOFTWARE\Wow6432Node\Microsoft\Windows CE Services\AutoStartOnConnect]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\SOFTWARE\Microsoft\Windows CE Services\AutoStartOnDisconnect]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\SOFTWARE\Wow6432Node\Microsoft\Windows CE Services\AutoStartOnDisconnect]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\Software\Policies\Microsoft\Windows\System\Scripts]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%CU%\Software\Policies\Microsoft\Windows\System\Scripts]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%CU%\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%CU%\Software\Microsoft\Windows NT\CurrentVersion\Windows\Load]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%CU%\Software\Microsoft\Windows NT\CurrentVersion\Windows\Run]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Shell]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%CU%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Shell]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\Software\Microsoft\Windows\CurrentVersion\Policies\System\Shell]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%CU%\Software\Microsoft\Windows\CurrentVersion\Policies\System\Shell]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\Software\Microsoft\Windows\CurrentVersion\Group Policy\Scripts]>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SYSTEM\CurrentControlSet\Services\NetBT\Parameters]>>%P%\1.reg
echo "SMBDeviceEnabled"=dword:00000000>>%P%\1.reg
echo "TransportBindName"=->>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Microsoft\Ole]>>%P%\1.reg
echo "EnableDCOM"="N">>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Microsoft\Rpc]>>%P%\1.reg
echo "DCOM Protocols"=hex(7):00,00>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SYSTEM\CurrentControlSet\Services\lanmanserver\Parameters]>>%P%\1.reg
echo "AutoShareServer"=dword:00000000>>%P%\1.reg
echo "AutoShareWks"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SYSTEM\CurrentControlSet\Control\LSA]>>%P%\1.reg
echo "RestrictAnonymous"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon]>>%P%\1.reg
echo "EnableFirstLogonAnimation"=dword:00000001>>%P%\1.reg
echo "WinStationsDisabled"="0">>%P%\1.reg
echo "Userinit"="%systemdrive%\\WINDOWS\\system32\\userinit.exe,">>%P%\1.reg
echo "Shell"="explorer.exe">>%P%\1.reg
echo "ShellCritical"=dword:00000000>>%P%\1.reg
echo "ShellInfrastructure"="sihost.exe">>%P%\1.reg
echo "SiHostCritical"=dword:00000000>>%P%\1.reg
echo "SiHostReadyTimeOut"=dword:00000000>>%P%\1.reg
echo "SiHostRestartCountLimit"=dword:00000000>>%P%\1.reg
echo "SiHostRestartTimeGap"=dword:00000000>>%P%\1.reg
echo "AutoRestartShell"=dword:00000001>>%P%\1.reg
echo "DisableBackButton"=dword:00000001>>%P%\1.reg
echo "EnableSIHostIntegration"=dword:00000001>>%P%\1.reg
echo "ForceUnlockLogon"=dword:00000000>>%P%\1.reg
echo "LegalNoticeCaption"="">>%P%\1.reg
echo "LegalNoticeText"="">>%P%\1.reg
echo "PowerdownAfterShutdown"="0">>%P%\1.reg
echo "ReportBootOk"="1">>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations]>>%P%\1.reg
echo ".tif"="PhotoViewer.FileAssoc.Tiff">>%P%\1.reg
echo ".tiff"="PhotoViewer.FileAssoc.Tiff">>%P%\1.reg
echo ".jpg"="PhotoViewer.FileAssoc.Tiff">>%P%\1.reg
echo ".jpeg"="PhotoViewer.FileAssoc.Tiff">>%P%\1.reg
echo ".jpe"="PhotoViewer.FileAssoc.Tiff">>%P%\1.reg
echo ".jfif"="PhotoViewer.FileAssoc.Tiff">>%P%\1.reg
echo ".bmp"="PhotoViewer.FileAssoc.Tiff">>%P%\1.reg
echo ".gif"="PhotoViewer.FileAssoc.Tiff">>%P%\1.reg
echo ".png"="PhotoViewer.FileAssoc.Tiff">>%P%\1.reg
echo ".ico"="PhotoViewer.FileAssoc.Tiff">>%P%\1.reg
echo ".dib"="PhotoViewer.FileAssoc.Tiff">>%P%\1.reg
echo ".wdp"="PhotoViewer.FileAssoc.Tiff">>%P%\1.reg
echo ".jxr"="PhotoViewer.FileAssoc.Tiff">>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SYSTEM\CurrentControlSet\Control\Remote Assistance]>>%P%\1.reg
echo "fAllowToGetHelp"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SYSTEM\CurrentControlSet\Control\Terminal Server]>>%P%\1.reg
echo "fDenyTSConnections"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\Software\Policies\Microsoft\Windows\BITS]>>%P%\1.reg
echo "EnablePeercaching"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization]>>%P%\1.reg
echo "DODownloadMode"=dword:00000003>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Internet Explorer\PhishingFilter]>>%P%\1.reg
echo "PreventOverride"=dword:00000000>>%P%\1.reg
echo "PreventOverrideAppRepUnknown"=dword:00000000>>%P%\1.reg
echo "EnabledV9"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter]>>%P%\1.reg
echo "EnabledV9"=dword:00000001>>%P%\1.reg
echo "PreventOverride"=dword:00000000>>%P%\1.reg
echo "PreventOverrideAppRepUnknown"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\System]>>%P%\1.reg
echo "EnableSmartScreen"=dword:00000001>>%P%\1.reg
echo "ShellSmartScreenLevel"="Warn">>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Policies\System]>>%P%\1.reg
echo "DisableTaskMgr"=->>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Policies\Microsoft\Windows\System]>>%P%\1.reg
echo "DisableCMD"=->>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SYSTEM\CurrentControlSet\Control\Session Manager]>>%P%\1.reg
echo "BootExecute"=hex(7):00,00>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]>>%P%\1.reg
echo "VerboseStatus"=dword:00000001>>%P%\1.reg
echo "EnableLUA"=dword:00000001>>%P%\1.reg
echo "ConsentPromptBehaviorAdmin"=dword:00000005>>%P%\1.reg
echo "ConsentPromptBehaviorUser"=dword:00000003>>%P%\1.reg
echo "PromptOnSecureDesktop"=dword:00000001>>%P%\1.reg
echo "EnableUIADesktopToggle"=dword:00000000>>%P%\1.reg
echo "FilterAdministratorToken"=dword:00000001>>%P%\1.reg
echo "EnableSecureUIAPaths"=dword:00000001>>%P%\1.reg
echo "EnableInstallerDetection"=dword:00000001>>%P%\1.reg
echo "EnableVirtualization"=dword:00000001>>%P%\1.reg
echo "ValidateAdminCodeSignatures"=dword:00000000>>%P%\1.reg
echo "DSCAutomationHostEnabled"=dword:00000002>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers]>>%P%\1.reg
echo "AuthenticodeEnabled"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\SystemCertificates\AuthRoot]>>%P%\1.reg
echo "DisableRootAutoUpdate"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\SystemCertificates\TrustedPublisher\Safer]>>%P%\1.reg
echo "AuthenticodeFlags"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile]>>%P%\1.reg
echo "DisableNotifications"=dword:00000000>>%P%\1.reg
echo "EnableFirewall"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile]>>%P%\1.reg
echo "EnableFirewall"=dword:00000001>>%P%\1.reg
echo "DisableNotifications"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile]>>%P%\1.reg
echo "DisableNotifications"=dword:00000000>>%P%\1.reg
echo "EnableFirewall"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Microsoft\Security Center]>>%P%\1.reg
echo "AntiVirusOverride"=->>%P%\1.reg
echo "FirewallDisableNotify"=->>%P%\1.reg
echo "UacDisableNotify"=->>%P%\1.reg
echo "UpdatesDisableNotify"=->>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Microsoft\Security Center\Svc]>>%P%\1.reg
echo "AntiVirusOverride"=->>%P%\1.reg
echo "FirewallDisableNotify"=->>%P%\1.reg
echo "UacDisableNotify"=->>%P%\1.reg
echo "UpdatesDisableNotify"=->>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate]>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU]>>%P%\1.reg
echo "NoAutoUpdate"=dword:00000001>>%P%\1.reg
echo "ExcludeWUDriversInQualityUpdate"=dword:00000000>>%P%\1.reg
echo "NoAutoRebootWithLoggedOnUsers"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\MRT]>>%P%\1.reg
echo "DontOfferThroughWUAU"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\SOFTWARE\Policies\Microsoft\PassportForWork\PINComplexity]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%CU%\SOFTWARE\Policies\Microsoft\PassportForWork\PINComplexity]>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\PassportForWork\PINComplexityBeta]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%CU%\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization]>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance]>>%P%\1.reg
echo "WakeUp"=dword:00000000>>%P%\1.reg
echo "MaintenanceDisabled"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SYSTEM\CurrentControlSet\Control\CrashControl]>>%P%\1.reg
echo "AutoReboot"=dword:00000000>>%P%\1.reg
echo "AlwaysKeepMemoryDump"=dword:00000000>>%P%\1.reg
echo "CrashDumpEnabled"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Maps]>>%P%\1.reg
echo "AutoDownloadAndUpdateMapData"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\WindowsStore]>>%P%\1.reg
echo "AutoDownload"=dword:00000002>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore]>>%P%\1.reg
echo "DisableConfig"=dword:00000001>>%P%\1.reg
echo "DisableSR"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\SQMClient\Windows]>>%P%\1.reg
echo "CEIPEnable"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting]>>%P%\1.reg
echo "DontShowUI"=dword:00000001>>%P%\1.reg
echo "DontSendAdditionalData"=dword:00000001>>%P%\1.reg
echo "Disabled"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting]>>%P%\1.reg
echo "DoReport"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters]>>%P%\1.reg
echo "EnableSuperfetch"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\AppCompat]>>%P%\1.reg
echo "DisablePCA"=dword:00000001>>%P%\1.reg
echo "DisableEngine"=dword:00000001>>%P%\1.reg
echo "VDMDisallowed"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\HomeGroup]>>%P%\1.reg
echo "DisableHomeGroup"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform]>>%P%\1.reg
echo "NoGenTicket"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\DWM]>>%P%\1.reg
echo "AnimationsShiftKey"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%P%\1.reg
echo "NoToolbarsOnTaskbar"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications]>>%P%\1.reg
echo "NoToastApplicationNotification"=dword:00000001>>%P%\1.reg
echo "NoToastApplicationNotificationOnLockScreen"=dword:00000001>>%P%\1.reg
echo "NoTileApplicationNotification"=dword:00000001>>%P%\1.reg
echo "NoCloudApplicationNotification"=dword:00000001>>%P%\1.reg
echo "DisallowNotificationMirroring"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Personalization]>>%P%\1.reg
echo "NoLockScreen"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%P%\1.reg
echo "AllowOnlineTips"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\System]>>%P%\1.reg
echo "DisableLockScreenAppNotifications"=dword:00000001>>%P%\1.reg
echo "DisableLogonBackgroundImage"=dword:00000001>>%P%\1.reg
echo "BlockUserFromShowingAccountDetailsOnSignin"=dword:00000001>>%P%\1.reg
echo "HiberbootEnabled"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Policies\Microsoft\Windows\Explorer]>>%P%\1.reg
echo "EnableLegacyBalloonNotifications"=dword:00000001>>%P%\1.reg
echo "DisableNotificationCenter"=dword:00000001>>%P%\1.reg
echo "HidePeopleBar"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize]>>%P%\1.reg
echo "EnableTransparency"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People]>>%P%\1.reg
echo "PeopleBand"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People\ShoulderTap]>>%P%\1.reg
echo "ShoulderTap"=dword:00000000>>%P%\1.reg
echo "ShoulderTapAudio"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SYSTEM\CurrentControlSet\Control\Session Manager\Power]>>%P%\1.reg
echo "AwayModeEnabled"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%P%\1.reg
echo "UseOLEDTaskbarTransparency"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\MultitaskingView\AltTabViewHost]>>%P%\1.reg
echo "Grid_backgroundPercent"=dword:00000000>>%P%\1.reg
echo "BackgroundDimmingLayer_percent"=dword:00000028>>%P%\1.reg
echo "wallpaper"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer]>>%P%\1.reg
echo "EnableAutoTray"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%P%\1.reg
echo "DontUsePowerShellOnWinX"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%P%\1.reg
echo "Start_TrackDocs"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%P%\1.reg
echo "LaunchTo"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer]>>%P%\1.reg
echo "ShowFrequent"=dword:00000000>>%P%\1.reg
echo "ShowRecent"=dword:00000000>>%P%\1.reg
echo "ShellState"=hex:24,00,00,00,1c,08,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\>>%P%\1.reg
echo    01,00,00,00,13,00,00,00,00,00,00,00,6b,00,00,00>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Modules\GlobalSettings\DetailsContainer]>>%P%\1.reg
echo "DetailsContainer"=hex:02,00,00,00,02,00,00,00>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Policies\Microsoft\Windows\Explorer]>>%P%\1.reg
echo "ClearTilesOnExit"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Policies\Microsoft\Windows\Explorer]>>%P%\1.reg
echo "DisableSearchBoxSuggestions"=dword:00000001>>%P%\1.reg
echo "ExplorerRibbonStartsMinimized"=dword:00000001>>%P%\1.reg
echo "DisableIndexedLibraryExperience"=dword:00000001>>%P%\1.reg
echo "DisableSearchHistory"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%P%\1.reg
echo "ForceClassicControlPanel"=dword:00000001>>%P%\1.reg
echo "EnforceShellExtensionSecurity"=dword:00000001>>%P%\1.reg
echo "ClearRecentDocsOnExit"=dword:00000001>>%P%\1.reg
echo "NoRecentDocsMenu"=dword:00000001>>%P%\1.reg
echo "NoStartMenuMFUprogramsList"=dword:00000001>>%P%\1.reg
echo "ClearRecentProgForNewUserInStartMenu"=dword:00000001>>%P%\1.reg
echo "NoTrayContextMenu"=dword:00000001>>%P%\1.reg
echo "NoTaskGrouping"=dword:00000000>>%P%\1.reg
echo "DisableCurrentUserRun"=dword:00000001>>%P%\1.reg
echo "DisableCurrentUserRunOnce"=->>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%P%\1.reg
echo "DisableLocalMachineRun"=dword:00000001>>%P%\1.reg
echo "HidePowerOptions"=dword:00000001>>%P%\1.reg
echo "DisableLocalMachineRunOnce"=->>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Modules\GlobalSettings\Sizer]>>%P%\1.reg
echo "PageSpaceControlSizer"=hex:a0,00,00,00,00,00,00,00,00,00,00,00,56,03,00,00>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%P%\1.reg
echo "ExtendedUIHoverTime"=dword:01111111>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband]>>%P%\1.reg
echo "NumThumbnails"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%P%\1.reg
echo "ShowTaskViewButton"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\Preferences]>>%P%\1.reg
echo "WholeFileSystem"=dword:00000000>>%P%\1.reg
echo "SystemFolders"=dword:00000000>>%P%\1.reg
echo "ArchivedFiles"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\PrimaryProperties\UnindexedLocations]>>%P%\1.reg
echo "SearchOnly"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\PenWorkspace]>>%P%\1.reg
echo "PenWorkspaceButtonDesiredVisibility"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Search]>>%P%\1.reg
echo "SearchboxTaskbarMode"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Touchpad]>>%P%\1.reg
echo "TouchpadDesiredVisibility"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Policies\Microsoft\Windows\Explorer]>>%P%\1.reg
echo "ShowWindowsStoreAppsOnTaskbar"=dword:00000002>>%P%\1.reg
echo "NoPinningToTaskbar"=dword:00000001>>%P%\1.reg
echo "NoPinningStoreToTaskbar"=dword:00000001>>%P%\1.reg
echo "TaskbarNoPinnedList"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Control Panel\Desktop\WindowMetrics]>>%P%\1.reg
echo "MinAnimate"="1">>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu]>>%P%\1.reg
echo "{645FF040-5081-101B-9F08-00AA002F954E}"=dword:00000001>>%P%\1.reg
echo "{59031a47-3f72-44a7-89c5-5595fe6b30ee}"=dword:00000001>>%P%\1.reg
echo "{20D04FE0-3AEA-1069-A2D8-08002B30309D}"=dword:00000000>>%P%\1.reg
echo "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}"=dword:00000001>>%P%\1.reg
echo "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel]>>%P%\1.reg
echo "{645FF040-5081-101B-9F08-00AA002F954E}"=dword:00000001>>%P%\1.reg
echo "{59031a47-3f72-44a7-89c5-5595fe6b30ee}"=dword:00000001>>%P%\1.reg
echo "{20D04FE0-3AEA-1069-A2D8-08002B30309D}"=dword:00000000>>%P%\1.reg
echo "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}"=dword:00000001>>%P%\1.reg
echo "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\cleanuppath]>>%P%\1.reg
echo @=hex(2):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,00,25,\>>%P%\1.reg
echo   00,5c,00,53,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,63,00,6c,00,\>>%P%\1.reg
echo   65,00,61,00,6e,00,6d,00,67,00,72,00,2e,00,65,00,78,00,65,00,20,00,2f,00,44,\>>%P%\1.reg
echo   00,20,00,25,00,63,00,00,00>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\DefragPath]>>%P%\1.reg
echo @=hex(2):25,00,73,00,79,00,73,00,74,00,65,00,6d,00,72,00,6f,00,6f,00,74,00,25,\>>%P%\1.reg
echo   00,5c,00,73,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,64,00,66,00,\>>%P%\1.reg
echo   72,00,67,00,75,00,69,00,2e,00,65,00,78,00,65,00,00,00>>%P%\1.reg
echo.>>%P%\1.reg
echo [HKEY_CLASSES_ROOT\lnkfile]>>%P%\1.reg
echo @="Shortcut">>%P%\1.reg
echo "IsShortcut"="">>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Themes]>>%P%\1.reg
echo "ThemeChangesDesktopIcons"=dword:00000000>>%P%\1.reg
echo "ThemeChangesMousePointers"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Control Panel\Mouse]>>%P%\1.reg
echo "MouseSensitivity"="10">>%P%\1.reg
echo "MouseSpeed"="2">>%P%\1.reg
echo "MouseThreshold1"="6">>%P%\1.reg
echo "MouseThreshold2"="10">>%P%\1.reg
echo "MouseTrails"="0">>%P%\1.reg
echo "MouseHoverTime"="2">>%P%\1.reg
echo "SnapToDefaultButton"="0">>%P%\1.reg
echo "DoubleClickSpeed"="500">>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Control Panel\Desktop]>>%P%\1.reg
echo "MouseWheelRouting"=dword:00000002>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%P%\1.reg
echo "NoInternetIcon"=dword:00000001>>%P%\1.reg
echo "HideSCANetwork"=dword:00000001>>%P%\1.reg
echo "HideSCAHealth"=dword:00000001>>%P%\1.reg
echo "HideSCAVolume"=dword:00000001>>%P%\1.reg
echo "NoAutoTrayNotify"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Policies\Microsoft\Windows\Control Panel\Desktop]>>%P%\1.reg
echo "ScreenSaveTimeOut"="0">>%P%\1.reg
echo "ScreenSaverIsSecure"="1">>%P%\1.reg
echo "ScreenSaveActive"="0">>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Policies\System]>>%P%\1.reg
echo "NoDispScrSavPage"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%P%\1.reg
echo "NoDesktop"=dword:00000001>>%P%\1.reg
echo "NoClose"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%P%\1.reg
echo "SeparateProcess"=dword:00000001>>%P%\1.reg
echo "ShowTypeOverlay"=dword:00000001>>%P%\1.reg
echo "Hidden"=dword:00000002>>%P%\1.reg
echo "ShowSuperHidden"=dword:00000000>>%P%\1.reg
echo "ShowEncryptCompressedColor"=dword:00000001>>%P%\1.reg
echo "HideFileExt"=dword:00000001>>%P%\1.reg
echo "AutoCheckSelect"=dword:00000001>>%P%\1.reg
echo "TaskbarSizeMove"=dword:00000000>>%P%\1.reg
echo "PersistBrowsers"=dword:00000001>>%P%\1.reg
echo "TaskbarAnimations"=dword:00000000>>%P%\1.reg
echo "TaskbarGlomLevel"=dword:00000001>>%P%\1.reg
echo "TaskbarGlomming"=dword:00000000>>%P%\1.reg
echo "IconsOnly"=dword:00000000>>%P%\1.reg
echo "ListviewShadow"=dword:00000001>>%P%\1.reg
echo "ListviewAlphaSelect"=dword:00000001>>%P%\1.reg
echo "TaskbarAppsVisibleInTabletMode"=dword:00000001>>%P%\1.reg
echo "TaskbarSmallIcons"=dword:00000001>>%P%\1.reg
echo "UseTabletModeNotificationIcons"=dword:00000000>>%P%\1.reg
echo "ShowSyncProviderNotifications"=dword:00000000>>%P%\1.reg
echo "JointResize"=dword:00000001>>%P%\1.reg
echo "SnapAssist"=dword:00000001>>%P%\1.reg
echo "SnapFill"=dword:00000001>>%P%\1.reg
echo "VirtualDesktopTaskbarFilter"=dword:00000001>>%P%\1.reg
echo "VirtualDesktopAltTabFilter"=dword:00000001>>%P%\1.reg
echo "ShowEncryptCompressedColor"=dword:00000001>>%P%\1.reg
echo "TypeAhead"=dword:00000001>>%P%\1.reg
echo "AlwaysShowMenus"=dword:00000000>>%P%\1.reg
echo "HideDrivesWithNoMedia"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState]>>%P%\1.reg
echo "Settings"=hex:0c,00,02,00,0a,01,00,00,60,00,00,00>>%P%\1.reg
echo "FullPath"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\CTF\LangBar]>>%P%\1.reg
echo "ShowStatus"=dword:00000003>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects]>>%P%\1.reg
echo "VisualFXSetting"=dword:00000003>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\DWM]>>%P%\1.reg
echo "AlwaysHibernateThumbnails"=dword:00000000>>%P%\1.reg
echo "EnableAeroPeek"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\PenWorkspace]>>%P%\1.reg
echo "PenWorkspaceAppSuggestionsEnabled"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Control Panel\Desktop]>>%P%\1.reg
echo "WheelScrollLines"="9">>%P%\1.reg
echo "MenuShowDelay"="0">>%P%\1.reg
echo "DragFullWindows"="1">>%P%\1.reg
echo "FontSmoothing"="2">>%P%\1.reg
echo "UserPreferencesMask"=hex:98,52,07,80,12,01,00,00>>%P%\1.reg
echo "WindowArrangementActive"="1">>%P%\1.reg
echo "PaintDesktopVersion"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows]>>%P%\1.reg
echo "DisplayVersion"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell]>>%P%\1.reg
echo "SignInMode"=dword:00000002>>%P%\1.reg
echo "ConvertibleSlateModePromptPreference"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers]>>%P%\1.reg
echo "DisableAutoplay"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager]>>%P%\1.reg
echo "FeatureManagementEnabled"=dword:00000000>>%P%\1.reg
echo "OemPreInstalledAppsEnabled"=dword:00000000>>%P%\1.reg
echo "PreInstalledAppsEnabled"=dword:00000000>>%P%\1.reg
echo "SilentInstalledAppsEnabled"=dword:00000000>>%P%\1.reg
echo "SoftLandingEnabled"=dword:00000000>>%P%\1.reg
echo "SystemPaneSuggestionsEnabled"=dword:00000000>>%P%\1.reg
echo "ContentDeliveryAllowed"=dword:00000000>>%P%\1.reg
echo "PreInstalledAppsEverEnabled"=dword:00000000>>%P%\1.reg
echo "RotatingLockScreenEnabled"=dword:00000000>>%P%\1.reg
echo "RotatingLockScreenOverlayEnabled"=dword:00000000>>%P%\1.reg
echo "SubscribedContent-310093Enabled"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Policies\Microsoft\Windows\CloudContent]>>%P%\1.reg
echo "DisableWindowsSpotlightWindowsWelcomeExperience"=dword:00000001>>%P%\1.reg
echo "DisableThirdPartySuggestions"=dword:00000001>>%P%\1.reg
echo "DisableWindowsSpotlightOnActionCenter"=dword:00000001>>%P%\1.reg
echo "DisableTailoredExperiencesWithDiagnosticData"=dword:00000001>>%P%\1.reg
echo "DisableWindowsSpotlightFeatures"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\CloudContent]>>%P%\1.reg
echo "DisableSoftLanding"=dword:00000001>>%P%\1.reg
echo "DisableWindowsConsumerFeatures"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\Software\Policies\Microsoft\Speech]>>%P%\1.reg
echo "AllowSpeechModelUpdate"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace]>>%P%\1.reg
echo "AllowSuggestedAppsInWindowsInkWorkspace"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%CU%\Software\Microsoft\TabletTip]>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Windows Search]>>%P%\1.reg
echo "AllowCortana"=dword:00000000>>%P%\1.reg
echo "AllowCortanaAboveLock"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\OneDrive]>>%P%\1.reg
echo "DisableFileSyncNGSC"=dword:00000001>>%P%\1.reg
echo "DisableFileSync"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%P%\1.reg
echo "NoDriveTypeAutoRun"=dword:000000ff>>%P%\1.reg
echo "NoAutorun"=dword:00000001>>%P%\1.reg
echo "DontSetAutoplayCheckbox"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%P%\1.reg
echo "NoDriveTypeAutoRun"=dword:000000ff>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%P%\1.reg
echo "NoAutorun"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%P%\1.reg
echo "DontSetAutoplayCheckbox"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Windows Search]>>%P%\1.reg
echo "AutoIndexSharedFolders"=dword:00000001>>%P%\1.reg
echo "PreventIndexOnBattery"=dword:00000001>>%P%\1.reg
echo "AllowIndexingEncryptedStoresOrItems"=dword:00000000>>%P%\1.reg
echo "PreventIndexingOfflineFiles"=dword:00000001>>%P%\1.reg
echo "PreventIndexingPublicFolders"=dword:00000001>>%P%\1.reg
echo "PreventIndexingEmailAttachments"=dword:00000001>>%P%\1.reg
echo "PreventIndexingOutlook"=dword:00000001>>%P%\1.reg
echo "DisableRemovableDriveIndexing"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications]>>%P%\1.reg
echo "GlobalUserDisabled"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]>>%P%\1.reg
echo "VerboseStatus"=dword:00000001>>%P%\1.reg
echo "DisableStartupSound"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings]>>%P%\1.reg
echo "ShowSleepOption"=dword:00000001>>%P%\1.reg
echo "ShowHibernateOption"=dword:00000001>>%P%\1.reg
echo "ShowLockOption"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\Software\Policies\Microsoft\Windows\Explorer]>>%P%\1.reg
echo "ShowSleepOption"=dword:00000001>>%P%\1.reg
echo "ShowHibernateOption"=dword:00000001>>%P%\1.reg
echo "ShowLockOption"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Policies\Microsoft\Windows\Explorer]>>%P%\1.reg
echo "PowerButtonAction"=dword:00000200>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]>>%P%\1.reg
echo "ShutdownWithoutLogon"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51]>>%P%\1.reg
echo "DCSettingIndex"=dword:00000001>>%P%\1.reg
echo "ACSettingIndex"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\29F6C1DB-86DA-48C5-9FDB-F2B67B1F44DA]>>%P%\1.reg
echo "ACSettingIndex"=dword:00000000>>%P%\1.reg
echo "DCSettingIndex"=dword:00002a30>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\3C0BC021-C8A8-4E07-A973-6B14CBCB2B7E]>>%P%\1.reg
echo "ACSettingIndex"=dword:00000000>>%P%\1.reg
echo "DCSettingIndex"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\5CA83367-6E45-459F-A27B-476B1D01C936]>>%P%\1.reg
echo "ACSettingIndex"=dword:00000001>>%P%\1.reg
echo "DCSettingIndex"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\637EA02F-BBCB-4015-8E2C-A1C7B9C0B546]>>%P%\1.reg
echo "DCSettingIndex"=dword:00000002>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\6738E2C4-E8A5-4A42-B16A-E040E769756E]>>%P%\1.reg
echo "DCSettingIndex"=dword:0000012c>>%P%\1.reg
echo "ACSettingIndex"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\7648EFA3-DD9C-4E3E-B566-50F929386280]>>%P%\1.reg
echo "DCSettingIndex"=dword:00000002>>%P%\1.reg
echo "ACSettingIndex"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\8183ba9a-e910-48da-8769-14ae6dc1170a]>>%P%\1.reg
echo "DCSettingIndex"=dword:0000000a>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\94ac6d29-73ce-41a6-809f-6363ba21b47e]>>%P%\1.reg
echo "DCSettingIndex"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\96996BC0-AD50-47EC-923B-6F41874DD9EB]>>%P%\1.reg
echo "ACSettingIndex"=dword:00000001>>%P%\1.reg
echo "DCSettingIndex"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\9A66D8D7-4FF7-4EF9-B5A2-5A326CA2A469]>>%P%\1.reg
echo "DCSettingIndex"=dword:00000005>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\9D7815A6-7EE4-497E-8888-515A05F02364]>>%P%\1.reg
echo "DCSettingIndex"=dword:00002a30>>%P%\1.reg
echo "ACSettingIndex"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\A4B195F5-8225-47D8-8012-9D41369786E2]>>%P%\1.reg
echo "DCSettingIndex"=dword:00000000>>%P%\1.reg
echo "ACSettingIndex"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\B7A27025-E569-46c2-A504-2B96CAD225A1]>>%P%\1.reg
echo "ACSettingIndex"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\E69653CA-CF7F-4F05-AA73-CB833FA90AD4]>>%P%\1.reg
echo "DCSettingIndex"=dword:00000014>>%P%\1.reg
echo "ACSettingIndex"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\17aaa29b-8b43-4b94-aafe-35f64daaf1ee]>>%P%\1.reg
echo "DCSettingIndex"=dword:00000032>>%P%\1.reg
echo "ACSettingIndex"=dword:00000032>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f1fbfde2-a960-4165-9f88-50667911ce96]>>%P%\1.reg
echo "DCSettingIndex"=dword:00000032>>%P%\1.reg
echo "ACSettingIndex"=dword:00000032>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9]>>%P%\1.reg
echo "DCSettingIndex"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Power\PowerSettings\F3C5027D-CD16-4930-AA6B-90DB844A8F00]>>%P%\1.reg
echo "DCSettingIndex"=dword:00000007>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%P%\1.reg
echo "Start_ShowNetPlaces"=dword:00000000>>%P%\1.reg
echo "Start_NotifyNewApps"=dword:00000000>>%P%\1.reg
echo "Start_ShowDownloads"=dword:00000001>>%P%\1.reg
echo "Start_ShowVideos"=dword:00000001>>%P%\1.reg
echo "Start_AutoCascade"=dword:00000000>>%P%\1.reg
echo "Start_LargeMFUIcons"=dword:00000000>>%P%\1.reg
echo "Start_ShowPrinters"=dword:00000000>>%P%\1.reg
echo "Start_ShowSetProgramAccessAndDefaults"=dword:00000000>>%P%\1.reg
echo "Start_ShowUser"=dword:00000000>>%P%\1.reg
echo "Start_ShowHelp"=dword:00000000>>%P%\1.reg
echo "Start_MinMFU"=dword:00000000>>%P%\1.reg
echo "Start_ShowMyGames"=dword:00000000>>%P%\1.reg
echo "Start_ShowMyPics"=dword:00000001>>%P%\1.reg
echo "Start_ShowMyDocs"=dword:00000001>>%P%\1.reg
echo "Start_ShowMyMusic"=dword:00000001>>%P%\1.reg
echo "Start_ShowMyComputer"=dword:00000001>>%P%\1.reg
echo "Start_ShowControlPanel"=dword:00000001>>%P%\1.reg
echo "Start_SearchFiles"=dword:00000002>>%P%\1.reg
echo "Start_ShowHomeGroup"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Explorer]>>%P%\1.reg
echo "IconUnderline"=dword:00000002>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo]>>%P%\1.reg
echo "Enabled"=dword:00000000>>%P%\1.reg
echo [%CU%\Control Panel\International\User Profile]>>%P%\1.reg
echo "HttpAcceptLanguageOptOut"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\FileHistory]>>%P%\1.reg
echo "Disabled"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\MobilityCenter]>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\MobilePC\MobilityCenter]>>%P%\1.reg
echo "RunOnDesktop"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\SOFTWARE\Policies\Microsoft\Internet Explorer]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%CU%\SOFTWARE\Policies\Microsoft\Internet Explorer]>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Internet Explorer\Activities]>>%P%\1.reg
echo "NoActivities"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Internet Explorer\Download]>>%P%\1.reg
echo "CheckExeSignatures"="yes">>%P%\1.reg
echo "RunInvalidSignatures"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Internet Explorer\FlipAhead]>>%P%\1.reg
echo "Enabled"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Internet Explorer\Main]>>%P%\1.reg
echo "Enable Browser Extensions Beta"="no">>%P%\1.reg
echo "DoNotTrack"=dword:00000001>>%P%\1.reg
echo "Isolation"="PMEM">>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings]>>%P%\1.reg
echo "PreventIgnoreCertErrors"=dword:00000001>>%P%\1.reg
echo "CertificateRevocation"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Cache]>>%P%\1.reg
echo "Persistent"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Policies\Microsoft\Internet Explorer\Restrictions]>>%P%\1.reg
echo "NoHelpItemSendFeedback"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Internet Explorer\Main]>>%P%\1.reg
echo "HideNewEdgeButton"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Internet Explorer\TabbedBrowsing]>>%P%\1.reg
echo "NewTabPageShow"=dword:00000002>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Internet Settings]>>%P%\1.reg
echo "MaxConnectionsPerServer"=dword:00000008>>%P%\1.reg
echo "MaxConnectionsPer1_0Server"=dword:00000008>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\SettingSync]>>%P%\1.reg
echo "DisableWindowsSettingSync"=dword:00000002>>%P%\1.reg
echo "DisableWindowsSettingSyncUserOverride"=dword:00000001>>%P%\1.reg
echo "DisableSyncOnPaidNetwork"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\Software\Policies\Microsoft\UEV\Agent\Configuration]>>%P%\1.reg
echo "SyncOverMeteredNetwork"=dword:00000000>>%P%\1.reg
echo "SyncOverMeteredNetworkWhenRoaming"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main]>>%P%\1.reg
echo "SyncFavoritesBetweenIEAndMicrosoftEdge"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\MicrosoftEdge\ServiceUI]>>%P%\1.reg
echo "AllowWebContentOnNewTabPage"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\Software\Policies\Microsoft\Windows\DataCollection]>>%P%\1.reg
echo "AllowTelemetry"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\Software\Policies\Microsoft\Windows\PreviewBuilds]>>%P%\1.reg
echo "EnableConfigFlighting"=dword:00000000>>%P%\1.reg
echo "EnableExperimentation"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%CU%\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons]>>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\SOFTWARE\Policies\Microsoft\Windows Defender]>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender]>>%P%\1.reg
echo "DisableRoutinelyTakingAction"=dword:00000000>>%P%\1.reg
echo "AllowFastServiceStartup"=dword:00000001>>%P%\1.reg
echo "ServiceKeepAlive"=dword:00000000>>%P%\1.reg
echo "DisableAntispyware"=->>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender\Quarantine]>>%P%\1.reg
echo "PurgeItemsAfterDelay"=dword:00000001>>%P%\1.reg
echo "LocalSettingOverridePurgeItemsAfterDelay"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine]>>%P%\1.reg
echo "MpEnablePus"=dword:00000001>>%P%\1.reg
echo "MpCloudBlockLevel"=dword:00000002>>%P%\1.reg
echo "MpBafsExtendedTimeout"=dword:00000032>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection]>>%P%\1.reg
echo "DisableIOAVProtection"=dword:00000000>>%P%\1.reg
echo "DisableRealtimeMonitoring"=dword:00000000>>%P%\1.reg
echo "DisableBehaviorMonitoring"=dword:00000000>>%P%\1.reg
echo "DisableOnAccessProtection"=dword:00000000>>%P%\1.reg
echo "DisableScanOnRealtimeEnable"=dword:00000000>>%P%\1.reg
echo "DisableRawWriteNotification"=dword:00000000>>%P%\1.reg
echo "IOAVMaxSize"=dword:0098967f>>%P%\1.reg
echo "RealtimeScanDirection"=dword:00000000>>%P%\1.reg
echo "LocalSettingOverrideDisableBehaviorMonitoring"=dword:00000000>>%P%\1.reg
echo "LocalSettingOverrideDisableOnAccessProtection"=dword:00000000>>%P%\1.reg
echo "LocalSettingOverrideDisableIOAVProtection"=dword:00000000>>%P%\1.reg
echo "LocalSettingOverrideDisableRealtimeMonitoring"=dword:00000000>>%P%\1.reg
echo "LocalSettingOverrideRealtimeScanDirection"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender\Remediation]>>%P%\1.reg
echo "LocalSettingOverrideScan_ScheduleTime"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet]>>%P%\1.reg
echo "SpynetReporting"=dword:00000002>>%P%\1.reg
echo "LocalSettingOverrideSpynetReporting"=dword:00000000>>%P%\1.reg
echo "SubmitSamplesConsent"=dword:00000003>>%P%\1.reg
echo "DisableBlockAtFirstSeen"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender\Scan]>>%P%\1.reg
echo "ArchieveMaxSize"=dword:00000000>>%P%\1.reg
echo "ArchieveMaxDepth"=dword:ffffffff>>%P%\1.reg
echo "AvgCPULoadFactor"=dword:00000032>>%P%\1.reg
echo "DisableEmailScanning"=dword:00000000>>%P%\1.reg
echo "DisableArchiveScanning"=dword:00000000>>%P%\1.reg
echo "DisableRemovableDriveScanning"=dword:00000000>>%P%\1.reg
echo "DisablePackedExeScanning"=dword:00000000>>%P%\1.reg
echo "DisableHeuristics"=dword:00000000>>%P%\1.reg
echo "DisableReparsePointScanning"=dword:00000000>>%P%\1.reg
echo "DisableRemovableDriveScanning"=dword:00000000>>%P%\1.reg
echo "DisableScanningNetworkFiles"=dword:00000000>>%P%\1.reg
echo "CheckForSignaturesBeforeRunningScan"=dword:00000001>>%P%\1.reg
echo "ScanOnlyIfIdle"=dword:00000001>>%P%\1.reg
echo "PurgeItemsAfterDelay"=dword:00000001>>%P%\1.reg
echo "LocalSettingOverrideScanParameters"=dword:00000000>>%P%\1.reg
echo "LocalSettingOverrideAvgCPULoadFactor"=dword:00000000>>%P%\1.reg
echo "LocalSettingOverrideScheduleDay"=dword:00000000>>%P%\1.reg
echo "LocalSettingOverrideScheduleQuickScanTime"=dword:00000000>>%P%\1.reg
echo "LocalSettingOverrideScheduleTime"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates]>>%P%\1.reg
echo "UpdateOnStartUp"=dword:00000001>>%P%\1.reg
echo "DisableUpdateOnStartupWithoutEngine"=dword:00000000>>%P%\1.reg
echo "AVSignatureDue"=dword:00000001>>%P%\1.reg
echo "ASSignatureDue"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender\Threats]>>%P%\1.reg
echo "Threats_ThreatSeverityDefaultAction"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction]>>%P%\1.reg
echo "1"="2">>%P%\1.reg
echo "2"="2">>%P%\1.reg
echo "4"="3">>%P%\1.reg
echo "5"="3">>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR]>>%P%\1.reg
echo "ExploitGuard_ASR_Rules"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules]>>%P%\1.reg
echo "BE9BA2D9-53EA-4CDC-84E5-9B1EEEE46550"="1">>%P%\1.reg
echo "D4F940AB-401B-4EFC-AADC-AD5F3C50688A"="1">>%P%\1.reg
echo "3B576869-A4EC-4529-8536-B80A7769E899"="1">>%P%\1.reg
echo "75668C1F-73B5-4CF0-BB93-3ECF5CB7CC84"="1">>%P%\1.reg
echo "D3E037E1-3EB8-44C8-A917-57927947596D"="1">>%P%\1.reg
echo "5BEB7EFE-FD9A-4556-801D-275E5FFC04CC"="1">>%P%\1.reg
echo "92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B"="1">>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access]>>%P%\1.reg
echo "EnableControlledFolderAccess"=dword:00000000>>%P%\1.reg
echo "ExploitGuard_ControlledFolderAccess_ProtectedFolders"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access\ProtectedFolders]>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection]>>%P%\1.reg
echo "EnableNetworkProtection"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender ExploitGuard\Exploit Protection]>>%P%\1.reg
echo "ExploitProtectionSettings"=->>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Device performance and health]>>%P%\1.reg
echo "UILockDown"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Family options]>>%P%\1.reg
echo "UILockDown"=dword:00000001>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Firewall and network protection]>>%P%\1.reg
echo "UILockDown"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\App and Browser protection]>>%P%\1.reg
echo "UILockDown"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Enterprise Customization]>>%P%\1.reg
echo "Url"="microsoft.com/en-us/wdsi">>%P%\1.reg
echo "CompanyName"="Windows Defender Security Intelligence">>%P%\1.reg
echo.>>%P%\1.reg
echo [-%LM%\Software\Policies\Microsoft\Windows\RemovableStorageDevices]>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation]>>%P%\1.reg
echo "Model"="Optimized by Tom Zhu">>%P%\1.reg
echo "SupportHours"="Optimized by Tom Zhu">>%P%\1.reg
echo "SupportURL"="support.microsoft.com/windows">>%P%\1.reg
echo.>>%P%\1.reg



echo [-%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer]>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]>>%P%\1.reg
echo "EnableLUA"=dword:00000001>>%P%\1.reg
echo "ValidateAdminCodeSignatures"=dword:00000000>>%P%\1.reg
echo "ConsentPromptBehaviorAdmin"=dword:0000005>>%P%\1.reg
echo "ConsentPromptBehaviorUser"=dword:00000003>>%P%\1.reg
echo "PromptOnSecureDesktop"=dword:00000001>>%P%\1.reg
echo "EnableUIADesktopToggle"=dword:00000000>>%P%\1.reg
echo "FilterAdministratorToken"=dword:00000001>>%P%\1.reg
echo "EnableSecureUIAPaths"=dword:00000001>>%P%\1.reg
echo "EnableInstallerDetection"=dword:00000001>>%P%\1.reg
echo "EnableVirtualization"=dword:00000001>>%P%\1.reg
echo "DSCAutomationHostEnabled"=dword:00000002>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\SystemCertificates\TrustedPublisher\Safer]>>%P%\1.reg
echo "AuthenticodeFlags"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers]>>%P%\1.reg
echo "DefaultLevel"=dword:00000000>>%P%\1.reg
echo "TransparentEnabled"=dword:00000001>>%P%\1.reg
echo "PolicyScope"=dword:00000000>>%P%\1.reg
echo "ExecutableTypes"=hex(7):57,00,53,00,43,00,00,00,56,00,42,00,00,00,53,00,48,00,\>>%P%\1.reg
echo   53,00,00,00,53,00,43,00,52,00,00,00,52,00,45,00,47,00,00,00,50,00,53,00,31,\>>%P%\1.reg
echo   00,00,00,50,00,43,00,44,00,00,00,4f,00,43,00,58,00,00,00,4d,00,53,00,54,00,\>>%P%\1.reg
echo   00,00,4d,00,53,00,50,00,00,00,4d,00,53,00,49,00,00,00,4d,00,53,00,43,00,00,\>>%P%\1.reg
echo   00,4d,00,44,00,45,00,00,00,4d,00,44,00,42,00,00,00,49,00,53,00,50,00,00,00,\>>%P%\1.reg
echo   49,00,4e,00,53,00,00,00,49,00,4e,00,46,00,00,00,48,00,54,00,41,00,00,00,48,\>>%P%\1.reg
echo   00,4c,00,50,00,00,00,45,00,58,00,45,00,00,00,43,00,52,00,54,00,00,00,43,00,\>>%P%\1.reg
echo   50,00,4c,00,00,00,43,00,4f,00,4d,00,00,00,43,00,4d,00,44,00,00,00,43,00,48,\>>%P%\1.reg
echo   00,4d,00,00,00,42,00,41,00,54,00,00,00,42,00,41,00,53,00,00,00,41,00,44,00,\>>%P%\1.reg
echo   50,00,00,00,41,00,44,00,45,00,00,00>>%P%\1.reg
echo "AuthenticodeEnabled"=dword:00000000>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{1333c194-73f8-4766-a6af-e2ad4c391626}]>>%P%\1.reg
echo "LastModified"=hex(b):08,23,fb,5a,57,16,d3,01>>%P%\1.reg
echo "Description"="Allow Program Files (x86)">>%P%\1.reg
echo "SaferFlags"=dword:00000000>>%P%\1.reg
echo "ItemData"=hex(2):25,00,48,00,4b,00,45,00,59,00,5f,00,4c,00,4f,00,43,00,41,00,\>>%P%\1.reg
echo   4c,00,5f,00,4d,00,41,00,43,00,48,00,49,00,4e,00,45,00,5c,00,53,00,4f,00,46,\>>%P%\1.reg
echo   00,54,00,57,00,41,00,52,00,45,00,5c,00,4d,00,69,00,63,00,72,00,6f,00,73,00,\>>%P%\1.reg
echo   6f,00,66,00,74,00,5c,00,57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,5c,00,43,\>>%P%\1.reg
echo   00,75,00,72,00,72,00,65,00,6e,00,74,00,56,00,65,00,72,00,73,00,69,00,6f,00,\>>%P%\1.reg
echo   6e,00,5c,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,46,00,69,00,6c,00,65,\>>%P%\1.reg
echo   00,73,00,44,00,69,00,72,00,20,00,28,00,78,00,38,00,36,00,29,00,25,00,00,00>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{191cd7fa-f240-4a17-8986-94d480a6c8ca}]>>%P%\1.reg
echo "LastModified"=hex(b):9f,37,4f,42,57,16,d3,01>>%P%\1.reg
echo "Description"="Allow Windows">>%P%\1.reg
echo "SaferFlags"=dword:00000000>>%P%\1.reg
echo "ItemData"=hex(2):25,00,48,00,4b,00,45,00,59,00,5f,00,4c,00,4f,00,43,00,41,00,\>>%P%\1.reg
echo   4c,00,5f,00,4d,00,41,00,43,00,48,00,49,00,4e,00,45,00,5c,00,53,00,4f,00,46,\>>%P%\1.reg
echo   00,54,00,57,00,41,00,52,00,45,00,5c,00,4d,00,69,00,63,00,72,00,6f,00,73,00,\>>%P%\1.reg
echo   6f,00,66,00,74,00,5c,00,57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,4e,\>>%P%\1.reg
echo   00,54,00,5c,00,43,00,75,00,72,00,72,00,65,00,6e,00,74,00,56,00,65,00,72,00,\>>%P%\1.reg
echo   73,00,69,00,6f,00,6e,00,5c,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,\>>%P%\1.reg
echo   00,6f,00,74,00,25,00,00,00>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{d2c34ab2-529a-46b2-b293-fc853fce72ea}]>>%P%\1.reg
echo "LastModified"=hex(b):9f,37,4f,42,57,16,d3,01>>%P%\1.reg
echo "Description"="Allow Program Files">>%P%\1.reg
echo "SaferFlags"=dword:00000000>>%P%\1.reg
echo "ItemData"=hex(2):25,00,48,00,4b,00,45,00,59,00,5f,00,4c,00,4f,00,43,00,41,00,\>>%P%\1.reg
echo   4c,00,5f,00,4d,00,41,00,43,00,48,00,49,00,4e,00,45,00,5c,00,53,00,4f,00,46,\>>%P%\1.reg
echo   00,54,00,57,00,41,00,52,00,45,00,5c,00,4d,00,69,00,63,00,72,00,6f,00,73,00,\>>%P%\1.reg
echo   6f,00,66,00,74,00,5c,00,57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,5c,00,43,\>>%P%\1.reg
echo   00,75,00,72,00,72,00,65,00,6e,00,74,00,56,00,65,00,72,00,73,00,69,00,6f,00,\>>%P%\1.reg
echo   6e,00,5c,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,46,00,69,00,6c,00,65,\>>%P%\1.reg
echo   00,73,00,44,00,69,00,72,00,25,00,00,00>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{2333c194-73f8-4766-a6af-e2ad4c391626}]>>%P%\1.reg
echo "LastModified"=hex(b):08,23,fb,5a,57,16,d3,01>>%P%\1.reg
echo "Description"="Allow Program Files (x86)">>%P%\1.reg
echo "SaferFlags"=dword:00000000>>%P%\1.reg
echo "ItemData"=hex(2):25,00,70,00,72,00,6f,00,67,00,72,00,61,00,6d,00,66,00,69,00,\>>%P%\1.reg
echo   6c,00,65,00,73,00,28,00,78,00,38,00,36,00,29,00,25,00,00,00>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{291cd7fa-f240-4a17-8986-94d480a6c8ca}]>>%P%\1.reg
echo "LastModified"=hex(b):9f,37,4f,42,57,16,d3,01>>%P%\1.reg
echo "Description"="Allow Windows">>%P%\1.reg
echo "SaferFlags"=dword:00000000>>%P%\1.reg
echo "ItemData"=hex(2):25,00,73,00,79,00,73,00,74,00,65,00,6d,00,72,00,6f,00,6f,00,\>>%P%\1.reg
echo   74,00,25,00,00,00>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{d3c34ab2-529a-46b2-b293-fc853fce72ea}]>>%P%\1.reg
echo "LastModified"=hex(b):9f,37,4f,42,57,16,d3,01>>%P%\1.reg
echo "Description"="Allow Program Files">>%P%\1.reg
echo "SaferFlags"=dword:00000000>>%P%\1.reg
echo "ItemData"=hex(2):25,00,70,00,72,00,6f,00,67,00,72,00,61,00,6d,00,66,00,69,00,\>>%P%\1.reg
echo   6c,00,65,00,73,00,25,00,00,00>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{d2c34ab2-529a-46b2-b293-fc853fce73ea}]>>%P%\1.reg
echo "LastModified"=hex(b):9f,37,4f,42,57,16,d3,01>>%P%\1.reg
echo "Description"="Allow ProgramData">>%P%\1.reg
echo "SaferFlags"=dword:00000000>>%P%\1.reg
echo "ItemData"=hex(2):25,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,44,00,61,00,\>>%P%\1.reg
echo   74,00,61,00,25,00,00,00>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{4d259436-c0ab-4186-b18d-0225eaa8039c}]>>%P%\1.reg
echo "LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01>>%P%\1.reg
echo "Description"="Allow AppData Local">>%P%\1.reg
echo "SaferFlags"=dword:00000000>>%P%\1.reg
echo "ItemData"=hex(2):25,00,4c,00,6f,00,63,00,61,00,6c,00,41,00,70,00,70,00,44,00,\>>%P%\1.reg
echo   61,00,74,00,61,00,25,00,00,00>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-0225eaa8040c}]>>%P%\1.reg
echo "LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01>>%P%\1.reg
echo "Description"="Disallow Temp">>%P%\1.reg
echo "SaferFlags"=dword:00000000>>%P%\1.reg
echo "ItemData"=hex(2):25,00,74,00,6d,00,70,00,25,00,00,00>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-0225eaa8032c}]>>%P%\1.reg
echo "LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01>>%P%\1.reg
echo "Description"="Disallow AppData Local Microsoft">>%P%\1.reg
echo "SaferFlags"=dword:00000000>>%P%\1.reg
echo "ItemData"=hex(2):25,00,4c,00,6f,00,63,00,61,00,6c,00,41,00,70,00,70,00,44,00,\>>%P%\1.reg
echo   61,00,74,00,61,00,25,00,5c,00,4d,00,69,00,63,00,72,00,6f,00,73,00,6f,00,66,\>>%P%\1.reg
echo   00,74,00,00,00>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-0225eaa8033c}]>>%P%\1.reg
echo "LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01>>%P%\1.reg
echo "Description"="Disallow AppData Local Packages">>%P%\1.reg
echo "SaferFlags"=dword:00000000>>%P%\1.reg
echo "ItemData"=hex(2):25,00,4c,00,6f,00,63,00,61,00,6c,00,41,00,70,00,70,00,44,00,\>>%P%\1.reg
echo   61,00,74,00,61,00,25,00,5c,00,50,00,61,00,63,00,6b,00,61,00,67,00,65,00,73,\>>%P%\1.reg
echo   00,00,00>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{4d259436-c0ab-4186-b18d-0225eaa8034c}]>>%P%\1.reg
echo "LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01>>%P%\1.reg
echo "Description"="Allow AppData Local Microsoft OneDrive">>%P%\1.reg
echo "SaferFlags"=dword:00000000>>%P%\1.reg
echo "ItemData"=hex(2):25,00,4c,00,6f,00,63,00,61,00,6c,00,41,00,70,00,70,00,44,00,\>>%P%\1.reg
echo   61,00,74,00,61,00,25,00,5c,00,4d,00,69,00,63,00,72,00,6f,00,73,00,6f,00,66,\>>%P%\1.reg
echo   00,74,00,5c,00,4f,00,6e,00,65,00,44,00,72,00,69,00,76,00,65,00,5c,00,2a,00,\>>%P%\1.reg
echo   00,00>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{4d259436-c0ab-4186-b18d-0225eaa8031c}]>>%P%\1.reg
echo "LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01>>%P%\1.reg
echo "Description"="Allow TrustedApps">>%P%\1.reg
echo "SaferFlags"=dword:00000000>>%P%\1.reg
echo "ItemData"="%systemdrive%\\TrustedApps">>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-0225eaa8037c}]>>%P%\1.reg
echo "LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01>>%P%\1.reg
echo "Description"="Disallow 7 - Zip Temp">>%P%\1.reg
echo "SaferFlags"=dword:00000000>>%P%\1.reg
echo "ItemData"=hex(2):25,00,74,00,6d,00,70,00,25,00,5c,00,37,00,7a,00,2a,00,00,00>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-1226eaa8037c}]>>%P%\1.reg
echo "LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01>>%P%\1.reg
echo "Description"="Disallow Hao Zip Temp">>%P%\1.reg
echo "SaferFlags"=dword:00000000>>%P%\1.reg
echo "ItemData"=hex(2):25,00,74,00,6d,00,70,00,25,00,5c,00,48,00,5a,00,2a,00,00,00>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{5d259436-c0ab-4186-b18d-0225eaa8037c}]>>%P%\1.reg
echo "LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01>>%P%\1.reg
echo "Description"="Disallow Windows Explorer Zip Temp">>%P%\1.reg
echo "SaferFlags"=dword:00000000>>%P%\1.reg
echo "ItemData"=hex(2):25,00,74,00,6d,00,70,00,25,00,5c,00,54,00,65,00,6d,00,70,00,\>>%P%\1.reg
echo   2a,00,2e,00,7a,00,69,00,70,00,5c,00,2a,00,00,00>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-0225eaa8066c}]>>%P%\1.reg
echo "LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01>>%P%\1.reg
echo "Description"="Disallow 7z*.tmp">>%P%\1.reg
echo "SaferFlags"=dword:00000000>>%P%\1.reg
echo "ItemData"=hex(2):25,00,74,00,6d,00,70,00,25,00,5c,00,37,00,7a,00,2a,00,2e,00,\>>%P%\1.reg
echo   74,00,6d,00,70,00,5c,00,2a,00,00,00>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-0225eaa8055c}]>>%P%\1.reg
echo "LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01>>%P%\1.reg
echo "Description"="Disallow WinRAR Temp">>%P%\1.reg
echo "SaferFlags"=dword:00000000>>%P%\1.reg
echo "ItemData"=hex(2):25,00,74,00,6d,00,70,00,25,00,5c,00,52,00,61,00,72,00,2a,00,\>>%P%\1.reg
echo   00,00>>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{4d259436-c0ab-4186-b18d-0225eaa8038c}]>>%P%\1.reg
echo "LastModified"=hex(b):ae,d3,b3,13,69,16,d3,01>>%P%\1.reg
echo "Description"="Disallow AppData Roaming">>%P%\1.reg
echo "SaferFlags"=dword:00000000>>%P%\1.reg
echo "ItemData"=hex(2):25,00,41,00,70,00,70,00,44,00,61,00,74,00,61,00,25,00,00,00>>%P%\1.reg
echo.>>%P%\1.reg



:clearstartupfolders
title Optimizing Windows...
mode con cols=45 lines=7
color fc
echo.
echo.
echo.
echo Optimizing autoruns...
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
title Optimizing Windows...
mode con cols=45 lines=7
color fc
echo.
echo.
echo.
echo Optimizing scheduled tasks...
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
title Optimizing Windows...
mode con cols=45 lines=7
color fc
echo.
echo.
echo.
echo Optimizing power options...
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
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Power\PowerSettings /v ActivePowerScheme /t REG_SZ /d 281b4222-f694-41f0-9685-ff5bb260df2e /f 1>nul 2>nul



:whitelist
title Optimizing Windows...
mode con cols=45 lines=7
color fc
echo.
echo.
echo.
echo Applying whitelist...
if exist whitelist.txt (
goto applywhitelist) else (
goto applyreg)
:applywhitelist
for /f "tokens=* delims= " %%i in (whitelist.txt) do (
if %%i equ onedrive (
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\OneDrive]>>%P%\1.reg
echo "DisableFileSyncNGSC"=->>%P%\1.reg
echo "DisableFileSync"=->>%P%\1.reg
echo.>>%P%\1.reg)

if %%i equ cortana (
echo [%LM%\SOFTWARE\Policies\Microsoft\Windows\Windows Search]>>%P%\1.reg
echo "AllowCortana"=->>%P%\1.reg
echo "AllowCortanaAboveLock"=->>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Policies\Microsoft\Windows\Explorer]>>%P%\1.reg
echo "DisableSearchBoxSuggestions"=->>%P%\1.reg
echo.>>%P%\1.reg)

if %%i equ power (
echo [-%LM%\SOFTWARE\Policies\Microsoft\Power]>>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Policies\Microsoft\Windows\Control Panel\Desktop]>>%P%\1.reg
echo "ScreenSaveTimeOut"=->>%P%\1.reg
echo "ScreenSaveActive"=->>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Policies\System]>>%P%\1.reg
echo "NoDispScrSavPage"=->>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%P%\1.reg
echo "NoClose"=->>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%P%\1.reg
echo "HidePowerOptions"=->>%P%\1.reg
echo.>>%P%\1.reg
echo [%CU%\Software\Policies\Microsoft\Windows\Explorer]>>%P%\1.reg
echo "PowerButtonAction"=->>%P%\1.reg
echo.>>%P%\1.reg
echo [%LM%\Software\Policies\Microsoft\Windows\Explorer]>>%P%\1.reg
echo "ShowSleepOption"=->>%P%\1.reg
echo "ShowHibernateOption"=->>%P%\1.reg
echo "ShowLockOption"=->>%P%\1.reg
echo.>>%P%\1.reg)

if %%i equ desktop (
echo [%CU%\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%P%\1.reg
echo "NoDesktop"=->>%P%\1.reg
echo.>>%P%\1.reg) else (
sc config "%%i" start= auto 1>nul 2>nul
schtasks /change /tn "%%i" /enable 1>nul 2>nul)
)



:applyreg
echo.>>%P%\1.reg
echo.>>%P%\1.reg
echo.>>%P%\1.reg
echo.>>%P%\1.reg
reg import %P%\1.reg /reg:32 1>nul 2>nul
reg import %P%\1.reg /reg:32 1>nul 2>nul
reg import %P%\1.reg /reg:32 1>nul 2>nul
reg import %P%\1.reg /reg:32 1>nul 2>nul
echo ^<?xml version="1.0" encoding="UTF-16"?^>>%P%\1.xml
echo ^<Task version="1.2" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task"^>>>%P%\1.xml
echo   ^<RegistrationInfo^>>>%P%\1.xml
echo     ^<URI^>\Perfect Windows\Refresh Local Machine Reg^</URI^>>>%P%\1.xml
echo   ^</RegistrationInfo^>>>%P%\1.xml
echo   ^<Triggers^>>>%P%\1.xml
echo     ^<BootTrigger^>>>%P%\1.xml
echo       ^<Enabled^>true^</Enabled^>>>%P%\1.xml
echo     ^</BootTrigger^>>>%P%\1.xml
echo     ^<LogonTrigger^>>>%P%\1.xml
echo       ^<Enabled^>true^</Enabled^>>>%P%\1.xml
echo     ^</LogonTrigger^>>>%P%\1.xml
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
echo       ^<Command^>"%systemroot%\system32\reg.exe"^</Command^>>>%P%\1.xml
echo       ^<Arguments^>import %P%\1.reg /reg:32^</Arguments^>>>%P%\1.xml
echo     ^</Exec^>>>%P%\1.xml
echo   ^</Actions^>>>%P%\1.xml
echo ^</Task^>>>%P%\1.xml
SCHTASKSBETA /CREATE /RU SYSTEM /TN "\Perfect Windows\Refresh Local Machine Reg" /XML "%P%\1.xml" /F 1>nul 2>nul
del %T%\detailedschtasks.txt 1>nul 2>nul
del %P%\1.xml 1>nul 2>nul
echo ^<?xml version="1.0" encoding="UTF-16"?^>>%P%\1.xml
echo ^<Task version="1.2" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task"^>>>%P%\1.xml
echo   ^<RegistrationInfo^>>>%P%\1.xml
echo     ^<URI^>\Perfect Windows\Refresh Current User Reg^</URI^>>>%P%\1.xml
echo   ^</RegistrationInfo^>>>%P%\1.xml
echo   ^<Triggers^>>>%P%\1.xml
echo     ^<LogonTrigger^>>>%P%\1.xml
echo       ^<Enabled^>true^</Enabled^>>>%P%\1.xml
echo     ^</LogonTrigger^>>>%P%\1.xml
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
echo       ^<Command^>"%systemroot%\system32\reg.exe"^</Command^>>>%P%\1.xml
echo       ^<Arguments^>import %P%\1.reg /reg:32^</Arguments^>>>%P%\1.xml
echo     ^</Exec^>>>%P%\1.xml
echo   ^</Actions^>>>%P%\1.xml
echo ^</Task^>>>%P%\1.xml
SCHTASKSBETA /CREATE /TN "\Perfect Windows\Refresh Current User Reg" /XML "%P%\1.xml" /F 1>nul 2>nul
del %T%\detailedschtasks.txt 1>nul 2>nul
del %P%\1.xml 1>nul 2>nul



:hosts
if exist hosts.txt (
goto applyhosts) else (
goto restart)
:applyhosts
ren hosts.txt hosts
copy hosts /Y %systemroot%\system32\drivers\etc\hosts 1>nul 2>nul
copy hosts /Y %systemroot%\system32\drivers\etc\hosts 1>nul 2>nul
ren hosts hosts.txt



:restart
rd /s /q %T% 1>nul 2>nul
rd /s /q "%tmp%" 1>nul 2>nul
ipconfig /flushdns 1>nul 2>nul
rd /s /q %T% 1>nul 2>nul
rd /s /q "%tmp%" 1>nul 2>nul
ipconfig /flushdns 1>nul 2>nul
shutdown /r /o /t 0 1>nul 2>nul
shutdown /r /o /t 0 1>nul 2>nul
shutdown /r /t 0 1>nul 2>nul
shutdown /r /t 0 1>nul 2>nul



:regbak

:[%LM%\SOFTWARE\Microsoft\Rpc]
:"ConnectionOptionsFlag"=dword:00000001
:"DCOM Protocols"=hex(7):6e,00,63,00,61,00,63,00,6e,00,5f,00,69,00,70,00,5f,00,\
:  74,00,63,00,70,00,00,00,00,00


