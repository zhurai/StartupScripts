#RequireAdmin
#include <Array.au3>
#include <AutoItConstants.au3>

; Window Manager
Run("C:\Program Files (x86)\WindowManager\WindowManager.exe")
Sleep(60000) ; wait 1 minute

; Firefox
Run('C:\Program Files\Mozilla Firefox\firefox.exe')
Sleep(30000) ; wait 0.5 minute

; Voicemeeter
Run("C:\Program Files (x86)\VB\Voicemeeter\voicemeeterpro.exe")
Sleep(30000) ; wait 0.5 minute

; AutoHotKey
ShellExecute('D:\GoogleDrive\Personal Sync\Scripts-AutoHotKey\pc1.ahk')

; Launchy
Run("C:\Program Files (x86)\Launchy\Launchy.exe /show")

; Move Stuff
RunWait(@AutoItExe & ' "D:\GoogleDrive\Personal Sync\Scripts-Autoit\Startup\pc1\PC1-WindowManager.au3"')

; Startup
RunWait(@AutoItExe & ' "D:\GoogleDrive\Personal Sync\Scripts-Autoit\Startup\pc1\PC1-SoftStartup.au3"')

; Greenshot
Run("C:\Program Files\Greenshot\Greenshot.exe")

; Keepass
Run("C:\Program Files\KeePassXC\KeePassXC.exe")
