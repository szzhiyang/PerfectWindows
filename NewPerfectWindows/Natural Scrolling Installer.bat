Windows Registry Editor Version 5.00

@echo off
set A=%systemroot%\PerfectWindows\NaturalScrolling.bat
net session 1>nul 2>nul
if errorlevel 1 (
  exit
) else (
  goto main 
)

:main
if %0 equ "%systemroot%\PerfectWindows\NaturalScrollingUninstall.bat" (
  set Reverse=0
) else (
  set Reverse=1
)

md "%systemroot%\PerfectWindows\Temp" 1>nul 2>nul
pushd "%systemroot%\PerfectWindows"
echo Windows Registry Editor Version 5.00>Temp\Reverse.reg
echo. >>Temp\Reverse.reg
reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\HID /s >Temp\Reverse.txt
findstr Parameter Temp\Reverse.txt > Temp\find.txt

for /f "tokens=* delims= " %%i in (Temp\find.txt) do (
echo [%%i] >>Temp\Reverse.reg
echo "FlipFlopWheel"=dword:0000000%Reverse%>>Temp\Reverse.reg
echo. >>Temp\Reverse.reg
)

regedit /s Temp\Reverse.reg 1>nul 2>nul
rd /s /q Temp 1>nul 2>nul

exit