#SingleInstance Force
#NoEnv
#EscapeChar \
SendMode Input 
SetWorkingDir %A_ScriptDir%

; Global
LWin & F12::Send {PrintScreen}
; [Screenshot]

; Firefox
#IfWinActive ahk_exe firefox.exe
^+x::
Return
; [QOL] disable "BIDI text direction" while attempting to cut and paste
