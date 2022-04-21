#RequireAdmin
Opt("WinTitleMatchMode",2)
#include <Array.au3>

KillProgram("BlueStacks")
Sleep(1000)
KillProgram("firefox")
Sleep(1000)
KillProgram("Discord")
Sleep(1000)

; Start up

; Start Firefox 5 minutes after
Sleep(300000)
Run ("C:\Program Files\Mozilla Firefox\firefox.exe")
Sleep(300000)
RunWait(@AutoItExe & ' "C:\Users\zhurai\Google Drive\Personal Sync\Scripts-Autoit\PC2-WindowManager.au3"')

; Start Discord 5 minutes after
Sleep(10000)
Run("C:\Users\zhurai\AppData\Local\Discord\Update.exe" & " --processStart Discord.exe")

; Start Bluestacks 5 minutes after
; Sleep(300000)
; Run ("C:\Program Files\BlueStacks_nxt\HD-Player.exe" & " --instance Nougat32")
;Run('C:\Program Files\BlueStacks_nxt\HD-Player.exe --instance Pie64 --cmd launchApp --package "com.tencent.baiyeint"')

Func KillProgram($item)
   ; Check List of Windows
   Local $arrayofwindows = ScanWindows($item)

   ; Loop through array of emulators
   For $i = 0 To UBound($arrayofwindows)-1
	  Local $window = $arrayofwindows[$i]
	  Local $pid = WinGetProcess($window)
	  ProcessClose($pid)
      Sleep(1000)
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
