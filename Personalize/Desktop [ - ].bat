Windows Registry Editor Version 5.00

set name=Desktop

set admin=0



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
if /i %0 == "%~dp0%name% [ON].bat" goto disable
md Temp
copy %0 %A%

(echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer] &echo "NoDesktop"=-)>>%A%


reg import %A% /reg:32
rd /s /q "Temp"
ren %0 "%name% [ON].bat"
:disable
md Temp
copy %0 %A%

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"NoDesktop"=dword:00000001


reg import %A% /reg:32
rd /s /q "Temp"
ren %0 "%name% [OFF].bat"