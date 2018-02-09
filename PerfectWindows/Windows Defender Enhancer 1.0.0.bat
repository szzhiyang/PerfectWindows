Windows Registry Editor Version 5.00

@echo off
net session 1>nul 2>nul
if errorlevel 1 (
  exit
)


rd /s /q "%programfiles%\Tom Zhu\Windows Defender Enhancer\Temp" 1>nul 2>nul
md "%programfiles%\Tom Zhu\Windows Defender Enhancer\Temp" 1>nul 2>nul
pushd "%programfiles%\Tom Zhu\Windows Defender Enhancer" 1>nul 2>nul
set A=Temp\main.reg 


:uninstall
copy %0 %A% /Y 1>nul 2>nul

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender]>>%A%
SCHTASKS /DELETE /TN "\Microsoft\Windows\Windows Defender\Windows Defender Signature Update" /F 1>nul 2>nul

regedit /s %A% 1>nul 2>nul
if "%1" equ "uninstall" (





  reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Windows Defender Enhancer by Tom Zhu" /f 1>nul 2>nul
  rd /s /q "%programfiles%\Tom Zhu\Windows Defender Enhancer" 1>nul 2>nul
  exit
)


:install
copy %0 %A% /Y 1>nul 2>nul

echo ^<?xml version="1.0" encoding="UTF-16"?^>>Temp\1.xml
echo ^<Task version="1.2" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task"^>>>Temp\1.xml
echo   ^<RegistrationInfo^>>>Temp\1.xml
echo     ^<URI^>\Microsoft\Windows\Windows Defender\Windows Defender Signature Update^</URI^>>>Temp\1.xml
echo   ^</RegistrationInfo^>>>Temp\1.xml
echo   ^<Triggers^>>>Temp\1.xml
echo     ^<TimeTrigger^>>>Temp\1.xml
echo       ^<Repetition^>>>Temp\1.xml
echo         ^<Interval^>PT5M^</Interval^>>>Temp\1.xml
echo         ^<StopAtDurationEnd^>false^</StopAtDurationEnd^>>>Temp\1.xml
echo       ^</Repetition^>>>Temp\1.xml
echo       ^<StartBoundary^>1999-11-30T00:00:00^</StartBoundary^>>>Temp\1.xml
echo       ^<Enabled^>true^</Enabled^>>>Temp\1.xml
echo     ^</TimeTrigger^>>>Temp\1.xml
echo   ^</Triggers^>>>Temp\1.xml
echo   ^<Principals^>>>Temp\1.xml
echo     ^<Principal id="Author"^>>>Temp\1.xml
echo       ^<RunLevel^>HighestAvailable^</RunLevel^>>>Temp\1.xml
echo     ^</Principal^>>>Temp\1.xml
echo   ^</Principals^>>>Temp\1.xml
echo   ^<Settings^>>>Temp\1.xml
echo     ^<MultipleInstancesPolicy^>IgnoreNew^</MultipleInstancesPolicy^>>>Temp\1.xml
echo     ^<DisallowStartIfOnBatteries^>false^</DisallowStartIfOnBatteries^>>>Temp\1.xml
echo     ^<StopIfGoingOnBatteries^>false^</StopIfGoingOnBatteries^>>>Temp\1.xml
echo     ^<AllowHardTerminate^>true^</AllowHardTerminate^>>>Temp\1.xml
echo     ^<StartWhenAvailable^>true^</StartWhenAvailable^>>>Temp\1.xml
echo     ^<RunOnlyIfNetworkAvailable^>false^</RunOnlyIfNetworkAvailable^>>>Temp\1.xml
echo     ^<IdleSettings^>>>Temp\1.xml
echo       ^<StopOnIdleEnd^>false^</StopOnIdleEnd^>>>Temp\1.xml
echo       ^<RestartOnIdle^>true^</RestartOnIdle^>>>Temp\1.xml
echo     ^</IdleSettings^>>>Temp\1.xml
echo     ^<AllowStartOnDemand^>true^</AllowStartOnDemand^>>>Temp\1.xml
echo     ^<Enabled^>true^</Enabled^>>>Temp\1.xml
echo     ^<Hidden^>true^</Hidden^>>>Temp\1.xml
echo     ^<RunOnlyIfIdle^>false^</RunOnlyIfIdle^>>>Temp\1.xml
echo     ^<WakeToRun^>false^</WakeToRun^>>>Temp\1.xml
echo     ^<ExecutionTimeLimit^>PT72H^</ExecutionTimeLimit^>>>Temp\1.xml
echo     ^<Priority^>7^</Priority^>>>Temp\1.xml
echo   ^</Settings^>>>Temp\1.xml
echo   ^<Actions Context="Author"^>>>Temp\1.xml
echo     ^<Exec^>>>Temp\1.xml
echo       ^<Command^>"%programfiles%\Windows Defender\MpCmdRun.exe"^</Command^>>>Temp\1.xml
echo       ^<Arguments^>-SignatureUpdate -MMPC^</Arguments^>>>Temp\1.xml
echo     ^</Exec^>>>Temp\1.xml
echo   ^</Actions^>>>Temp\1.xml
echo ^</Task^>>>Temp\1.xml


SCHTASKS /CREATE /RU SYSTEM /TN "\Microsoft\Windows\Windows Defender\Windows Defender Signature Update" /XML "%programfiles%\Tom Zhu\Windows Defender Enhancer\Temp\1.xml" /F 1>nul 2>nul
SCHTASKS /RUN /TN "\Microsoft\Windows\Windows Defender\Windows Defender Signature Update" 1>nul 2>nul


regedit /s %A% 1>nul 2>nul
rd /s /q Temp 1>nul 2>nul
copy %0 main.bat /Y 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Windows Defender Enhancer by Tom Zhu" /v DisplayIcon /d "%systemroot%\system32\imageres.dll,-106" /f 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Windows Defender Enhancer by Tom Zhu" /v UninstallString /d "\"%programfiles%\Tom Zhu\Windows Defender Enhancer\main.bat\" uninstall" /f 1>nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Windows Defender Enhancer by Tom Zhu" /v ModifyPath /d "\"%programfiles%\Tom Zhu\Windows Defender Enhancer\main.bat\"" /f 1>nul 2>nul
exit

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Windows Defender Enhancer by Tom Zhu]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Windows Defender Enhancer by Tom Zhu]
"NoModify"=dword:00000000
"DisplayName"=" Windows Defender Enhancer"
"DisplayVersion"="1.0.0"
"Publisher"=" Tom Zhu"
"URLInfoAbout"="https://www.github.com/szzhiyang/PerfectWindows"
"HelpLink"="https://www.github.com/szzhiyang/PerfectWindows"
"URLUpdateInfo"="https://www.github.com/szzhiyang/PerfectWindows"
"Contact"="https://www.github.com/szzhiyang/PerfectWindows"
"EstimatedSize"=dword:0000000a
"NoRemove"=dword:00000000
"NoRepair"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MRT]
"DontOfferThroughWUAU"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU]
"NoAutoUpdate"=-
"AUOptions"=dword:00000002

[-HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender]
"DisableRoutinelyTakingAction"=dword:00000000
"AllowFastServiceStartup"=dword:00000001
"ServiceKeepAlive"=dword:00000000
"DisableAntispyware"=-

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Quarantine]
"PurgeItemsAfterDelay"=dword:00000001
"LocalSettingOverridePurgeItemsAfterDelay"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine]
"MpEnablePus"=dword:00000001
"MpCloudBlockLevel"=dword:00000002
"MpBafsExtendedTimeout"=dword:00000032

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection]
"DisableIOAVProtection"=dword:00000000
"DisableRealtimeMonitoring"=dword:00000000
"DisableBehaviorMonitoring"=dword:00000000
"DisableOnAccessProtection"=dword:00000000
"DisableScanOnRealtimeEnable"=dword:00000000
"DisableRawWriteNotification"=dword:00000000
"IOAVMaxSize"=dword:0098967f
"RealtimeScanDirection"=dword:00000000
"LocalSettingOverrideDisableBehaviorMonitoring"=dword:00000000
"LocalSettingOverrideDisableOnAccessProtection"=dword:00000000
"LocalSettingOverrideDisableIOAVProtection"=dword:00000000
"LocalSettingOverrideDisableRealtimeMonitoring"=dword:00000000
"LocalSettingOverrideRealtimeScanDirection"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Remediation]
"LocalSettingOverrideScan_ScheduleTime"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet]
"SpynetReporting"=dword:00000002
"LocalSettingOverrideSpynetReporting"=dword:00000000
"SubmitSamplesConsent"=dword:00000003
"DisableBlockAtFirstSeen"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Scan]
"ArchieveMaxSize"=dword:00000000
"ArchieveMaxDepth"=dword:ffffffff
"AvgCPULoadFactor"=dword:00000032
"DisableEmailScanning"=dword:00000000
"DisableArchiveScanning"=dword:00000000
"DisableRemovableDriveScanning"=dword:00000000
"DisablePackedExeScanning"=dword:00000000
"DisableHeuristics"=dword:00000000
"DisableReparsePointScanning"=dword:00000001
"DisableRemovableDriveScanning"=dword:00000000
"DisableScanningNetworkFiles"=dword:00000000
"CheckForSignaturesBeforeRunningScan"=dword:00000001
"ScanOnlyIfIdle"=dword:00000001
"PurgeItemsAfterDelay"=dword:00000001
"LocalSettingOverrideScanParameters"=dword:00000000
"LocalSettingOverrideAvgCPULoadFactor"=dword:00000000
"LocalSettingOverrideScheduleDay"=dword:00000000
"LocalSettingOverrideScheduleQuickScanTime"=dword:00000000
"LocalSettingOverrideScheduleTime"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates]
"UpdateOnStartUp"=dword:00000001
"DisableUpdateOnStartupWithoutEngine"=dword:00000000
"AVSignatureDue"=dword:00000001
"ASSignatureDue"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Threats]
"Threats_ThreatSeverityDefaultAction"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction]
"1"="2"
"2"="2"
"4"="3"
"5"="3"

[HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR]
"ExploitGuard_ASR_Rules"=dword:00000001

[HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules]
"BE9BA2D9-53EA-4CDC-84E5-9B1EEEE46550"="1"
"D4F940AB-401B-4EFC-AADC-AD5F3C50688A"="1"
"3B576869-A4EC-4529-8536-B80A7769E899"="1"
"75668C1F-73B5-4CF0-BB93-3ECF5CB7CC84"="1"
"D3E037E1-3EB8-44C8-A917-57927947596D"="1"
"5BEB7EFE-FD9A-4556-801D-275E5FFC04CC"="1"
"92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B"="1"

[HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access]
"EnableControlledFolderAccess"=dword:00000000
"ExploitGuard_ControlledFolderAccess_ProtectedFolders"=dword:00000000

[HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access\ProtectedFolders]

[HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection]
"EnableNetworkProtection"=dword:00000001

[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"NoDriveTypeAutoRun"=dword:000000ff
"NoAutorun"=dword:00000001

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"NoDriveTypeAutoRun"=dword:000000ff
"NoAutorun"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]
"EnableLUA"=dword:00000001
"ValidateAdminCodeSignatures"=dword:00000000
"ConsentPromptBehaviorAdmin"=dword:0000005
"ConsentPromptBehaviorUser"=dword:00000003
"PromptOnSecureDesktop"=dword:00000001
"EnableUIADesktopToggle"=dword:00000000
"FilterAdministratorToken"=dword:00000001
"EnableSecureUIAPaths"=dword:00000001
"EnableInstallerDetection"=dword:00000001
"EnableVirtualization"=dword:00000001


