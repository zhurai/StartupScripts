#RequireAdmin

; Start AutoHotkey
ShellExecute('C:\Users\zhurai\Google Drive\Personal Sync\Scripts-AutoHotKey\pc2.ahk')
; Start VoiceMeeter
Run("C:\Program Files (x86)\VB\Voicemeeter\voicemeeterpro.exe")
; Start Firefox (Todoist Tasks, TickTick)
;Run('"C:\Program Files\Mozilla Firefox\firefox.exe" -P "TickTick" --no-remote')
Sleep(30000) ; wait 0.5 minute

; Start Window Manager
Run("C:\Program Files (x86)\WindowManager\WindowManager.exe")
Sleep(30000) ; wait 0.5 minute

; Start Firefox
Run ("C:\Program Files\Mozilla Firefox\firefox.exe")
Sleep(30000) ; wait 0.5 minute

; Start Sublime Editor
Run("C:\Program Files\Sublime Text\sublime_text.exe")
Sleep(30000) ; wait 0.5 minute

; Start Discord
Run("C:\Users\zhurai\AppData\Local\Discord\Update.exe --processStart Discord.exe", "C:\Users\zhurai\AppData\Local\Discord\app-1.0.9005")
Sleep(30000) ; wait 0.5 minute

; Start OBS
Run("C:\Program Files (x86)\obs-studio\bin\64bit\obs64.exe", "C:\Program Files (x86)\obs-studio\bin\64bit")
Sleep(30000) ; wait 0.5 minute

; Hide Stuff
Opt("SendKeyDownDelay", 100)
Send ('^!1')
