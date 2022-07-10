#RequireAdmin
#include <Array.au3>

; ------------------------
; Main

;;;;;;;;;;;;;;;;;;;;;;;;;;  Start Emulators



;;;;;;;;;;;;;;;;;;;;;;;;;; Check Time

Run("D:\Counterside\Launcher\PDLauncher.exe","D:\Counterside\Launcher") ; Counter Side
Run("C:\Program Files\BlueStacks_nxt\HD-MultiInstanceManager.exe") ; BlueStacks Multi Instance
Run("C:\MuMu\emulator\nemu\EmulatorShell\NemuMultiPlayer.exe") ; MuMu Multi Player

;;;;;;;;;;;;;;;;;;;;;;;;;; Log In

RunWait(@AutoItExe & ' "D:\GoogleDrive\Personal Sync\Scripts-Autoit\Startup\pc1\PC1-Login.au3"')

; ------------------------
; Functions

Func ScanWindows($item)
   Local $windowlist = WinList()
   Local $returnarray[0]= []
   For $i = 1 To $windowlist[0][0]
	  If $windowlist[$i][0] <> "" And BitAND(WinGetState($windowlist[$i][1]), 2) Then
		 If StringInStr ($windowlist[$i][0], $item) Then
			   _ArrayAdd($returnarray,$windowlist[$i][1],0)
		 EndIf
	  EndIf
   Next
   ;_ArrayDisplay($returnarray)
   return $returnarray
EndFunc

Func _StringStartsWith($string, $start, $case = 0)
    If StringLen($start) > StringLen($string) Then Return -1
    If $case > 0 Then
        If StringLeft($string, StringLen($start)) == $start Then Return 1
    Else
        If StringLeft($string, StringLen($start)) = $start Then Return 1
    EndIf
    Return 0
EndFunc   ;==>_StringStartsWith
