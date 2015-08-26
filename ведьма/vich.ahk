x=10
y=10

xpola=300
ypola=300

hper=30
wper=30

shag=10

xprepatstvia1=100
yprepatstvia1=100
xprepatstvia2=200
yprepatstvia2=200

xmax:=xpola-wper-shag
ymax:=ypola-hper-shag

xprepatstvia1real:=xprepatstvia1-wper
yprepatstvia1real:=yprepatstvia1-hper
xprepatstvia2real=xprepatstvia2
yprepatstvia2real=yprepatstvia2

Gui, Add, Picture,  h30 w30 x%x% y%y%, %A_ScriptDir%\content\0.jpg
Gui, Add, Picture,  h100 w100 x100 y100, %A_ScriptDir%\content\00.jpg
Gui, Show, h%xpola% w%ypola%, Untitled

return


~SC011:: ;w

MouseGetPos, Xpos, Ypos

PixelGetColor, r, Xpos, Ypos
	if ((r=0xF0F0F0))
	{
	MsgBox это фон
	}
	else
	{
	MsgBox %r%
	}
	return