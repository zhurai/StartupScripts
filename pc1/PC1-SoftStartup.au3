#RequireAdmin
#include <Array.au3>

; ------------------------
; Main

;;;;;;;;;;;;;;;;;;;;;;;;;;  Start Emulators



;;;;;;;;;;;;;;;;;;;;;;;;;; Check Time


;;;;;;;;;;;;;;;;;;;;;;;;;; Log In

RunWait(@AutoItExe & ' "D:\GoogleDrive\Personal Sync\Scripts-Autoit\Startup\pc1\PC1-Login.au3"')

; ------------------------
; Functions

Func LDPlayer($item,$number)
	$windowlist=ScanWindows($item)
	For $i = 0 To UBound($windowlist)-1
	  Local $window = $windowlist[$i]
      ; get size of window from the handle
	  Local $position = WinGetPos($window)
	  Local $windowX = $position[0]
	  Local $windowY = $position[1]
	  Local $newX = 0
	  Local $newY = 0
	  $newX = $windowX+$LDPlayer[$number][0]
	  $newY = $windowY+$LDPlayer[$number][1]
	  WinActivate($window)
	  MouseClick ("left",$newX,$newY)
	Next
EndFunc


Func LDPlayerFGA($item)
	$windowlist=ScanWindows($item)
	For $i = 0 To UBound($windowlist)-1
	  Local $window = $windowlist[$i]
      ; get size of window from the handle
	  Local $position = WinGetPos($window)
	  Local $windowX = $position[0]
	  Local $windowY = $position[1]
	  Local $newX = 0
	  Local $newY = 0
	  $newX = $windowX+$LDPlayerHOMEX
	  $newY = $windowY+$LDPlayerHOMEY
	  WinActivate($window)
	  MouseClick ("left",$newX,$newY)
	Next
	Sleep(1000)
	LDPlayer($item,2)
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
