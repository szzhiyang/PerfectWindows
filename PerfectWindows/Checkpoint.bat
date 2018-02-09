Windows Registry Editor Version 5.00

@echo off

net session 1>nul 2>nul
if errorlevel 1 (
  exit
)

setlocal enabledelayedexpansion
set num=11

rd /s /q "%programfiles%\Tom Zhu\Checkpoint\Temp" 1>nul 2>nul
md "%programfiles%\Tom Zhu\Checkpoint\Temp" 1>nul 2>nul
pushd "%programfiles%\Tom Zhu\Checkpoint" 1>nul 2>nul
set A=Temp\main.reg 


:uninstall
copy %0 %A% /Y 1>nul 2>nul


echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer]>>%A%



regedit /s %A% 1>nul 2>nul
if "%1" equ "uninstall" (





  reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Checkpoint by Tom Zhu" /f 1>nul 2>nul
  rd /s /q "%programfiles%\Tom Zhu\Checkpoint" 1>nul 2>nul
  exit
)


:install
copy %0 %A% /Y 1>nul 2>nul

md "%systemdrive%\Checkpoint" 1>nul 2>nul


echo.>>%A%


echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{91fc058a-3015-4608-b3a6-4a8ba079c000}]>>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"="%systemdrive%\\">>%A%
echo.>>%A%


echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{91fc058a-3015-4608-b3a6-4a8ba079c007}]>>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"="X:\\">>%A%
echo.>>%A%


echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{91fc058a-3015-4608-b3a6-4a8ba079c008}]>>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"="Y:\\">>%A%
echo.>>%A%


echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{91fc058a-3015-4608-b3a6-4a8ba079c009}]>>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"="Z:\\">>%A%
echo.>>%A%


echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{91fc058a-3015-4608-b3a6-4a8ba079c002}]>>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"="%systemdrive%\\Users\\*\\AppData\\Local\\Microsoft\\Windows\\I*\\*">>%A%
echo.>>%A%


echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{91fc058a-3015-4608-b3a6-4a8ba079c003}]>>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"="%systemdrive%\\Users\\*\\AppData\\Local\\Packages\\*">>%A%
echo.>>%A%


echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{91fc058a-3015-4608-b3a6-4a8ba079c201}]>>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"="%systemdrive%\\Users\\*\\AppData\\Local\\Temp\\7zO*">>%A%
echo.>>%A%


echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{91fc058a-3015-4608-b3a6-4a8ba079c202}]>>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"="%systemdrive%\\Users\\*\\AppData\\Local\\Temp\\7z*.tmp\\*">>%A%
echo.>>%A%


echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{91fc058a-3015-4608-b3a6-4a8ba079c203}]>>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"="%systemdrive%\\Users\\*\\AppData\\Local\\Temp\\Temp1*.zip\\*">>%A%
echo.>>%A%


wmic logicaldisk where "drivetype=3" get name>Temp\wmicdrive.txt
type Temp\wmicdrive.txt>Temp\drive.txt


for /f "skip=1 tokens=1 delims=:" %%i in (Temp\drive.txt) do (


echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\262144\Paths\{91fc058a-3015-4608-b3a6-4a8ba079c0!num!}]>>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"="%%i:\\">>%A%
echo.>>%A%


echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers\0\Paths\{91fc058a-3015-4608-b3a6-4a8ba079c1!num!}]>>%A%
echo "SaferFlags"=dword:00000000>>%A%
echo "ItemData"="%%i:\\Checkpoint">>%A%
echo.>>%A%


set /A num+=1


)

echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers]>>%A%
echo "DefaultLevel"=dword:00000000>>%A%
echo.>>%A%





regedit /s %A% 1>nul 2>nul
rd /s /q Temp 1>nul 2>nul
copy %0 main.bat /Y 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Checkpoint by Tom Zhu" /v DisplayIcon /d "%systemroot%\system32\imageres.dll,-78" /f 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Checkpoint by Tom Zhu" /v UninstallString /d "\"%programfiles%\Tom Zhu\Checkpoint\main.bat\" uninstall" /f 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Checkpoint by Tom Zhu" /v ModifyPath /d "\"%programfiles%\Tom Zhu\Checkpoint\main.bat\"" /f 1>nul 2>nul
exit

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Checkpoint by Tom Zhu]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Checkpoint by Tom Zhu]
"NoModify"=dword:00000000
"DisplayName"=" Checkpoint"
"DisplayVersion"=-
"Publisher"=" Tom Zhu"
"URLInfoAbout"="https://www.github.com/szzhiyang"
"HelpLink"="https://www.github.com/szzhiyang"
"URLUpdateInfo"="https://www.github.com/szzhiyang"
"Contact"="https://www.github.com/szzhiyang"
"EstimatedSize"=dword:00000000
"NoRemove"=dword:00000000
"NoRepair"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers]
"AuthenticodeEnabled"=dword:00000000
"DefaultLevel"=dword:00040000
"TransparentEnabled"=dword:00000001
"PolicyScope"=dword:00000000
"ExecutableTypes"=hex(7):57,00,53,00,43,00,00,00,56,00,42,00,00,00,55,00,52,00,\
  4c,00,00,00,53,00,48,00,53,00,00,00,53,00,43,00,52,00,00,00,52,00,45,00,47,\
  00,00,00,50,00,53,00,31,00,00,00,50,00,49,00,46,00,00,00,50,00,43,00,44,00,\
  00,00,4f,00,43,00,58,00,00,00,4d,00,53,00,54,00,00,00,4d,00,53,00,50,00,00,\
  00,4d,00,53,00,49,00,00,00,4d,00,53,00,43,00,00,00,4d,00,44,00,45,00,00,00,\
  4d,00,44,00,42,00,00,00,4c,00,4e,00,4b,00,00,00,49,00,53,00,50,00,00,00,49,\
  00,4e,00,53,00,00,00,49,00,4e,00,46,00,00,00,48,00,54,00,41,00,00,00,48,00,\
  4c,00,50,00,00,00,45,00,58,00,45,00,00,00,43,00,52,00,54,00,00,00,43,00,50,\
  00,4c,00,00,00,43,00,4f,00,4d,00,00,00,43,00,4d,00,44,00,00,00,43,00,48,00,\
  4d,00,00,00,42,00,41,00,54,00,00,00,42,00,41,00,53,00,00,00,41,00,44,00,50,\
  00,00,00,41,00,44,00,45,00,00,00


[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SystemCertificates\TrustedPublisher\Safer]
"AuthenticodeFlags"=dword:00000000

[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"NoDriveTypeAutoRun"=dword:000000ff
"NoAutorun"=dword:00000001

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"NoDriveTypeAutoRun"=dword:000000ff
"NoAutorun"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]
"EnableLUA"=dword:00000001
"ValidateAdminCodeSignatures"=dword:00000000
"ConsentPromptBehaviorAdmin"=dword:0000005
"ConsentPromptBehaviorUser"=dword:00000003
"PromptOnSecureDesktop"=dword:00000001
"EnableUIADesktopToggle"=dword:00000000
"FilterAdministratorToken"=dword:00000001
"EnableSecureUIAPaths"=dword:00000001
"EnableInstallerDetection"=dword:00000001
"EnableVirtualization"=dword:00000001




