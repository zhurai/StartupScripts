#RequireAdmin
#include <Array.au3>

Global $ArknightsInfraStart = 0
	; 0 = Don't do ArknightsInfra[3]
	; 1 = Do ArknightsInfra[3]

Global $LDPlayer [5][2] =   [[0,0], _
                            [72,224], _
                            [142,225], _
                            [210,223], _
                            [280,226]]


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
Global $BSCloseX=516
Global $BSCloseY=17

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Main

; Shut Down Stuff
RunWait(@AutoItExe & ' "D:\GoogleDrive\Personal Sync\Scripts-Autoit\PC1-WindowManager.au3"')
Sleep (1000)
EndLDPlayerApp("LDPlayer 2") ; 8:30:01
EndBlueStacksApp() ; 8:30:02
MouseClick("left",0,0) ; 8:30:03
Sleep (1000) ; 8:30:04

; Restart BlueStacks
Sleep(60000) ; wait 1 minute
; 8:31:05
Run('"C:\Program Files\BlueStacks_nxt\HD-Player.exe" --instance  Pie64_11') ; BlueStacks 1 (AE/CS/BA/RW/AS)

; Restart LDPlayer
Sleep(60000) ; wait 1 minute
; 8:32:05
Run("C:\LDPlayer\LDPlayer4.0\dnplayer.exe" & " index=1|") ; LDPlayer 2 (GFL, FGO, FGA, TLW)

; Script 
Sleep(60000) ; wait 1 minute
; 8:33:05
RunWait(@AutoItExe & ' "D:\GoogleDrive\Personal Sync\Scripts-Autoit\PC1-BS5-AELogin.au3"')

; Login
Sleep(60000) ; wait 1 minute
; 8:34:35
LDPlayer("LDPlayer 2",1)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Functions


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
		If $ArknightsInfraStart > 0 Then
			MouseClick ("left",$newX,$newY)
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


Func EndLDPlayerApp($item)
   ; Check List of Windows
   Local $arrayofwindows = ScanWindows($item)

   ; Loop through array of emulators
   For $i = 0 To UBound($arrayofwindows)-1
	  Local $window = $arrayofwindows[$i]
	  WinClose($window)
	  Sleep (1000)
   Next
EndFunc


Func LDPlayerHOME($item)
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
EndFunc

Func LDPlayer($item,$number)
	Local $window = $item
    ; get size of window from the handle
	Local $position = WinGetPos($item)
	Local $windowX = $position[0]
	Local $windowY = $position[1]
	Local $newX = 0
	Local $newY = 0
	$newX = $windowX+$LDPlayer[$number][0]
	$newY = $windowY+$LDPlayer[$number][1]
	WinActivate($window)
	MouseClick ("left",$newX,$newY)
EndFunc

Func EndBlueStacksApp()
   Local $arrayofwindows = ScanWindows("BlueStacks")

   ; Loop through array of emulators
   For $i = 0 To UBound($arrayofwindows)-1
	  Local $window = $arrayofwindows[$i]
      ; get size of window from the handle
	  Local $position = WinGetPos($window)
	  Local $windowX = $position[0]
	  Local $windowY = $position[1]
	  ; calculate value of where to click the close button = 828,15
	  Local $newX = $windowX+$BSCloseX
	  Local $newY = $windowY+$BSCloseY
     ; click on that button
	  WinActivate($window)
	  MouseClick ("left",$newX,$newY)
	  ;MsgBox($MB_SYSTEMMODAL, "", $window & " " & $windowX & " " & $windowY & " " & $newX & " " & $newY)
	  Sleep (1000)
   Next
EndFunc

; Function for getting HWND from PID
Func _GetHwndFromPID($PID)
	$hWnd = 0
	$winlist = WinList()
	Do
		For $i = 1 To $winlist[0][0]
			If $winlist[$i][0] <> "" Then
				$iPID2 = WinGetProcess($winlist[$i][1])
				If $iPID2 = $PID Then
					$hWnd = $winlist[$i][1]
					ExitLoop
				EndIf
			EndIf
		Next
	Until $hWnd <> 0
	Return $hWnd
EndFunc;==>_GetHwndFromPID

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

