Windows Registry Editor Version 5.00

set name=Lock Screen

set admin=1



@echo off
pushd "%~dp0"
if %admin% equ 0 goto main
md "%systemroot%\checkadmin"
if exist "%systemroot%\checkadmin" (
rd /s /q "%systemroot%\checkadmin"
goto main) else (
exit
)

:main
if /i %0 == "%~dp0%name% [ON].bat" goto disable
md Temp
copy %0 Temp\temp.reg

echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization]>>Temp\temp.reg
echo "NoLockScreen"=dword:00000000>>Temp\temp.reg


reg import Temp\temp.reg /reg:32
rd /s /q "Temp"
ren %0 "%name% [ON].bat"
:disable
md Temp
copy %0 Temp\temp.reg

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization]
"NoLockScreen"=dword:00000001


reg import Temp\temp.reg /reg:32
rd /s /q "Temp"
ren %0 "%name% [OFF].bat"