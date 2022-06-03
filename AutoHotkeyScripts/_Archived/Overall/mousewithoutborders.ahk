#NoTrayIcon
#SingleInstance force
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

^+!A::
    Run *RunAs C:\Windows\System32\schtasks.exe /run /TN "Open MouseWithoutBorders",,,MOUSEWITHOUTBORDERS
^+!S::
    Process, close, %MOUSEWITHOUTBORDERS%
	
Return 