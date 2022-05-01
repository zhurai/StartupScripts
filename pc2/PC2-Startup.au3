#RequireAdmin
; Assume login at 3:30
ShellExecute('C:\Users\zhurai\Google Drive\Personal Sync\Scripts-AutoHotKey\pc2.ahk')

; Start GFL Alarm
Run("C:\Personal\Programs\GFLAlarm\GFAlarm.exe")

; Start VoiceMeeter
Run("C:\Program Files (x86)\VB\Voicemeeter\voicemeeterpro.exe")

; Start Firefox (Tasks, TickTick)
Run('"C:\Program Files\Mozilla Firefox\firefox.exe" -P "TickTick" --no-remote')
Sleep(30000) ; wait 0.5 minute

; Start Window Manager
Run("C:\Program Files (x86)\WindowManager\WindowManager.exe")
Sleep(30000) ; wait 0.5 minute

; Start Firefox
Run ("C:\Program Files\Mozilla Firefox\firefox.exe")
Sleep(30000) ; wait 0.5 minute

; Start Sublime Editor
Sleep(30000) ; wait 0.5 minute
Run("C:\Program Files\Sublime Text\sublime_text.exe")

; Start OBS
Sleep(30000) ; wait 0.5 minute
Run("C:\Program Files (x86)\obs-studio\bin\64bit\obs64.exe", "C:\Program Files (x86)\obs-studio\bin\64bit")

; Hide Stuff
Sleep(30000) ; wait 0.5 minute
Opt("SendKeyDownDelay", 100)
Send ('^!1')
