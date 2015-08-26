#IncludeAgain %A_ScriptDir%\muve.ahk
n=2
gui, font, s15
Gui, Add, Text,x10 y15, Пройдите весь лабиринт.

Gui, Color, %backcolor%
Gui, Add, Picture,  h50 w80 x210 y60, %A_ScriptDir%\content\1.jpg
Gui, Add, Picture,  h50 w80 x210 y350, %A_ScriptDir%\content\1.jpg

Gui, Add, Picture,  h60 w20 x220 y90, %A_ScriptDir%\content\1.jpg
Gui, Add, Picture,  h60 w20 x260 y310, %A_ScriptDir%\content\1.jpg

Gui, Add, Picture,  h20 w190 x230 y130, %A_ScriptDir%\content\1.jpg
Gui, Add, Picture,  h20 w180 x100 y310, %A_ScriptDir%\content\1.jpg
Gui, Add, Picture,  h20 w100 x10 y60, %A_ScriptDir%\content\1.jpg
Gui, Add, Picture,  h10 w100 x390 y60, %A_ScriptDir%\content\1.jpg
Gui, Add, Picture,  h10 w100 x10 y380, %A_ScriptDir%\content\1.jpg
Gui, Add, Picture,  h20 w100 x390 y370, %A_ScriptDir%\content\1.jpg

Gui, Add, Picture,  h320 w30 x10 y60, %A_ScriptDir%\content\1.jpg
Gui, Add, Picture,  h310 w30 x460 y60, %A_ScriptDir%\content\1.jpg
Gui, Add, Picture,  h170 w50 x90 y60, %A_ScriptDir%\content\1.jpg
Gui, Add, Picture,  h80 w30 x90 y310, %A_ScriptDir%\content\1.jpg
Gui, Add, Picture,  h70 w30 x390 y60, %A_ScriptDir%\content\1.jpg
Gui, Add, Picture,  h170 w50 x370 y220, %A_ScriptDir%\content\1.jpg

Gui, Add, Picture,  h20 w330 x90 y220, %A_ScriptDir%\content\1.jpg

Gui, Add, Picture,  h10 w10 x%curentX% y%curentY%, %A_ScriptDir%\content\00.jpg

SetTimer, GuiUpdateTimer, %periodGuiUpdateTimer%
Gui, Show, h400 w500, Untitled
return


if ((curentX>220)and(curentX<280)and(curentY>340)and(curentY<390)and(n=2))
{
SetTimer, GuiUpdateTimer, off
MsgBox, Поздравляем!`nВы переходите на 3 уровень!
Gui, Destroy
#IncludeAgain %A_ScriptDir%\l3STR.ahk
}

