@echo off
net session>nul&&(goto main)
start "" mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0","","runas",1)(window.close)&&exit

:main

notepad %systemroot%\system32\drivers\etc\hosts
ipconfig /flushdns
exit
