#RequireAdmin
; Assume login at 3:30
ShellExecute('C:\Users\zhurai\Google Drive\Personal Sync\Scripts-AutoHotKey\pc2.ahk')

; Run GFL Alarm
Run("C:\Personal\Programs\GFLAlarm\GFAlarm.exe")
Run('"C:\Program Files\Mozilla Firefox\firefox.exe" -P "TickTick" --no-remote')

; Window Manager
Run("C:\Program Files (x86)\WindowManager\WindowManager.exe")
Sleep(30000) ; wait 0.5 minute

; Start Firefox
Run ("C:\Program Files\Mozilla Firefox\firefox.exe")
Sleep(30000) ; wait 0.5 minute
RunWait(@AutoItExe & ' "C:\Users\zhurai\Google Drive\Personal Sync\Scripts-Autoit\PC2-WindowManager.au3"')

; Voicemeeter
Run("C:\Program Files (x86)\VB\Voicemeeter\voicemeeterpro.exe")
Sleep(30000) ; wait 0.5 minute

; Start Sublime Editor
;Sleep(30000) ; wait 0.5 minute
;Run("C:\Program Files\Sublime Text\sublime_text.exe")

; Start OBS
Sleep(30000) ; wait 0.5 minute
Run("C:\Program Files (x86)\obs-studio\bin\64bit\obs64.exe", "C:\Program Files (x86)\obs-studio\bin\64bit")

; Start Streetsmart Edge
; Sleep(30000) ; wait 0.5 minute
; ShellExecute ("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Schwab\StreetSmart Edge.lnk")

; Start IB
; Sleep(30000) ; wait 0.5 minute
; Run("C:\Jts\tws.exe")

; Start Discord
Sleep(30000) ; wait 0.5 minute
Run("C:\Users\zhurai\AppData\Local\Discord\Update.exe" & " --processStart Discord.exe")

; Hide Stuff
Sleep(30000) ; wait 0.5 minute
Opt("SendKeyDownDelay", 100)
Send ('^!1')

