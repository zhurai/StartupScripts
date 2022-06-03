#NoTrayIcon
#SingleInstance force
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%


Loop {
	If !WinExist("mobile - dragalia2")
	{
		ExitApp
	}
	Sleep 1000
}


#IfWinActive mobile - dragalia2
SetControlDelay -1

1:: ; Summon 1 158,911 -> 300,948
Random,x,158,300
Random,y,911,948
ControlClick, % "x" x " y" y+36,mobile - dragalia2,,,,NA Pos
return

2:: ; Summon 2 260,626 -> 406,661
Random,x,260,406
Random,y,626,661
ControlClick, % "x" x " y" y+36,mobile - dragalia2,,,,NA Pos
return

z:: ; Contents 141,795 -> 203,810
Random,x,141,203
Random,y,795,810
ControlClick, % "x" x " y" y+36,mobile - dragalia2,,,,NA Pos
return

x:: ; Close 162,758 -> 294,787
Random,x,162,294
Random,y,758,787
ControlClick, % "x" x " y" y+36,mobile - dragalia2,,,,NA Pos
return
