#IncludeAgain %A_ScriptDir%\muve.ahk
n=1
gui, font, s15
Gui, Add, Text,x10 y15, Пройдите весь лабиринт.

Gui, Color, %backcolor%

Gui, Add, Picture,  h50 w80 x210 y60, %A_ScriptDir%\content\1.jpg
Gui, Add, Picture,  h50 w80 x210 y350, %A_ScriptDir%\content\1.jpg

Gui, Add, Picture,  h50 w40 x230 y90, %A_ScriptDir%\content\1.jpg
Gui, Add, Picture,  h50 w40 x230 y320, %A_ScriptDir%\content\1.jpg

Gui, Add, Picture,  h20 w200 x70 y130, %A_ScriptDir%\content\1.jpg
Gui, Add, Picture,  h20 w200 x230 y310, %A_ScriptDir%\content\1.jpg

Gui, Add, Picture,  h70 w30 x70 y150, %A_ScriptDir%\content\1.jpg
Gui, Add, Picture,  h70 w30 x400 y240, %A_ScriptDir%\content\1.jpg

Gui, Add, Picture,  h20 w360 x70 y220, %A_ScriptDir%\content\1.jpg

Gui, Add, Picture,  h10 w10 x%curentX% y%curentY%, %A_ScriptDir%\content\00.jpg

SetTimer, GuiUpdateTimer, %periodGuiUpdateTimer%
Gui, Show, h400 w500, Untitled
return

;=======================================================
;секундомер
GuiUpdateTimer:
Gui, Submit , NoHide
guicontrol , move , %A_ScriptDir%\content\00.jpg , x%curentX% y%curentY%




if ((curentX>220)and(curentX<280)and(curentY>340)and(curentY<390)and(n=1))
{
SetTimer, GuiUpdateTimer, off
MsgBox, Поздравляем!`nВы переходите на 2 уровень!
sleep 1000
n=2
Gui, Destroy
#IncludeAgain %A_ScriptDir%\l2STR.ahk
}
return
;===============================================================================
;===============================================================================
;===============================================================================
shagVverh(curentXlocal,curentYlocal,napravlenie)
{
	if (napravlenie = "vverh")
	{
	Yproveraemoitochki:=curentYlocal-shag+pixelOffSety+otstupDlaVihodaIzUglov
	}
	Else
	{
	Yproveraemoitochki:=curentYlocal+shag+hitboxHeight+pixelOffSety-otstupDlaVihodaIzUglov
	}

Xproveraemoitochkileft:=curentXlocal+otstupDlaVihodaIzUglov+pixelOffSetX
PixelGetColor, CheckColorLeft, Xproveraemoitochkileft, Yproveraemoitochki,RGB
Xproveraemoitochkiright:=curentXlocal+hitboxWight-otstupDlaVihodaIzUglov+pixelOffSetX
PixelGetColor, CheckColorRight, Xproveraemoitochkiright, Yproveraemoitochki,RGB
	
if ((CheckColorLeft=colorsravnenia)and(CheckColorRight=colorsravnenia))
{
		if (napravlenie = "vverh")
	{
	curentYlocal:=curentYlocal-shag
	}
	Else
	{
	curentYlocal:=curentYlocal+shag
	}
	
}
Else
	{
curentYlocal:=curentYlocal
;MsgBox levaya to4ka%Xproveraemoitochkileft%, %Yproveraemoitochki% %CheckColorLeft%`n pravaya to4ka %Xproveraemoitochkiright%, %Yproveraemoitochki% %CheckColorRight%`n sravnivl s%colorsravnenia%
	}
	
return 	curentYlocal
}	

;===============================================================================
shagVbok(curentXlocal,curentYlocal,napravlenie)
{
	if (napravlenie = "vlevo")
	{
	Xproveraemoitochki:=curentXlocal-shag+pixelOffSetx+otstupDlaVihodaIzUglov
	}
	Else
	{
	Xproveraemoitochki:=curentXlocal+shag+hitboxWight+pixelOffSetx-otstupDlaVihodaIzUglov
	}

Yproveraemoitochkiverh:=curentYlocal+otstupDlaVihodaIzUglov+pixelOffSetY
PixelGetColor, CheckColorVerh, Xproveraemoitochki, Yproveraemoitochkiverh,RGB
Yproveraemoitochkiniz:=curentYlocal+hitboxHeight-otstupDlaVihodaIzUglov+pixelOffSetY
PixelGetColor, CheckColorNiz, Xproveraemoitochki, Yproveraemoitochkiniz,RGB
	
if ((CheckColorVerh=colorsravnenia)and(CheckColorNiz=colorsravnenia))
{
		if (napravlenie = "vlevo")
	{
	curentXlocal:=curentXlocal-shag
	}
	Else
	{
	curentXlocal:=curentXlocal+shag
	}
	
}
Else
	{
curentXlocal:=curentXlocal
;MsgBox levaya to4ka%Xproveraemoitochki%, %Yproveraemoitochkiverh% %CheckColorverh%`n pravaya to4ka %Xproveraemoitochki%, %Yproveraemoitochkiniz% %CheckColorniz%`n sravnivl s%colorsravnenia%
	}
	
return 	curentXlocal
}

;===============================================================================
;===============================================================================
;===============================================================================


#InstallKeybdHook  
~SC011:: ;w
curentY:=shagVverh(curentX,curentY,"vverh")
return

~SC01F:: ;s
curentY:=shagVverh(curentX,curentY,"vniz")
return

~SC01E:: ;a
curentX:=shagVbok(curentX,curentY,"vlevo")
return


~SC020:: ;d
curentX:=shagVbok(curentX,curentY,"vpravo")
return






