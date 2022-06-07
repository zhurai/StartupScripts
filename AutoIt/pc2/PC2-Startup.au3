#RequireAdmin

; Start AutoHotkey
ShellExecute('C:\Users\zhurai\Google Drive\Personal Sync\Scripts-AutoHotKey\pc2.ahk')

; Start VoiceMeeter
Run("C:\Program Files (x86)\VB\Voicemeeter\voicemeeterpro.exe")

; Start Firefox (Todoist Tasks, TickTick)
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

; Start Discord
Sleep(30000) ; wait 0.5 minute
Run("C:\Users\zhurai\AppData\Local\Discord\Update.exe --processStart Discord.exe", "C:\Users\zhurai\AppData\Local\Discord\app-1.0.9004")

; Start OBS
Sleep(30000) ; wait 0.5 minute
Run("C:\Program Files (x86)\obs-studio\bin\64bit\obs64.exe", "C:\Program Files (x86)\obs-studio\bin\64bit")

; Start GFL Alarm
Sleep(30000) ; wait 0.5 minute
Run("C:\Personal\Programs\GFLAlarm\GFAlarm.exe", "C:\Personal\Programs\GFLAlarm")

; Hide Stuff
Sleep(30000) ; wait 0.5 minute
Opt("SendKeyDownDelay", 100)
Send ('^!1')
