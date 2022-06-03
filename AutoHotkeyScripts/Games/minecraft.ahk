#SingleInstance Force
#NoEnv
#EscapeChar \
SetTitleMatchMode RegEx
SendMode Input 
SetWorkingDir %A_ScriptDir%

; Script Requires:
; - Quark Mod to be fully efficient
; - Hold Sneak to grow plants

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


F12::
StopLoop := False
Loop,
{
Send, {Shift down}{RButton}
Sleep 1000
if StopLoop
    break
}
return
+Esc:: 
  Send, {Shift up}
  StopLoop := True 
return
