Windows Registry Editor Version 5.00

set name=Logon Background

set admin=1



@echo off
pushd "%~dp0"
set A=Temp\Temp.reg
if %admin% equ 0 goto main
md "%systemroot%\checkadmin"
if exist "%systemroot%\checkadmin" (
rd /s /q "%systemroot%\checkadmin"
goto main) else (
exit
)

:main
if /i %0 == "%~dp0Disable%name%.bat" goto disable
md Temp
copy %0 %A%

echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System]>>%A%
echo "DisableLogonBackgroundImage"=->>%A%


reg import %A% /reg:32
rd /s /q "Temp"
ren %0 "Disable %name%.bat"
:disable
md Temp
copy %0 %A%

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System]
"DisableLogonBackgroundImage"=dword:00000001


reg import %A% /reg:32
rd /s /q "Temp"
ren %0 "Enable %name%.bat"