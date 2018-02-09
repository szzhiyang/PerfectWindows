Windows Registry Editor Version 5.00

@echo off
net session 1>nul 2>nul
if errorlevel 1 (
  exit
)


rd /s /q "%programfiles%\Tom Zhu\Windows Photo Viewer\Temp" 1>nul 2>nul
md "%programfiles%\Tom Zhu\Windows Photo Viewer\Temp" 1>nul 2>nul
pushd "%programfiles%\Tom Zhu\Windows Photo Viewer" 1>nul 2>nul
set A=Temp\main.reg 


:uninstall
copy %0 %A% /Y 1>nul 2>nul
regedit /s %A% 1>nul 2>nul
if "%1" equ "uninstall" (





  reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Windows Photo Viewer by Tom Zhu" /f 1>nul 2>nul
  rd /s /q "%programfiles%\Tom Zhu\Windows Photo Viewer" 1>nul 2>nul
  exit
)


:install
copy %0 %A% /Y 1>nul 2>nul
regedit /s %A% 1>nul 2>nul

rd /s /q Temp 1>nul 2>nul
copy %0 main.bat /Y 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Windows Photo Viewer by Tom Zhu" /v DisplayIcon /d "%systemroot%\system32\imageres.dll,-72" /f 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Windows Photo Viewer by Tom Zhu" /v UninstallString /d "\"%programfiles%\Tom Zhu\Windows Photo Viewer\main.bat\" uninstall" /f 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Windows Photo Viewer by Tom Zhu" /v ModifyPath /d "\"%programfiles%\Tom Zhu\Windows Photo Viewer\main.bat\"" /f 1>nul 2>nul
exit

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Windows Photo Viewer by Tom Zhu]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Windows Photo Viewer by Tom Zhu]
"NoModify"=dword:00000000
"DisplayName"=" Windows Photo Viewer"
"DisplayVersion"="1.0.0"
"Publisher"=" Tom Zhu"
"URLInfoAbout"="https://www.github.com/szzhiyang/PerfectWindows"
"HelpLink"="https://www.github.com/szzhiyang/PerfectWindows"
"URLUpdateInfo"="https://www.github.com/szzhiyang/PerfectWindows"
"Contact"="https://www.github.com/szzhiyang/PerfectWindows"
"EstimatedSize"=dword:00000003
"NoRemove"=dword:00000000
"NoRepair"=dword:00000000

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




