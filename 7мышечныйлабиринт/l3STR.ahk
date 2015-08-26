#IncludeAgain %A_ScriptDir%\muve.ahk
n=3
gui, font, s15
Gui, Add, Text,x10 y15, Пройдите весь лабиринт.

Gui, Color, %backcolor%
Gui, Add, Text,x10 y15, Пройдите весь лабиринт от Старта до Финиша.
Gui, Add, Text,x10 y35, Ведите курсором по черной дорожке, не заходя на серое поле.
Gui, Add, Picture,  h50 w80 x210 y60, %A_ScriptDir%\content\1.jpg
Gui, Add, Picture,  h50 w80 x210 y350, %A_ScriptDir%\content\1.jpg

Gui, Add, Picture,  h50 w200 x10 y60, %A_ScriptDir%\content\1.jpg

Gui, Add, Picture,  h100 w40 x10 y70, %A_ScriptDir%\content\1.jpg
Gui, Add, Picture,  h80 w20 x10 y230, %A_ScriptDir%\content\1.jpg
Gui, Add, Picture,  h90 w30 x460 y150, %A_ScriptDir%\content\1.jpg
Gui, Add, Picture,  h80 w5 x250 y300, %A_ScriptDir%\content\1.jpg
Gui, Add, Picture,  h40 w480 x10 y130, %A_ScriptDir%\content\1.jpg

Gui, Add, Picture,  h30 w480 x10 y210, %A_ScriptDir%\content\1.jpg

Gui, Add, Picture,  h20 w245 x10 y290, %A_ScriptDir%\content\1.jpg

Gui, Add, Picture,  h10 w10 x%curentX% y%curentY%, %A_ScriptDir%\content\00.jpg

SetTimer, GuiUpdateTimer, %periodGuiUpdateTimer%
Gui, Show, h400 w500, Untitled
return






if ((curentX>220)and(curentX<280)and(curentY>340)and(curentY<390)and(n=3))
{
SetTimer, GuiUpdateTimer, off
MsgBox, Поздравляем!`nВы маладец)
Gui, Destroy

}
