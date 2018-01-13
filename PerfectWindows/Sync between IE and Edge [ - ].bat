Windows Registry Editor Version 5.00

set name=Sync between IE and Edge


@echo off
pushd "%~dp0"
set A=Temp\Temp.reg
md "%systemroot%\checkadmin"
if exist "%systemroot%\checkadmin" (
rd /s /q "%systemroot%\checkadmin"
goto main) else (
exit
)

:main
if /i %0 == "%~dp0%name% [ O ].bat" goto disable
md Temp
copy %0 %A%

[HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\MicrosoftEdge\Main]
"SyncFavoritesBetweenIEAndMicrosoftEdge"=dword:00000001

[HKEY_CURRENT_USER\Software\Policies\Microsoft\MicrosoftEdge\Main]
"SyncFavoritesBetweenIEAndMicrosoftEdge"=dword:00000001

regedit /s %A%  1>nul 2>nul
rd /s /q "Temp"
ren %0 "%name% [ O ].bat"
:disable
md Temp
copy %0 %A%

echo.>>%A%
(echo [HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\MicrosoftEdge\Main] &echo "SyncFavoritesBetweenIEAndMicrosoftEdge"=-)>>%A%
(echo [HKEY_CURRENT_USER\Software\Policies\Microsoft\MicrosoftEdge\Main] &echo "SyncFavoritesBetweenIEAndMicrosoftEdge"=-)>>%A%



regedit /s %A%  1>nul 2>nul
rd /s /q "Temp"
ren %0 "%name% [ X ].bat"