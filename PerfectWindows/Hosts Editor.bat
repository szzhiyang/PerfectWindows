@echo off

md "%systemroot%\checkadmin"
if exist "%systemroot%\checkadmin" (
rd /s /q "%systemroot%\checkadmin"
goto main) else (
exit
)

:main
notepad %systemroot%\system32\drivers\etc\hosts
ipconfig /flushdns
exit
