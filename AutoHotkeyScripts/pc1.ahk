#SingleInstance Force
#NoEnv
#EscapeChar \
SetTitleMatchMode RegEx
SendMode Input 
SetWorkingDir %A_ScriptDir%

; If the script is not elevated, relaunch as administrator and kill current instance:
full_command_line := DllCall("GetCommandLine", "str")
if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try ; leads to having the script re-launching itself as administrator
    {
        if A_IsCompiled
            Run *RunAs "%A_ScriptFullPath%" /restart
        else
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
    }
    ExitApp
}

; Global
LWin & F12::Send {PrintScreen}
; [Screenshot]

; Launchy
LWin::
Send, ^+{F15}
return
; [Activate Launchy]

; Counter Side
#IfWinActive ahk_exe CounterSide.exe
f1:: 
Send, m
return
; [toggle mute]

; MuMu
#IfWinActive ahk_exe NemuPlayer.exe
f1::
Send, ^m
Return
; [toggle mute]
f2::
Send, !q
Return
; [Screenshot]

; MuMu Nebula
#IfWinActive ahk_exe NebulaPlayer.exe
f1::
Send, ^m
Return
; [toggle mute]
f2::
Send, !q
Return
; [Screenshot]

; Firefox
#IfWinActive ahk_exe firefox.exe
^+x::
Return
; [QOL] disable "BIDI text direction" while attempting to cut and paste
