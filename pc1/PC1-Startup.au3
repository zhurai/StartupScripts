#RequireAdmin
#include <Array.au3>
#include <AutoItConstants.au3>

; Window Manager
Run("C:\Program Files (x86)\WindowManager\WindowManager.exe")
Sleep(60000) ; wait 1 minute

; LDPlayer Optimization
;Run("C:\LDPlayer\LDPlayer4.0\dnmultiplayer.exe")
;Sleep(60000) ; wait 1 minute
;WinActivate("LDMultiPlayer")
;MouseClick($MOUSE_CLICK_LEFT,380,570,1)
;Sleep(30000) ; wait 0.5 minute
;WinActivate("LDMultiPlayer")
;Local $iColor = PixelGetColor(47,273)
;If $iColor <> 2201073 Then
;   WinActivate("LDMultiPlayer")
;   MouseClick($MOUSE_CLICK_LEFT,47,273,1)
;Endif
; LDPlayer Debug
; MsgBox($MB_SYSTEMMODAL, "", "The decimal color is: " & $iColor)
; MsgBox($MB_SYSTEMMODAL, "", "The hex color is: " & Hex($iColor, 6))

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

