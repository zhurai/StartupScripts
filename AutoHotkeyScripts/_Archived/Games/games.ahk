;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#NoEnv
#SingleInstance
SendMode Input
SetWorkingDir %A_ScriptDir%
SetTimer, TimerCleanup, 500

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Menu Settings
Menu, Tray, NoStandard
Menu, Tray, Add, [Vysor] Dragalia Lost, DLMenuVysor
Menu, Tray, Add, [Vysor] Another Eden, AEMenuVysor
; Menu, Tray, Add, [Scrcpy] Dragalia Lost, DLMenuScrcpy
;Menu, Tray, Add, [Flow] Dragalia Lost, DLMenuFlow
Menu, Tray, Add, , , +Break
Menu, Tray, Add, [Standard] Reload, ReloadMenu
Menu, Tray, Add, [Standard] Edit, EditMenu
Menu, Tray, Add, [Standard] Suspend, SuspendMenu
Menu, Tray, Add, [Standard] Exit, ExitMenu
return

ReloadMenu:
Reload
return

EditMenu:
Edit
return

SuspendMenu:
Menu, Tray, ToggleCheck, Suspend
Suspend, Toggle
return

ExitMenu:
CLEANUP()
ExitApp
return

CLEANUP()
{
; Uncheck
Menu, Tray, UnCheck, [Vysor] Dragalia Lost
Menu, Tray, UnCheck, [Vysor] Another Eden
	;Menu, Tray, UnCheck, [Scrcpy] Dragalia Lost
	;Menu, Tray, UnCheck, [Flow] Dragalia Lost
; Set Title
WinSetTitle, mobile - dragalia,  , mobile
WinSetTitle, mobile - anothereden,  , mobile
; Close Old Processes
Process, close, %PIDVysorDL%
Process, close, %PIDVysorAE%
}

DLMenuVysor:
CLEANUP()
Menu, Tray, Check, [Vysor] Dragalia Lost
WinMove, mobile, , 583, 0, 478, 1026
WinSetTitle, mobile,  , mobile - dragalia
Run, "games-vysor-DL.ahk", , , PIDVysorDL
return

AEMenuVysor:
CLEANUP()
Menu, Tray, Check, [Vysor] Another Eden
WinMove, mobile, , 582, 351, 975, 495
WinSetTitle, mobile,  , mobile - anothereden
Run, "games-vysor-AE.ahk", , , PIDVysorAE
return

DLMenuFlow:
CLEANUP()
Menu, Tray, Check, [Vysor] Another Eden
WinMove, mobile, , 583, 0, 478, 1026
WinSetTitle, mobile,  , flow - dragalia
Run, "games-flow-DL.ahk", , , PIDFlowDL
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

TimerCleanup:

Process,Exist,%PIDVysorDL%
If (ErrorLevel = 0)
{
	Menu, Tray, UnCheck, [Vysor] Dragalia Lost

}
Process,Exist,%PIDVysorAE%
If (ErrorLevel = 0)
{
	Menu, Tray, UnCheck, [Vysor] Another Eden
}
Process,Exist,%PIDFlowDL%
If (ErrorLevel = 0)
{
	Menu, Tray, UnCheck, [Flow] Dragalia Lost
}

return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Enable Script / Disable Script (Global)
#F2::
Pause
Suspend
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
