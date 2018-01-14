Windows Registry Editor Version 5.00

set name=Cortana

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
echo.>>%A%
(echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search] &echo "AllowCortana"=- &echo "AllowCortanaAboveLock"=- )>>%A%


regedit /s %A% 1>nul 2>nul
rd /s /q "Temp"
ren %0 "%name% [ O ].bat"
:disable
md Temp
copy %0 %A%


regedit /s %A% 1>nul 2>nul
rd /s /q "Temp"
ren %0 "%name% [ X ].bat"

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search]
"AllowCortana"=dword:00000000
"AllowCortanaAboveLock"=dword:00000000

