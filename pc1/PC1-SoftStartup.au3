#RequireAdmin
#include <Array.au3>


Global $LDPlayer [5][2] =   [[0,0], _   
                            [72,224], _
                            [142,225], _
                            [210,223], _
                            [280,226]]


Global $BlueStacks [6][2] =   [[0,0], _   
                            [60,221], _
                            [145,222], _
                            [235,225], _
                            [325,221], _
                            [413,224]]

Global $Arknights [4][4] =   [[0,0,0,0], _
                            [47,145,552,340], _ 	; login 1 (47,145) (552,340)
                            [236,243,320,269], _ 	; login 2
                            [407,286,491,332]] 		; base

Global $ArknightsInfra [5][4] =   [[0,0,0,0], _
                            [502,112,557,133], _ 	; reception - 502,112 -> 557,133
                            [121,275,222,320], _ 	; go in - 121,275 -> 222, 320
                            [15,47,62,56], _ 	; clue info (Back out, don't do if no active clue exchange) - 15, 47 -> 62, 56 
                            [249,311,349,326]] 		; start clue exchange 249, 311 -> 349,326

Global $LDPlayerHOMEX = 46
Global $LDPlayerHOMEY = 17

; ------------------------
; Main

;;;;;;;;;;;;;;;;;;;;;;;;;;  Start Emulators

Run("C:\LDPlayer\LDPlayer4.0\dnplayer.exe" & " index=0|") ; LDPlayer 1 (AK, PCN)
Run("C:\LDPlayer\LDPlayer4.0\dnplayer.exe" & " index=2|") ; LDPlayer 2 (GFL, FGO, FGA, TLW)
Run("C:\LDPlayer\LDPlayer4.0\dnplayer.exe" & " index=1|") ; LDPlayer 3 (AL, PCN)
Sleep(120000) ; wait 2 minutes
Run("C:\Program Files (x86)\Mudfish Cloud VPN\mudrun.exe","C:\Program Files (x86)\Mudfish Cloud VPN")
Run("C:\LDPlayer\LDPlayer4.0\dnplayer.exe" & " index=3|") ; LDPlayer 4 (E7)
Run('"C:\Program Files\BlueStacks_nxt\HD-Player.exe" --instance  Pie64_11') ; BlueStacks 1 (AE/CS/BA/RW/AS)
Run("D:\PersonalPrograms\VivaldiGBF\Application\vivaldi.exe","D:\PersonalPrograms\VivaldiGBF\Application")
Sleep(120000) ; wait 2 minutes



;;;;;;;;;;;;;;;;;;;;;;;;;; Check Time
If @HOUR = 5 OR @HOUR = 6 Then 
	; For 5:30AM
	; [Comp] PC1: AK, FGO, AL, E7, RW, CS
	LDPlayer("LDPlayer 1",1) ; AK
	Sleep(1000)
	LDPlayer("LDPlayer 2",3) ; FGA
	Sleep(1000)
	LDPlayer("LDPlayer 3",1) ; AL
	Sleep(1000)
	LDPlayer("LDPlayer 4",1) ; E7
	Sleep(1000)
	BlueStacks("BlueStacks 1",4) ; RW
	Sleep(1000)
	LDPlayerFGA("LDPlayer 2") ; FGA -> FGO
	Sleep(1000)
	;Run("D:\Counterside\Launcher\PDLauncher.exe","D:\Counterside\Launcher") ; CS
	;Sleep(30000) ; wait 0.5 minutes
	;WinMove("COUNTER:SIDE","",553,350,1143,673)
EndIf
If @HOUR = 12 OR @HOUR = 13 Then
	; For 1:15PM
	; [Comp] PC1: AK, FGO, PCN, E7, BA, PCNJP
	LDPlayer("LDPlayer 1",1) ; AK
	Sleep(1000)
	LDPlayer("LDPlayer 2",3) ; FGA
	Sleep(1000)
	LDPlayer("LDPlayer 3",2) ; PCN
	Sleep(1000)
	LDPlayer("LDPlayer 4",1) ; E7
	Sleep(1000)
	BlueStacks("BlueStacks 1",3) ; BA
	Sleep(1000)
	LDPlayerFGA("LDPlayer 2") ; FGA -> FGO
	Sleep(1000)
	PriconneJP() ; PCNJP
EndIf
If @HOUR = 14 OR @HOUR = 15 Then
	; For 3:15PM
	; [Comp] PC1: AK, GFL, AL, E7, AS, CS
	LDPlayer("LDPlayer 1",1) ; AK
	Sleep(1000)
	LDPlayer("LDPlayer 2",1) ; GFL
	Sleep(1000)
	LDPlayer("LDPlayer 3",1) ; AL
	Sleep(1000)
	LDPlayer("LDPlayer 4",1) ; E7
	Sleep(1000)
	BlueStacks("BlueStacks 1",5) ; AS
	Sleep(1000)
	Run("D:\Counterside\Launcher\PDLauncher.exe","D:\Counterside\Launcher") ; CS
	Sleep(30000) ; wait 0.5 minutes
	WinMove("COUNTER:SIDE","",553,350,1143,673)
EndIf
If @HOUR = 18 OR @HOUR = 19 Then
	; For 8PM
	; [Comp] PC1: AK, GFL, PCN, E7, BA, PCN JP
	;	LDPlayer("LDPlayer 1",1) ; AK
	;	Sleep(1000)
	;	LDPlayer("LDPlayer 2",1) ; GFL
	;	Sleep(1000)
	;	LDPlayer("LDPlayer 3",2) ; PCN
	;	Sleep(1000)
	LDPlayer("LDPlayer 4",1) ; E7
	Sleep(1000)
	;	BlueStacks("BlueStacks 1",3) ; AS
	;	Sleep(1000)
	;	PriconneJP() ; PCNJP
EndIf

Sleep(60000)

;RunWait(@AutoItExe & ' "D:\GoogleDrive\Personal Sync\Scripts-Autoit\PC1-Login.au3"')

; ------------------------
; Functions

Func PriconneJP ()
	Run("C:\Program Files (x86)\DMMGamePlayer\DMMGamePlayer.exe","C:\Program Files (x86)\DMMGamePlayer") ; PCNJP
	Sleep(30000) ; wait 0.5 minutes
	Sleep(30000) ; wait 0.5 minutes
	WinActivate("DMM GAME PLAYER")
	MouseClick("left",635,619)
	Sleep(30000) ; wait 0.5 minutes
	Sleep(30000) ; wait 0.5 minutes
	WinActivate("DMM GAME PLAYER")
	MouseClick("left",1309,873)
	Sleep(30000) ; wait 0.5 minutes
	Sleep(30000) ; wait 0.5 minutes
	WinMove("PrincessConnectReDive","",554,385,1143,673)
	Sleep(1000)
	WinClose ("DMM GAME PLAYER","")
EndFunc

Func BlueStacks ($item,$number)
	$windowlist=ScanWindows($item)
	For $i = 0 To UBound($windowlist)-1
	  Local $window = $windowlist[$i]
      ; get size of window from the handle
	  Local $position = WinGetPos($window)
	  Local $windowX = $position[0]
	  Local $windowY = $position[1]
	  Local $newX = 0
	  Local $newY = 0
	  $newX = $windowX+$BlueStacks[$number][0]
	  $newY = $windowY+$BlueStacks[$number][1]
	  WinActivate($window)
	  MouseClick ("left",$newX,$newY)
	Next
EndFunc

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
