startX=250
startY=70

Global hitboxHeight=10
Global hitboxWight=10

widowX=500
widowY=400

Global shag=10

periodGuiUpdateTimer:=100

Global backcolor=0xFF4500
Global colorsravnenia=0x000000

Global otstupDlaVihodaIzUglov:=1

Global pixelOffSetX:=2
Global pixelOffSety:=25
;==============================================================================
curentX:=startX
curentY:=startY
;===============================================================================

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

Gui, Show, h%widowY% w%widowX%, Masana
SetTimer, GuiUpdateTimer, %periodGuiUpdateTimer%
return


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
;MsgBox ERROR levaya to4ka%Xproveraemoitochkileft%, %Yproveraemoitochki% %CheckColorLeft%`n pravaya to4ka %Xproveraemoitochkiright%, %Yproveraemoitochki% %CheckColorRight%`n sravnivl s%colorsravnenia%
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
;MsgBox ERROR levaya to4ka%Xproveraemoitochki%, %Yproveraemoitochkiverh% %CheckColorverh%`n pravaya to4ka %Xproveraemoitochki%, %Yproveraemoitochkiniz% %CheckColorniz%`n sravnivl s%colorsravnenia%
	}
	
return 	curentXlocal
}

;===============================================================================
;===============================================================================
;===============================================================================
#IfWinActive Masana

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

;=======================================================
;секундомер
GuiUpdateTimer:
Gui, Submit , NoHide
guicontrol , move , %A_ScriptDir%\content\00.jpg , x%curentX% y%curentY%

return
