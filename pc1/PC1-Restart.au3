#RequireAdmin
Opt("WinTitleMatchMode",2)
#include <Array.au3>
#include <MsgBoxConstants.au3>


; ------------------------
; Main

; Close Apps only first
RunWait(@AutoItExe & ' "D:\GoogleDrive\Personal Sync\Scripts-Autoit\pc1\PC1-SoftRestart.au3"')

; Sleep for a bit
Sleep(30000)

; Close Software/Emulator
Sleep (1000)
CloseMuMu()
Sleep (1000)
CloseLDPlayer()
Sleep (1000)
CloseBluestacks() 

; Sleep for a bit
Sleep(30000)

; Shut Down
Run("C:\Windows\System32\shutdown.exe /f /r /t 0")

; ------------------------
; Functions

Func CloseLDPlayer ()
   ; Check List of Windows
   Local $arrayofwindows = ScanWindows("LDPlayer")

   ; Loop through array of emulators
   For $i = 0 To UBound($arrayofwindows)-1
	  Local $window = $arrayofwindows[$i]
	  WinClose($window)
	  Sleep (1000)
   Next
EndFunc

Func CloseBluestacks ()
   Local $arrayofwindows = ScanWindows("BlueStacks")

   ; Loop through array of emulators
   For $i = 0 To UBound($arrayofwindows)-1
	  Local $window = $arrayofwindows[$i]
	  WinClose($window)
	  Sleep (1000)
   Next
EndFunc

Func CloseMuMu ()
   Local $arrayofwindows = ScanWindows("MuMu")

   ; Loop through array of emulators
   For $i = 0 To UBound($arrayofwindows)-1
	  Local $window = $arrayofwindows[$i]
	  WinClose($window)
	  Sleep (1000)
   Next
EndFunc

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
