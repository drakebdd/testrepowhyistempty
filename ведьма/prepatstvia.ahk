startX=50
startY=150

Global hitboxHeight=30
Global hitboxWight=30

widowX=300
widowY=300

Global shag=10

periodGuiUpdateTimer:=100

Global foncolor=0xFF4500

Global otstupDlaVihodaIzUglov:=1
;==============================================================================
curentX:=startX
curentY:=startY
;===============================================================================

Gui, Color, %foncolor%
Gui, Add, Picture,  h30 w30 x%curentX% y%curentY%, %A_ScriptDir%\content\0.jpg
Gui, Add, Picture,  h100 w100 x100 y100, %A_ScriptDir%\content\00.jpg
Gui, Show, h%widowX% w%widowY%, Masana
SetTimer, GuiUpdateTimer, %periodGuiUpdateTimer%
return


;===============================================================================
shagVverh(curentXlocal,curentYlocal)
{
Xproveraemoitochkileft:=curentXlocal+otstupDlaVihodaIzUglov
Yproveraemoitochkileft:=curentYlocal-shag
PixelGetColor, CheckColorLeft, Xproveraemoitochkileft, Yproveraemoitochkileft,RGB
Xproveraemoitochkiright:=curentXlocal+hitboxWight-otstupDlaVihodaIzUglov
Yproveraemoitochkiright:=curentYlocal-shag
PixelGetColor, CheckColorRight, Xproveraemoitochkiright, Yproveraemoitochkiright,RGB
	
if ((CheckColorLeft=foncolor)and(CheckColorRight=foncolor))
{
curentYlocal:=curentYlocal-shag
}
Else
	{
curentYlocal:=curentYlocal
MsgBox ERROR levaya to4ka%Xproveraemoitochkileft%, %Yproveraemoitochkileft% %CheckColorLeft%`n pravaya to4ka %Xproveraemoitochkiright%, %Yproveraemoitochkiright% %CheckColorRight%`n sravnivl s%foncolor%
	}
	
return 	curentYlocal
}	
;===============================================================================	
shagVniz(curentXlocal,curentYlocal)
{
Xproveraemoitochkileft:=curentXlocal+otstupDlaVihodaIzUglov
Yproveraemoitochkileft:=curentYlocal+shag+hitboxHeight
PixelGetColor, CheckColorLeft, Xproveraemoitochkileft, Yproveraemoitochkileft,RGB
Xproveraemoitochkiright:=curentXlocal+hitboxWight-otstupDlaVihodaIzUglov
Yproveraemoitochkiright:=curentYlocal+shag+hitboxHeight
PixelGetColor, CheckColorRight, Xproveraemoitochkiright, Yproveraemoitochkiright,RGB
	
if ((CheckColorLeft=foncolor)or(CheckColorRight=foncolor))
{
curentYlocal:=curentYlocal+shag
}
Else
	{
curentYlocal:=curentYlocal
MsgBox ERROR levaya to4ka%Xproveraemoitochkileft%, %Yproveraemoitochkileft% %CheckColorLeft%`n pravaya to4ka %Xproveraemoitochkiright%, %Yproveraemoitochkiright% %CheckColorRight%`n sravnivl s%foncolor%
	}
	
return 	curentYlocal
}

;===============================================================================
;===============================================================================
;===============================================================================
#IfWinActive Masana

#InstallKeybdHook  
~SC011:: ;w
curentY:=shagVverh(curentX,curentY)
return

~SC01F:: ;s
curentY:=shagVniz(curentX,curentY)
return

~SC01E:: ;a
Xpos1:=curentX-shag
Ypos1:=curentY+otstupDlaVihodaIzUglov
PixelGetColor, color1, Xpos1, Ypos1,RGB
Xpos2:=curentX-shag
Ypos2:=curentY+hitboxHeight-otstupDlaVihodaIzUglov
PixelGetColor, color2, Xpos2, Ypos2,RGB
	
if ((color1=foncolor)and(color2=foncolor))
{
curentX:=curentX-shag
}
Else
	{
curentX:=curentX
MsgBox %Xpos1%, %Ypos1% %color1%`n%Xpos2%, %Ypos2% %color2%`n %foncolor%
	}
return

~SC020:: ;d
Xpos1:=curentX+hitboxWight+shag
Ypos1:=curentY+otstupDlaVihodaIzUglov
PixelGetColor, color1, Xpos1, Ypos1,RGB
Xpos2:=curentX+hitboxWight+shag
Ypos2:=curentY+hitboxHeight-otstupDlaVihodaIzUglov
PixelGetColor, color2, Xpos2, Ypos2,RGB
	
if ((color1=foncolor)and(color2=foncolor))
{
curentX:=curentX+shag
}
Else
	{
curentX:=curentX
MsgBox %Xpos1%, %Ypos1% %color1%`n%Xpos2%, %Ypos2% %color2%`n %foncolor%
	}
return

;=======================================================
;секундомер
GuiUpdateTimer:
Gui, Submit , NoHide
guicontrol , move , %A_ScriptDir%\content\0.jpg , x%curentX% y%curentY%

return