Windows Registry Editor Version 5.00

set name=# Reset All


@echo off

pushd "%~dp0"
set A=Temp\Temp.reg
set T=Temp
md "%systemroot%\checkadmin"
if exist "%systemroot%\checkadmin" (
rd /s /q "%systemroot%\checkadmin"
goto main) else (
exit
)

:main
md Temp
copy %0 %A% 1>nul 2>nul
echo.>>%A%
regedit /s %A%  1>nul 2>nul

icacls "%WINDIR%\System32\UserAccountControlSettings.exe" /reset 1>nul 2>nul

rd /s /q "Temp"
ren %0 "%name%.bat"
ren "*[*].bat" "*[ - ].bat"
EXIT

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]
"Scancode Map"=-

[-HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies]

[-HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services]
@="DO NOT DELETE THIS KEY !"

[-HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft]

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run]
"ctfmon"=hex(2):25,00,73,00,79,00,73,00,74,00,65,00,6d,00,72,00,6f,00,6f,00,74,\
  00,25,00,5c,00,73,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,63,00,\
  74,00,66,00,6d,00,6f,00,6e,00,2e,00,65,00,78,00,65,00,00,00


[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run]
"ctfmon"=hex(2):25,00,73,00,79,00,73,00,74,00,65,00,6d,00,72,00,6f,00,6f,00,74,\
  00,25,00,5c,00,73,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,63,00,\
  74,00,66,00,6d,00,6f,00,6e,00,2e,00,65,00,78,00,65,00,00,00

