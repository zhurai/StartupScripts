#RequireAdmin
#include <Array.au3>
#include <MsgBoxConstants.au3>

Global $LDCloseX=511
Global $LDCloseY=16
Global $BSCloseX=516
Global $BSCloseY=17

; ------------------------
; Main

; Closes the application (before either: Actual Restart of the computer (closing the emulator itself) ... OR ... Restarting the applications again)
RunWait(@AutoItExe & ' "D:\GoogleDrive\Personal Sync\Scripts-Autoit\Startup\pc1\PC1-WindowManager.au3"')
Sleep (1000)
OtherGames("PrincessConnectReDive")
Sleep (1000)
OtherGames("COUNTER:SIDE")
Sleep (1000)
LDPlayer()
Sleep (1000)
BlueStacks()
Sleep (1000)

; ------------------------

Func OtherGames($game)
   Local $arrayofwindows = ScanWindows($game)

   ; Loop through array of emulators
   For $i = 0 To UBound($arrayofwindows)-1
	  Local $window = $arrayofwindows[$i]
	  WinClose($window)
	  Sleep (1000)
	  WinKill($window)
   Next
EndFunc


Func BlueStacks()
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
	  WinKill($window)
	  Sleep (1000)
   Next
EndFunc

Func LDPlayer()
   ; Check List of Windows
   Local $arrayofwindows = ScanWindows("LDPlayer")

   ; Loop through array of emulators
   For $i = 0 To UBound($arrayofwindows)-1
	  Local $window = $arrayofwindows[$i]
      ; get size of window from the handle
	  Local $position = WinGetPos($window)
	  Local $windowX = $position[0]
	  Local $windowY = $position[1]
	  ; calculate value of where to click the close button = 511, 16
	  Local $newX = $windowX+$LDCloseX
	  Local $newY = $windowY+$LDCloseY
     ; click on that button
	  WinActivate($window)
	  MouseClick ("left",$newX,$newY)
	  ;MsgBox($MB_SYSTEMMODAL, "", $window & " " & $windowX & " " & $windowY & " " & $newX & " " & $newY)
	  Sleep (1000)
	  WinKill($window)
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
