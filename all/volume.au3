#include <MsgBoxConstants.au3>
$currentwindow=WinGetTitle("[ACTIVE]")
$volumemixer="Volume Mixer"

If WinExists($volumemixer) Then
   WinClose($volumemixer)
   Sleep(500)
EndIf

Run("C:\Windows\System32\SndVol.exe")
Sleep(3000)

$buildtext="[TEXT:Mute for " & $currentwindow & "]"
$hControl = ControlGetHandle($volumemixer, "",$buildtext)
controlclick($volumemixer,"",$hControl,"left",1)
Sleep(500)
WinClose($volumemixer)
