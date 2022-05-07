#RequireAdmin
Opt("WinTitleMatchMode",2)
#include <Array.au3>
#include <MsgBoxConstants.au3>

Global $CounterSide [6][4] =   [[5,0,0,0], _     	; first value is how many lines
                            [1286,475,1317,516], _ 	; login switch view
                            [993,792,1257,837], _ 	; google sign in -> firefox pops up
                            [1662,388,1683,408], _ 	; news
                            [873,729,1302,941], _ 	; tap screen/login
                            [1353,805,1625,870]]   	; world map

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


Func CounterSideLogin($item)
	; Find Window
	$windowlist=ScanWindows($item)
	For $i = 0 To UBound($windowlist)-1
		Local $window = $windowlist[$i]
		Local $newX = 0
		Local $newY = 0
		; Login Switch View
		$newX = Random($CounterSide[1][0],$CounterSide[1][2])
		$newY = Random($CounterSide[1][1],$CounterSide[1][3])
		WinActivate($window)
		MouseClick ("left",$newX,$newY)
		; Wait 0.5 minute
		Sleep(30000)
		; Login Google Sign in
		$newX = Random($CounterSide[2][0],$CounterSide[2][2])
		$newY = Random($CounterSide[2][1],$CounterSide[2][3])
		WinActivate($window)
		MouseClick ("left",$newX,$newY)		
		; Wait 0.5 minute
		Sleep(30000)
		; Hide Firefox
		RunWait(@AutoItExe & ' "D:\GoogleDrive\Personal Sync\Scripts-Autoit\PC1-WindowManager.au3"')
		; Wait 0.5 minute
		Sleep(30000)
		; Click News
		$newX = Random($CounterSide[3][0],$CounterSide[3][2])
		$newY = Random($CounterSide[3][1],$CounterSide[3][3])
		WinActivate($window)
		MouseClick ("left",$newX,$newY)	
		; Wait 0.5 minute
		Sleep(30000)
		; Click Screen / Real Login
		$newX = Random($CounterSide[4][0],$CounterSide[4][2])
		$newY = Random($CounterSide[4][1],$CounterSide[4][3])
		WinActivate($window)
		MouseClick ("left",$newX,$newY)	
		;;;;;;;;;;;;;;;;;
		; Wait 5 seconds
		Sleep (5000)
		; Click World Map
		$newX = Random($CounterSide[5][0],$CounterSide[5][2])
		$newY = Random($CounterSide[5][1],$CounterSide[5][3])
		WinActivate($window)
		MouseClick ("left",$newX,$newY)	
		; Wait 0.5 minute
		Sleep(30000)
		WinMove("COUNTER:SIDE","",553,350,1080,637)
	Next
	; Wait 0.5 minute
	Sleep(30000)
EndFunc


Func RevivedWitchLogin($item)
	; Find Window
	$windowlist=ScanWindows($item)
	For $i = 0 To UBound($windowlist)-1
		Local $window = $windowlist[$i]
		Local $newX = 0
		Local $newY = 0
		For $ii = 1 To $RevivedWitch[0][0] Step 1
			$newX = Random($RevivedWitch[$ii][0],$RevivedWitch[$ii][2])
			$newY = Random($RevivedWitch[$ii][1],$RevivedWitch[$ii][3])
			WinActivate($window)
			MouseClick ("left",$newX,$newY)
			Sleep(30000)
		Next
	Next
	; Wait 0.5 minute
	Sleep(30000)
EndFunc


Func ArknightsLoginReset($item)
	; Find Window
	$windowlist=ScanWindows($item)
	For $i = 0 To UBound($windowlist)-1
		Local $window = $windowlist[$i]
		Local $newX = 0
		Local $newY = 0
		For $ii = 1 To $ArknightsReset[0][0] Step 1
			$newX = Random($ArknightsReset[$ii][0],$ArknightsReset[$ii][2])
			$newY = Random($ArknightsReset[$ii][1],$ArknightsReset[$ii][3])
			WinActivate($window)
			MouseClick ("left",$newX,$newY)
			Sleep(30000)
		Next
	Next
	; Wait 0.5 minute
	Sleep(30000)
EndFunc

Func ArknightsLogin($item)
	; Find Window
	$windowlist=ScanWindows($item)
	For $i = 0 To UBound($windowlist)-1
		Local $window = $windowlist[$i]
		Local $newX = 0
		Local $newY = 0
			; Click Login 1
		$newX = Random($Arknights[1][0],$Arknights[1][2])
		$newY = Random($Arknights[1][1],$Arknights[1][3])
		WinActivate($window)
		MouseClick ("left",$newX,$newY)
			; Wait 0.5 minute
		Sleep(30000)
			; Click Login 2
		$newX = Random($Arknights[2][0],$Arknights[2][2])
		$newY = Random($Arknights[2][1],$Arknights[2][3])
		WinActivate($window)
		MouseClick ("left",$newX,$newY)
		If @HOUR = 5 Then
			; Wait 0.5 minute
			Sleep(30000)
			ArknightsLoginReset($item)
		EndIf
			; Wait 0.5 minute
		Sleep(30000)
		$newX = Random($Arknights[3][0],$Arknights[3][2])
		$newY = Random($Arknights[3][1],$Arknights[3][3])
		WinActivate($window)
		MouseClick ("left",$newX,$newY)
	Next
	; Wait 0.5 minute
	Sleep(30000)
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

