Windows Registry Editor Version 5.00

set name=Windows Defender
@echo off
pushd "%~dp0"

ren "[*]*" "[ Restart to be perfect ].bat" 1>nul 2>nul
if /i %0 == "%~dp0%name% [ O ].bat" goto disable
ren %0 "%name% [ O ].bat" 1>nul 2>nul
:disable
ren %0 "%name% [ X ].bat" 1>nul 2>nul
