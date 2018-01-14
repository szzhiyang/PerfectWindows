Windows Registry Editor Version 5.00

set name=Natural Scroll

@echo off
pushd "%~dp0"
md "%systemroot%\checkadmin"
if exist "%systemroot%\checkadmin" (
rd /s /q "%systemroot%\checkadmin"
goto main) else (
exit
)

:main
if /i %0 == "%~dp0%name% [ O ].bat" goto disable

md Temp

echo Windows Registry Editor Version 5.00>Temp\Reverse.reg
echo. >>Temp\Reverse.reg
reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\HID /s >Temp\Reverse.txt
findstr Parameter Temp\Reverse.txt > Temp\find.txt

for /f "tokens=* delims= " %%i in (Temp\find.txt) do (
echo [%%i] >>Temp\Reverse.reg
echo "FlipFlopWheel"=dword:00000001>>Temp\Reverse.reg
echo. >>Temp\Reverse.reg
)

regedit /s Temp\Reverse.reg 
rd /s /q "Temp"

ren %0 "%name% [ O ].bat"



:disable




md Temp

echo Windows Registry Editor Version 5.00>Temp\Reverse.reg
echo. >>Temp\Reverse.reg
reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\HID /s >Temp\Reverse.txt
findstr Parameter Temp\Reverse.txt > Temp\find.txt

for /f "tokens=* delims= " %%i in (Temp\find.txt) do (
echo [%%i] >>Temp\Reverse.reg
echo "FlipFlopWheel"=dword:00000000>>Temp\Reverse.reg
echo. >>Temp\Reverse.reg
)

regedit /s Temp\Reverse.reg 
rd /s /q "Temp"

ren %0 "%name% [ X ].bat"