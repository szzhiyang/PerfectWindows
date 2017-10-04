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
rd /s /q %systemroot%\ZZYTEMP 1>nul 2>nul
md %systemroot%\ZZYTEMP 1>nul 2>nul
powercfg /hibernate /size 75 1>nul 2>nul
powercfg /hibernate /type full 1>nul 2>nul



:services
title  
mode con cols=30 lines=3
color fc
echo.
echo 正在优化服务。
del %systemroot%\ZZYTEMP\tmp1.txt 1>nul 2>nul
del %systemroot%\ZZYTEMP\tmp2.txt 1>nul 2>nul
del %systemroot%\ZZYTEMP\tmp3.txt 1>nul 2>nul
del %systemroot%\ZZYTEMP\services.txt 1>nul 2>nul
sc query state=all >%systemroot%\ZZYTEMP\tmp1.txt
findstr SERVICE_NAME %systemroot%\ZZYTEMP\tmp1.txt >> %systemroot%\ZZYTEMP\tmp2.txt

for /f "tokens=2 delims=:" %%i in (%systemroot%\ZZYTEMP\tmp2.txt) do (
echo %%i>>%systemroot%\ZZYTEMP\tmp3.txt
)

for /f "tokens=* delims= " %%i in (%systemroot%\ZZYTEMP\tmp3.txt) do (
echo %%i>>%systemroot%\ZZYTEMP\services.txt
)

for /f "tokens=* delims= " %%i in (%systemroot%\ZZYTEMP\services.txt) do (
sc config "%%i" start= demand 1>nul 2>nul
)

del %systemroot%\ZZYTEMP\tmp1.txt 1>nul 2>nul
del %systemroot%\ZZYTEMP\tmp2.txt 1>nul 2>nul
del %systemroot%\ZZYTEMP\tmp3.txt 1>nul 2>nul



:core
title  
mode con cols=30 lines=3
color fc
echo.
echo 正在优化系统设置。

echo Windows Registry Editor Version 5.00>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]>>%systemroot%\ZZYTEMP\core.reg
echo "Scancode Map"=hex:00,00,00,00,00,00,00,00,40,00,00,00,32,E0,3B,00,2E,E0,51,E0,30,E0,49,E0,00,00,00,00>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WbioSrvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UserManager]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SystemEventsBroker]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PolicyAgent]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\gpsvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DusmSvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WlanSvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Winmgmt]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\stisvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FontCache]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MpsSvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SecurityHealthService]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinDefend]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AudioEndpointBuilder]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Audiosrv]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ProfSvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Themes]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Schedule]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wscsvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Power]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PlugPlay]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nsi]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NlaSvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LSM]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TrkWks]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dhcp]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DoSvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DcomLaunch]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CryptSvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\sppsvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CoreMessagingRegistrar]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventSystem]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BFE]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BrokerInfrastructure]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BITS]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WSearch]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Wcmsvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lfsvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DsmSvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DeviceInstall]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DeviceAssociationService]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CDPUserSvc_420c0]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WpnUserService_420c0]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WpnService]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tiledatamodelsvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ShellHWDetection]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RpcEptMapper]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RpcSs]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Spooler]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations]>>%systemroot%\ZZYTEMP\core.reg
echo ".tif"="PhotoViewer.FileAssoc.Tiff">>%systemroot%\ZZYTEMP\core.reg
echo ".tiff"="PhotoViewer.FileAssoc.Tiff">>%systemroot%\ZZYTEMP\core.reg
echo ".jpg"="PhotoViewer.FileAssoc.Tiff">>%systemroot%\ZZYTEMP\core.reg
echo ".jpeg"="PhotoViewer.FileAssoc.Tiff">>%systemroot%\ZZYTEMP\core.reg
echo ".jpe"="PhotoViewer.FileAssoc.Tiff">>%systemroot%\ZZYTEMP\core.reg
echo ".jfif"="PhotoViewer.FileAssoc.Tiff">>%systemroot%\ZZYTEMP\core.reg
echo ".bmp"="PhotoViewer.FileAssoc.Tiff">>%systemroot%\ZZYTEMP\core.reg
echo ".gif"="PhotoViewer.FileAssoc.Tiff">>%systemroot%\ZZYTEMP\core.reg
echo ".png"="PhotoViewer.FileAssoc.Tiff">>%systemroot%\ZZYTEMP\core.reg
echo ".ico"="PhotoViewer.FileAssoc.Tiff">>%systemroot%\ZZYTEMP\core.reg
echo ".dib"="PhotoViewer.FileAssoc.Tiff">>%systemroot%\ZZYTEMP\core.reg
echo ".wdp"="PhotoViewer.FileAssoc.Tiff">>%systemroot%\ZZYTEMP\core.reg
echo ".jxr"="PhotoViewer.FileAssoc.Tiff">>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance]>>%systemroot%\ZZYTEMP\core.reg
echo "fAllowToGetHelp"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server]>>%systemroot%\ZZYTEMP\core.reg
echo "fDenyTSConnections"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\BITS]>>%systemroot%\ZZYTEMP\core.reg
echo "EnablePeercaching"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization]>>%systemroot%\ZZYTEMP\core.reg
echo "DODownloadMode"=dword:00000003>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WerSvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000004>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RemoteRegistry]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000004>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\iphlpsvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000004>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DiagTrack]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000004>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\PhishingFilter]>>%systemroot%\ZZYTEMP\core.reg
echo "PreventOverride"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "PreventOverrideAppRepUnknown"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "EnabledV9"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter]>>%systemroot%\ZZYTEMP\core.reg
echo "EnabledV9"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "PreventOverride"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "PreventOverrideAppRepUnknown"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System]>>%systemroot%\ZZYTEMP\core.reg
echo "EnableSmartScreen"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "ShellSmartScreenLevel"="Warn">>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System]>>%systemroot%\ZZYTEMP\core.reg
echo "DisableTaskMgr"=->>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\System]>>%systemroot%\ZZYTEMP\core.reg
echo "DisableCMD"=->>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]>>%systemroot%\ZZYTEMP\core.reg
echo "VerboseStatus"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "EnableLUA"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "ConsentPromptBehaviorAdmin"=dword:00000005>>%systemroot%\ZZYTEMP\core.reg
echo "PromptOnSecureDesktop"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "EnableUIADesktopToggle"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "FilterAdministratorToken"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "EnableSecureUIAPaths"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "EnableInstallerDetection"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "ConsentPromptBehaviorUser"=dword:00000003>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers]>>%systemroot%\ZZYTEMP\core.reg
echo "DefaultLevel"=dword:00040000>>%systemroot%\ZZYTEMP\core.reg
echo "TransparentEnabled"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "PolicyScope"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "AuthenticodeEnabled"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SystemCertificates\AuthRoot]>>%systemroot%\ZZYTEMP\core.reg
echo "DisableRootAutoUpdate"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SystemCertificates\TrustedPublisher\Safer]>>%systemroot%\ZZYTEMP\core.reg
echo "AuthenticodeFlags"=dword:00000300>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile]>>%systemroot%\ZZYTEMP\core.reg
echo "DisableNotifications"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "EnableFirewall"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile]>>%systemroot%\ZZYTEMP\core.reg
echo "EnableFirewall"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "DisableNotifications"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile]>>%systemroot%\ZZYTEMP\core.reg
echo "DisableNotifications"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "EnableFirewall"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MpsSvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WSearch]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FontCache]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SecurityHealthService]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ProfSvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lfsvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wscsvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Spooler]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Power]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PlugPlay]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DoSvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UserManager]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BFE]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PolicyAgent]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DeviceAssociationService]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DeviceInstall]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DsmSvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SDRSVC]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000004>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center]>>%systemroot%\ZZYTEMP\core.reg
echo "AntiVirusOverride"=->>%systemroot%\ZZYTEMP\core.reg
echo "FirewallDisableNotify"=->>%systemroot%\ZZYTEMP\core.reg
echo "UacDisableNotify"=->>%systemroot%\ZZYTEMP\core.reg
echo "UpdatesDisableNotify"=->>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center\Svc]>>%systemroot%\ZZYTEMP\core.reg
echo "AntiVirusOverride"=->>%systemroot%\ZZYTEMP\core.reg
echo "FirewallDisableNotify"=->>%systemroot%\ZZYTEMP\core.reg
echo "UacDisableNotify"=->>%systemroot%\ZZYTEMP\core.reg
echo "UpdatesDisableNotify"=->>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate]>>%systemroot%\ZZYTEMP\core.reg
echo "DisableWindowsUpdateAccess"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DelayedAutoStart"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU]>>%systemroot%\ZZYTEMP\core.reg
echo "NoAutoUpdate"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "AUOptions"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DetectionFrequencyEnabled"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "DetectionFrequency"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "ExcludeWUDriversInQualityUpdate"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "NoAutoRebootWithLoggedOnUsers"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MRT]>>%systemroot%\ZZYTEMP\core.reg
echo "DontOfferThroughWUAU"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PassportForWork\PINComplexity]>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [-HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\PassportForWork\PINComplexity]>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PassportForWork\PINComplexityBeta]>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [-HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization]>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance]>>%systemroot%\ZZYTEMP\core.reg
echo "WakeUp"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "MaintenanceDisabled"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl]>>%systemroot%\ZZYTEMP\core.reg
echo "AutoReboot"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "AlwaysKeepMemoryDump"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "CrashDumpEnabled"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Maps]>>%systemroot%\ZZYTEMP\core.reg
echo "AutoDownloadAndUpdateMapData"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore]>>%systemroot%\ZZYTEMP\core.reg
echo "AutoDownload"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore]>>%systemroot%\ZZYTEMP\core.reg
echo "DisableConfig"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "DisableSR"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows]>>%systemroot%\ZZYTEMP\core.reg
echo "CEIPEnable"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting]>>%systemroot%\ZZYTEMP\core.reg
echo "DontShowUI"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "DontSendAdditionalData"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "Disabled"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting]>>%systemroot%\ZZYTEMP\core.reg
echo "DoReport"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters]>>%systemroot%\ZZYTEMP\core.reg
echo "EnableSuperfetch"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SysMain]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000004>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat]>>%systemroot%\ZZYTEMP\core.reg
echo "DisablePCA"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "DisableEngine"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "VDMDisallowed"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PcaSvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000004>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HomeGroup]>>%systemroot%\ZZYTEMP\core.reg
echo "DisableHomeGroup"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HomeGroupListener]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000004>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HomeGroupProvider]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000004>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform]>>%systemroot%\ZZYTEMP\core.reg
echo "NoGenTicket"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\defragsvc]>>%systemroot%\ZZYTEMP\core.reg
echo "Start"=dword:00000003>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM]>>%systemroot%\ZZYTEMP\core.reg
echo "AnimationsShiftKey"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%systemroot%\ZZYTEMP\core.reg
echo "NoToolbarsOnTaskbar"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications]>>%systemroot%\ZZYTEMP\core.reg
echo "NoToastApplicationNotification"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "NoToastApplicationNotificationOnLockScreen"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "NoTileApplicationNotification"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "NoCloudApplicationNotification"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "DisallowNotificationMirroring"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization]>>%systemroot%\ZZYTEMP\core.reg
echo "NoLockScreen"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System]>>%systemroot%\ZZYTEMP\core.reg
echo "DisableLockScreenAppNotifications"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "DisableLogonBackgroundImage"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "BlockUserFromShowingAccountDetailsOnSignin"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "HiberbootEnabled"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer]>>%systemroot%\ZZYTEMP\core.reg
echo "EnableLegacyBalloonNotifications"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "DisableNotificationCenter"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize]>>%systemroot%\ZZYTEMP\core.reg
echo "EnableTransparency"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power]>>%systemroot%\ZZYTEMP\core.reg
echo "AwayModeEnabled"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%systemroot%\ZZYTEMP\core.reg
echo "UseOLEDTaskbarTransparency"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\MultitaskingView\AltTabViewHost]>>%systemroot%\ZZYTEMP\core.reg
echo "Grid_backgroundPercent"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "BackgroundDimmingLayer_percent"=dword:00000028>>%systemroot%\ZZYTEMP\core.reg
echo "wallpaper"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer]>>%systemroot%\ZZYTEMP\core.reg
echo "EnableAutoTray"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%systemroot%\ZZYTEMP\core.reg
echo "DontUsePowerShellOnWinX"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%systemroot%\ZZYTEMP\core.reg
echo "Start_TrackDocs"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%systemroot%\ZZYTEMP\core.reg
echo "LaunchTo"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer]>>%systemroot%\ZZYTEMP\core.reg
echo "ShowFrequent"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "ShowRecent"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "ShellState"=hex:24,00,00,00,1c,08,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\>>%systemroot%\ZZYTEMP\core.reg
echo    01,00,00,00,13,00,00,00,00,00,00,00,6b,00,00,00>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Modules\GlobalSettings\DetailsContainer]>>%systemroot%\ZZYTEMP\core.reg
echo "DetailsContainer"=hex:02,00,00,00,02,00,00,00>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer]>>%systemroot%\ZZYTEMP\core.reg
echo "ClearTilesOnExit"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer]>>%systemroot%\ZZYTEMP\core.reg
echo "DisableSearchBoxSuggestions"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "ExplorerRibbonStartsMinimized"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "DisableIndexedLibraryExperience"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "DisableSearchHistory"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%systemroot%\ZZYTEMP\core.reg
echo "ForceClassicControlPanel"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "EnforceShellExtensionSecurity"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "ClearRecentDocsOnExit"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "NoRecentDocsMenu"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "NoStartMenuMFUprogramsList"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "ClearRecentProgForNewUserInStartMenu"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "NoTrayContextMenu"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "NoTaskGrouping"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "DisableCurrentUserRun"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "DisableCurrentUserRunOnce"=->>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%systemroot%\ZZYTEMP\core.reg
echo "DisableLocalMachineRun"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "DisableLocalMachineRunOnce"=->>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Modules\GlobalSettings\Sizer]>>%systemroot%\ZZYTEMP\core.reg
echo "PageSpaceControlSizer"=hex:a0,00,00,00,00,00,00,00,00,00,00,00,56,03,00,00>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%systemroot%\ZZYTEMP\core.reg
echo "ExtendedUIHoverTime"=dword:99999999>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband]>>%systemroot%\ZZYTEMP\core.reg
echo "NumThumbnails"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%systemroot%\ZZYTEMP\core.reg
echo "ShowTaskViewButton"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\Preferences]>>%systemroot%\ZZYTEMP\core.reg
echo "WholeFileSystem"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "SystemFolders"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "ArchivedFiles"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\PrimaryProperties\UnindexedLocations]>>%systemroot%\ZZYTEMP\core.reg
echo "SearchOnly"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\PenWorkspace]>>%systemroot%\ZZYTEMP\core.reg
echo "PenWorkspaceButtonDesiredVisibility"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search]>>%systemroot%\ZZYTEMP\core.reg
echo "SearchboxTaskbarMode"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Touchpad]>>%systemroot%\ZZYTEMP\core.reg
echo "TouchpadDesiredVisibility"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer]>>%systemroot%\ZZYTEMP\core.reg
echo "ShowWindowsStoreAppsOnTaskbar"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "NoPinningToTaskbar"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "NoPinningStoreToTaskbar"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "TaskbarNoPinnedList"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics]>>%systemroot%\ZZYTEMP\core.reg
echo "MinAnimate"="1">>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons]>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu]>>%systemroot%\ZZYTEMP\core.reg
echo "{645FF040-5081-101B-9F08-00AA002F954E}"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "{59031a47-3f72-44a7-89c5-5595fe6b30ee}"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "{20D04FE0-3AEA-1069-A2D8-08002B30309D}"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel]>>%systemroot%\ZZYTEMP\core.reg
echo "{645FF040-5081-101B-9F08-00AA002F954E}"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "{59031a47-3f72-44a7-89c5-5595fe6b30ee}"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "{20D04FE0-3AEA-1069-A2D8-08002B30309D}"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\cleanuppath]>>%systemroot%\ZZYTEMP\core.reg
echo @=hex(2):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,00,25,\>>%systemroot%\ZZYTEMP\core.reg
echo   00,5c,00,53,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,63,00,6c,00,\>>%systemroot%\ZZYTEMP\core.reg
echo   65,00,61,00,6e,00,6d,00,67,00,72,00,2e,00,65,00,78,00,65,00,20,00,2f,00,44,\>>%systemroot%\ZZYTEMP\core.reg
echo   00,20,00,25,00,63,00,00,00>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\DefragPath]>>%systemroot%\ZZYTEMP\core.reg
echo @=hex(2):25,00,73,00,79,00,73,00,74,00,65,00,6d,00,72,00,6f,00,6f,00,74,00,25,\>>%systemroot%\ZZYTEMP\core.reg
echo   00,5c,00,73,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,64,00,66,00,\>>%systemroot%\ZZYTEMP\core.reg
echo   72,00,67,00,75,00,69,00,2e,00,65,00,78,00,65,00,00,00>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CLASSES_ROOT\lnkfile]>>%systemroot%\ZZYTEMP\core.reg
echo @="Shortcut">>%systemroot%\ZZYTEMP\core.reg
echo "IsShortcut"="">>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes]>>%systemroot%\ZZYTEMP\core.reg
echo "ThemeChangesDesktopIcons"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "ThemeChangesMousePointers"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Control Panel\Mouse]>>%systemroot%\ZZYTEMP\core.reg
echo "MouseSensitivity"="10">>%systemroot%\ZZYTEMP\core.reg
echo "MouseSpeed"="2">>%systemroot%\ZZYTEMP\core.reg
echo "MouseThreshold1"="6">>%systemroot%\ZZYTEMP\core.reg
echo "MouseThreshold2"="10">>%systemroot%\ZZYTEMP\core.reg
echo "MouseTrails"="0">>%systemroot%\ZZYTEMP\core.reg
echo "MouseHoverTime"="2">>%systemroot%\ZZYTEMP\core.reg
echo "SnapToDefaultButton"="0">>%systemroot%\ZZYTEMP\core.reg
echo "DoubleClickSpeed"="500">>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Control Panel\Desktop]>>%systemroot%\ZZYTEMP\core.reg
echo "MouseWheelRouting"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%systemroot%\ZZYTEMP\core.reg
echo "NoInternetIcon"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "HideSCANetwork"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "HideSCAHealth"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "HideSCAVolume"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "NoAutoTrayNotify"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Control Panel\Desktop]>>%systemroot%\ZZYTEMP\core.reg
echo "ScreenSaveTimeOut"="0">>%systemroot%\ZZYTEMP\core.reg
echo "ScreenSaverIsSecure"="1">>%systemroot%\ZZYTEMP\core.reg
echo "ScreenSaveActive"="0">>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System]>>%systemroot%\ZZYTEMP\core.reg
echo "NoDispScrSavPage"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%systemroot%\ZZYTEMP\core.reg
echo "NoDesktop"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "NoClose"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%systemroot%\ZZYTEMP\core.reg
echo "SeparateProcess"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "Hidden"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "HideFileExt"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "AutoCheckSelect"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "TaskbarSizeMove"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "PersistBrowsers"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "TaskbarAnimations"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "TaskbarGlomLevel"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "TaskbarGlomming"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "TaskbarAppsVisibleInTabletMode"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "TaskbarSmallIcons"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "UseTabletModeNotificationIcons"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "ShowSyncProviderNotifications"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "JointResize"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "SnapAssist"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "SnapFill"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "VirtualDesktopTaskbarFilter"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "VirtualDesktopAltTabFilter"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "ShowEncryptCompressedColor"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "TypeAhead"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "AlwaysShowMenus"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar]>>%systemroot%\ZZYTEMP\core.reg
echo "ShowStatus"=dword:00000003>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects]>>%systemroot%\ZZYTEMP\core.reg
echo "VisualFXSetting"=dword:00000003>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM]>>%systemroot%\ZZYTEMP\core.reg
echo "AlwaysHibernateThumbnails"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "EnableAeroPeek"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\PenWorkspace]>>%systemroot%\ZZYTEMP\core.reg
echo "PenWorkspaceAppSuggestionsEnabled"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Control Panel\Desktop]>>%systemroot%\ZZYTEMP\core.reg
echo "WheelScrollLines"="9">>%systemroot%\ZZYTEMP\core.reg
echo "MenuShowDelay"="0">>%systemroot%\ZZYTEMP\core.reg
echo "UserPreferencesMask"=hex:98,52,07,80,12,01,00,00>>%systemroot%\ZZYTEMP\core.reg
echo "WindowArrangementActive"="1">>%systemroot%\ZZYTEMP\core.reg
echo "PaintDesktopVersion"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows]>>%systemroot%\ZZYTEMP\core.reg
echo "DisplayVersion"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell]>>%systemroot%\ZZYTEMP\core.reg
echo "SignInMode"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "ConvertibleSlateModePromptPreference"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers]>>%systemroot%\ZZYTEMP\core.reg
echo "DisableAutoplay"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager]>>%systemroot%\ZZYTEMP\core.reg
echo "FeatureManagementEnabled"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "OemPreInstalledAppsEnabled"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "PreInstalledAppsEnabled"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "SilentInstalledAppsEnabled"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "SoftLandingEnabled"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "SystemPaneSuggestionsEnabled"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "ContentDeliveryAllowed"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "PreInstalledAppsEverEnabled"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "RotatingLockScreenEnabled"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "RotatingLockScreenOverlayEnabled"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "SubscribedContent-310093Enabled"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\CloudContent]>>%systemroot%\ZZYTEMP\core.reg
echo "DisableWindowsSpotlightWindowsWelcomeExperience"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "DisableThirdPartySuggestions"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "DisableWindowsSpotlightOnActionCenter"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "DisableTailoredExperiencesWithDiagnosticData"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent]>>%systemroot%\ZZYTEMP\core.reg
echo "DisableSoftLanding"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "DisableWindowsConsumerFeatures"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace]>>%systemroot%\ZZYTEMP\core.reg
echo "AllowSuggestedAppsInWindowsInkWorkspace"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [-HKEY_CURRENT_USER\Software\Microsoft\TabletTip]>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search]>>%systemroot%\ZZYTEMP\core.reg
echo "AllowCortana"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "AllowCortanaAboveLock"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive]>>%systemroot%\ZZYTEMP\core.reg
echo "DisableFileSyncNGSC"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "DisableFileSync"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>%systemroot%\ZZYTEMP\core.reg
echo "NoDriveTypeAutoRun"=dword:000000ff>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search]>>%systemroot%\ZZYTEMP\core.reg
echo "AutoIndexSharedFolders"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "PreventIndexOnBattery"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "AllowIndexingEncryptedStoresOrItems"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "PreventIndexingOfflineFiles"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "PreventIndexingPublicFolders"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "PreventIndexingEmailAttachments"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "PreventIndexingOutlook"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "DisableRemovableDriveIndexing"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications]>>%systemroot%\ZZYTEMP\core.reg
echo "GlobalUserDisabled"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]>>%systemroot%\ZZYTEMP\core.reg
echo "VerboseStatus"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "DisableStartupSound"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings]>>%systemroot%\ZZYTEMP\core.reg
echo "ShowSleepOption"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "ShowHibernateOption"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "ShowLockOption"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Explorer]>>%systemroot%\ZZYTEMP\core.reg
echo "ShowSleepOption"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "ShowHibernateOption"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "ShowLockOption"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer]>>%systemroot%\ZZYTEMP\core.reg
echo "PowerButtonAction"=dword:00000010>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]>>%systemroot%\ZZYTEMP\core.reg
echo "ShutdownWithoutLogon"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51]>>%systemroot%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "ACSettingIndex"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\29F6C1DB-86DA-48C5-9FDB-F2B67B1F44DA]>>%systemroot%\ZZYTEMP\core.reg
echo "ACSettingIndex"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00002a30>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\3C0BC021-C8A8-4E07-A973-6B14CBCB2B7E]>>%systemroot%\ZZYTEMP\core.reg
echo "ACSettingIndex"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\5CA83367-6E45-459F-A27B-476B1D01C936]>>%systemroot%\ZZYTEMP\core.reg
echo "ACSettingIndex"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\637EA02F-BBCB-4015-8E2C-A1C7B9C0B546]>>%systemroot%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\6738E2C4-E8A5-4A42-B16A-E040E769756E]>>%systemroot%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:0000012c>>%systemroot%\ZZYTEMP\core.reg
echo "ACSettingIndex"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\7648EFA3-DD9C-4E3E-B566-50F929386280]>>%systemroot%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "ACSettingIndex"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\8183ba9a-e910-48da-8769-14ae6dc1170a]>>%systemroot%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:0000000a>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\94ac6d29-73ce-41a6-809f-6363ba21b47e]>>%systemroot%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\96996BC0-AD50-47EC-923B-6F41874DD9EB]>>%systemroot%\ZZYTEMP\core.reg
echo "ACSettingIndex"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\9A66D8D7-4FF7-4EF9-B5A2-5A326CA2A469]>>%systemroot%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000005>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\9D7815A6-7EE4-497E-8888-515A05F02364]>>%systemroot%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00002a30>>%systemroot%\ZZYTEMP\core.reg
echo "ACSettingIndex"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\A4B195F5-8225-47D8-8012-9D41369786E2]>>%systemroot%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "ACSettingIndex"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\B7A27025-E569-46c2-A504-2B96CAD225A1]>>%systemroot%\ZZYTEMP\core.reg
echo "ACSettingIndex"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\E69653CA-CF7F-4F05-AA73-CB833FA90AD4]>>%systemroot%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000064>>%systemroot%\ZZYTEMP\core.reg
echo "ACSettingIndex"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\17aaa29b-8b43-4b94-aafe-35f64daaf1ee]>>%systemroot%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000032>>%systemroot%\ZZYTEMP\core.reg
echo "ACSettingIndex"=dword:00000032>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f1fbfde2-a960-4165-9f88-50667911ce96]>>%systemroot%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000032>>%systemroot%\ZZYTEMP\core.reg
echo "ACSettingIndex"=dword:00000032>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9]>>%systemroot%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\F3C5027D-CD16-4930-AA6B-90DB844A8F00]>>%systemroot%\ZZYTEMP\core.reg
echo "DCSettingIndex"=dword:00000007>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>%systemroot%\ZZYTEMP\core.reg
echo "Start_ShowNetPlaces"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "Start_NotifyNewApps"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "Start_ShowDownloads"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "Start_ShowVideos"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "Start_AutoCascade"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "Start_LargeMFUIcons"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "Start_ShowPrinters"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "Start_ShowSetProgramAccessAndDefaults"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "Start_ShowUser"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "Start_ShowHelp"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "Start_MinMFU"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "Start_ShowMyGames"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer]>>%systemroot%\ZZYTEMP\core.reg
echo "IconUnderline"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\FileHistory]>>%systemroot%\ZZYTEMP\core.reg
echo "Disabled"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\MobilityCenter]>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\MobilePC\MobilityCenter]>>%systemroot%\ZZYTEMP\core.reg
echo "RunOnDesktop"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer]>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [-HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Internet Explorer]>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Activities]>>%systemroot%\ZZYTEMP\core.reg
echo "NoActivities"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Download]>>%systemroot%\ZZYTEMP\core.reg
echo "CheckExeSignatures"="yes">>%systemroot%\ZZYTEMP\core.reg
echo "RunInvalidSignatures"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\FlipAhead]>>%systemroot%\ZZYTEMP\core.reg
echo "Enabled"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Main]>>%systemroot%\ZZYTEMP\core.reg
echo "Enable Browser Extensions Beta"="no">>%systemroot%\ZZYTEMP\core.reg
echo "DoNotTrack"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "Isolation"="PMEM">>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings]>>%systemroot%\ZZYTEMP\core.reg
echo "PreventIgnoreCertErrors"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "CertificateRevocation"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Cache]>>%systemroot%\ZZYTEMP\core.reg
echo "Persistent"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Restrictions]>>%systemroot%\ZZYTEMP\core.reg
echo "NoHelpItemSendFeedback"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main]>>%systemroot%\ZZYTEMP\core.reg
echo "HideNewEdgeButton"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TabbedBrowsing]>>%systemroot%\ZZYTEMP\core.reg
echo "NewTabPageShow"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings]>>%systemroot%\ZZYTEMP\core.reg
echo "MaxConnectionsPerServer"=dword:00000008>>%systemroot%\ZZYTEMP\core.reg
echo "MaxConnectionsPer1_0Server"=dword:00000008>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SettingSync]>>%systemroot%\ZZYTEMP\core.reg
echo "DisableWindowsSettingSync"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "DisableWindowsSettingSyncUserOverride"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "DisableSyncOnPaidNetwork"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\UEV\Agent\Configuration]>>%systemroot%\ZZYTEMP\core.reg
echo "SyncOverMeteredNetwork"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "SyncOverMeteredNetworkWhenRoaming"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main]>>%systemroot%\ZZYTEMP\core.reg
echo "SyncFavoritesBetweenIEAndMicrosoftEdge"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\ServiceUI]>>%systemroot%\ZZYTEMP\core.reg
echo "AllowWebContentOnNewTabPage"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DataCollection]>>%systemroot%\ZZYTEMP\core.reg
echo "AllowTelemetry"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\PreviewBuilds]>>%systemroot%\ZZYTEMP\core.reg
echo "EnableConfigFlighting"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "EnableExperimentation"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons]>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [-HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons]>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender]>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine]>>%systemroot%\ZZYTEMP\core.reg
echo "MpEnablePus"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "MpCloudBlockLevel"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "MpBafsExtendedTimeout"=dword:00000032>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection]>>%systemroot%\ZZYTEMP\core.reg
echo "DisableIOAVProtection"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet]>>%systemroot%\ZZYTEMP\core.reg
echo "SpynetReporting"=dword:00000002>>%systemroot%\ZZYTEMP\core.reg
echo "SubmitSamplesConsent"=dword:00000003>>%systemroot%\ZZYTEMP\core.reg
echo "DisableBlockAtFirstSeen"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Scan]>>%systemroot%\ZZYTEMP\core.reg
echo "DisableEmailScanning"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "CheckForSignaturesBeforeRunningScan"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "ScanOnlyIfIdle"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates]>>%systemroot%\ZZYTEMP\core.reg
echo "UpdateOnStartUp"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "DisableUpdateOnStartupWithoutEngine"=dword:00000000>>%systemroot%\ZZYTEMP\core.reg
echo "AVSignatureDue"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo "ASSignatureDue"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Threats]>>%systemroot%\ZZYTEMP\core.reg
echo "Threats_ThreatSeverityDefaultAction"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction]>>%systemroot%\ZZYTEMP\core.reg
echo "1"="2">>%systemroot%\ZZYTEMP\core.reg
echo "2"="2">>%systemroot%\ZZYTEMP\core.reg
echo "4"="2">>%systemroot%\ZZYTEMP\core.reg
echo "5"="2">>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{53f5630d-b6bf-11d0-94f2-00a0c91efb8b}]>>%systemroot%\ZZYTEMP\core.reg
echo "Deny_Execute"=dword:00000001>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation]>>%systemroot%\ZZYTEMP\core.reg
echo "Model"="这是一台经过 Tom Zhu 优化的电脑。">>%systemroot%\ZZYTEMP\core.reg
echo "SupportHours"="这是一台经过 Tom Zhu 优化的电脑。">>%systemroot%\ZZYTEMP\core.reg
echo "SupportURL"="support.microsoft.com/windows">>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
echo.>>%systemroot%\ZZYTEMP\core.reg
reg import %systemroot%\ZZYTEMP\core.reg 1>nul 2>nul
reg import %systemroot%\ZZYTEMP\core.reg 1>nul 2>nul
del %systemroot%\ZZYTEMP\core.reg 1>nul 2>nul



:clearstartupfolders
title  
mode con cols=30 lines=3
color fc
echo.
echo 正在清理启动项。
rd /s /q "%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul
rd /s /q "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul
rd /s /q "%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul
rd /s /q "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup" 1>nul 2>nul



:devicedisablewake
powercfg /devicequery wake_armed >%systemroot%\ZZYTEMP\powercfg.txt
for /f "tokens=* delims= " %%i in (%systemroot%\ZZYTEMP\powercfg.txt) do powercfg /devicedisablewake "%%i" 1>nul 2>nul
powercfg /devicequery wake_armed >%systemroot%\ZZYTEMP\powercfg.txt
for /f "tokens=* delims= " %%i in (%systemroot%\ZZYTEMP\powercfg.txt) do powercfg /devicedisablewake "%%i" 1>nul 2>nul



:reversemouse
echo Windows Registry Editor Version 5.00>%systemroot%\ZZYTEMP\Reverse.reg
echo. >>%systemroot%\ZZYTEMP\Reverse.reg
reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\HID /s >%systemroot%\ZZYTEMP\Reverse.txt
findstr Parameter %systemroot%\ZZYTEMP\Reverse.txt > %systemroot%\ZZYTEMP\find.txt

for /f "tokens=* delims= " %%i in (%systemroot%\ZZYTEMP\find.txt) do (
echo [%%i] >>%systemroot%\ZZYTEMP\Reverse.reg
echo "FlipFlopWheel"=dword:00000001 >>%systemroot%\ZZYTEMP\Reverse.reg
echo. >>%systemroot%\ZZYTEMP\Reverse.reg
)

reg import %systemroot%\ZZYTEMP\Reverse.reg 1>nul 2>nul
reg import %systemroot%\ZZYTEMP\Reverse.reg 1>nul 2>nul
del %systemroot%\ZZYTEMP\find.txt
del %systemroot%\ZZYTEMP\Reverse.txt
del %systemroot%\ZZYTEMP\Reverse.reg
del %systemroot%\ZZYTEMP\powercfg.txt



:disableschtasks
title  
mode con cols=30 lines=3
color fc
echo.
echo 正在优化计划任务。
schtasks /query /fo csv /nh >%systemroot%\ZZYTEMP\detailedschtasks.txt
echo. >%systemroot%\ZZYTEMP\disabledschtasks.txt
for /f "tokens=1 delims=," %%i in (%systemroot%\ZZYTEMP\detailedschtasks.txt) do (
echo %%i>>%systemroot%\ZZYTEMP\disabledschtasks.txt
schtasks /end /tn %%i 1>nul 2>nul
schtasks /change /tn %%i /disable 1>nul 2>nul
)

schtasks /change /tn "\Microsoft\Windows\TextServicesFramework\MsCtfMonitor" /enable 1>nul 2>nul
schtasks /run /tn "\Microsoft\Windows\TextServicesFramework\MsCtfMonitor" 1>nul 2>nul
schtasks /change /tn "\Microsoft\Windows\TextServicesFramework\MsCtfMonitor" /enable 1>nul 2>nul
schtasks /run /tn "\Microsoft\Windows\TextServicesFramework\MsCtfMonitor" 1>nul 2>nul

del %systemroot%\ZZYTEMP\detailedschtasks.txt 1>nul 2>nul



:power
title  
mode con cols=30 lines=3
color fc
echo.
echo 正在优化电源选项。
powercfg -restoredefaultschemes 1>nul 2>nul
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
rd /s /q %systemroot%\ZZYTEMP 1>nul 2>nul
shutdown /r /t 1
