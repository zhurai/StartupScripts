#NoTrayIcon
#SingleInstance force
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%


Loop {
	If !WinExist("mobile - anothereden")
	{
		ExitApp
	}
	Sleep 1000
}


#IfWinActive mobile - anothereden
SetControlDelay -1

1:: ; Battle - Char 1 127,463
Random,x,127,128
Random,y,463,464
ControlClick, % "x" x+8 " y" y+31,mobile - anothereden,,,,NA Pos
return

2:: ; Battle - Char 2 201,462 -> 276,487
Random,x,201,276
Random,y,462,487
ControlClick, % "x" x+8 " y" y+31,mobile - anothereden,,,,NA Pos
return

3:: ; Battle - Char 3 310,462 -> 387,487
Random,x,310,387
Random,y,456,487
ControlClick, % "x" x+8 " y" y+31,mobile - anothereden,,,,NA Pos
return

4:: ; Battle - Char 4 416,462 -> 499,487
Random,x,416,499
Random,y,462,487
ControlClick, % "x" x+8 " y" y+31,mobile - anothereden,,,,NA Pos
return

5:: ; Battle - Char 5 542,462 -> 627,487
Random,x,542,627
Random,y,462,487
ControlClick, % "x" x+8 " y" y+31,mobile - anothereden,,,,NA Pos
return

6:: ; Battle - Char 6 652,462 -> 736,487
Random,x,652,736
Random,y,462,487
ControlClick, % "x" x+8 " y" y+31,mobile - anothereden,,,,NA Pos
return

q:: ; Battle - Skill 1 98,382 -> 219,402
Random,x,98,219
Random,y,382,402
ControlClick, % "x" x+8 " y" y+31,mobile - anothereden,,,,NA Pos
return

w:: ; Battle - Skill 2 257,382 -> 385,402
Random,x,257,385
Random,y,382,402
ControlClick, % "x" x+8 " y" y+31,mobile - anothereden,,,,NA Pos
return

e:: ; Battle - Skill 3 416,382 -> 540,402
Random,x,416,540
Random,y,382,402
ControlClick, % "x" x+8 " y" y+31,mobile - anothereden,,,,NA Pos
return

r:: ; Battle - Skill 4 576,382 -> 700,402
Random,x,576,700
Random,y,382,402
ControlClick, % "x" x+8 " y" y+31,mobile - anothereden,,,,NA Pos
return

t:: ; Battle - Skill 5 (Switch) 733,382 -> 863,402
Random,x,733,863
Random,y,382,402
ControlClick, % "x" x+8 " y" y+31,mobile - anothereden,,,,NA Pos
return

g:: ; Battle - Another Force - 833,61 -> 857,91
Random,x,833,857
Random,y,61,91
ControlClick, % "x" x+8 " y" y+31,mobile - anothereden,,,,NA Pos
return

a:: ; Battle - Another Force - Skill 1
ControlClick, % "x" x+8 " y" y+31,mobile - anothereden,,,,NA Pos
return

s:: ; Battle - Another Force - Skill 2
ControlClick, % "x" x+8 " y" y+31,mobile - anothereden,,,,NA Pos
return

d:: ; Battle - Another Force - Skill 3
ControlClick, % "x" x+8 " y" y+31,mobile - anothereden,,,,NA Pos
return

f:: ; Battle - Another Force - Skill 4
ControlClick, % "x" x+8 " y" y+31,mobile - anothereden,,,,NA Pos
return

Space:: ; Battle - Attack 795,411 -> 854,466
Random,x,795,854
Random,y,411,466
ControlClick, % "x" x+8 " y" y+31,mobile - anothereden,,,,NA Pos
return

BS:: ; Battle - Run 838,323 -> 865,344
Random,x,838,865
Random,y,323,344
ControlClick, % "x" x+8 " y" y+31,mobile - anothereden,,,,NA Pos
return

z:: ; Battle - Status 87,54 -> 163,65
Random,x,87,163
Random,y,54,65
ControlClick, % "x" x+8 " y" y+31,mobile - anothereden,,,,NA Pos
return

x:: ; Battle - Repeat  199,54 -> 276,65
Random,x,199,276
Random,y,54,65
ControlClick, % "x" x+8 " y" y+31,mobile - anothereden,,,,NA Pos
return

`:: ; Navigation - Minimap 821,66 -> 923,121
Random,x,821,923
Random,y,66,121
ControlClick, % "x" x+8 " y" y+31,mobile - anothereden,,,,NA Pos
return

