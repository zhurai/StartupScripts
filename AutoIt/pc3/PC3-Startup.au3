#include <Array.au3>

; Voicemeeter
Run("C:\Program Files (x86)\VB\Voicemeeter\voicemeeterpro.exe")
ShellExecute('C:\Users\zhurai\Google Drive\Personal Sync\Scripts-AutoHotKey\pc3.ahk')

; Firefox
Sleep (30000)
Run ("C:\Program Files\Mozilla Firefox\firefox.exe")

; Discord
Sleep(30000)
Run ('C:\Users\zhurai\AppData\Local\Discord\Update.exe' & ' --processStart Discord.exe')
WinSetState("Discord", "", @SW_MAXIMIZE)
