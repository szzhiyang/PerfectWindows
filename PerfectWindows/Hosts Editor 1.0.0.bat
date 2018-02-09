@echo off
net session 1>nul 2>nul
if errorlevel 1 (
  exit
)

notepad %systemroot%\system32\drivers\etc\hosts
ipconfig /flushdns
exit
