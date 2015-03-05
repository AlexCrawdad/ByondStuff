mob
	proc
		CreateName(r=0,g=0,b=0)
			//return
			var/newname=TakeHTML(name)
			if(client)
				AddName(AtName(newname),color2Add=nameColor)
				return
			if(!client)
				var/lines=round(32/namefont.height)
				var/txt=namefont.GetLines(newname,width=96,maxlines=lines,\
				                            flags=DF_WRAP_ELLIPSIS)
				var/size=namefont.RoundUp32(namefont.GetWidth(txt))
				var/iconset/s=namefont.DrawText(txt,size/2,0,\
				                    width=size,maxlines=lines,\
				                    flags=DF_JUSTIFY_CENTER|DF_WRAP_ELLIPSIS,\
				                    icons_x=size/32,icons_y=1)
				s.Transparent()
				if(r<255||g<255||b<255)s.Blend(rgb(r,g,b),ICON_MULTIPLY)
				var/obj/O=new
				O.pixel_y=-32
				for(var/xx=0,xx<s.w,++xx)
					var/icon/ic=s.GetIcon(xx,0)
					if(ic)
						O.icon=ic
						O.pixel_x=(xx+(1-s.w)/2)*32
						O.layer=1005
						overlays+=O
			return


proc/TakeHTML(T as text)
	set background=1
	if(!istext(T))return
	if(!findtext(T,"<")||!findtext(T,">"))return T
	while(findtext(T,"<")&&findtext(T,">"))
		var/pre=copytext(T,1,findtext(T,"<"))
		var/pos=copytext(T,findtext(T,">")+1)
		T=pre+pos
	return T

proc/AtName(var/t)
	if(findtext(t,"@"))	return copytext(t,1,findtext(t,"@"))
	else return t
proc/AtAt(var/t)
	if(findtext(t,"@"))	return "@"
	else return ""
proc/AtAccount(var/t)
	if(findtext(t,"@"))	return copytext(t,findtext(t,"@")+1)
	else return ""
proc/Split(var/text2split,var/SplitBy)
	var/CurPos=1
	var/list/SplitList=list()
	while(findtext(text2split,SplitBy,CurPos,0))
		var/NextPos=findtext(text2split,SplitBy,CurPos,0)
		SplitList+=copytext(text2split,CurPos,NextPos)
		CurPos=NextPos+1
	if(CurPos<=length(text2split))	SplitList+=copytext(text2split,CurPos,0)
	return SplitList
proc/TrimSpaces(var/Text2Trim)
	while(length(Text2Trim)>=1 && copytext(Text2Trim,1,2)==" ")
		Text2Trim=copytext(Text2Trim,2,0)
	while(length(Text2Trim)>=2 && copytext(Text2Trim,length(Text2Trim),0)==" ")
		Text2Trim=copytext(Text2Trim,1,length(Text2Trim))
	return Text2Trim
proc/AsciiCheck(var/t as text)
	var/counter=0
	while(counter<=length(t)-1)
		counter+=1
		var/AscVal=text2ascii(t,counter)
		if(AscVal>=48 && AscVal<=57)continue
		if(AscVal>=65 && AscVal<=90)continue
		if(AscVal>=97 && AscVal<=122)continue
		if(AscVal==32)continue
		usr<<"Characters A-Z, 0-9, and Spaces Only!"
		return null
	return


var/obj/Supplemental/NameDisplay/AddNameObject=new()
obj/Supplemental/NameDisplay
	var/curColor
	icon='Text.dmi'
	layer=FLOAT_LAYER
atom/proc/AddName(var/Name2Add,var/textID="Name",var/yOffset=0,var/color2Add)
	Name2Add="[Name2Add]"
	for(var/I in overlays)if(I&&I:name==textID)overlays-=I
	if(!Name2Add)return
	var/PixelSpace=6;var/ThisLetter;var/CurPos=0
	var/px=((1*PixelSpace)-(length(Name2Add)*PixelSpace)/2)-PixelSpace
	while(CurPos<length(Name2Add))
		CurPos+=1;ThisLetter=copytext(Name2Add,CurPos,CurPos+1)
		if(SlimLetter(ThisLetter))px+=2
	CurPos=0
	while(src)
		CurPos+=1;ThisLetter=copytext(Name2Add,CurPos,CurPos+1)
		if(!ThisLetter)return
		px+=PixelSpace
		global.AddNameObject.name=textID
		global.AddNameObject.pixel_x=9+px
		global.AddNameObject.pixel_y=-10+yOffset
		global.AddNameObject.icon_state=ThisLetter
		if(SlimLetter(ThisLetter))px-=4
		if(LowLetter(ThisLetter))global.AddNameObject.pixel_y-=2
		if(isobj(src))color2Add=rgb(100,100,0)
		if(color2Add)
			if(global.AddNameObject.curColor!=color2Add)
				global.AddNameObject.curColor=color2Add
				global.AddNameObject.icon='Text.dmi'
				global.AddNameObject.icon+=color2Add
		else
			if(global.AddNameObject.curColor)
				global.AddNameObject.curColor=null
				global.AddNameObject.icon='Text.dmi'
		overlays+=global.AddNameObject
proc/LowLetter(var/L)
	if(L=="g"||L=="j"||L=="p"||L=="q"||L=="y"||L==",")return 1
	else return 0
proc/SlimLetter(var/L)
	if(L=="i"||L=="l"||L==","||L=="."||L=="'"||L=="!"||L==":")return 1
	else return 0
