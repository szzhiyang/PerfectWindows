Windows Registry Editor Version 5.00

set name=Cortana

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
if /i %0 == "%~dp0%name% [ON].bat" goto disable
md Temp
copy %0 %A%

(echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search] &echo "AllowCortana"=- &echo "AllowCortanaAboveLock"=- )>>%A%


reg import %A% /reg:32
rd /s /q "Temp"
ren %0 "%name% [ON].bat"
:disable
md Temp
copy %0 %A%

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search]
"AllowCortana"=dword:00000000
"AllowCortanaAboveLock"=dword:00000000


reg import %A% /reg:32
rd /s /q "Temp"
ren %0 "%name% [OFF].bat"