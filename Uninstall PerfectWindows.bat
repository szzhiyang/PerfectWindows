Windows Registry Editor Version 5.00

@echo off

pushd "%~dp0"
setlocal enabledelayedexpansion
set A=Temp\Temp.reg
set T=Temp
set num=11
md "%systemroot%\checkadmin" 1>nul 2>nul
if exist "%systemroot%\checkadmin" (
rd /s /q "%systemroot%\checkadmin"
goto main) else (
exit
)

:main

title  
color fc
mode con cols=30 lines=3
echo.
echo PLESAE WAIT !

rd /s /q Temp 1>nul 2>nul
md Temp 1>nul 2>nul
bcdedit /set {default} bootmenupolicy legacy 1>nul 2>nul
sc config LanmanWorkstation depend= bowser/mrxsmb20/nsi 1>nul 2>nul

SCHTASKS /DELETE /TN "\Microsoft\Windows\Windows Defender\Windows Defender Signature Update" /F 1>nul 2>nul

rd /s /q %systemroot%\Prefetch 1>nul 2>nul


attrib -h -s "%systemroot%" 1>nul 2>nul
attrib -h -s "%ProgramFiles%" 1>nul 2>nul
attrib -h -s "%ProgramFiles(x86)%" 1>nul 2>nul
attrib +h -s "%ProgramData%" 1>nul 2>nul
attrib -h -s "%systemdrive%\Users" 1>nul 2>nul
attrib +h -s "%systemdrive%\PerfLogs" 1>nul 2>nul
attrib -h -s "%systemdrive%\Windows.old" 1>nul 2>nul
attrib +h +s "%userprofile%\ntuser.dat" 1>nul 2>nul
attrib +h +s "%userprofile%\ntuser.ini" 1>nul 2>nul
attrib +h -s "%userprofile%\AppData" 1>nul 2>nul
attrib -h -s "%LocalAppData%" 1>nul 2>nul
attrib -h -s "%LocalAppData%\Packages" 1>nul 2>nul
attrib -h -s "%AppData%" 1>nul 2>nul
attrib -h -s "%userprofile%\AppData\LocalLow" 1>nul 2>nul



copy %0 %A% 1>nul 2>nul
echo.>>%A%


icacls "%WINDIR%\System32\UsoClient.exe" /reset 1>nul 2>nul

echo Windows Registry Editor Version 5.00>Temp\Reverse.reg
echo. >>Temp\Reverse.reg
reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\HID /s >Temp\Reverse.txt
findstr Parameter Temp\Reverse.txt > Temp\find.txt

for /f "tokens=* delims= " %%i in (Temp\find.txt) do (
echo [%%i] >>Temp\Reverse.reg
echo "FlipFlopWheel"=dword:00000000>>Temp\Reverse.reg
echo. >>Temp\Reverse.reg
)

regedit /s Temp\Reverse.reg 1>nul 2>nul

:reg

[-HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{21EC2020-3AEA-1069-A2DD-08002B30309D}]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{645FF040-5081-101B-9F08-00AA002F954E}]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{59031a47-3f72-44a7-89c5-5595fe6b30ee}]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{031E4825-7B94-4dc3-B131-E946B44C8DD5}]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{7b81be6a-ce2b-4676-a29e-eb907a5126c5}]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{BB06C0E4-D293-4f75-8A90-CB05B6477EEE}]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{7007ACC7-3202-11D1-AAD2-00805FC1270E}]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{D20EA4E1-3957-11d2-A40B-0C5020524153}]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{ED834ED6-4B5A-4bfe-8F11-A626DCB6A921}]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft]

[-HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft]

[-HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations]
".tif"="PhotoViewer.FileAssoc.Tiff"
".tiff"="PhotoViewer.FileAssoc.Tiff"
".jpg"="PhotoViewer.FileAssoc.Tiff"
".jpeg"="PhotoViewer.FileAssoc.Tiff"
".jpe"="PhotoViewer.FileAssoc.Tiff"
".jfif"="PhotoViewer.FileAssoc.Tiff"
".bmp"="PhotoViewer.FileAssoc.Tiff"
".gif"="PhotoViewer.FileAssoc.Tiff"
".png"="PhotoViewer.FileAssoc.Tiff"
".ico"="PhotoViewer.FileAssoc.Tiff"
".dib"="PhotoViewer.FileAssoc.Tiff"
".wdp"="PhotoViewer.FileAssoc.Tiff"
".jxr"="PhotoViewer.FileAssoc.Tiff"

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services]
@="DO NOT DELETE THIS KEY !"


[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run]
"ctfmon"=hex(2):25,00,73,00,79,00,73,00,74,00,65,00,6d,00,72,00,6f,00,6f,00,74,\
  00,25,00,5c,00,73,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,63,00,\
  74,00,66,00,6d,00,6f,00,6e,00,2e,00,65,00,78,00,65,00,00,00


[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run]
"ctfmon"=hex(2):25,00,73,00,79,00,73,00,74,00,65,00,6d,00,72,00,6f,00,6f,00,74,\
  00,25,00,5c,00,73,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,63,00,\
  74,00,66,00,6d,00,6f,00,6e,00,2e,00,65,00,78,00,65,00,00,00



