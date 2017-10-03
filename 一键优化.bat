@echo off
pushd "%~dp0"
(echo check>"%systemroot%"\check.check) 1>nul 2>nul
if exist "%systemroot%"\check.check (
del "%systemroot%"\check.check 1>nul 2>nul
goto main) else (
title 需要管理员权限！
mode con cols=45 lines=7
color fc
echo.
echo 需要管理员权限才能一键优化 Windows！
echo.
echo 请右键单击本程序后单击“以管理员身份运行”！
echo.
pause
exit
)

:main
mode con cols=28 lines=7
title  
color fc
echo.
echo 为确保所有优化操作生效，优化
echo 结束后我们将会重新启动电脑。
echo.
echo 如果你已准备好重新启动电脑，
pause
rd /s /q %systemdrive%\ZZYTEMP 1>nul 2>nul
md %systemdrive%\ZZYTEMP 1>nul 2>nul
powercfg /hibernate /size 75 1>nul 2>nul
powercfg /hibernate /type full 1>nul 2>nul



:services
title  
mode con cols=30 lines=3
color fc
echo.
echo 正在优化服务。
del %systemdrive%\ZZYTEMP\tmp1.txt 1>nul 2>nul
del %systemdrive%\ZZYTEMP\tmp2.txt 1>nul 2>nul
del %systemdrive%\ZZYTEMP\tmp3.txt 1>nul 2>nul
del %systemdrive%\ZZYTEMP\services.txt 1>nul 2>nul
sc query state=all >%systemdrive%\ZZYTEMP\tmp1.txt
findstr SERVICE_NAME %systemdrive%\ZZYTEMP\tmp1.txt >> %systemdrive%\ZZYTEMP\tmp2.txt

for /f "tokens=2 delims=:" %%i in (%systemdrive%\ZZYTEMP\tmp2.txt) do (
echo %%i>>%systemdrive%\ZZYTEMP\tmp3.txt
)

for /f "tokens=* delims= " %%i in (%systemdrive%\ZZYTEMP\tmp3.txt) do (
echo %%i>>%systemdrive%\ZZYTEMP\services.txt
)

for /f "tokens=* delims= " %%i in (%systemdrive%\ZZYTEMP\services.txt) do (
sc config "%%i" start= demand 1>nul 2>nul
)

del %systemdrive%\ZZYTEMP\tmp1.txt 1>nul 2>nul
del %systemdrive%\ZZYTEMP\tmp2.txt 1>nul 2>nul
del %systemdrive%\ZZYTEMP\tmp3.txt 1>nul 2>nul



:core
title  
mode con cols=30 lines=3
color fc
echo.
echo 正在优化系统设置。

echo Windows Registry Editor Version 5.00>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]>>%systemdrive%\ZZYTEMP\core.reg
echo "Scancode Map"=hex:00,00,00,00,00,00,00,00,40,00,00,00,32,E0,3B,00,2E,E0,51,E0,30,E0,49,E0,00,00,00,00>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WbioSrvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UserManager]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SystemEventsBroker]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PolicyAgent]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\gpsvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DusmSvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WlanSvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Winmgmt]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\stisvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FontCache]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MpsSvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SecurityHealthService]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinDefend]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AudioEndpointBuilder]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Audiosrv]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ProfSvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Themes]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Schedule]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wscsvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Power]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PlugPlay]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nsi]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NlaSvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LSM]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TrkWks]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dhcp]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DoSvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DcomLaunch]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CryptSvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\sppsvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CoreMessagingRegistrar]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventSystem]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BFE]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BrokerInfrastructure]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BITS]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WSearch]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Wcmsvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lfsvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DsmSvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DeviceInstall]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DeviceAssociationService]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CDPUserSvc_420c0]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WpnUserService_420c0]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WpnService]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tiledatamodelsvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ShellHWDetection]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RpcEptMapper]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RpcSs]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Spooler]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations]>>%systemdrive%\ZZYTEMP\core.reg
echo ".tif"="PhotoViewer.FileAssoc.Tiff">>%systemdrive%\ZZYTEMP\core.reg
echo ".tiff"="PhotoViewer.FileAssoc.Tiff">>%systemdrive%\ZZYTEMP\core.reg
echo ".jpg"="PhotoViewer.FileAssoc.Tiff">>%systemdrive%\ZZYTEMP\core.reg
echo ".jpeg"="PhotoViewer.FileAssoc.Tiff">>%systemdrive%\ZZYTEMP\core.reg
echo ".jpe"="PhotoViewer.FileAssoc.Tiff">>%systemdrive%\ZZYTEMP\core.reg
echo ".jfif"="PhotoViewer.FileAssoc.Tiff">>%systemdrive%\ZZYTEMP\core.reg
echo ".bmp"="PhotoViewer.FileAssoc.Tiff">>%systemdrive%\ZZYTEMP\core.reg
echo ".gif"="PhotoViewer.FileAssoc.Tiff">>%systemdrive%\ZZYTEMP\core.reg
echo ".png"="PhotoViewer.FileAssoc.Tiff">>%systemdrive%\ZZYTEMP\core.reg
echo ".ico"="PhotoViewer.FileAssoc.Tiff">>%systemdrive%\ZZYTEMP\core.reg
echo ".dib"="PhotoViewer.FileAssoc.Tiff">>%systemdrive%\ZZYTEMP\core.reg
echo ".wdp"="PhotoViewer.FileAssoc.Tiff">>%systemdrive%\ZZYTEMP\core.reg
echo ".jxr"="PhotoViewer.FileAssoc.Tiff">>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance]>>%systemdrive%\ZZYTEMP\core.reg
echo "fAllowToGetHelp"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server]>>%systemdrive%\ZZYTEMP\core.reg
echo "fDenyTSConnections"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\BITS]>>%systemdrive%\ZZYTEMP\core.reg
echo "EnablePeercaching"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization]>>%systemdrive%\ZZYTEMP\core.reg
echo "DODownloadMode"=dword:00000003>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WerSvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000004>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RemoteRegistry]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000004>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\iphlpsvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000004>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DiagTrack]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000004>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\PhishingFilter]>>%systemdrive%\ZZYTEMP\core.reg
echo "PreventOverride"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "PreventOverrideAppRepUnknown"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "EnabledV9"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter]>>%systemdrive%\ZZYTEMP\core.reg
echo "EnabledV9"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "PreventOverride"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "PreventOverrideAppRepUnknown"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System]>>%systemdrive%\ZZYTEMP\core.reg
echo "EnableSmartScreen"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "ShellSmartScreenLevel"="Warn">>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System]>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableTaskMgr"=->>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\System]>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableCMD"=->>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]>>%systemdrive%\ZZYTEMP\core.reg
echo "VerboseStatus"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "EnableLUA"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "ConsentPromptBehaviorAdmin"=dword:00000005>>%systemdrive%\ZZYTEMP\core.reg
echo "PromptOnSecureDesktop"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "EnableUIADesktopToggle"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "FilterAdministratorToken"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "EnableSecureUIAPaths"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "EnableInstallerDetection"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "ConsentPromptBehaviorUser"=dword:00000003>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers]>>%systemdrive%\ZZYTEMP\core.reg
echo "DefaultLevel"=dword:00040000>>%systemdrive%\ZZYTEMP\core.reg
echo "TransparentEnabled"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "PolicyScope"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "AuthenticodeEnabled"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SystemCertificates\AuthRoot]>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableRootAutoUpdate"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SystemCertificates\TrustedPublisher\Safer]>>%systemdrive%\ZZYTEMP\core.reg
echo "AuthenticodeFlags"=dword:00000300>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile]>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableNotifications"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "EnableFirewall"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile]>>%systemdrive%\ZZYTEMP\core.reg
echo "EnableFirewall"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableNotifications"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile]>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableNotifications"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "EnableFirewall"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MpsSvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WSearch]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FontCache]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SecurityHealthService]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ProfSvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lfsvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wscsvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Spooler]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Power]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PlugPlay]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DoSvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UserManager]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BFE]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PolicyAgent]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DeviceAssociationService]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DeviceInstall]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DsmSvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SDRSVC]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000004>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center]>>%systemdrive%\ZZYTEMP\core.reg
echo "AntiVirusOverride"=->>%systemdrive%\ZZYTEMP\core.reg
echo "FirewallDisableNotify"=->>%systemdrive%\ZZYTEMP\core.reg
echo "UacDisableNotify"=->>%systemdrive%\ZZYTEMP\core.reg
echo "UpdatesDisableNotify"=->>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center\Svc]>>%systemdrive%\ZZYTEMP\core.reg
echo "AntiVirusOverride"=->>%systemdrive%\ZZYTEMP\core.reg
echo "FirewallDisableNotify"=->>%systemdrive%\ZZYTEMP\core.reg
echo "UacDisableNotify"=->>%systemdrive%\ZZYTEMP\core.reg
echo "UpdatesDisableNotify"=->>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate]>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableWindowsUpdateAccess"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU]>>%systemdrive%\ZZYTEMP\core.reg
echo "NoAutoUpdate"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "AUOptions"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DetectionFrequencyEnabled"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "DetectionFrequency"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "ExcludeWUDriversInQualityUpdate"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "NoAutoRebootWithLoggedOnUsers"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MRT]>>%systemdrive%\ZZYTEMP\core.reg
echo "DontOfferThroughWUAU"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PassportForWork\PINComplexity]>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [-HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\PassportForWork\PINComplexity]>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PassportForWork\PINComplexityBeta]>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [-HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization]>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance]>>%systemdrive%\ZZYTEMP\core.reg
echo "WakeUp"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "MaintenanceDisabled"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl]>>%systemdrive%\ZZYTEMP\core.reg
echo "AutoReboot"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "AlwaysKeepMemoryDump"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "CrashDumpEnabled"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Maps]>>%systemdrive%\ZZYTEMP\core.reg
echo "AutoDownloadAndUpdateMapData"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore]>>%systemdrive%\ZZYTEMP\core.reg
echo "AutoDownload"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore]>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableConfig"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableSR"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows]>>%systemdrive%\ZZYTEMP\core.reg
echo "CEIPEnable"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting]>>%systemdrive%\ZZYTEMP\core.reg
echo "DontShowUI"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "DontSendAdditionalData"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "Disabled"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting]>>%systemdrive%\ZZYTEMP\core.reg
echo "DoReport"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters]>>%systemdrive%\ZZYTEMP\core.reg
echo "EnableSuperfetch"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SysMain]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000004>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat]>>%systemdrive%\ZZYTEMP\core.reg
echo "DisablePCA"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableEngine"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "VDMDisallowed"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PcaSvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000004>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HomeGroup]>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableHomeGroup"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HomeGroupListener]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000004>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HomeGroupProvider]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000004>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform]>>%systemdrive%\ZZYTEMP\core.reg
echo "NoGenTicket"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\defragsvc]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start"=dword:00000003>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM]>>%systemdrive%\ZZYTEMP\core.reg
echo "AnimationsShiftKey"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%systemdrive%\ZZYTEMP\core.reg
echo "NoToolbarsOnTaskbar"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications]>>%systemdrive%\ZZYTEMP\core.reg
echo "NoToastApplicationNotification"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "NoToastApplicationNotificationOnLockScreen"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "NoTileApplicationNotification"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "NoCloudApplicationNotification"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "DisallowNotificationMirroring"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization]>>%systemdrive%\ZZYTEMP\core.reg
echo "NoLockScreen"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System]>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableLockScreenAppNotifications"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableLogonBackgroundImage"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "BlockUserFromShowingAccountDetailsOnSignin"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "HiberbootEnabled"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer]>>%systemdrive%\ZZYTEMP\core.reg
echo "EnableLegacyBalloonNotifications"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableNotificationCenter"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize]>>%systemdrive%\ZZYTEMP\core.reg
echo "EnableTransparency"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%systemdrive%\ZZYTEMP\core.reg
echo "UseOLEDTaskbarTransparency"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\MultitaskingView\AltTabViewHost]>>%systemdrive%\ZZYTEMP\core.reg
echo "Grid_backgroundPercent"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "BackgroundDimmingLayer_percent"=dword:00000028>>%systemdrive%\ZZYTEMP\core.reg
echo "wallpaper"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer]>>%systemdrive%\ZZYTEMP\core.reg
echo "EnableAutoTray"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%systemdrive%\ZZYTEMP\core.reg
echo "DontUsePowerShellOnWinX"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start_TrackDocs"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%systemdrive%\ZZYTEMP\core.reg
echo "LaunchTo"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer]>>%systemdrive%\ZZYTEMP\core.reg
echo "ShowFrequent"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "ShowRecent"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "ShellState"=hex:24,00,00,00,1c,08,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\>>%systemdrive%\ZZYTEMP\core.reg
echo    01,00,00,00,13,00,00,00,00,00,00,00,6b,00,00,00>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Modules\GlobalSettings\DetailsContainer]>>%systemdrive%\ZZYTEMP\core.reg
echo "DetailsContainer"=hex:02,00,00,00,02,00,00,00>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer]>>%systemdrive%\ZZYTEMP\core.reg
echo "ClearTilesOnExit"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer]>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableSearchBoxSuggestions"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "ExplorerRibbonStartsMinimized"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableIndexedLibraryExperience"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableSearchHistory"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%systemdrive%\ZZYTEMP\core.reg
echo "ForceClassicControlPanel"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "EnforceShellExtensionSecurity"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "ClearRecentDocsOnExit"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "NoRecentDocsMenu"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "NoStartMenuMFUprogramsList"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "ClearRecentProgForNewUserInStartMenu"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "NoTrayContextMenu"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "NoTaskGrouping"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableCurrentUserRun"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableCurrentUserRunOnce"=->>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableLocalMachineRun"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableLocalMachineRunOnce"=->>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Modules\GlobalSettings\Sizer]>>%systemdrive%\ZZYTEMP\core.reg
echo "PageSpaceControlSizer"=hex:a0,00,00,00,00,00,00,00,00,00,00,00,56,03,00,00>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%systemdrive%\ZZYTEMP\core.reg
echo "ExtendedUIHoverTime"=dword:99999999>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband]>>%systemdrive%\ZZYTEMP\core.reg
echo "NumThumbnails"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%systemdrive%\ZZYTEMP\core.reg
echo "ShowTaskViewButton"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\Preferences]>>%systemdrive%\ZZYTEMP\core.reg
echo "WholeFileSystem"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "SystemFolders"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "ArchivedFiles"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\PrimaryProperties\UnindexedLocations]>>%systemdrive%\ZZYTEMP\core.reg
echo "SearchOnly"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\PenWorkspace]>>%systemdrive%\ZZYTEMP\core.reg
echo "PenWorkspaceButtonDesiredVisibility"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search]>>%systemdrive%\ZZYTEMP\core.reg
echo "SearchboxTaskbarMode"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Touchpad]>>%systemdrive%\ZZYTEMP\core.reg
echo "TouchpadDesiredVisibility"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer]>>%systemdrive%\ZZYTEMP\core.reg
echo "ShowWindowsStoreAppsOnTaskbar"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "NoPinningToTaskbar"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "NoPinningStoreToTaskbar"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "TaskbarNoPinnedList"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics]>>%systemdrive%\ZZYTEMP\core.reg
echo "MinAnimate"="1">>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons]>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu]>>%systemdrive%\ZZYTEMP\core.reg
echo "{645FF040-5081-101B-9F08-00AA002F954E}"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "{59031a47-3f72-44a7-89c5-5595fe6b30ee}"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "{20D04FE0-3AEA-1069-A2D8-08002B30309D}"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel]>>%systemdrive%\ZZYTEMP\core.reg
echo "{645FF040-5081-101B-9F08-00AA002F954E}"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "{59031a47-3f72-44a7-89c5-5595fe6b30ee}"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "{20D04FE0-3AEA-1069-A2D8-08002B30309D}"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\cleanuppath]>>%systemdrive%\ZZYTEMP\core.reg
echo @=hex(2):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,00,25,\>>%systemdrive%\ZZYTEMP\core.reg
echo   00,5c,00,53,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,63,00,6c,00,\>>%systemdrive%\ZZYTEMP\core.reg
echo   65,00,61,00,6e,00,6d,00,67,00,72,00,2e,00,65,00,78,00,65,00,20,00,2f,00,44,\>>%systemdrive%\ZZYTEMP\core.reg
echo   00,20,00,25,00,63,00,00,00>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\DefragPath]>>%systemdrive%\ZZYTEMP\core.reg
echo @=hex(2):25,00,73,00,79,00,73,00,74,00,65,00,6d,00,72,00,6f,00,6f,00,74,00,25,\>>%systemdrive%\ZZYTEMP\core.reg
echo   00,5c,00,73,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,64,00,66,00,\>>%systemdrive%\ZZYTEMP\core.reg
echo   72,00,67,00,75,00,69,00,2e,00,65,00,78,00,65,00,00,00>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CLASSES_ROOT\lnkfile]>>%systemdrive%\ZZYTEMP\core.reg
echo @="Shortcut">>%systemdrive%\ZZYTEMP\core.reg
echo "IsShortcut"="">>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes]>>%systemdrive%\ZZYTEMP\core.reg
echo "ThemeChangesDesktopIcons"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "ThemeChangesMousePointers"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Control Panel\Mouse]>>%systemdrive%\ZZYTEMP\core.reg
echo "MouseSensitivity"="10">>%systemdrive%\ZZYTEMP\core.reg
echo "MouseSpeed"="2">>%systemdrive%\ZZYTEMP\core.reg
echo "MouseThreshold1"="6">>%systemdrive%\ZZYTEMP\core.reg
echo "MouseThreshold2"="10">>%systemdrive%\ZZYTEMP\core.reg
echo "MouseTrails"="0">>%systemdrive%\ZZYTEMP\core.reg
echo "MouseHoverTime"="2">>%systemdrive%\ZZYTEMP\core.reg
echo "SnapToDefaultButton"="0">>%systemdrive%\ZZYTEMP\core.reg
echo "DoubleClickSpeed"="500">>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Control Panel\Desktop]>>%systemdrive%\ZZYTEMP\core.reg
echo "MouseWheelRouting"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%systemdrive%\ZZYTEMP\core.reg
echo "NoInternetIcon"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "HideSCANetwork"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "HideSCAHealth"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "HideSCAVolume"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "NoAutoTrayNotify"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Control Panel\Desktop]>>%systemdrive%\ZZYTEMP\core.reg
echo "ScreenSaveTimeOut"="0">>%systemdrive%\ZZYTEMP\core.reg
echo "ScreenSaverIsSecure"="1">>%systemdrive%\ZZYTEMP\core.reg
echo "ScreenSaveActive"="0">>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System]>>%systemdrive%\ZZYTEMP\core.reg
echo "NoDispScrSavPage"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%systemdrive%\ZZYTEMP\core.reg
echo "NoDesktop"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "NoClose"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%systemdrive%\ZZYTEMP\core.reg
echo "SeparateProcess"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "Hidden"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "HideFileExt"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "AutoCheckSelect"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "TaskbarSizeMove"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "PersistBrowsers"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "TaskbarAnimations"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "TaskbarGlomLevel"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "TaskbarGlomming"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "TaskbarAppsVisibleInTabletMode"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "TaskbarSmallIcons"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "UseTabletModeNotificationIcons"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "ShowSyncProviderNotifications"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "JointResize"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "SnapAssist"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "SnapFill"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "VirtualDesktopTaskbarFilter"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "VirtualDesktopAltTabFilter"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "ShowEncryptCompressedColor"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "TypeAhead"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "AlwaysShowMenus"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar]>>%systemdrive%\ZZYTEMP\core.reg
echo "ShowStatus"=dword:00000003>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects]>>%systemdrive%\ZZYTEMP\core.reg
echo "VisualFXSetting"=dword:00000003>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM]>>%systemdrive%\ZZYTEMP\core.reg
echo "AlwaysHibernateThumbnails"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "EnableAeroPeek"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\PenWorkspace]>>%systemdrive%\ZZYTEMP\core.reg
echo "PenWorkspaceAppSuggestionsEnabled"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Control Panel\Desktop]>>%systemdrive%\ZZYTEMP\core.reg
echo "WheelScrollLines"="9">>%systemdrive%\ZZYTEMP\core.reg
echo "MenuShowDelay"="0">>%systemdrive%\ZZYTEMP\core.reg
echo "UserPreferencesMask"=hex:98,52,07,80,12,01,00,00>>%systemdrive%\ZZYTEMP\core.reg
echo "WindowArrangementActive"="1">>%systemdrive%\ZZYTEMP\core.reg
echo "PaintDesktopVersion"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows]>>%systemdrive%\ZZYTEMP\core.reg
echo "DisplayVersion"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell]>>%systemdrive%\ZZYTEMP\core.reg
echo "SignInMode"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "ConvertibleSlateModePromptPreference"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers]>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableAutoplay"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager]>>%systemdrive%\ZZYTEMP\core.reg
echo "FeatureManagementEnabled"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "OemPreInstalledAppsEnabled"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "PreInstalledAppsEnabled"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "SilentInstalledAppsEnabled"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "SoftLandingEnabled"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "SystemPaneSuggestionsEnabled"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "ContentDeliveryAllowed"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "PreInstalledAppsEverEnabled"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "RotatingLockScreenEnabled"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "RotatingLockScreenOverlayEnabled"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "SubscribedContent-310093Enabled"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\CloudContent]>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableWindowsSpotlightWindowsWelcomeExperience"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableThirdPartySuggestions"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableWindowsSpotlightOnActionCenter"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableTailoredExperiencesWithDiagnosticData"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent]>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableSoftLanding"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableWindowsConsumerFeatures"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace]>>%systemdrive%\ZZYTEMP\core.reg
echo "AllowSuggestedAppsInWindowsInkWorkspace"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [-HKEY_CURRENT_USER\Software\Microsoft\TabletTip]>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search]>>%systemdrive%\ZZYTEMP\core.reg
echo "AllowCortana"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "AllowCortanaAboveLock"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive]>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableFileSyncNGSC"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableFileSync"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%systemdrive%\ZZYTEMP\core.reg
echo "NoDriveTypeAutoRun"=dword:000000ff>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search]>>%systemdrive%\ZZYTEMP\core.reg
echo "AutoIndexSharedFolders"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "PreventIndexOnBattery"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "AllowIndexingEncryptedStoresOrItems"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "PreventIndexingOfflineFiles"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "PreventIndexingPublicFolders"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "PreventIndexingEmailAttachments"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "PreventIndexingOutlook"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableRemovableDriveIndexing"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications]>>%systemdrive%\ZZYTEMP\core.reg
echo "GlobalUserDisabled"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]>>%systemdrive%\ZZYTEMP\core.reg
echo "VerboseStatus"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableStartupSound"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings]>>%systemdrive%\ZZYTEMP\core.reg
echo "ShowSleepOption"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "ShowHibernateOption"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "ShowLockOption"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Explorer]>>%systemdrive%\ZZYTEMP\core.reg
echo "ShowSleepOption"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "ShowHibernateOption"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "ShowLockOption"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer]>>%systemdrive%\ZZYTEMP\core.reg
echo "PowerButtonAction"=dword:00000010>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]>>%systemdrive%\ZZYTEMP\core.reg
echo "ShutdownWithoutLogon"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51]>>%systemdrive%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "ACSettingIndex"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\29F6C1DB-86DA-48C5-9FDB-F2B67B1F44DA]>>%systemdrive%\ZZYTEMP\core.reg
echo "ACSettingIndex"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00002a30>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\3C0BC021-C8A8-4E07-A973-6B14CBCB2B7E]>>%systemdrive%\ZZYTEMP\core.reg
echo "ACSettingIndex"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\5CA83367-6E45-459F-A27B-476B1D01C936]>>%systemdrive%\ZZYTEMP\core.reg
echo "ACSettingIndex"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\637EA02F-BBCB-4015-8E2C-A1C7B9C0B546]>>%systemdrive%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\6738E2C4-E8A5-4A42-B16A-E040E769756E]>>%systemdrive%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:0000012c>>%systemdrive%\ZZYTEMP\core.reg
echo "ACSettingIndex"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\7648EFA3-DD9C-4E3E-B566-50F929386280]>>%systemdrive%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "ACSettingIndex"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\8183ba9a-e910-48da-8769-14ae6dc1170a]>>%systemdrive%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:0000000a>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\94ac6d29-73ce-41a6-809f-6363ba21b47e]>>%systemdrive%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\96996BC0-AD50-47EC-923B-6F41874DD9EB]>>%systemdrive%\ZZYTEMP\core.reg
echo "ACSettingIndex"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\9A66D8D7-4FF7-4EF9-B5A2-5A326CA2A469]>>%systemdrive%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000005>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\9D7815A6-7EE4-497E-8888-515A05F02364]>>%systemdrive%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00002a30>>%systemdrive%\ZZYTEMP\core.reg
echo "ACSettingIndex"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\A4B195F5-8225-47D8-8012-9D41369786E2]>>%systemdrive%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "ACSettingIndex"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\B7A27025-E569-46c2-A504-2B96CAD225A1]>>%systemdrive%\ZZYTEMP\core.reg
echo "ACSettingIndex"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\E69653CA-CF7F-4F05-AA73-CB833FA90AD4]>>%systemdrive%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000064>>%systemdrive%\ZZYTEMP\core.reg
echo "ACSettingIndex"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\17aaa29b-8b43-4b94-aafe-35f64daaf1ee]>>%systemdrive%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000032>>%systemdrive%\ZZYTEMP\core.reg
echo "ACSettingIndex"=dword:00000032>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f1fbfde2-a960-4165-9f88-50667911ce96]>>%systemdrive%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000032>>%systemdrive%\ZZYTEMP\core.reg
echo "ACSettingIndex"=dword:00000032>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9]>>%systemdrive%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\F3C5027D-CD16-4930-AA6B-90DB844A8F00]>>%systemdrive%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000007>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%systemdrive%\ZZYTEMP\core.reg
echo "Start_ShowNetPlaces"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "Start_NotifyNewApps"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "Start_ShowDownloads"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "Start_ShowVideos"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "Start_AutoCascade"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "Start_LargeMFUIcons"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "Start_ShowPrinters"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "Start_ShowSetProgramAccessAndDefaults"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "Start_ShowUser"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "Start_ShowHelp"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "Start_MinMFU"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "Start_ShowMyGames"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer]>>%systemdrive%\ZZYTEMP\core.reg
echo "IconUnderline"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\FileHistory]>>%systemdrive%\ZZYTEMP\core.reg
echo "Disabled"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\MobilityCenter]>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\MobilePC\MobilityCenter]>>%systemdrive%\ZZYTEMP\core.reg
echo "RunOnDesktop"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer]>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [-HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Internet Explorer]>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Activities]>>%systemdrive%\ZZYTEMP\core.reg
echo "NoActivities"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Download]>>%systemdrive%\ZZYTEMP\core.reg
echo "CheckExeSignatures"="yes">>%systemdrive%\ZZYTEMP\core.reg
echo "RunInvalidSignatures"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\FlipAhead]>>%systemdrive%\ZZYTEMP\core.reg
echo "Enabled"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Main]>>%systemdrive%\ZZYTEMP\core.reg
echo "Enable Browser Extensions Beta"="no">>%systemdrive%\ZZYTEMP\core.reg
echo "DoNotTrack"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "Isolation"="PMEM">>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings]>>%systemdrive%\ZZYTEMP\core.reg
echo "PreventIgnoreCertErrors"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "CertificateRevocation"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Cache]>>%systemdrive%\ZZYTEMP\core.reg
echo "Persistent"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Restrictions]>>%systemdrive%\ZZYTEMP\core.reg
echo "NoHelpItemSendFeedback"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main]>>%systemdrive%\ZZYTEMP\core.reg
echo "HideNewEdgeButton"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TabbedBrowsing]>>%systemdrive%\ZZYTEMP\core.reg
echo "NewTabPageShow"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings]>>%systemdrive%\ZZYTEMP\core.reg
echo "MaxConnectionsPerServer"=dword:00000008>>%systemdrive%\ZZYTEMP\core.reg
echo "MaxConnectionsPer1_0Server"=dword:00000008>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SettingSync]>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableWindowsSettingSync"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableWindowsSettingSyncUserOverride"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableSyncOnPaidNetwork"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\UEV\Agent\Configuration]>>%systemdrive%\ZZYTEMP\core.reg
echo "SyncOverMeteredNetwork"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "SyncOverMeteredNetworkWhenRoaming"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main]>>%systemdrive%\ZZYTEMP\core.reg
echo "SyncFavoritesBetweenIEAndMicrosoftEdge"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\ServiceUI]>>%systemdrive%\ZZYTEMP\core.reg
echo "AllowWebContentOnNewTabPage"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DataCollection]>>%systemdrive%\ZZYTEMP\core.reg
echo "AllowTelemetry"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\PreviewBuilds]>>%systemdrive%\ZZYTEMP\core.reg
echo "EnableConfigFlighting"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "EnableExperimentation"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons]>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [-HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons]>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender]>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine]>>%systemdrive%\ZZYTEMP\core.reg
echo "MpEnablePus"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "MpCloudBlockLevel"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "MpBafsExtendedTimeout"=dword:00000032>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection]>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableIOAVProtection"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet]>>%systemdrive%\ZZYTEMP\core.reg
echo "SpynetReporting"=dword:00000002>>%systemdrive%\ZZYTEMP\core.reg
echo "SubmitSamplesConsent"=dword:00000003>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableBlockAtFirstSeen"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Scan]>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableEmailScanning"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "CheckForSignaturesBeforeRunningScan"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "ScanOnlyIfIdle"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates]>>%systemdrive%\ZZYTEMP\core.reg
echo "UpdateOnStartUp"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "DisableUpdateOnStartupWithoutEngine"=dword:00000000>>%systemdrive%\ZZYTEMP\core.reg
echo "AVSignatureDue"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo "ASSignatureDue"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Threats]>>%systemdrive%\ZZYTEMP\core.reg
echo "Threats_ThreatSeverityDefaultAction"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction]>>%systemdrive%\ZZYTEMP\core.reg
echo "1"="2">>%systemdrive%\ZZYTEMP\core.reg
echo "2"="2">>%systemdrive%\ZZYTEMP\core.reg
echo "4"="2">>%systemdrive%\ZZYTEMP\core.reg
echo "5"="2">>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{53f5630d-b6bf-11d0-94f2-00a0c91efb8b}]>>%systemdrive%\ZZYTEMP\core.reg
echo "Deny_Execute"=dword:00000001>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation]>>%systemdrive%\ZZYTEMP\core.reg
echo "Model"="这是一台经过 Tom Zhu 优化的电脑。">>%systemdrive%\ZZYTEMP\core.reg
echo "SupportHours"="这是一台经过 Tom Zhu 优化的电脑。">>%systemdrive%\ZZYTEMP\core.reg
echo "SupportURL"="support.microsoft.com/windows">>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg
echo.>>%systemdrive%\ZZYTEMP\core.reg

reg import %systemdrive%\ZZYTEMP\core.reg 1>nul 2>nul
del %systemdrive%\ZZYTEMP\core.reg 1>nul 2>nul



:clearstartupfolders
title  
mode con cols=30 lines=3
color fc
echo.
echo 正在清理启动项。
rd /s /q "%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul
rd /s /q "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul



:devicedisablewake
powercfg /devicequery wake_armed >%systemdrive%\ZZYTEMP\powercfg.txt
for /f "tokens=* delims= " %%i in (%systemdrive%\ZZYTEMP\powercfg.txt) do powercfg /devicedisablewake "%%i" 1>nul 2>nul



:reversemouse
echo Windows Registry Editor Version 5.00>%systemdrive%\ZZYTEMP\Reverse.reg
echo. >>%systemdrive%\ZZYTEMP\Reverse.reg
reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\HID /s >%systemdrive%\ZZYTEMP\Reverse.txt
findstr Parameter %systemdrive%\ZZYTEMP\Reverse.txt > %systemdrive%\ZZYTEMP\find.txt

for /f "tokens=* delims= " %%i in (%systemdrive%\ZZYTEMP\find.txt) do (
echo [%%i] >>%systemdrive%\ZZYTEMP\Reverse.reg
echo "FlipFlopWheel"=dword:00000001 >>%systemdrive%\ZZYTEMP\Reverse.reg
echo. >>%systemdrive%\ZZYTEMP\Reverse.reg
)

reg import %systemdrive%\ZZYTEMP\Reverse.reg 1>nul 2>nul
del %systemdrive%\ZZYTEMP\find.txt
del %systemdrive%\ZZYTEMP\Reverse.txt
del %systemdrive%\ZZYTEMP\Reverse.reg
del %systemdrive%\ZZYTEMP\powercfg.txt



:disableschtasks
title  
mode con cols=30 lines=3
color fc
echo.
echo 正在优化计划任务。
schtasks /query /fo csv /nh >%systemdrive%\ZZYTEMP\detailedschtasks.txt
echo. >%systemdrive%\ZZYTEMP\disabledschtasks.txt
for /f "tokens=1 delims=," %%i in (%systemdrive%\ZZYTEMP\detailedschtasks.txt) do (
echo %%i>>%systemdrive%\ZZYTEMP\disabledschtasks.txt
schtasks /end /tn %%i 1>nul 2>nul
schtasks /change /tn %%i /disable 1>nul 2>nul
)

schtasks /change /tn "\Microsoft\Windows\TextServicesFramework\MsCtfMonitor" /enable 1>nul 2>nul
schtasks /run /tn "\Microsoft\Windows\TextServicesFramework\MsCtfMonitor" 1>nul 2>nul

del %systemdrive%\ZZYTEMP\detailedschtasks.txt 1>nul 2>nul



:power
title  
mode con cols=30 lines=3
color fc
echo.
echo 正在优化电源选项。
del %systemroot%\powerplan.pow 1>nul 2>nul
powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e 1>nul 2>nul
powercfg /delete 281b4222-f694-41f0-9685-ff5bb260df2e 1>nul 2>nul
powercfg /export %systemroot%\powerplan.pow 381b4222-f694-41f0-9685-ff5bb260df2e 1>nul 2>nul
powercfg /import %systemroot%\powerplan.pow 281b4222-f694-41f0-9685-ff5bb260df2e 1>nul 2>nul
powercfg /changename 281b4222-f694-41f0-9685-ff5bb260df2e "最佳" "接通电源时最大程度提高性能；使用电池时最大程度降低功耗。" 1>nul 2>nul
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
title  
mode con cols=30 lines=3
color fc
echo.
echo 正在应用白名单。
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
rd /s /q %systemdrive%\ZZYTEMP 1>nul 2>nul
shutdown /r /t 1