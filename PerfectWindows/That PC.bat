Windows Registry Editor Version 5.00

@echo off
net session 1>nul 2>nul
if errorlevel 1 (
  exit
)


rd /s /q "%programfiles%\Tom Zhu\That PC\Temp" 1>nul 2>nul
md "%programfiles%\Tom Zhu\That PC\Temp" 1>nul 2>nul
pushd "%programfiles%\Tom Zhu\That PC" 1>nul 2>nul
set A=Temp\main.reg 


:uninstall
copy %0 %A% /Y 1>nul 2>nul


echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{21EC2020-3AEA-1069-A2DD-08002B30309D}]>>%A%

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{645FF040-5081-101B-9F08-00AA002F954E}]>>%A%

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{59031a47-3f72-44a7-89c5-5595fe6b30ee}]>>%A%

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{031E4825-7B94-4dc3-B131-E946B44C8DD5}]>>%A%

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{7b81be6a-ce2b-4676-a29e-eb907a5126c5}]>>%A%

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{BB06C0E4-D293-4f75-8A90-CB05B6477EEE}]>>%A%

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{7007ACC7-3202-11D1-AAD2-00805FC1270E}]>>%A%

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{D20EA4E1-3957-11d2-A40B-0C5020524153}]>>%A%

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{ED834ED6-4B5A-4bfe-8F11-A626DCB6A921}]>>%A%


echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{17cd9488-1228-4b2f-88ce-4298e93e0966}]>>%A%

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8A91A66-3A7D-4424-8D24-04E180695C7A}]>>%A%

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{6C8EEC18-8D75-41B2-A177-8831D59D2D50}]>>%A%

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}]>>%A%

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{025A5937-A6BE-4686-A844-36FE4BEC8B6D}]>>%A%

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{BB64F8A7-BEE7-4E1A-AB8D-7D8273F7FDB6}]>>%A%

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{74246bfc-4c96-11d0-abef-0020af6b0b7a}]>>%A%

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{D555645E-D4F8-4c29-A827-D93C859C4F2A}]>>%A%

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{BF782CC9-5A52-4A17-806C-2A894FFEEAC5}]>>%A%

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{BF782CC9-5A52-4A17-806C-2A894FFEEAC5}]>>%A%

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{5ea4f148-308c-46d7-98a9-49041b1dd468}]>>%A%

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{E2E7934B-DCE5-43C4-9576-7FE4F75E7480}]>>%A%

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{87D66A43-7B11-4A28-9811-C86EE395ACF7}]>>%A%

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A3DD4F92-658A-410F-84FD-6FBBBEF2FFFE}]>>%A%

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{8E908FC9-BECC-40f6-915B-F4CA0E70D03D}]>>%A%

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{4026492F-2F69-46B8-B9BF-5654FC07E423}]>>%A%

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{60632754-c523-4b62-b45c-4172da012619}]>>%A%



regedit /s %A% 1>nul 2>nul
if "%1" equ "uninstall" (





  reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\That PC by Tom Zhu" /f 1>nul 2>nul
  rd /s /q "%programfiles%\Tom Zhu\That PC" 1>nul 2>nul
  exit
)


:install
copy %0 %A% /Y 1>nul 2>nul







regedit /s %A% 1>nul 2>nul
rd /s /q Temp 1>nul 2>nul
copy %0 main.bat /Y 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\That PC by Tom Zhu" /v DisplayIcon /d "%systemroot%\system32\imageres.dll,-197" /f 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\That PC by Tom Zhu" /v UninstallString /d "\"%programfiles%\Tom Zhu\That PC\main.bat\" uninstall" /f 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\That PC by Tom Zhu" /v ModifyPath /d "\"%programfiles%\Tom Zhu\That PC\main.bat\"" /f 1>nul 2>nul
exit

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\That PC by Tom Zhu]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\That PC by Tom Zhu]
"NoModify"=dword:00000000
"DisplayName"=" That PC"
"DisplayVersion"=-
"Publisher"=" Tom Zhu"
"URLInfoAbout"="https://www.github.com/szzhiyang"
"HelpLink"="https://www.github.com/szzhiyang"
"URLUpdateInfo"="https://www.github.com/szzhiyang"
"Contact"="https://www.github.com/szzhiyang"
"EstimatedSize"=dword:00000000
"NoRemove"=dword:00000000
"NoRepair"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{21EC2020-3AEA-1069-A2DD-08002B30309D}]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{645FF040-5081-101B-9F08-00AA002F954E}]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{59031a47-3f72-44a7-89c5-5595fe6b30ee}]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{031E4825-7B94-4dc3-B131-E946B44C8DD5}]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{7b81be6a-ce2b-4676-a29e-eb907a5126c5}]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{BB06C0E4-D293-4f75-8A90-CB05B6477EEE}]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{7007ACC7-3202-11D1-AAD2-00805FC1270E}]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{D20EA4E1-3957-11d2-A40B-0C5020524153}]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{ED834ED6-4B5A-4bfe-8F11-A626DCB6A921}]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{17cd9488-1228-4b2f-88ce-4298e93e0966}]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8A91A66-3A7D-4424-8D24-04E180695C7A}]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{6C8EEC18-8D75-41B2-A177-8831D59D2D50}]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{025A5937-A6BE-4686-A844-36FE4BEC8B6D}]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{BB64F8A7-BEE7-4E1A-AB8D-7D8273F7FDB6}]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{74246bfc-4c96-11d0-abef-0020af6b0b7a}]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{D555645E-D4F8-4c29-A827-D93C859C4F2A}]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{BF782CC9-5A52-4A17-806C-2A894FFEEAC5}]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{BF782CC9-5A52-4A17-806C-2A894FFEEAC5}]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{5ea4f148-308c-46d7-98a9-49041b1dd468}]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{E2E7934B-DCE5-43C4-9576-7FE4F75E7480}]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{87D66A43-7B11-4A28-9811-C86EE395ACF7}]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A3DD4F92-658A-410F-84FD-6FBBBEF2FFFE}]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{8E908FC9-BECC-40f6-915B-F4CA0E70D03D}]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{4026492F-2F69-46B8-B9BF-5654FC07E423}]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{60632754-c523-4b62-b45c-4172da012619}]




