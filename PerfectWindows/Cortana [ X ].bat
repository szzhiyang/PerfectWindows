Windows Registry Editor Version 5.00

set name=Cortana

@echo off
pushd "%~dp0"

ren "[ Perfect ]" "[ Logoff to be perfect ].bat"
if /i %0 == "%~dp0%name% [ O ].bat" goto disable
ren %0 "%name% [ O ].bat"
:disable
ren %0 "%name% [ X ].bat"
