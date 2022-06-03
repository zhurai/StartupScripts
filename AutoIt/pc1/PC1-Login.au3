#RequireAdmin
Opt("WinTitleMatchMode",2)
#include <Array.au3>
#include <MsgBoxConstants.au3>

; ------------------------
; Main


If @HOUR = 5 OR @HOUR = 6 Then
	; For 5:30AM
	; [Comp] PC1: 
EndIf
If @HOUR = 12 OR @HOUR = 13 Then
	; For 1PM
	; [Comp] PC1: 
EndIf
If @HOUR = 14 OR @HOUR = 15 Then
	; For 3:30PM
	; [Comp] PC1: 
EndIf
If @HOUR = 18 OR @HOUR = 19 Then
	; For 8PM
	; [Comp] PC1: 
EndIf


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

