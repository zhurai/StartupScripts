#SingleInstance Force
#NoEnv
#EscapeChar \
SendMode Input 
SetWorkingDir %A_ScriptDir%

; Global
LWin & F12::Send {PrintScreen}
; [Screenshot]

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
