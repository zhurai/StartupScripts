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

; LDPlayer
#IfWinActive ahk_exe dnplayer.exe

f1:: 
Send, ^{-}
return
; [Lower Volume]

f3::
Send, ^0
return
; Screenshot

^f1::
return
; disable ctrl+f1

^2::
return
; disable ctrl+2

^3::
return
; disable ctrl+3

^4::
return
; disable ctrl+4

^5::
return
; disable ctrl+5

^6::
return
; disable ctrl+6

^7::
return
; disable ctrl+7

^8::
return
; disable ctrl+8

^9::
return
; disable ctrl+9

LWin::
return
