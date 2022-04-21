#RequireAdmin
Opt("WinTitleMatchMode",2)
#include <Array.au3>
#include <MsgBoxConstants.au3>

; doesn't need x/y modification: AK, any bluestacks, CS, Priconne JP
; needs x/y modification: PCN, GFL, FGO, TLW, AL, E7


Global $Arknights [4][4] =   [[0,0,0,0], _
                            [47,145,552,340], _ 	; login 1 (47,145) (552,340)
                            [236,243,320,269], _ 	; login 2
                            [407,286,491,332]] 		; base
Global $ArknightsReset [3][4] =   [[1,0,0,0], _     ; first value is how many lines
                            [533,51,547,65], _ 	; news remove, specific
                            [0,0,0,0]]
Global $PriconneEN [3][4]  =   [[0,0,0,0], _
                            [113,198,498,325], _ 	; login
                            [226,303,334,322]] 		; news
Global $GirlsFrontline [3][4] =   [[0,0,0,0], _
                            [158,138,450,279], _ 	; login
                            [0,0,0,0]] 				; ???
Global $FateGrandOrder [5][4] =   [[0,0,0,0], _
                            [47,145,552,340], _ 	; game start
                            [236,243,320,269], _ 	; login
                            [535,53,549,62]] 		; news
Global $FateGrandOrderReset [3][4] =   [[1,1,0,0], _  ; first = how many lines, second = how many times
                            [233,270,329,287], _ 	;
                            [0,0,0,0]]
Global $TouhouLostWord [3][4] =   [[1,0,0,0], _     ; first value is how many lines
                            [195,264,399,308], _ 	; game start
                            [0,0,0,0]]
Global $TouhouLostWordReset [3][4] =   [[1,5,0,0], _  ; first = how many lines, second = how many times
                            [537,49,537,49], _ 	;
                            [0,0,0,0]]
;Global $AzurLane
;Global $AzurLaneReset
Global $EpicSeven [3][4] =   [[1,0,0,0], _     ; first value is how many lines
                            [221,290,340,318], _ 	; game start
                            []]
;Global $EpicSevenReset

;;; BlueStacks Emulator is stuck to 1124,0 location 566,351 dimensions so if this changes the below values must change
;Global $AnotherEden
;Global $BlueArchive
;Global $BlueArchiveJP
Global $RevivedWitch [6][4] =   [[5,0,0,0], _     	; first value is how many lines
                            [1309,249,1500,286], _ 	; game start
                            [1327,242,1483,280], _ 	; login
                            [1647,71,1665,92], _ 	; news
                            [1504,311,1531,335], _ 	; courtyard
                            [1324,185,1401,196]]   	; mirror
;Global $AlchemyStars
Global $CounterSide [6][4] =   [[5,0,0,0], _     	; first value is how many lines
                            [1286,475,1317,516], _ 	; login switch view
                            [993,792,1257,837], _ 	; google sign in -> firefox pops up
                            [1662,388,1683,408], _ 	; news
                            [873,729,1302,941], _ 	; tap screen/login
                            [1353,805,1625,870]]   	; world map
;Global $PriconneJP 



; ------------------------
; Main


If @HOUR = 5 OR @HOUR = 6 Then
	; For 5:30AM
	; [Comp] PC1: AK, FGO, AL, E7, RW, CS
	ArknightsLogin("LDPlayer 1")
	;ArknightsLoginReset("LDPlayer 1")
	;FateGrandOrderLogin("LDPlayer 2")
	; Reset?
	;AzurLaneLogin("LDPlayer 3")
	; Reset?
	;EpicSevenLogin("LDPlayer 4")
	; Reset
	RevivedWitchLogin("BlueStacks 1")
	CounterSideLogin("COUNTER:SIDE")
EndIf
If @HOUR = 12 OR @HOUR = 13 Then
	; For 1PM
	; [Comp] PC1: AK, FGO, PCN, E7, BA, PCNJP
	ArknightsLogin("LDPlayer 1")
	;FateGrandOrderLogin("LDPlayer 2")
	;PriconneLogin("LDPlayer 3")
	;EpicSevenLogin("LDPlayer 4")
	;BlueArchiveLogin("BlueStacks 1")
	;BlueArchiveLoginReset("BlueStacks 1")
	;PriconneJPLogin("PrincessConnectReDive")
	; Reset?
EndIf
If @HOUR = 14 OR @HOUR = 15 Then
	; For 3:30PM
	; [Comp] PC1: AK, GFL, AL, E7, AS, CS
	ArknightsLogin("LDPlayer 1")
	;GirlsFrontlineLogin("LDPlayer 2")
	;AzurLaneLogin("LDPlayer 3")
	;EpicSevenLogin("LDPlayer 4")
	;AlchemyStarsLogin("BlueStacks 1")
	; Reset?
	CounterSideLogin("COUNTER:SIDE")
EndIf
If @HOUR = 18 OR @HOUR = 19 Then
	; For 8PM
	; [Comp] PC1: AK, GFL, PCN, E7, BA, PCNJP
	;ArknightsLogin("LDPlayer 1")
	;GirlsFrontlineLogin("LDPlayer 2")
	;PriconneLogin("LDPlayer 3")
	;EpicSevenLogin("LDPlayer 4")
	;BlueArchiveLogin("BlueStacks 1")
	;PriconneJPLogin("COUNTER:SIDE")
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

