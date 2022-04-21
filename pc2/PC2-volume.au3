#include <MsgBoxConstants.au3>
#include <Array.au3>
$volumemixer="Volume Mixer"

Run("C:\Windows\System32\SndVol.exe")
Sleep(2000)

Global $stringarray[0]
Global $Counter=0
While 1
	Local $controlstring="[CLASS:Static; INSTANCE:" & $Counter & "]"
	Local $controltext = ControlGetText($volumemixer,"",$controlstring)

	; If "No audio device is installed" stop incrementing number
	If StringCompare($controltext,"No audio device is installed")==0 Then
		ExitLoop
	EndIf
	If StringCompare($controltext,"")==0 Then
		Local $temp = "nothing happens"
	ElseIf StringinStr($controltext,"Volume for ")<>0 Then
		Local $temp = "nothing happens"
	Else
		_ArrayAdd($stringarray,$controltext)
	EndIf

	;MsgBox($MB_SYSTEMMODAL, "Title", $controltext)
	$Counter=$Counter+1
WEnd

; List all the ones that don't say "Volume for (...)"
; _ArrayList($stringarray)

; for EACH of those, click on the controlgethandle of "Mute for <>" in a whole script for the start
For $c=0 to UBound($stringarray)-1
	$buildtext="[TEXT:Mute for " & $stringarray[$c] & "]"
	$hControl = ControlGetHandle($volumemixer, "",$buildtext)
	controlclick($volumemixer,"",$hControl,"left",1)
Next

WinClose($volumemixer)