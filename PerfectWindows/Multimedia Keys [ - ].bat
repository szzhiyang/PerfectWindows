Windows Registry Editor Version 5.00

set name=Multimedia Keys

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

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]
"Scancode Map"=hex:00,00,00,00,00,00,00,00,05,00,00,00,2E,E0,51,E0,30,E0,49,E0,22,E0,47,E0,19,E0,4F,E0,00,00,00,00


regedit /s %A%  1>nul 2>nul
rd /s /q "Temp"
ren %0 "%name% [ O ].bat"
:disable
md Temp
copy %0 %A%
echo.>>%A%
(echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout] &echo "Scancode Map"=- )>>%A%


regedit /s %A%  1>nul 2>nul
rd /s /q "Temp"
ren %0 "%name% [ X ].bat"