Opt("SendKeyDownDelay", 100)
Send ('^!1')

Sleep(1000)

If WinExists("HoloTools — Mozilla Firefox") Then
	WinActivate("HoloTools — Mozilla Firefox")
	Send("{F1}")
EndIf

Sleep(1000)

If WinExists("NijiMado | Play — Mozilla Firefox") Then
	WinActivate("NijiMado | Play — Mozilla Firefox")
	Send("{F1}")
EndIf

Sleep(1000)

If WinExists("Today - TickTick — Mozilla Firefox") Then
	WinActivate("Today - TickTick — Mozilla Firefox")
	Send("{F1}")
EndIf

Sleep(1000)
