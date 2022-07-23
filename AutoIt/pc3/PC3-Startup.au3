#include <Array.au3>

; Voicemeeter
Run("C:\Program Files (x86)\VB\Voicemeeter\voicemeeterpro.exe")
ShellExecute('C:\Users\zhurai\Google Drive\Personal Sync\Scripts-AutoHotKey\pc3.ahk')

; Start GFL Alarm
Sleep (30000)
Run("C:\Personal\Programs\GFAlarm\GFAlarm.exe", "C:\Personal\Programs\GFAlarm")

; Firefox
Sleep (30000)
Run ("C:\Program Files\Mozilla Firefox\firefox.exe")

; Discord
Sleep(30000)
Run ('C:\Users\zhurai\AppData\Local\Discord\Update.exe' & ' --processStart Discord.exe')

; Maximize Discord
Sleep(30000)
WinSetState("Discord", "", @SW_MAXIMIZE)
