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

LWin::
Send, ^+{F15}
return
; [Launchy]

; Counter Side
#IfWinActive ahk_exe CounterSide.exe

f1:: 
Send, m
return
; [mute]

; Firefox
#IfWinActive ahk_exe firefox.exe

^+x::
Return
; [QOL] disable "BIDI text direction" while attempting to cut and paste
