@echo off
pushd "%~dp0"
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
echo.
echo To ensure the optimization works,
echo your PC will be restarted automatically.
echo.
echo If you are ready to restart your PC,
pause
rd /s /q %systemroot%\PerfectWindowsTemp 1>nul 2>nul
md %systemroot%\PerfectWindows 1>nul 2>nul
md %systemroot%\PerfectWindowsTemp 1>nul 2>nul
powercfg /hibernate /size 75 1>nul 2>nul
powercfg /hibernate /type full 1>nul 2>nul
rd /s /q %systemroot%\PerfectWindowsTemp 1>nul 2>nul
md %systemroot%\PerfectWindows 1>nul 2>nul
md %systemroot%\PerfectWindowsTemp 1>nul 2>nul
powercfg /hibernate /size 75 1>nul 2>nul
powercfg /hibernate /type full 1>nul 2>nul



:services
title Optimizing Windows...
mode con cols=45 lines=3
color fc
echo.
echo Optimizing services...
del %systemroot%\PerfectWindowsTemp\tmp1.txt 1>nul 2>nul
del %systemroot%\PerfectWindowsTemp\tmp2.txt 1>nul 2>nul
del %systemroot%\PerfectWindowsTemp\tmp3.txt 1>nul 2>nul
del %systemroot%\PerfectWindowsTemp\services.txt 1>nul 2>nul
sc query state= all >%systemroot%\PerfectWindowsTemp\tmp1.txt
findstr SERVICE_NAME %systemroot%\PerfectWindowsTemp\tmp1.txt >> %systemroot%\PerfectWindowsTemp\tmp2.txt

for /f "tokens=2 delims=:" %%i in (%systemroot%\PerfectWindowsTemp\tmp2.txt) do (
echo %%i>>%systemroot%\PerfectWindowsTemp\tmp3.txt
)

for /f "tokens=* delims= " %%i in (%systemroot%\PerfectWindowsTemp\tmp3.txt) do (
echo %%i>>%systemroot%\PerfectWindowsTemp\services.txt
)

for /f "tokens=* delims= " %%i in (%systemroot%\PerfectWindowsTemp\services.txt) do (
sc config "%%i" start= demand 1>nul 2>nul
)

del %systemroot%\PerfectWindowsTemp\tmp1.txt 1>nul 2>nul
del %systemroot%\PerfectWindowsTemp\tmp2.txt 1>nul 2>nul
del %systemroot%\PerfectWindowsTemp\tmp3.txt 1>nul 2>nul

sc config WbioSrvc start= auto 1>nul 2>nul
sc config UserManager start= auto 1>nul 2>nul
sc config SystemEventsBroker start= auto 1>nul 2>nul
sc config PolicyAgent start= auto 1>nul 2>nul
sc config gpsvc start= auto 1>nul 2>nul
sc config AppIDSvc start= auto 1>nul 2>nul
sc config Dnscache start= auto 1>nul 2>nul
sc config DusmSvc start= auto 1>nul 2>nul
sc config WlanSvc start= auto 1>nul 2>nul
sc config Winmgmt start= auto 1>nul 2>nul
sc config stisvc start= auto 1>nul 2>nul
sc config FontCache start= auto 1>nul 2>nul
sc config MpsSvc start= auto 1>nul 2>nul
sc config EventLog start= auto 1>nul 2>nul
sc config SecurityHealthService start= auto 1>nul 2>nul
sc config WinDefend start= auto 1>nul 2>nul
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
sc config TrkWks start= auto 1>nul 2>nul
sc config Dhcp start= auto 1>nul 2>nul
sc config DoSvc start= auto 1>nul 2>nul
sc config DcomLaunch start= auto 1>nul 2>nul
sc config CryptSvc start= auto 1>nul 2>nul
sc config wuauserv start= auto 1>nul 2>nul
sc config sppsvc start= auto 1>nul 2>nul
sc config CoreMessagingRegistrar start= auto 1>nul 2>nul
sc config EventSystem start= auto 1>nul 2>nul
sc config BFE start= auto 1>nul 2>nul
sc config BrokerInfrastructure start= auto 1>nul 2>nul
sc config BITS start= auto 1>nul 2>nul
sc config UsoSvc start= auto 1>nul 2>nul
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
sc config SDRSVC start= disabled 1>nul 2>nul
sc config WSearch start= delayed-auto 1>nul 2>nul



:core
title Optimizing Windows...
mode con cols=45 lines=3
color fc
echo.
echo Optimizing Windows settings...

echo Windows Registry Editor Version 5.00>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]>>%systemroot%\PerfectWindows\core.reg
echo "Scancode Map"=hex:00,00,00,00,00,00,00,00,40,00,00,00,32,E0,3B,00,2E,E0,51,E0,30,E0,49,E0,00,00,00,00>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters]>>%systemroot%\PerfectWindows\core.reg
echo "SMBDeviceEnabled"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations]>>%systemroot%\PerfectWindows\core.reg
echo ".tif"="PhotoViewer.FileAssoc.Tiff">>%systemroot%\PerfectWindows\core.reg
echo ".tiff"="PhotoViewer.FileAssoc.Tiff">>%systemroot%\PerfectWindows\core.reg
echo ".jpg"="PhotoViewer.FileAssoc.Tiff">>%systemroot%\PerfectWindows\core.reg
echo ".jpeg"="PhotoViewer.FileAssoc.Tiff">>%systemroot%\PerfectWindows\core.reg
echo ".jpe"="PhotoViewer.FileAssoc.Tiff">>%systemroot%\PerfectWindows\core.reg
echo ".jfif"="PhotoViewer.FileAssoc.Tiff">>%systemroot%\PerfectWindows\core.reg
echo ".bmp"="PhotoViewer.FileAssoc.Tiff">>%systemroot%\PerfectWindows\core.reg
echo ".gif"="PhotoViewer.FileAssoc.Tiff">>%systemroot%\PerfectWindows\core.reg
echo ".png"="PhotoViewer.FileAssoc.Tiff">>%systemroot%\PerfectWindows\core.reg
echo ".ico"="PhotoViewer.FileAssoc.Tiff">>%systemroot%\PerfectWindows\core.reg
echo ".dib"="PhotoViewer.FileAssoc.Tiff">>%systemroot%\PerfectWindows\core.reg
echo ".wdp"="PhotoViewer.FileAssoc.Tiff">>%systemroot%\PerfectWindows\core.reg
echo ".jxr"="PhotoViewer.FileAssoc.Tiff">>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance]>>%systemroot%\PerfectWindows\core.reg
echo "fAllowToGetHelp"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server]>>%systemroot%\PerfectWindows\core.reg
echo "fDenyTSConnections"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\BITS]>>%systemroot%\PerfectWindows\core.reg
echo "EnablePeercaching"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization]>>%systemroot%\PerfectWindows\core.reg
echo "DODownloadMode"=dword:00000003>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\PhishingFilter]>>%systemroot%\PerfectWindows\core.reg
echo "PreventOverride"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "PreventOverrideAppRepUnknown"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "EnabledV9"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter]>>%systemroot%\PerfectWindows\core.reg
echo "EnabledV9"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "PreventOverride"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "PreventOverrideAppRepUnknown"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System]>>%systemroot%\PerfectWindows\core.reg
echo "EnableSmartScreen"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "ShellSmartScreenLevel"="Warn">>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System]>>%systemroot%\PerfectWindows\core.reg
echo "DisableTaskMgr"=->>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\System]>>%systemroot%\PerfectWindows\core.reg
echo "DisableCMD"=->>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager]>>%systemroot%\PerfectWindows\core.reg
echo "BootExecute"=->>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]>>%systemroot%\PerfectWindows\core.reg
echo "VerboseStatus"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "EnableLUA"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "ConsentPromptBehaviorAdmin"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "ConsentPromptBehaviorUser"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "PromptOnSecureDesktop"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "EnableUIADesktopToggle"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "FilterAdministratorToken"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "EnableSecureUIAPaths"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "EnableInstallerDetection"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "EnableVirtualization"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "ValidateAdminCodeSignatures"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "DSCAutomationHostEnabled"=dword:00000002>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers]>>%systemroot%\PerfectWindows\core.reg
echo "DefaultLevel"=dword:00040000>>%systemroot%\PerfectWindows\core.reg
echo "TransparentEnabled"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "PolicyScope"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "AuthenticodeEnabled"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SystemCertificates\AuthRoot]>>%systemroot%\PerfectWindows\core.reg
echo "DisableRootAutoUpdate"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SystemCertificates\TrustedPublisher\Safer]>>%systemroot%\PerfectWindows\core.reg
echo "AuthenticodeFlags"=dword:00000300>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile]>>%systemroot%\PerfectWindows\core.reg
echo "DisableNotifications"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "EnableFirewall"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile]>>%systemroot%\PerfectWindows\core.reg
echo "EnableFirewall"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "DisableNotifications"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile]>>%systemroot%\PerfectWindows\core.reg
echo "DisableNotifications"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "EnableFirewall"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center]>>%systemroot%\PerfectWindows\core.reg
echo "AntiVirusOverride"=->>%systemroot%\PerfectWindows\core.reg
echo "FirewallDisableNotify"=->>%systemroot%\PerfectWindows\core.reg
echo "UacDisableNotify"=->>%systemroot%\PerfectWindows\core.reg
echo "UpdatesDisableNotify"=->>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center\Svc]>>%systemroot%\PerfectWindows\core.reg
echo "AntiVirusOverride"=->>%systemroot%\PerfectWindows\core.reg
echo "FirewallDisableNotify"=->>%systemroot%\PerfectWindows\core.reg
echo "UacDisableNotify"=->>%systemroot%\PerfectWindows\core.reg
echo "UpdatesDisableNotify"=->>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate]>>%systemroot%\PerfectWindows\core.reg
echo "DisableWindowsUpdateAccess"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU]>>%systemroot%\PerfectWindows\core.reg
echo "NoAutoUpdate"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "AUOptions"=dword:00000002>>%systemroot%\PerfectWindows\core.reg
echo "DetectionFrequencyEnabled"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "DetectionFrequency"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "ExcludeWUDriversInQualityUpdate"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "NoAutoRebootWithLoggedOnUsers"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MRT]>>%systemroot%\PerfectWindows\core.reg
echo "DontOfferThroughWUAU"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PassportForWork\PINComplexity]>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [-HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\PassportForWork\PINComplexity]>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PassportForWork\PINComplexityBeta]>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [-HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization]>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance]>>%systemroot%\PerfectWindows\core.reg
echo "WakeUp"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "MaintenanceDisabled"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl]>>%systemroot%\PerfectWindows\core.reg
echo "AutoReboot"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "AlwaysKeepMemoryDump"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "CrashDumpEnabled"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Maps]>>%systemroot%\PerfectWindows\core.reg
echo "AutoDownloadAndUpdateMapData"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore]>>%systemroot%\PerfectWindows\core.reg
echo "AutoDownload"=dword:00000002>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore]>>%systemroot%\PerfectWindows\core.reg
echo "DisableConfig"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "DisableSR"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows]>>%systemroot%\PerfectWindows\core.reg
echo "CEIPEnable"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting]>>%systemroot%\PerfectWindows\core.reg
echo "DontShowUI"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "DontSendAdditionalData"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "Disabled"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting]>>%systemroot%\PerfectWindows\core.reg
echo "DoReport"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters]>>%systemroot%\PerfectWindows\core.reg
echo "EnableSuperfetch"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat]>>%systemroot%\PerfectWindows\core.reg
echo "DisablePCA"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "DisableEngine"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "VDMDisallowed"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HomeGroup]>>%systemroot%\PerfectWindows\core.reg
echo "DisableHomeGroup"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform]>>%systemroot%\PerfectWindows\core.reg
echo "NoGenTicket"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM]>>%systemroot%\PerfectWindows\core.reg
echo "AnimationsShiftKey"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%systemroot%\PerfectWindows\core.reg
echo "NoToolbarsOnTaskbar"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications]>>%systemroot%\PerfectWindows\core.reg
echo "NoToastApplicationNotification"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "NoToastApplicationNotificationOnLockScreen"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "NoTileApplicationNotification"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "NoCloudApplicationNotification"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "DisallowNotificationMirroring"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization]>>%systemroot%\PerfectWindows\core.reg
echo "NoLockScreen"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System]>>%systemroot%\PerfectWindows\core.reg
echo "DisableLockScreenAppNotifications"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "DisableLogonBackgroundImage"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "BlockUserFromShowingAccountDetailsOnSignin"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "HiberbootEnabled"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer]>>%systemroot%\PerfectWindows\core.reg
echo "EnableLegacyBalloonNotifications"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "DisableNotificationCenter"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize]>>%systemroot%\PerfectWindows\core.reg
echo "EnableTransparency"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power]>>%systemroot%\PerfectWindows\core.reg
echo "AwayModeEnabled"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%systemroot%\PerfectWindows\core.reg
echo "UseOLEDTaskbarTransparency"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\MultitaskingView\AltTabViewHost]>>%systemroot%\PerfectWindows\core.reg
echo "Grid_backgroundPercent"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "BackgroundDimmingLayer_percent"=dword:00000028>>%systemroot%\PerfectWindows\core.reg
echo "wallpaper"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer]>>%systemroot%\PerfectWindows\core.reg
echo "EnableAutoTray"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%systemroot%\PerfectWindows\core.reg
echo "DontUsePowerShellOnWinX"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%systemroot%\PerfectWindows\core.reg
echo "Start_TrackDocs"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%systemroot%\PerfectWindows\core.reg
echo "LaunchTo"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer]>>%systemroot%\PerfectWindows\core.reg
echo "ShowFrequent"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "ShowRecent"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "ShellState"=hex:24,00,00,00,1c,08,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\>>%systemroot%\PerfectWindows\core.reg
echo    01,00,00,00,13,00,00,00,00,00,00,00,6b,00,00,00>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Modules\GlobalSettings\DetailsContainer]>>%systemroot%\PerfectWindows\core.reg
echo "DetailsContainer"=hex:02,00,00,00,02,00,00,00>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer]>>%systemroot%\PerfectWindows\core.reg
echo "ClearTilesOnExit"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer]>>%systemroot%\PerfectWindows\core.reg
echo "DisableSearchBoxSuggestions"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "ExplorerRibbonStartsMinimized"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "DisableIndexedLibraryExperience"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "DisableSearchHistory"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%systemroot%\PerfectWindows\core.reg
echo "ForceClassicControlPanel"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "EnforceShellExtensionSecurity"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "ClearRecentDocsOnExit"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "NoRecentDocsMenu"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "NoStartMenuMFUprogramsList"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "ClearRecentProgForNewUserInStartMenu"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "NoTrayContextMenu"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "NoTaskGrouping"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "DisableCurrentUserRun"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "DisableCurrentUserRunOnce"=->>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%systemroot%\PerfectWindows\core.reg
echo "DisableLocalMachineRun"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "DisableLocalMachineRunOnce"=->>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Modules\GlobalSettings\Sizer]>>%systemroot%\PerfectWindows\core.reg
echo "PageSpaceControlSizer"=hex:a0,00,00,00,00,00,00,00,00,00,00,00,56,03,00,00>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%systemroot%\PerfectWindows\core.reg
echo "ExtendedUIHoverTime"=dword:99999999>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband]>>%systemroot%\PerfectWindows\core.reg
echo "NumThumbnails"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%systemroot%\PerfectWindows\core.reg
echo "ShowTaskViewButton"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\Preferences]>>%systemroot%\PerfectWindows\core.reg
echo "WholeFileSystem"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "SystemFolders"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "ArchivedFiles"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\PrimaryProperties\UnindexedLocations]>>%systemroot%\PerfectWindows\core.reg
echo "SearchOnly"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\PenWorkspace]>>%systemroot%\PerfectWindows\core.reg
echo "PenWorkspaceButtonDesiredVisibility"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search]>>%systemroot%\PerfectWindows\core.reg
echo "SearchboxTaskbarMode"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Touchpad]>>%systemroot%\PerfectWindows\core.reg
echo "TouchpadDesiredVisibility"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer]>>%systemroot%\PerfectWindows\core.reg
echo "ShowWindowsStoreAppsOnTaskbar"=dword:00000002>>%systemroot%\PerfectWindows\core.reg
echo "NoPinningToTaskbar"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "NoPinningStoreToTaskbar"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "TaskbarNoPinnedList"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics]>>%systemroot%\PerfectWindows\core.reg
echo "MinAnimate"="1">>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons]>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu]>>%systemroot%\PerfectWindows\core.reg
echo "{645FF040-5081-101B-9F08-00AA002F954E}"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "{59031a47-3f72-44a7-89c5-5595fe6b30ee}"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "{20D04FE0-3AEA-1069-A2D8-08002B30309D}"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel]>>%systemroot%\PerfectWindows\core.reg
echo "{645FF040-5081-101B-9F08-00AA002F954E}"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "{59031a47-3f72-44a7-89c5-5595fe6b30ee}"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "{20D04FE0-3AEA-1069-A2D8-08002B30309D}"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\cleanuppath]>>%systemroot%\PerfectWindows\core.reg
echo @=hex(2):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,00,25,\>>%systemroot%\PerfectWindows\core.reg
echo   00,5c,00,53,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,63,00,6c,00,\>>%systemroot%\PerfectWindows\core.reg
echo   65,00,61,00,6e,00,6d,00,67,00,72,00,2e,00,65,00,78,00,65,00,20,00,2f,00,44,\>>%systemroot%\PerfectWindows\core.reg
echo   00,20,00,25,00,63,00,00,00>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\DefragPath]>>%systemroot%\PerfectWindows\core.reg
echo @=hex(2):25,00,73,00,79,00,73,00,74,00,65,00,6d,00,72,00,6f,00,6f,00,74,00,25,\>>%systemroot%\PerfectWindows\core.reg
echo   00,5c,00,73,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,64,00,66,00,\>>%systemroot%\PerfectWindows\core.reg
echo   72,00,67,00,75,00,69,00,2e,00,65,00,78,00,65,00,00,00>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CLASSES_ROOT\lnkfile]>>%systemroot%\PerfectWindows\core.reg
echo @="Shortcut">>%systemroot%\PerfectWindows\core.reg
echo "IsShortcut"="">>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes]>>%systemroot%\PerfectWindows\core.reg
echo "ThemeChangesDesktopIcons"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "ThemeChangesMousePointers"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Control Panel\Mouse]>>%systemroot%\PerfectWindows\core.reg
echo "MouseSensitivity"="10">>%systemroot%\PerfectWindows\core.reg
echo "MouseSpeed"="2">>%systemroot%\PerfectWindows\core.reg
echo "MouseThreshold1"="6">>%systemroot%\PerfectWindows\core.reg
echo "MouseThreshold2"="10">>%systemroot%\PerfectWindows\core.reg
echo "MouseTrails"="0">>%systemroot%\PerfectWindows\core.reg
echo "MouseHoverTime"="2">>%systemroot%\PerfectWindows\core.reg
echo "SnapToDefaultButton"="0">>%systemroot%\PerfectWindows\core.reg
echo "DoubleClickSpeed"="500">>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Control Panel\Desktop]>>%systemroot%\PerfectWindows\core.reg
echo "MouseWheelRouting"=dword:00000002>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%systemroot%\PerfectWindows\core.reg
echo "NoInternetIcon"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "HideSCANetwork"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "HideSCAHealth"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "HideSCAVolume"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "NoAutoTrayNotify"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Control Panel\Desktop]>>%systemroot%\PerfectWindows\core.reg
echo "ScreenSaveTimeOut"="0">>%systemroot%\PerfectWindows\core.reg
echo "ScreenSaverIsSecure"="1">>%systemroot%\PerfectWindows\core.reg
echo "ScreenSaveActive"="0">>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System]>>%systemroot%\PerfectWindows\core.reg
echo "NoDispScrSavPage"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%systemroot%\PerfectWindows\core.reg
echo "NoDesktop"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "NoClose"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%systemroot%\PerfectWindows\core.reg
echo "SeparateProcess"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "Hidden"=dword:00000002>>%systemroot%\PerfectWindows\core.reg
echo "HideFileExt"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "AutoCheckSelect"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "TaskbarSizeMove"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "PersistBrowsers"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "TaskbarAnimations"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "TaskbarGlomLevel"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "TaskbarGlomming"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "TaskbarAppsVisibleInTabletMode"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "TaskbarSmallIcons"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "UseTabletModeNotificationIcons"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "ShowSyncProviderNotifications"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "JointResize"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "SnapAssist"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "SnapFill"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "VirtualDesktopTaskbarFilter"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "VirtualDesktopAltTabFilter"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "ShowEncryptCompressedColor"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "TypeAhead"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "AlwaysShowMenus"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar]>>%systemroot%\PerfectWindows\core.reg
echo "ShowStatus"=dword:00000003>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects]>>%systemroot%\PerfectWindows\core.reg
echo "VisualFXSetting"=dword:00000003>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM]>>%systemroot%\PerfectWindows\core.reg
echo "AlwaysHibernateThumbnails"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "EnableAeroPeek"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\PenWorkspace]>>%systemroot%\PerfectWindows\core.reg
echo "PenWorkspaceAppSuggestionsEnabled"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Control Panel\Desktop]>>%systemroot%\PerfectWindows\core.reg
echo "WheelScrollLines"="9">>%systemroot%\PerfectWindows\core.reg
echo "MenuShowDelay"="0">>%systemroot%\PerfectWindows\core.reg
echo "UserPreferencesMask"=hex:98,52,07,80,12,01,00,00>>%systemroot%\PerfectWindows\core.reg
echo "WindowArrangementActive"="1">>%systemroot%\PerfectWindows\core.reg
echo "PaintDesktopVersion"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows]>>%systemroot%\PerfectWindows\core.reg
echo "DisplayVersion"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell]>>%systemroot%\PerfectWindows\core.reg
echo "SignInMode"=dword:00000002>>%systemroot%\PerfectWindows\core.reg
echo "ConvertibleSlateModePromptPreference"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers]>>%systemroot%\PerfectWindows\core.reg
echo "DisableAutoplay"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager]>>%systemroot%\PerfectWindows\core.reg
echo "FeatureManagementEnabled"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "OemPreInstalledAppsEnabled"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "PreInstalledAppsEnabled"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "SilentInstalledAppsEnabled"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "SoftLandingEnabled"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "SystemPaneSuggestionsEnabled"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "ContentDeliveryAllowed"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "PreInstalledAppsEverEnabled"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "RotatingLockScreenEnabled"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "RotatingLockScreenOverlayEnabled"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "SubscribedContent-310093Enabled"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\CloudContent]>>%systemroot%\PerfectWindows\core.reg
echo "DisableWindowsSpotlightWindowsWelcomeExperience"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "DisableThirdPartySuggestions"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "DisableWindowsSpotlightOnActionCenter"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "DisableTailoredExperiencesWithDiagnosticData"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent]>>%systemroot%\PerfectWindows\core.reg
echo "DisableSoftLanding"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "DisableWindowsConsumerFeatures"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace]>>%systemroot%\PerfectWindows\core.reg
echo "AllowSuggestedAppsInWindowsInkWorkspace"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [-HKEY_CURRENT_USER\Software\Microsoft\TabletTip]>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search]>>%systemroot%\PerfectWindows\core.reg
echo "AllowCortana"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "AllowCortanaAboveLock"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive]>>%systemroot%\PerfectWindows\core.reg
echo "DisableFileSyncNGSC"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "DisableFileSync"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%systemroot%\PerfectWindows\core.reg
echo "NoDriveTypeAutoRun"=dword:000000ff>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%systemroot%\PerfectWindows\core.reg
echo "NoAutorun"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%systemroot%\PerfectWindows\core.reg
echo "DontSetAutoplayCheckbox"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%systemroot%\PerfectWindows\core.reg
echo "NoDriveTypeAutoRun"=dword:000000ff>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%systemroot%\PerfectWindows\core.reg
echo "NoAutorun"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%systemroot%\PerfectWindows\core.reg
echo "DontSetAutoplayCheckbox"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search]>>%systemroot%\PerfectWindows\core.reg
echo "AutoIndexSharedFolders"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "PreventIndexOnBattery"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "AllowIndexingEncryptedStoresOrItems"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "PreventIndexingOfflineFiles"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "PreventIndexingPublicFolders"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "PreventIndexingEmailAttachments"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "PreventIndexingOutlook"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "DisableRemovableDriveIndexing"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications]>>%systemroot%\PerfectWindows\core.reg
echo "GlobalUserDisabled"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]>>%systemroot%\PerfectWindows\core.reg
echo "VerboseStatus"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "DisableStartupSound"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings]>>%systemroot%\PerfectWindows\core.reg
echo "ShowSleepOption"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "ShowHibernateOption"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "ShowLockOption"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Explorer]>>%systemroot%\PerfectWindows\core.reg
echo "ShowSleepOption"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "ShowHibernateOption"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "ShowLockOption"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer]>>%systemroot%\PerfectWindows\core.reg
echo "PowerButtonAction"=dword:00000010>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]>>%systemroot%\PerfectWindows\core.reg
echo "ShutdownWithoutLogon"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51]>>%systemroot%\PerfectWindows\core.reg
echo "DCSettingIndex"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "ACSettingIndex"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\29F6C1DB-86DA-48C5-9FDB-F2B67B1F44DA]>>%systemroot%\PerfectWindows\core.reg
echo "ACSettingIndex"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "DCSettingIndex"=dword:00002a30>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\3C0BC021-C8A8-4E07-A973-6B14CBCB2B7E]>>%systemroot%\PerfectWindows\core.reg
echo "ACSettingIndex"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "DCSettingIndex"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\5CA83367-6E45-459F-A27B-476B1D01C936]>>%systemroot%\PerfectWindows\core.reg
echo "ACSettingIndex"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "DCSettingIndex"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\637EA02F-BBCB-4015-8E2C-A1C7B9C0B546]>>%systemroot%\PerfectWindows\core.reg
echo "DCSettingIndex"=dword:00000002>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\6738E2C4-E8A5-4A42-B16A-E040E769756E]>>%systemroot%\PerfectWindows\core.reg
echo "DCSettingIndex"=dword:0000012c>>%systemroot%\PerfectWindows\core.reg
echo "ACSettingIndex"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\7648EFA3-DD9C-4E3E-B566-50F929386280]>>%systemroot%\PerfectWindows\core.reg
echo "DCSettingIndex"=dword:00000002>>%systemroot%\PerfectWindows\core.reg
echo "ACSettingIndex"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\8183ba9a-e910-48da-8769-14ae6dc1170a]>>%systemroot%\PerfectWindows\core.reg
echo "DCSettingIndex"=dword:0000000a>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\94ac6d29-73ce-41a6-809f-6363ba21b47e]>>%systemroot%\PerfectWindows\core.reg
echo "DCSettingIndex"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\96996BC0-AD50-47EC-923B-6F41874DD9EB]>>%systemroot%\PerfectWindows\core.reg
echo "ACSettingIndex"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "DCSettingIndex"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\9A66D8D7-4FF7-4EF9-B5A2-5A326CA2A469]>>%systemroot%\PerfectWindows\core.reg
echo "DCSettingIndex"=dword:00000005>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\9D7815A6-7EE4-497E-8888-515A05F02364]>>%systemroot%\PerfectWindows\core.reg
echo "DCSettingIndex"=dword:00002a30>>%systemroot%\PerfectWindows\core.reg
echo "ACSettingIndex"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\A4B195F5-8225-47D8-8012-9D41369786E2]>>%systemroot%\PerfectWindows\core.reg
echo "DCSettingIndex"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "ACSettingIndex"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\B7A27025-E569-46c2-A504-2B96CAD225A1]>>%systemroot%\PerfectWindows\core.reg
echo "ACSettingIndex"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\E69653CA-CF7F-4F05-AA73-CB833FA90AD4]>>%systemroot%\PerfectWindows\core.reg
echo "DCSettingIndex"=dword:00000014>>%systemroot%\PerfectWindows\core.reg
echo "ACSettingIndex"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\17aaa29b-8b43-4b94-aafe-35f64daaf1ee]>>%systemroot%\PerfectWindows\core.reg
echo "DCSettingIndex"=dword:00000032>>%systemroot%\PerfectWindows\core.reg
echo "ACSettingIndex"=dword:00000032>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f1fbfde2-a960-4165-9f88-50667911ce96]>>%systemroot%\PerfectWindows\core.reg
echo "DCSettingIndex"=dword:00000032>>%systemroot%\PerfectWindows\core.reg
echo "ACSettingIndex"=dword:00000032>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9]>>%systemroot%\PerfectWindows\core.reg
echo "DCSettingIndex"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\F3C5027D-CD16-4930-AA6B-90DB844A8F00]>>%systemroot%\PerfectWindows\core.reg
echo "DCSettingIndex"=dword:00000007>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%systemroot%\PerfectWindows\core.reg
echo "Start_ShowNetPlaces"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "Start_NotifyNewApps"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "Start_ShowDownloads"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "Start_ShowVideos"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "Start_AutoCascade"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "Start_LargeMFUIcons"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "Start_ShowPrinters"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "Start_ShowSetProgramAccessAndDefaults"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "Start_ShowUser"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "Start_ShowHelp"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "Start_MinMFU"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "Start_ShowMyGames"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer]>>%systemroot%\PerfectWindows\core.reg
echo "IconUnderline"=dword:00000002>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\FileHistory]>>%systemroot%\PerfectWindows\core.reg
echo "Disabled"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\MobilityCenter]>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\MobilePC\MobilityCenter]>>%systemroot%\PerfectWindows\core.reg
echo "RunOnDesktop"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer]>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [-HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Internet Explorer]>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Activities]>>%systemroot%\PerfectWindows\core.reg
echo "NoActivities"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Download]>>%systemroot%\PerfectWindows\core.reg
echo "CheckExeSignatures"="yes">>%systemroot%\PerfectWindows\core.reg
echo "RunInvalidSignatures"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\FlipAhead]>>%systemroot%\PerfectWindows\core.reg
echo "Enabled"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Main]>>%systemroot%\PerfectWindows\core.reg
echo "Enable Browser Extensions Beta"="no">>%systemroot%\PerfectWindows\core.reg
echo "DoNotTrack"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "Isolation"="PMEM">>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings]>>%systemroot%\PerfectWindows\core.reg
echo "PreventIgnoreCertErrors"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "CertificateRevocation"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Cache]>>%systemroot%\PerfectWindows\core.reg
echo "Persistent"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Restrictions]>>%systemroot%\PerfectWindows\core.reg
echo "NoHelpItemSendFeedback"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main]>>%systemroot%\PerfectWindows\core.reg
echo "HideNewEdgeButton"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TabbedBrowsing]>>%systemroot%\PerfectWindows\core.reg
echo "NewTabPageShow"=dword:00000002>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings]>>%systemroot%\PerfectWindows\core.reg
echo "MaxConnectionsPerServer"=dword:00000008>>%systemroot%\PerfectWindows\core.reg
echo "MaxConnectionsPer1_0Server"=dword:00000008>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SettingSync]>>%systemroot%\PerfectWindows\core.reg
echo "DisableWindowsSettingSync"=dword:00000002>>%systemroot%\PerfectWindows\core.reg
echo "DisableWindowsSettingSyncUserOverride"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "DisableSyncOnPaidNetwork"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\UEV\Agent\Configuration]>>%systemroot%\PerfectWindows\core.reg
echo "SyncOverMeteredNetwork"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "SyncOverMeteredNetworkWhenRoaming"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main]>>%systemroot%\PerfectWindows\core.reg
echo "SyncFavoritesBetweenIEAndMicrosoftEdge"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\ServiceUI]>>%systemroot%\PerfectWindows\core.reg
echo "AllowWebContentOnNewTabPage"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DataCollection]>>%systemroot%\PerfectWindows\core.reg
echo "AllowTelemetry"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\PreviewBuilds]>>%systemroot%\PerfectWindows\core.reg
echo "EnableConfigFlighting"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "EnableExperimentation"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons]>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [-HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons]>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender]>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender]>>%systemroot%\PerfectWindows\core.reg
echo "DisableRoutinelyTakingAction"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "DisableAntiSpyware"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "AllowFastServiceStartup"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "ServiceKeepAlive"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Quarantine]>>%systemroot%\PerfectWindows\core.reg
echo "PurgeItemsAfterDelay"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "LocalSettingOverridePurgeItemsAfterDelay"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine]>>%systemroot%\PerfectWindows\core.reg
echo "MpEnablePus"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "MpCloudBlockLevel"=dword:00000002>>%systemroot%\PerfectWindows\core.reg
echo "MpBafsExtendedTimeout"=dword:00000032>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection]>>%systemroot%\PerfectWindows\core.reg
echo "DisableIOAVProtection"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "DisableRealtimeMonitoring"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "DisableBehaviorMonitoring"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "DisableOnAccessProtection"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "RealtimeScanDirection"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "LocalSettingOverrideDisableBehaviorMonitoring"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "LocalSettingOverrideDisableOnAccessProtection"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "LocalSettingOverrideDisableIOAVProtection"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "LocalSettingOverrideDisableRealtimeMonitoring"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "LocalSettingOverrideRealtimeScanDirection"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Remediation]>>%systemroot%\PerfectWindows\core.reg
echo "LocalSettingOverrideScan_ScheduleTime"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet]>>%systemroot%\PerfectWindows\core.reg
echo "SpynetReporting"=dword:00000002>>%systemroot%\PerfectWindows\core.reg
echo "LocalSettingOverrideSpynetReporting"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "SubmitSamplesConsent"=dword:00000003>>%systemroot%\PerfectWindows\core.reg
echo "DisableBlockAtFirstSeen"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Scan]>>%systemroot%\PerfectWindows\core.reg
echo "DisableEmailScanning"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "DisableArchiveScanning"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "DisableRemovableDriveScanning"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "DisablePackedExeScanning"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "DisableHeuristics"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "DisableRemovableDriveScanning"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "CheckForSignaturesBeforeRunningScan"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "ScanOnlyIfIdle"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "PurgeItemsAfterDelay"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "LocalSettingOverrideScanParameters"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "LocalSettingOverrideAvgCPULoadFactor"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "LocalSettingOverrideScheduleDay"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "LocalSettingOverrideScheduleQuickScanTime"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "LocalSettingOverrideScheduleTime"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates]>>%systemroot%\PerfectWindows\core.reg
echo "UpdateOnStartUp"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "DisableUpdateOnStartupWithoutEngine"=dword:00000000>>%systemroot%\PerfectWindows\core.reg
echo "AVSignatureDue"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo "ASSignatureDue"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Threats]>>%systemroot%\PerfectWindows\core.reg
echo "Threats_ThreatSeverityDefaultAction"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction]>>%systemroot%\PerfectWindows\core.reg
echo "1"="2">>%systemroot%\PerfectWindows\core.reg
echo "2"="2">>%systemroot%\PerfectWindows\core.reg
echo "4"="3">>%systemroot%\PerfectWindows\core.reg
echo "5"="3">>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{53f5630d-b6bf-11d0-94f2-00a0c91efb8b}]>>%systemroot%\PerfectWindows\core.reg
echo "Deny_Execute"=dword:00000001>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation]>>%systemroot%\PerfectWindows\core.reg
echo "Model"="Optimized by Tom Zhu">>%systemroot%\PerfectWindows\core.reg
echo "SupportHours"="Optimized by Tom Zhu">>%systemroot%\PerfectWindows\core.reg
echo "SupportURL"="support.microsoft.com/windows">>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
echo.>>%systemroot%\PerfectWindows\core.reg
reg import %systemroot%\PerfectWindows\core.reg 1>nul 2>nul
reg import %systemroot%\PerfectWindows\core.reg 1>nul 2>nul
del %systemroot%\PerfectWindows\corebak.reg 1>nul 2>nul



:clearstartupfolders
title Optimizing Windows...
mode con cols=45 lines=3
color fc
echo.
echo.
echo.>%systemroot%\PerfectWindowsTemp\startup
rd /s /q "%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul
copy %systemroot%\PerfectWindowsTemp\startup "%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul
attrib +h +s "%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul
rd /s /q "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul
copy %systemroot%\PerfectWindowsTemp\startup "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul
attrib +h +s "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul
del %systemroot%\PerfectWindowsTemp\startup



:devicedisablewake
powercfg /devicequery wake_armed >%systemroot%\PerfectWindowsTemp\powercfg.txt
for /f "tokens=* delims= " %%i in (%systemroot%\PerfectWindowsTemp\powercfg.txt) do powercfg /devicedisablewake "%%i" 1>nul 2>nul
powercfg /devicequery wake_armed >%systemroot%\PerfectWindowsTemp\powercfg.txt
for /f "tokens=* delims= " %%i in (%systemroot%\PerfectWindowsTemp\powercfg.txt) do powercfg /devicedisablewake "%%i" 1>nul 2>nul



:reversemouse
echo Windows Registry Editor Version 5.00>%systemroot%\PerfectWindowsTemp\Reverse.reg
echo. >>%systemroot%\PerfectWindowsTemp\Reverse.reg
reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\HID /s >%systemroot%\PerfectWindowsTemp\Reverse.txt
findstr Parameter %systemroot%\PerfectWindowsTemp\Reverse.txt > %systemroot%\PerfectWindowsTemp\find.txt

for /f "tokens=* delims= " %%i in (%systemroot%\PerfectWindowsTemp\find.txt) do (
echo [%%i] >>%systemroot%\PerfectWindowsTemp\Reverse.reg
echo "FlipFlopWheel"=dword:00000001 >>%systemroot%\PerfectWindowsTemp\Reverse.reg
echo. >>%systemroot%\PerfectWindowsTemp\Reverse.reg
)

reg import %systemroot%\PerfectWindowsTemp\Reverse.reg 1>nul 2>nul
reg import %systemroot%\PerfectWindowsTemp\Reverse.reg 1>nul 2>nul
del %systemroot%\PerfectWindowsTemp\find.txt
del %systemroot%\PerfectWindowsTemp\Reverse.txt
del %systemroot%\PerfectWindowsTemp\Reverse.reg
del %systemroot%\PerfectWindowsTemp\powercfg.txt



:disableschtasks
title Optimizing Windows...
mode con cols=45 lines=3
color fc
echo.
echo Optimizing scheduled tasks...
schtasks /query /fo csv /nh >%systemroot%\PerfectWindowsTemp\detailedschtasks.txt
echo. >%systemroot%\PerfectWindowsTemp\temp5.txt
for /f "tokens=1 delims=," %%i in (%systemroot%\PerfectWindowsTemp\detailedschtasks.txt) do (
echo %%i>>%systemroot%\PerfectWindowsTemp\temp5.txt
)
findstr /v PerfectWindows %systemroot%\PerfectWindowsTemp\temp5.txt >%systemroot%\PerfectWindows\disabledschtasks.txt
for /f "tokens=* delims= " %%i in (%systemroot%\PerfectWindows\disabledschtasks.txt) do (
schtasks /end /tn %%i 1>nul 2>nul
schtasks /change /tn %%i /disable 1>nul 2>nul
)

schtasks /change /tn "\Microsoft\Windows\TextServicesFramework\MsCtfMonitor" /enable 1>nul 2>nul
schtasks /run /tn "\Microsoft\Windows\TextServicesFramework\MsCtfMonitor" 1>nul 2>nul
schtasks /change /tn "\Microsoft\Windows\TextServicesFramework\MsCtfMonitor" /enable 1>nul 2>nul
schtasks /run /tn "\Microsoft\Windows\TextServicesFramework\MsCtfMonitor" 1>nul 2>nul

echo ^<?xml version="1.0" encoding="UTF-16"?^>>%systemroot%\PerfectWindows\update.xml
echo ^<Task version="1.2" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task"^>>>%systemroot%\PerfectWindows\update.xml
echo   ^<RegistrationInfo^>>>%systemroot%\PerfectWindows\update.xml
echo     ^<URI^>\Microsoft\Windows\Windows Defender\Windows Defender Signature Update^</URI^>>>%systemroot%\PerfectWindows\update.xml
echo   ^</RegistrationInfo^>>>%systemroot%\PerfectWindows\update.xml
echo   ^<Triggers^>>>%systemroot%\PerfectWindows\update.xml
echo     ^<TimeTrigger^>>>%systemroot%\PerfectWindows\update.xml
echo       ^<Repetition^>>>%systemroot%\PerfectWindows\update.xml
echo         ^<Interval^>PT5M^</Interval^>>>%systemroot%\PerfectWindows\update.xml
echo         ^<StopAtDurationEnd^>false^</StopAtDurationEnd^>>>%systemroot%\PerfectWindows\update.xml
echo       ^</Repetition^>>>%systemroot%\PerfectWindows\update.xml
echo       ^<StartBoundary^>1999-11-30T00:00:00^</StartBoundary^>>>%systemroot%\PerfectWindows\update.xml
echo       ^<Enabled^>true^</Enabled^>>>%systemroot%\PerfectWindows\update.xml
echo     ^</TimeTrigger^>>>%systemroot%\PerfectWindows\update.xml
echo   ^</Triggers^>>>%systemroot%\PerfectWindows\update.xml
echo   ^<Principals^>>>%systemroot%\PerfectWindows\update.xml
echo     ^<Principal id="Author"^>>>%systemroot%\PerfectWindows\update.xml
echo       ^<RunLevel^>LeastPrivilege^</RunLevel^>>>%systemroot%\PerfectWindows\update.xml
echo     ^</Principal^>>>%systemroot%\PerfectWindows\update.xml
echo   ^</Principals^>>>%systemroot%\PerfectWindows\update.xml
echo   ^<Settings^>>>%systemroot%\PerfectWindows\update.xml
echo     ^<MultipleInstancesPolicy^>IgnoreNew^</MultipleInstancesPolicy^>>>%systemroot%\PerfectWindows\update.xml
echo     ^<DisallowStartIfOnBatteries^>false^</DisallowStartIfOnBatteries^>>>%systemroot%\PerfectWindows\update.xml
echo     ^<StopIfGoingOnBatteries^>false^</StopIfGoingOnBatteries^>>>%systemroot%\PerfectWindows\update.xml
echo     ^<AllowHardTerminate^>true^</AllowHardTerminate^>>>%systemroot%\PerfectWindows\update.xml
echo     ^<StartWhenAvailable^>true^</StartWhenAvailable^>>>%systemroot%\PerfectWindows\update.xml
echo     ^<RunOnlyIfNetworkAvailable^>false^</RunOnlyIfNetworkAvailable^>>>%systemroot%\PerfectWindows\update.xml
echo     ^<IdleSettings^>>>%systemroot%\PerfectWindows\update.xml
echo       ^<StopOnIdleEnd^>false^</StopOnIdleEnd^>>>%systemroot%\PerfectWindows\update.xml
echo       ^<RestartOnIdle^>true^</RestartOnIdle^>>>%systemroot%\PerfectWindows\update.xml
echo     ^</IdleSettings^>>>%systemroot%\PerfectWindows\update.xml
echo     ^<AllowStartOnDemand^>true^</AllowStartOnDemand^>>>%systemroot%\PerfectWindows\update.xml
echo     ^<Enabled^>true^</Enabled^>>>%systemroot%\PerfectWindows\update.xml
echo     ^<Hidden^>false^</Hidden^>>>%systemroot%\PerfectWindows\update.xml
echo     ^<RunOnlyIfIdle^>false^</RunOnlyIfIdle^>>>%systemroot%\PerfectWindows\update.xml
echo     ^<WakeToRun^>false^</WakeToRun^>>>%systemroot%\PerfectWindows\update.xml
echo     ^<ExecutionTimeLimit^>PT72H^</ExecutionTimeLimit^>>>%systemroot%\PerfectWindows\update.xml
echo     ^<Priority^>7^</Priority^>>>%systemroot%\PerfectWindows\update.xml
echo   ^</Settings^>>>%systemroot%\PerfectWindows\update.xml
echo   ^<Actions Context="Author"^>>>%systemroot%\PerfectWindows\update.xml
echo     ^<Exec^>>>%systemroot%\PerfectWindows\update.xml
echo       ^<Command^>"%programfiles%\Windows Defender\MpCmdRun.exe"^</Command^>>>%systemroot%\PerfectWindows\update.xml
echo       ^<Arguments^>-SignatureUpdate -MMPC^</Arguments^>>>%systemroot%\PerfectWindows\update.xml
echo     ^</Exec^>>>%systemroot%\PerfectWindows\update.xml
echo   ^</Actions^>>>%systemroot%\PerfectWindows\update.xml
echo ^</Task^>>>%systemroot%\PerfectWindows\update.xml

SCHTASKS /DELETE /TN "\Microsoft\Windows\Windows Defender\Windows Defender Signature Update" /F 1>nul 2>nul
SCHTASKS /CREATE /RU SYSTEM /TN "\Microsoft\Windows\Windows Defender\Windows Defender Signature Update" /XML %systemroot%\PerfectWindows\update.xml /F 1>nul 2>nul
SCHTASKS /RUN /TN "\Microsoft\Windows\Windows Defender\Windows Defender Signature Update" 1>nul 2>nul
del %systemroot%\PerfectWindowsTemp\detailedschtasks.txt 1>nul 2>nul
del %systemroot%\PerfectWindows\update.xml 1>nul 2>nul



:power
title Optimizing Windows...
mode con cols=45 lines=3
color fc
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
powercfg /setdcvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 3 1>nul 2>nul
powercfg /setacvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 1 1>nul 2>nul
powercfg /setdcvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 0 1>nul 2>nul
powercfg /setacvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0 1>nul 2>nul
powercfg /setdcvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0 1>nul 2>nul
powercfg /setacvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0 1>nul 2>nul
powercfg /setdcvalueindex 281b4222-f694-41f0-9685-ff5bb260df2e 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 1 1>nul 2>nul
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
mode con cols=45 lines=3
color fc
echo.
echo Applying whitelist...
if exist whitelist.txt (
goto applywhitelist) else (
goto restart)
:applywhitelist
for /f "tokens=* delims= " %%i in (whitelist.txt) do (
if %%i equ onedrive (
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v DisableFileSyncNGSC /f 1>nul 2>nul
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v DisableFileSync /f 1>nul 2>nul)

if %%i equ cortana (
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /f 1>nul 2>nul
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortanaAboveLock /f 1>nul 2>nul)

if %%i equ power (
reg delete HKLM\SOFTWARE\Policies\Microsoft\Power\PowerSettings /f 1>nul 2>nul
reg delete "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaveTimeOut /f 1>nul 2>nul
reg delete "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaveActive /f 1>nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v NoDispScrSavPage /f 1>nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoClose /f 1>nul 2>nul
reg delete "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v PowerButtonAction /f 1>nul 2>nul
reg delete "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v ShowSleepOption /f 1>nul 2>nul
reg delete "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v ShowHibernateOption /f 1>nul 2>nul
reg delete "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v ShowLockOption /f 1>nul 2>nul)

if %%i equ desktop (
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDesktop /f 1>nul 2>nul) else (
sc config "%%i" start= auto 1>nul 2>nul
schtasks /change /tn "%%i" /enable 1>nul 2>nul)
)



:restart
rd /s /q %systemroot%\PerfectWindowsTemp 1>nul 2>nul
shutdown /r /t 1
