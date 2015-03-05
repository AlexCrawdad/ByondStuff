mob
	verb
		JoinGame()
			set hidden = 1
			set category = null
			winset(src,"Splash","is-visible=false")
			winset(src,"Login","is-visible=true")
			winset(src,"Login","pos=50x500")
			winset(src,"Bars","is-visible=true")
			src.client.view = 8

mob
	verb
		CharNew()
			set hidden = 1
			set category = null
			if(usr.clickdelay)return
			usr.clickdelay=1
			spawn(5)if(usr)usr.clickdelay=0
			usr.AddSlots("New")
		CharLoad()
			set hidden = 1
			set category = null
			if(usr.clickdelay)return
			usr.clickdelay=1
			spawn(5)if(usr)usr.clickdelay=0
			usr.AddSlots("Load")
		CharDelete()
			set hidden = 1
			set category = null
			if(usr.clickdelay)return
			usr.clickdelay=1
			spawn(5)if(usr)usr.clickdelay=0
			usr.AddSlots("Delete")

mob
	var/tmp/clickdelay=0
	proc
		DeleteChar(S)
			switch(S)
				if(1)
					if(fexists("Player Saves/[ckey]/Slot 1.sav"))
						switch(alert("Do you want to delete your current character?","Delete: Slot 1","Delete","Cancel"))
							if("Delete")
								var/delname=""
								var/savefile/F=new("Player Saves/[ckey]/Slot 1.sav")
								F["name"]>>delname
								var/savefile/N=new("World Save Files/Player Names.sav")
								NameList.Remove(lowertext(delname))
								N["NameList"]<<NameList
								fdel("Player Saves/[ckey]/Slot 1.sav")
								src<<"<font color=red>Slot 1 Deleted!"
								client.screen=null
								spawn(15)if(src)clickdelay=0
					else
						src<<"<font color=red>Slot 1 is empty!"
						client.screen=null
						spawn(15)if(src)clickdelay=0
				if(2)
					if(fexists("Player Saves/[ckey]/Slot 2.sav"))
						switch(alert("Do you want to delete your current character?","Delete: Slot 2","Delete","Cancel"))
							if("Delete")
								var/delname
								var/savefile/F=new("Player Saves/[ckey]/Slot 2.sav")
								F["name"]>>delname
								var/savefile/N=new("World Save Files/Player Names.sav")
								NameList.Remove(lowertext(delname))
								N["NameList"]<<NameList
								fdel("Player Saves/[ckey]/Slot 2.sav")
								src<<"<font color=red>Slot 2 Deleted!"
								client.screen=null
								spawn(15)if(src)clickdelay=0
					else
						src<<"<font color=red>Slot 2 is empty!"
						client.screen=null
						spawn(15)if(src)clickdelay=0
				if(3)
					if(fexists("Player Saves/[ckey]/Slot 3.sav"))
						switch(alert("Do you want to delete your current character?","Delete: Slot 3","Delete","Cancel"))
							if("Delete")
								var/delname
								var/savefile/F=new("Player Saves/[ckey]/Slot 3.sav")
								F["name"]>>delname
								var/savefile/N=new("World Save Files/Player Names.sav")
								NameList.Remove(lowertext(delname))
								N["NameList"]<<NameList
								fdel("Player Saves/[ckey]/Slot 3.sav")
								src<<"<font color=red>Slot 3 Deleted!"
								client.screen=null
								spawn(15)if(src)clickdelay=0
					else
						src<<"<font color=red>Slot 3 is empty!"
						client.screen=null
						spawn(15)if(src)clickdelay=0
		AddSlots(T)
			client.screen=null
			switch(T)
				if("New")
					var/obj/LoginStuff/Slot1New/S1=new
					var/obj/LoginStuff/Slot2New/S2=new
					var/obj/LoginStuff/Slot3New/S3=new
					var/obj/LoginStuff/S1N/SN1=new
					var/obj/LoginStuff/S2N/SN2=new
					var/obj/LoginStuff/S3N/SN3=new
					client.screen.Add(S1,S2,S3,SN1,SN2,SN3)
					if(fexists("Player Saves/[ckey]/Slot 1.sav"))
						var/savefile/F=new("Player Saves/[usr.ckey]/Slot 1.sav")
						F["PI"]>>SN1.icon
					if(fexists("Player Saves/[ckey]/Slot 2.sav"))
						var/savefile/F=new("Player Saves/[usr.ckey]/Slot 2.sav")
						F["PI"]>>SN2.icon
					if(fexists("Player Saves/[ckey]/Slot 3.sav"))
						var/savefile/F=new("Player Saves/[ckey]/Slot 3.sav")
						F["PI"]>>SN3.icon
				if("Load")
					var/obj/LoginStuff/Slot1Load/S1=new
					var/obj/LoginStuff/Slot2Load/S2=new
					var/obj/LoginStuff/Slot3Load/S3=new
					var/obj/LoginStuff/S1L/SN1=new
					var/obj/LoginStuff/S2L/SN2=new
					var/obj/LoginStuff/S3L/SN3=new
					client.screen.Add(S1,S2,S3,SN1,SN2,SN3)
					if(fexists("Player Saves/[ckey]/Slot 1.sav"))
						var/savefile/F=new("Player Saves/[ckey]/Slot 1.sav")
						F["PI"]>>SN1.icon
					if(fexists("Player Saves/[ckey]/Slot 2.sav"))
						var/savefile/F=new("Player Saves/[ckey]/Slot 2.sav")
						F["PI"]>>SN2.icon
					if(fexists("Player Saves/[ckey]/Slot 3.sav"))
						var/savefile/F=new("Player Saves/[ckey]/Slot 3.sav")
						F["PI"]>>SN3.icon
				if("Delete")
					var/obj/LoginStuff/Slot1Delete/S1=new
					var/obj/LoginStuff/Slot2Delete/S2=new
					var/obj/LoginStuff/Slot3Delete/S3=new
					var/obj/LoginStuff/S1D/SN1=new
					var/obj/LoginStuff/S2D/SN2=new
					var/obj/LoginStuff/S3D/SN3=new
					client.screen.Add(S1,S2,S3,SN1,SN2,SN3)
					if(fexists("Player Saves/[ckey]/Slot 1.sav"))
						var/savefile/F=new("Player Saves/[ckey]/Slot 1.sav")
						F["PI"]>>SN1.icon
					if(fexists("Player Saves/[ckey]/Slot 2.sav"))
						var/savefile/F=new("Player Saves/[ckey]/Slot 2.sav")
						F["PI"]>>SN2.icon
					if(fexists("Player Saves/[ckey]/Slot 3.sav"))
						var/savefile/F=new("Player Saves/[ckey]/Slot 3.sav")
						F["PI"]>>SN3.icon



turf
	SaveButton
		icon='Done.dmi'
		layer=999
		Click()
			if(usr.clickdelay)return
			usr.clickdelay=1
			spawn(5)if(usr)usr.clickdelay=0
			usr.CreateNewChar()
obj
	NameIcons
		layer=5
		icon='Login Races.dmi'
		name=""
		RS1
			icon_state = "rs1"
		RS2
			icon_state = "rs2"
		SC1
			icon_state = "sc1"
			screen_loc="7,6"
		SC2
			icon_state = "sc2"
			screen_loc="8,6"
		Hair
			icon_state = "hair"
			screen_loc="7,5"
	LoginStuff
		layer=5
		icon='Login Stuff.dmi'
		name=""
		SavingChar1
			icon_state="saving1"
			layer=1000
			screen_loc="8,2"
			New()
				..()
				pixel_x=-32
				src.overlays+=new/obj/LoginStuff/SavingChar2
				src.overlays+=new/obj/LoginStuff/SavingChar3
		SavingChar2
			icon_state="saving2"
			New()
				..()
				pixel_x=32
		SavingChar3
			icon_state="saving3"
			New()
				..()
				pixel_x=64
		S1N
			mouse_opacity=0
			screen_loc="2,14"
		S2N
			mouse_opacity=0
			screen_loc="3,14"
		S3N
			mouse_opacity=0
			screen_loc="4,14"
		S1L
			mouse_opacity=0
			screen_loc="2,10"
		S2L
			mouse_opacity=0
			screen_loc="3,10"
		S3L
			mouse_opacity=0
			screen_loc="4,10"
		S1D
			mouse_opacity=0
			screen_loc="2,5"
		S2D
			mouse_opacity=0
			screen_loc="3,5"
		S3D
			mouse_opacity=0
			screen_loc="4,5"
		Nothing1
			layer=999
			icon_state="nothing1"
		Nothing2
			layer=999
			icon_state="nothing2"
		Slot1New
			icon_state="slot1"
			screen_loc="2,14"
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				if(fexists("Player Saves/[usr.ckey]/Slot 1.sav"))
					switch(alert("Do you want to overwrite your current character?","Overwrite: Slot 1","Overwrite","Cancel"))
						if("Cancel")
							spawn(15)if(usr)usr.clickdelay=0
							return
						else
							var/delname
							var/savefile/F=new("Player Saves/[usr.ckey]/Slot 1.sav")
							F["name"]>>delname
							var/savefile/N=new("World Save Files/Player Names.sav")
							NameList.Remove(lowertext(delname))
							N["NameList"]<<NameList
							fdel("Player Saves/[usr.ckey]/Slot 1.sav")
							usr<<"<font color=red>Slot 1 Deleted!"
							spawn(15)if(usr)usr.clickdelay=0
							usr.client.screen=null
							src.overlays=null
				else
					usr.client.screen=null
					usr.loc = locate(43,8,6)
					usr.save_file_1=1
					usr.save_file_2=0
					usr.save_file_3=0
					winset(usr,"Login","is-visible=false")
					usr.AddHUD()
					winset(src,"MainMapPan.Race_Info","text=\"-Powerfull Android-\"")
					winset(src,"MainMapPan","pos=44,20;is-visible=true")
					spawn(50000)	if(src)	{winset(src,"Race_Info","is-visible=false");}
		Slot2New
			icon_state="slot2"
			screen_loc="3,14"
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				if(fexists("Player Saves/[usr.ckey]/Slot 2.sav"))
					switch(alert("Do you want to overwrite your current character?","Overwrite: Slot 2","Overwrite","Cancel"))
						if("Cancel")
							spawn(15)if(usr)usr.clickdelay=0
							return
						else
							var/delname
							var/savefile/F=new("Player Saves/[usr.ckey]/Slot 2.sav")
							F["name"]>>delname
							var/savefile/N=new("World Save Files/Player Names.sav")
							NameList.Remove(lowertext(delname))
							N["NameList"]<<NameList
							fdel("Player Saves/[usr.ckey]/Slot 2.sav")
							usr<<"<font color=red>Slot 2 Deleted!"
							spawn(15)if(usr)usr.clickdelay=0
							usr.client.screen=null
							src.overlays=null
				else
					usr.client.screen=null
					usr.loc = locate(43,8,6)
					usr.save_file_1=0
					usr.save_file_2=1
					usr.save_file_3=0
					winset(usr,"Login","is-visible=false")
					usr.AddHUD()
		Slot3New
			icon_state="slot3"
			screen_loc="4,14"
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				if(fexists("Player Saves/[usr.ckey]/Slot 3.sav"))
					switch(alert("Do you want to overwrite your current character?","Overwrite: Slot 3","Overwrite","Cancel"))
						if("Cancel")
							spawn(15)if(usr)usr.clickdelay=0
							return
						else
							var/delname
							var/savefile/F=new("Player Saves/[usr.ckey]/Slot 3.sav")
							F["name"]>>delname
							var/savefile/N=new("World Save Files/Player Names.sav")
							NameList.Remove(lowertext(delname))
							N["NameList"]<<NameList
							fdel("Player Saves/[usr.ckey]/Slot 3.sav")
							usr<<"<font color=red>Slot 3 Deleted!"
							spawn(15)if(usr)usr.clickdelay=0
							usr.client.screen=null
							src.overlays=null
				else
					usr.client.screen=null
					usr.loc = locate(43,8,6)
					usr.save_file_1=0
					usr.save_file_2=0
					usr.save_file_3=1
					winset(usr,"Login","is-visible=false")
					usr.AddHUD()
		Slot1Load
			icon_state="slot1"
			screen_loc="2,10"
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				if(fexists("Player Saves/[usr.ckey]/Slot 1.sav"))
					winset(usr,"Login","is-visible=false")
					usr.client.LoadChar(1)
				else
					usr<<"<font color=red>Slot 1 is empty!"
					spawn(15)if(usr)usr.clickdelay=0
		Slot2Load
			icon_state="slot2"
			screen_loc="3,10"
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				if(fexists("Player Saves/[usr.ckey]/Slot 2.sav"))
					winset(usr,"Login","is-visible=false")
					usr.client.LoadChar(2)
				else
					usr<<"<font color=red>Slot 2 is empty!"
					spawn(15)if(usr)usr.clickdelay=0
		Slot3Load
			icon_state="slot3"
			screen_loc="4,10"
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				if(fexists("Player Saves/[usr.ckey]/Slot 3.sav"))
					winset(usr,"Login","is-visible=false")
					usr.client.LoadChar(3)
				else
					usr<<"<font color=red>Slot 3 is empty!"
					spawn(15)if(usr)usr.clickdelay=0
		Slot1Delete
			icon_state="slot1"
			screen_loc="2,5"
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				usr.DeleteChar(1)
		Slot2Delete
			icon_state="slot2"
			screen_loc="3,5"
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				usr.DeleteChar(2)
		Slot3Delete
			icon_state="slot3"
			screen_loc="4,5"
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				usr.DeleteChar(3)
		ArrowL
			icon_state="arrowl"
			layer=999
			screen_loc="8,6"
			Click()
				if(src.icon_state=="arrowls"||src.icon_state=="arrowrs"||usr.clickdelay)return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.ScrollSkin("RIGHT")
		ArrowR
			icon_state="arrowr"
			layer=999
			screen_loc="10,6"
			Click()
				if(src.icon_state=="arrowls"||src.icon_state=="arrowrs"||usr.clickdelay)return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.ScrollSkin("LEFT")
		ArrowT
			icon_state="arrowt"
			layer=999
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.ScrollRace("UP")
		ArrowB
			icon_state="arrowb"
			layer=999
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.ScrollRace("DOWN")
		RaceL
			icon_state="arrowl"
			layer=999
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.ScrollRace("DOWN")
		RaceR
			icon_state="arrowr"
			layer=999
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.ScrollRace("UP")
		CharPreview
			icon_state="1race1"
			layer=998
			screen_loc="9,9"
		CharHair
			icon_state="hair1"
			layer=999
			screen_loc="9,5"
		CharRace1
			icon='Login Races.dmi'
			icon_state="1-1"
			layer=999
			screen_loc="10,9"
		CharRace2
			icon='Login Races.dmi'
			icon_state="1-2"
			layer=999
			screen_loc="11,9"
		CharDesc
			layer=999
			screen_loc="5,14"
		RaceZero
			icon_state="KI"
			layer=999
			screen_loc="9,7"
		RaceOne
			icon_state="KIDEF"
			layer=999
			screen_loc="10,7"
		RaceSkin
			icon_state="skinwhite"
			layer=999
			screen_loc="9,6"
		HairL
			icon_state="hairl"
			screen_loc="8,5"
			layer=999
			Click()
				if(src.icon_state=="arrowls"||src.icon_state=="arrowrs"||usr.clickdelay)return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				if(usr.charrace!=1&&usr.charrace!=8&&usr.charrace!=9&&usr.charrace!=17)return
				usr.ScrollHair("LEFT")
		HairR
			icon_state="hairr"
			layer=999
			screen_loc="10,5"
			Click()
				if(src.icon_state=="arrowls"||src.icon_state=="arrowrs"||usr.clickdelay)return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				if(usr.charrace!=1&&usr.charrace!=8&&usr.charrace!=9&&usr.charrace!=17)return
				usr.ScrollHair("RIGHT")
		CharDiff
			CharDiff1
				icon='Star1.dmi'
				icon_state="4"
				layer=999
				screen_loc="3,9:11"
			CharDiff2
				icon='Star2.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:12,9:11"
			CharDiff3
				icon='Star3.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:24,9:11"
			CharDiff4
				icon='Star4.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:36,9:11"
			CharDiff5
				icon='Star5.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:48,9:11"
		CharPL
			CharPL1
				icon='PL1.dmi'
				icon_state="4"
				layer=999
				screen_loc="3,13"
			CharPL2
				icon='PL2.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:12,13"
			CharPL3
				icon='PL3.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:22,13"
			CharPL4
				icon='PL4.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:34,13"
			CharPL5
				icon='PL5.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:46,13"
		CharKI
			CharKI1
				icon='PL1.dmi'
				icon_state="4"
				layer=999
				screen_loc="3,12"
			CharKI2
				icon='PL2.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:12,12"
			CharKI3
				icon='PL3.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:22,12"
			CharKI4
				icon='PL4.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:34,12"
			CharKI5
				icon='PL5.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:46,12"
		CharStr
			CharStr1
				icon='PL1.dmi'
				icon_state="4"
				layer=999
				screen_loc="3,11"
			CharStr2
				icon='PL2.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:12,11"
			CharStr3
				icon='PL3.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:22,11"
			CharStr4
				icon='PL4.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:34,11"
			CharStr5
				icon='PL5.dmi'
				icon_state="4"
				layer=999
				screen_loc="3:46,11"
		CharDef
			CharDef1
				icon='PL1.dmi'
				icon_state="3"
				layer=999
				screen_loc="3,10"
			CharDef2
				icon='PL2.dmi'
				icon_state="3"
				layer=999
				screen_loc="3:12,10"
			CharDef3
				icon='PL3.dmi'
				icon_state="3"
				layer=999
				screen_loc="3:22,10"
			CharDef4
				icon='PL4.dmi'
				icon_state="3"
				layer=999
				screen_loc="3:34,10"
			CharDef5
				icon='PL5.dmi'
				icon_state="3"
				layer=999
				screen_loc="3:46,10"
turf
	LoginStuff
		layer=5
		icon='Login Stuff.dmi'
		name=""
		Title1
			icon='DBZ.gif'
			density=1
		Title2
			icon='gokuvsbills.gif'
			density=1
		Title3
			icon='dragon-ball-z-wallpaper-12.jpg'
			density=1
		Title4
			icon='DBZ3.jpg'
			density=1
		BG
			icon_state="bg"
		BGT
			icon_state="bgt"
		BGB
			icon_state="bgb"
		BGL
			icon_state="bgl"
		BGR
			icon_state="bgr"
		FrameL
			icon_state="framel"
			layer=999
		FrameR
			icon_state="framer"
			layer=999
		FrameT
			icon_state="framet"
			layer=999
		FrameB
			icon_state="frameb"
			layer=999
		Race
			icon='Login Races.dmi'
			icon_state="race"
		CharNew
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.AddSlots("New")
		CharLoad
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.AddSlots("Load")
		CharDelete
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.AddSlots("Delete")
		CharSave
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.CreateNewChar()
		CharCancel
			Click()
				if(usr.clickdelay)return
				usr.clickdelay=1
				spawn(5)if(usr)usr.clickdelay=0
				usr.client.screen=null
		Pl
			icon='PL.png'
		Ki
			icon='KI.png'
		Str
			icon='STR.png'
		Def
			icon='DEF.png'
		TrainingDiff
			icon='TD.png'
		CharCreation
			icon='Character Creation.png'
		StatDist
			icon='Stat Distribution.png'
		PointsLeft
			icon='Points Left.png'
		SaveChar
			icon='Save.png'
			pixel_y=14
		Stats
			icon='Stats.png'
mob
	var
		tmp
			charrace=1
			charskin=1
			charhair=1
			newrace="Android"
			newskin="tan"
			newhair="Bald"
			statpoints=5
		statpl=0
		statki=0
		statstr=0
		statdef=0
		stattrain=0
	proc
		AddHUD()
			src.client.screen=null
			sleep(1)
			if(!src)return
			src.client.screen+=new/obj/LoginStuff/CharRace1
			src.client.screen+=new/obj/LoginStuff/CharRace2
			src.client.screen+=new/obj/LoginStuff/CharPreview
			src.client.screen+=new/obj/LoginStuff/CharHair
			src.client.screen+=new/obj/LoginStuff/RaceSkin
			src.client.screen+=new/obj/LoginStuff/HairR
			src.client.screen+=new/obj/LoginStuff/HairL
			src.client.screen+=new/obj/LoginStuff/ArrowL
			src.client.screen+=new/obj/LoginStuff/ArrowR
			src.client.screen+=new/obj/LoginStuff/RaceZero
			src.client.screen+=new/obj/LoginStuff/RaceOne
			src.client.screen+=new/obj/NameIcons/SC1
			src.client.screen+=new/obj/NameIcons/SC2
			src.client.screen+=new/obj/NameIcons/Hair
			spawn(15)if(src)src.clickdelay=0
		ScrollHair(var/A)
			if(A=="LEFT")
				src.charhair+=1
				if(src.charhair>9)charhair=1
			if(A=="RIGHT")
				src.charhair-=1
				if(src.charhair<1)charhair=9
			if(src.charrace==1||src.charrace==8||src.charrace==9||src.charrace==17)
				for(var/obj/LoginStuff/CharHair/H in src.client.screen)
					switch(charhair)
						if(1)
							src.newhair="Bald"
							H.icon_state="hair1"
						if(2)
							src.newhair="Goku"
							H.icon_state="hair2"
						if(3)
							src.newhair="Vegeta"
							H.icon_state="hair3"
						if(4)
							src.newhair="Teen Gohan"
							H.icon_state="hair4"
						if(5)
							src.newhair="Adult Gohan"
							H.icon_state="hair5"
						if(6)
							src.newhair="Future Gohan"
							H.icon_state="hair6"
						if(7)
							src.newhair="Hercule"
							H.icon_state="hair7"
						if(8)
							src.newhair="Raditz"
							H.icon_state="hair8"
						if(9)
							src.newhair="Trunks Long"
							H.icon_state="hair9"
		ScrollRace(var/A)
			if(A=="UP")
				src.charrace+=1
				if(src.charrace>20)charrace=1
			if(A=="DOWN")
				src.charrace-=1
				if(src.charrace<1)charrace=20
			if(src.charrace==1||src.charrace==8||src.charrace==9||src.charrace==17)
				for(var/obj/LoginStuff/ArrowL/AL in src.client.screen)AL.icon_state="arrowl"
				for(var/obj/LoginStuff/ArrowR/AR in src.client.screen)AR.icon_state="arrowr"
				for(var/obj/LoginStuff/HairL/HL in src.client.screen)HL.icon_state="hairl"
				for(var/obj/LoginStuff/HairR/HR in src.client.screen)HR.icon_state="hairr"
				for(var/obj/LoginStuff/RaceSkin/RS in src.client.screen)RS.icon_state="skinwhite"
				for(var/obj/NameIcons/Hair/H in src.client.screen)H.icon_state="hair"
				for(var/obj/NameIcons/SC1/R in src.client.screen)R.icon_state="sc1"
				for(var/obj/NameIcons/SC2/R in src.client.screen)R.icon_state="sc2"
				for(var/obj/LoginStuff/CharPreview/CP in src.client.screen)CP.icon_state="[charskin]race[charrace]"
			else
				for(var/obj/LoginStuff/ArrowL/AL in src.client.screen)AL.icon_state="arrowls"
				for(var/obj/LoginStuff/ArrowR/AR in src.client.screen)AR.icon_state="arrowrs"
				for(var/obj/LoginStuff/HairL/HL in src.client.screen)HL.icon_state="arrowls"
				for(var/obj/LoginStuff/HairR/HR in src.client.screen)HR.icon_state="arrowrs"
				for(var/obj/LoginStuff/RaceSkin/RS in src.client.screen)RS.icon_state=""
				for(var/obj/NameIcons/Hair/H in src.client.screen)H.icon_state=""
				for(var/obj/NameIcons/SC1/R in src.client.screen)R.icon_state=""
				for(var/obj/NameIcons/SC2/R in src.client.screen)R.icon_state=""
				for(var/obj/LoginStuff/CharPreview/CP in src.client.screen)CP.icon_state="race[charrace]"
			for(var/obj/LoginStuff/CharRace1/CR1 in src.client.screen)
				for(var/obj/LoginStuff/CharRace2/CR2 in src.client.screen)
					for(var/obj/LoginStuff/RaceZero/RZ in src.client.screen)
						for(var/obj/LoginStuff/RaceOne/RO in src.client.screen)
							switch(charrace)
								if(1)
									CR1.icon_state="1-1"
									CR2.icon_state="1-2"
									RZ.icon_state="KI"
									RO.icon_state="KIDEF"
									src.newrace="Android"
									for(var/obj/LoginStuff/CharHair/O in src.client.screen)O.layer=999
								if(2)
									CR1.icon_state="2-1"
									CR2.icon_state="2-2"
									RZ.icon_state="TrainEase"
									RO.icon_state="PL"
									src.newrace="Bio-Android"
									for(var/obj/LoginStuff/CharHair/O in src.client.screen)O.layer=1
								if(3)
									CR1.icon_state="18-1"
									CR2.icon_state="18-2"
									src.newrace="Bio-Warrior"
									RZ.icon_state="STR"
									RO.icon_state="DEF"
									for(var/obj/LoginStuff/CharHair/O in src.client.screen)O.layer=1
								if(4)
									CR1.icon_state="4-1"
									CR2.icon_state="4-2"
									src.newrace="Changeling"
									RZ.icon_state="KI"
									RO.icon_state="KIDEF"
									for(var/obj/LoginStuff/CharHair/O in src.client.screen)O.layer=1
								if(5)
									CR1.icon_state="5"
									CR2.icon_state=""
									src.newrace="Demon"
									RZ.icon_state="KI"
									RO.icon_state="KIDEF"
									for(var/obj/LoginStuff/CharHair/O in src.client.screen)O.layer=1
								if(6)
									CR1.icon_state="6-1"
									CR2.icon_state="6-2"
									src.newrace="Dragon"
									RZ.icon_state="TrainEase"
									RO.icon_state="PL"
									for(var/obj/LoginStuff/CharHair/O in src.client.screen)O.layer=1
								if(7)
									CR1.icon_state="3-1"
									CR2.icon_state="3-2"
									src.newrace="Galactic Warrior"
									RZ.icon_state="TrainEase"
									RO.icon_state="PL"
									for(var/obj/LoginStuff/CharHair/O in src.client.screen)O.layer=1
								if(8)
									CR1.icon_state="7-1"
									CR2.icon_state="7-2"
									src.newrace="Half Saiyan"
									RZ.icon_state="KI"
									RO.icon_state="KIDEF"
									for(var/obj/LoginStuff/CharHair/O in src.client.screen)O.layer=999
								if(9)
									CR1.icon_state="8"
									CR2.icon_state=""
									src.newrace="Human"
									RZ.icon_state="STR"
									RO.icon_state="DEF"
									for(var/obj/LoginStuff/CharHair/O in src.client.screen)O.layer=999
								if(10)
									CR1.icon_state="9-1"
									CR2.icon_state="9-2"
									src.newrace="Ultimate Hybrid"
									RZ.icon_state="TrainEase"
									RO.icon_state="PL"
									for(var/obj/LoginStuff/CharHair/O in src.client.screen)O.layer=1
								if(11)
									CR1.icon_state="10"
									CR2.icon_state=""
									src.newrace="Kai"
									RZ.icon_state="KI"
									RO.icon_state="KIDEF"
									for(var/obj/LoginStuff/CharHair/O in src.client.screen)O.layer=1
								if(12)
									CR1.icon_state="11"
									CR2.icon_state=""
									src.newrace="Konat"
									RZ.icon_state="STR"
									RO.icon_state="DEF"
									for(var/obj/LoginStuff/CharHair/O in src.client.screen)O.layer=1
								if(13)
									CR1.icon_state="12"
									CR2.icon_state=""
									src.newrace="Majin"
									RZ.icon_state="KI"
									RO.icon_state="KIDEF"
									for(var/obj/LoginStuff/CharHair/O in src.client.screen)O.layer=1
								if(14)
									CR1.icon_state="13"
									CR2.icon_state=""
									src.newrace="Makyo"
									RZ.icon_state="STR"
									RO.icon_state="DEF"
									for(var/obj/LoginStuff/CharHair/O in src.client.screen)O.layer=1
								if(15)
									CR1.icon_state="14-1"
									CR2.icon_state="14-2"
									src.newrace="Namekian"
									RZ.icon_state="TrainEase"
									RO.icon_state="PL"
									for(var/obj/LoginStuff/CharHair/O in src.client.screen)O.layer=1
								if(16)
									CR1.icon_state="15-1"
									CR2.icon_state="15-2"
									src.newrace="Saibaman"
									RZ.icon_state="STR"
									RO.icon_state="DEF"
									for(var/obj/LoginStuff/CharHair/O in src.client.screen)O.layer=1
								if(17)
									CR1.icon_state="16-1"
									CR2.icon_state="16-2"
									src.newrace="Saiyan"
									RZ.icon_state="Random"
									RO.icon_state=""
									for(var/obj/LoginStuff/CharHair/O in src.client.screen)O.layer=999
								if(18)
									CR1.icon_state="17-1"
									CR2.icon_state="17-2"
									src.newrace="Tuffle"
									RZ.icon_state="TrainEase"
									RO.icon_state="PL"
									for(var/obj/LoginStuff/CharHair/O in src.client.screen)O.layer=1
								if(19)
									CR1.icon_state="41-1"
									CR2.icon_state="41-2"
									src.newrace="Vampire"
									RZ.icon_state="Random"
									for(var/obj/LoginStuff/CharHair/O in src.client.screen)O.layer=1
								if(20)
									CR1.icon_state="19-1"
									CR2.icon_state="19-2"
									src.newrace="Dark Angel"
									RZ.icon_state="Random"
									for(var/obj/LoginStuff/CharHair/O in src.client.screen)O.layer=1

		ScrollSkin(var/T)
			if(T=="LEFT")
				src.charskin+=1
				if(src.charskin>6)charskin=1
			if(T=="RIGHT")
				src.charskin-=1
				if(src.charskin<1)src.charskin=6
			for(var/obj/LoginStuff/CharPreview/CP in src.client.screen)
				for(var/obj/LoginStuff/RaceSkin/RS in src.client.screen)
					CP.icon_state="[src.charskin]race[src.charrace]"
					if(src.charskin==1)
						src.newskin="white"
						RS.icon_state="skinwhite"
					if(src.charskin==2)
						src.newskin="tan"
						RS.icon_state="skintan"
					if(src.charskin==3)
						src.newskin="dark"
						RS.icon_state="skinblack"
					if(src.charskin==4)
						src.newskin="tanf"
						RS.icon_state="skintan"
					if(src.charskin==5)
						src.newskin="whitef"
						RS.icon_state="skinwhite"
					if(src.charskin==6)
						src.newskin="darkf"
						RS.icon_state="skinblack"
		CreateNewChar()
			usr << output("Welcome to Apocalyptic Armageddon, [usr]!", "loginmessage")
			var/mob/mobcreation=new/mob/PC()
			mobcreation.name="PC-[src.key]-PC"
			var/newname = null
			newname=input("What's your name?","Name",src.key)as text
			var/lowername=lowertext(newname)
			var/ntxt1=uppertext(copytext(newname,1,2))
			var/ntxt2=copytext(newname,2)
			newname="[ntxt1][ntxt2]"
			if(NameList.Find(lowername))
				alert("[newname] is already in use. Try another name.")
				del(mobcreation)
				src.CreateNewChar()
			for(var/i=1,i<=lentext(lowername),i++)
				if(Allowed_Letters.Find(copytext(lowername,i,i+1))==0)
					alert(src,"Only letters A-Z are allowed.")
					del(mobcreation)
					src.CreateNewChar()
			if(lentext(newname) < 2)
				alert("Your name must contain at least 2 characters.")
				del(mobcreation)
				src.CreateNewChar()
			if(lentext(newname) > 15)
				alert("Your name cannot exceed 15 characters.")
				del(mobcreation)
				src.CreateNewChar()
			if(isnull(newname) | newname == "" | !newname)
				alert("Your name cannot be blank.")
				del(mobcreation)
				src.CreateNewChar()
			if(Forbidden_Words.Find(lowername)||lowername=="pc"||lowername=="cancel"||lowername=="nevermind"||lowername=="")
				alert("That name is not allowed.")
				del(mobcreation)
				src.CreateNewChar ()
			if(isnull(newname) | newname == " " | !newname)
				alert("Your name cannot be blank.")
				del(mobcreation)
				src.CreateNewChar()
			else
				newname=html_encode(newname)
				var/txt1=uppertext(copytext(newname,1,2))
				var/txt2=copytext(newname,2)
				newname="[txt1][txt2]"
				var/savefile/N = new("World Save Files/Player Names.sav")
				NameList.Add(lowername)
				N["NameList"]<<NameList
			src.client.screen+=new/obj/LoginStuff/SavingChar1
			switch(src.newrace)
				if("Android")switch(input("Which genetype do you wish to have?")in list("17","13"))
					if("17")
						src.icon='Android17form1.dmi'
						mobcreation.gene_model17=1
						alert("You are a highly skilled future android, who has come to past to take over the world.")
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Technique/KiBlast
						mobcreation.contents += new/obj/Technique/SelfDestruct
						mobcreation.contents += new/obj/Technique/LifeAbsorb
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.ki_bonus += rand(300,390)
						mobcreation.power_bonus += rand(100,250)
						mobcreation.Class_Selection()
						src.ApplyIconHair()
					if("13")
						src.icon='Android13form1.dmi'
						mobcreation.gene_model13=1
						alert("You were created in a lab by the Diobolical Dr Gero - Your main goal is to dominate the galaxy!")
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Technique/KiBlast
						mobcreation.contents += new/obj/Technique/SelfDestruct
						mobcreation.contents += new/obj/Technique/LifeAbsorb
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.ki_bonus += rand(300,390)
						mobcreation.power_bonus += rand(100,250)
						mobcreation.Class_Selection()
						src.ApplyIconHair()
				if("Bio-Android")
					src.icon='Bio Android - Form 1.dmi'
					alert("Created in a lab by the Diobolical Dr Gero, your goal is to absorb the androids and become complete!")
					mobcreation.contents += new/obj/Technique/Absorb
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert
					mobcreation.contents += new/obj/Technique/KiBlast
					mobcreation.contents += new/obj/Technique/Regenerate
					mobcreation.learn_kienzandisk=1
					mobcreation.learn_absorb=1
					mobcreation.contents+=new/obj/Technique/KienzanDisk
					mobcreation.ki_bonus += rand(300,390)
					mobcreation.defence_bonus += rand(100,250)
					mobcreation.Class_Selection()
				if("Bio-Warrior")
					src.icon='Bio Warrior 1.dmi'
					alert("You were brought into this world by an evil Diobolical Scientist, you are the opposite of all that is Pink and Fluffy.")
					mobcreation.contents += new/obj/Transform/Revert
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Technique/KiBlast
					mobcreation.power_bonus += rand(300,360)
					mobcreation.Class_Selection()
				if("Galactic Warrior")
					src.icon='Bojack.dmi'
					alert("You were set free after the destruction of King Kai's planet, you are now on Earth and ready to take it over!")
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert
					mobcreation.contents += new/obj/Technique/KiBlast
					mobcreation.defence_bonus += rand(200,350)
					mobcreation.strength_bonus = rand(75,100)
					mobcreation.Class_Selection()
				if("Changeling")switch(input("Which genetype do you wish to have?")in list("Frieza","Cooler"))
					if("Frieza")
						src.icon='Changling - Form 1.dmi'
						mobcreation.gene_frieza=1
						alert("Arrogant, Powerfull, resourcefull, you can survive anywhere.")
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.contents += new/obj/Technique/KiBlast
						mobcreation.learn_kienzandisk=1
						mobcreation.contents+=new/obj/Technique/KienzanDisk
						mobcreation.strength_bonus += rand(275,390)
						mobcreation.ki_bonus += rand(275,300)
						mobcreation.Class_Selection()
					if("Cooler")
						src.icon='Cooler - Form.dmi'
						mobcreation.gene_cooler=1
						alert("Arrogant, Powerfull, resourcefull, you can survive anywhere.")
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.contents += new/obj/Technique/KiBlast
						mobcreation.learn_kienzandisk=1
						mobcreation.contents+=new/obj/Technique/KienzanDisk
						mobcreation.defence_bonus += rand(175,340)
						mobcreation.ki_bonus += rand(175,370)
						mobcreation.Class_Selection()
				if("Demon")switch(input("Which genetype do you wish to have?")in list("Angelic","Chaotic"))
					if("Angelic")
						src.icon='ADemon - Form 1.dmi'
						mobcreation.gene_angelic=1
						alert("Evil is your middle name.")
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Technique/FlameBullet
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.strength_bonus += rand(275,300)
						mobcreation.ki_bonus += rand(275,370)
						mobcreation.Class_Selection()
					if("Chaotic")
						src.icon='Demon - Form 1.dmi'
						mobcreation.gene_chaotic=1
						alert("A Demon of the underworld.")
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Technique/FlameBullet
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.power_bonus += rand(275,300)
						mobcreation.ki_bonus += rand(275,370)
						mobcreation.Class_Selection()
				if("Dragon")switch(input("Which genetype do you wish to have?")in list("Chaos","Holy"))
					if("Chaos")
						src.icon='Dragon - Form 1.dmi'
						mobcreation.gene_chaos=1
						alert("You are the ultimate evil creature , created by negative energy and dragonballs.")
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Technique/WhirlWindSpin
						mobcreation.contents += new/obj/Technique/KiBlast
						mobcreation.power_bonus += rand(285,320)
						mobcreation.ki_bonus += rand(245,370)
						mobcreation.Class_Selection()
					if("Holy")
						src.icon='Shenron level 9.dmi'
						mobcreation.gene_holy=1
						alert("Born from the over-use of the Dragon Balls, With all the might and power which that has been used over the ages.")
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Technique/WhirlWindSpin
						mobcreation.contents += new/obj/Technique/KiBlast
						mobcreation.power_bonus += rand(275,310)
						mobcreation.defence_bonus += rand(275,380)
						mobcreation.Class_Selection()
				if("Half Saiyan")switch(input("Which genetype do you wish to have?")in list("Demonic","Saint"))
					if("Demonic")
						mobcreation.gene_demonic=1
						alert("You are the demonic gene of Half Saiyans who will destroy any villan in world.")
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.contents += new/obj/Technique/KiBlast
						mobcreation.contents += new/obj/Tech/FakeMoon
						mobcreation.power_bonus += rand(275,300)
						mobcreation.ki_bonus += rand(275,370)
						mobcreation.Class_Selection()
						src.ApplyIconHair()
					if("Saint")
						mobcreation.gene_saint=1
						alert("You are the saint gene of Half Saiyans , your dream in the world is to become the best warrior no matter what.")
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.contents += new/obj/Technique/KiBlast
						mobcreation.contents += new/obj/Tech/FakeMoon
						mobcreation.power_bonus += rand(250,375)
						mobcreation.defence_bonus += rand(100,300)
						mobcreation.Class_Selection()
						src.ApplyIconHair()
				if("Human")
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert
					mobcreation.contents += new/obj/Technique/KiBlast
					alert("Fast, Intelligent and technologically advanced with a good grasp on martial arts.")
					mobcreation.Class_Selection()
					src.ApplyIconHair()
					mobcreation.power_bonus += rand(150,175)
					mobcreation.ki_bonus += rand(150,175)
				if("Kai")
					src.icon='Kai - Form 1.dmi'
					alert("An ancient race, with the sole task of looking over the universe.")
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert
					mobcreation.contents += new/obj/Technique/KiBlast
					mobcreation.defence_bonus += rand(250,375)
					mobcreation.ki_bonus += rand(75,200)
					mobcreation.Class_Selection()
				if("Konat")
					src.icon='Konat - Form 1.dmi'
					alert("You are the Hero Konat , a brave warrior who are not afraid to fight with anyone.")
					mobcreation.contents += new/obj/Technique/KiBlast
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.defence_bonus += rand(200,350)
					mobcreation.ki_bonus += rand(75,200)
					mobcreation.Class_Selection()
				if("Dark Angel")
					src.icon='dark angel.dmi'
					alert("You are a Dark Angel!")
					mobcreation.contents += new/obj/Technique/KiBlast
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert
					mobcreation.defence_bonus += rand(300,450)
					mobcreation.ki_bonus += rand(75,200)
					mobcreation.Class_Selection()
				if("Majin")
					src.icon='Majin - Form 1.dmi'
					alert("You were created by Babidi's father, you are incredibly powerfull with amazing regenerative abilities.")
					mobcreation.contents += new/obj/Technique/Regenerate
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Technique/FatWrap
					mobcreation.contents += new/obj/Technique/KiBlast
					mobcreation.contents += new/obj/Technique/CandyRay
					mobcreation.power_bonus += rand(175,200)
					mobcreation.ki_bonus += rand(175,200)
					mobcreation.strength_bonus += rand(240,250)
					mobcreation.defence_bonus += rand(140,150)
					mobcreation.Class_Selection()
				if("Makyo")
					src.icon='Makyo Form 1.dmi'
					alert("You are a small and powerfull alien.")
					mobcreation.contents += new/obj/Technique/KiBlast
					mobcreation.contents += new/obj/Transform/Revert
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.power_bonus += rand(75,100)
					mobcreation.ki_bonus += rand(200,250)
					mobcreation.strength_bonus = rand(75,100)
					mobcreation.Class_Selection()
				if("Namekian")switch(input("Which genetype do you wish to have?")in list("Mystic","Warrior"))
					if("Mystic")
						src.icon='Mistic.dmi'
						mobcreation.gene_chaos=1
						alert("Highly Intelligent, Highly powerfull, you are one of the most powerfull races to have ever existed.")
						mobcreation.contents += new/obj/Technique/Regenerate
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Technique/KiBlast
						mobcreation.ki_bonus += rand(250,275)
						mobcreation.strength_bonus += rand(75,100)
						mobcreation.Class_Selection()
					if("Warrior")
						src.icon='Namek - Normal.dmi'
						mobcreation.gene_warrior=1
						alert("You are the warrior gene of Namekian's who can become one of the most powerfull races.")
						mobcreation.contents += new/obj/Technique/Regenerate
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Technique/KiBlast
						mobcreation.power_bonus += rand(250,275)
						mobcreation.defence_bonus += rand(150,175)
						mobcreation.Class_Selection()
				if("Saibaman")
					src.icon='Saibaman - Form 1.dmi'
					alert("After Vegeta and Nappa attacked earth you were forgotten as a small seed...")
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert
					mobcreation.contents += new/obj/Technique/KiBlast
					mobcreation.power_bonus += rand(75,100)
					mobcreation.ki_bonus += rand(200,250)
					mobcreation.strength_bonus = rand(75,100)
					mobcreation.Class_Selection()
				if("Saiyan")
					//Nox START
					if(prob(10))
						if(mobcreation.rage_chromosome==1||mobcreation.legendary_chromosome==1||mobcreation.god_chromosome==1||mobcreation.train_chromosome==1)
						else
							mobcreation.contents += new/obj/Transform/Transform
							mobcreation.contents += new/obj/Transform/Revert
							mobcreation.contents += new/obj/Technique/KiBlast
							mobcreation.contents += new/obj/Tech/FakeMoon
							alert("You are the legenday Super Saiyan god.")
							mobcreation.god_chromosome=1
							mobcreation.Class_Selection()
							mobcreation.power_bonus += rand(320,350)
							mobcreation.ki_bonus += rand(150,170)
							src.ApplyIconHair()
					else
						if(prob(15 ))
							if(mobcreation.rage_chromosome==1||mobcreation.legendary_chromosome==1||mobcreation.god_chromosome==1||mobcreation.train_chromosome==1)
							else
								mobcreation.contents += new/obj/Transform/Transform
								mobcreation.contents += new/obj/Transform/Revert
								mobcreation.contents += new/obj/Technique/KiBlast
								mobcreation.contents += new/obj/Tech/FakeMoon
								alert("A fluke in the Saiyan Genome, Powerfull and fast, you are a valuable adversary to all who came before you.")
								mobcreation.legendary_chromosome=1
								mobcreation.Class_Selection()
								mobcreation.power_bonus += rand(320,350)
								mobcreation.ki_bonus += rand(150,170)
								src.ApplyIconHair()
						else
							if(prob(50))
								if(mobcreation.rage_chromosome==1||mobcreation.legendary_chromosome==1||mobcreation.god_chromosome==1||mobcreation.train_chromosome==1)
								else
									mobcreation.contents += new/obj/Technique/KiBlast
									mobcreation.contents += new/obj/Tech/FakeMoon
									alert("You are a race that loves to fight, you age slowly, you are also incredibly powerfull, all those who stand in your way are destroyed.")
									mobcreation.rage_chromosome=1
									mobcreation.Class_Selection()
									mobcreation.power_bonus += rand(200,310)
									mobcreation.ki_bonus += rand(240,50)
									src.ApplyIconHair()
							else
								if(mobcreation.rage_chromosome==1||mobcreation.legendary_chromosome==1||mobcreation.god_chromosome==1||mobcreation.train_chromosome==1)
								else
									mobcreation.contents += new/obj/Transform/Transform
									mobcreation.contents += new/obj/Transform/Revert
									mobcreation.contents += new/obj/Technique/KiBlast
									mobcreation.contents += new/obj/Tech/FakeMoon
									alert("You are a race that loves to fight, you age slowly, you are also incredibly powerfull, all those who stand in your way are destroyed.")
									mobcreation.Class_Selection()
									mobcreation.strength_bonus += rand(300,350)
									mobcreation.power_bonus += rand(150,175)
									mobcreation.train_chromosome=1
									src.ApplyIconHair()
								// END

				if("Tuffle")
					src.icon='Bebi - Form 1.dmi'
					alert("Your entire race was wiped out by the Saiyans, you come to earth to enact revenge!")
					mobcreation.contents += new/obj/Technique/Infect
					mobcreation.contents += new/obj/Technique/KiBlast
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert
					mobcreation.strength_bonus += rand(100,250)
					mobcreation.ki_bonus += rand(240,350)
					mobcreation.defence_bonus += rand(150,175)
					mobcreation.Class_Selection()
				if("Ultimate Hybrid")
					src.icon='Ultimate Hybrid Form 1.dmi'
					alert("You are a hybrid of humans and androids..")
					mobcreation.contents += new/obj/Technique/KiBlast
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.strength_bonus += rand(100,250)
					mobcreation.ki_bonus += rand(140,350)
					mobcreation.power_bonus += rand(150,275)
					mobcreation.Class_Selection()
				if("Vampire")
					src.icon='Vamp - Form 1.dmi'
					alert("You were once a Human, Now a Vampire, Here to get Revenge on those who Hate you..")
					mobcreation.contents += new/obj/Technique/KiBlast
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert
					mobcreation.contents += new/obj/Technique/Bite
					mobcreation.strength_bonus += rand(500,1000)
					mobcreation.ki_bonus += rand(600,1300)
					mobcreation.power_bonus += rand(300,900)
					mobcreation.Class_Selection()
			switch(alert("What alliance do you lies with?","Alliance???","Good","Evil"))
				if("Good")mobcreation.karma="Good"
				if("Evil")mobcreation.karma="Evil"
			mobcreation.save_file_1=src.save_file_1
			mobcreation.save_file_2=src.save_file_2
			mobcreation.save_file_3=src.save_file_3
			mobcreation.overlays+=src.overlays
			mobcreation.race=newrace
			mobcreation.skin=newskin
			mobcreation.hair=newhair
			mobcreation.name=newname
			mobcreation.icon=src.icon
			mobcreation.hair=src.hair
			mobcreation.statpl=src.statpl
			mobcreation.statki=src.statki
			mobcreation.statstr=src.statstr
			mobcreation.statdef=src.statdef
			mobcreation.stattrain=src.stattrain
			mobcreation.powerlevel=300
			mobcreation.powerlevel_max=300
			mobcreation.ki=300
			mobcreation.ki_max=300
			mobcreation.strength=100
			mobcreation.strength_max=100
			mobcreation.defence=100
			mobcreation.defence_max=100
			mobcreation.zenni=500
			mobcreation.karma_rating=1
			mobcreation.energy_code=rand(0000001,9999999)
			src.AddName()
			switch(alert(src,"Do you wish to enable training information? (Note: this can be turned off by going into 'training' tab > train visibility.)","Enable training information","Yes","No"))
				if("Yes")mobcreation.level_on=1
				if("No")mobcreation.level_on=0
			switch(alert(src,"Do you also wish to enable damage information? (Note: this can be turned off by going into 'combat' tab > toggle damage information.)","Enable damage information","Yes","No"))
				if("Yes")mobcreation.damage_enabled=1
				if("No")mobcreation.damage_enabled=0
			src.client.screen=null
			world<<"<font color = gray><u>[servername]:</u> <font color=white>[mobcreation.name], the [mobcreation.race], has logged in for first time!"
			src.AddName()
			src.RebirthGain()
			if(mobcreation.race=="Galactic Warrior"||mobcreation.race=="Namekian"||mobcreation.race=="Tuffle"||mobcreation.race=="Dragon"||mobcreation.race=="Bio-Android"||mobcreation.race=="Konat"||mobcreation.race=="Ultimate Hybrid"||mobcreation.race=="Cooler"||mobcreation.race=="Babidi"||mobcreation.race=="Bojack"||mobcreation.race=="Vampire")
				mobcreation.tpsboosted=1
				mobcreation.plboosted=1
			if(mobcreation.race=="Android"||mobcreation.race=="Changeling"||mobcreation.race=="Demon"||mobcreation.race=="Half Saiyan"||mobcreation.race=="Kai"||mobcreation.race=="Majin"||mobcreation.race=="Bardock"||mobcreation.race=="Uubub"||mobcreation.race=="Legendary")mobcreation.kiboosted=1
			if(mobcreation.race=="Saibaman"||mobcreation.race=="Makyo"||mobcreation.race=="Konat"||mobcreation.race=="Human"||mobcreation.race=="Bio-Warrior"||mobcreation.race=="Dark Angel"||mobcreation.race=="Dark Namek"||mobcreation.race=="Janemba"||mobcreation.race=="Tenrai")
				mobcreation.strboosted=1
				mobcreation.defboosted=1
				if(mobcreation.race=="Saiyan" && key=="Vegito9000")
					mobcreation.rage_chromosome=0
					mobcreation.legendary_chromosome=0
					mobcreation.god_chromosome=1
					mobcreation.train_chromosome=0
					mobcreation.contents -= new/obj/Transform/Transform
					mobcreation.contents -= new/obj/Transform/Revert
					mobcreation.contents -= new/obj/Technique/KiBlast
					mobcreation.contents -= new/obj/Tech/FakeMoon
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert
					mobcreation.contents += new/obj/Technique/KiBlast
					mobcreation.contents += new/obj/Tech/FakeMoon
			src.client.mob=mobcreation
			del(src)
			if(client.IsByondMember())
				switch(alert("You are a Beyond Member!","Would you like to receive a boost?","Yes","No"))
					if("Yes")
						var/pboost = rand(100000, 1000000000)
						usr <<"<font color = green>Powerlevel set to [pboost]."
						mobcreation.powerlevel_max += pboost
						mobcreation.powerlevel += pboost
						usr <<"<font color = green>Ki set to [pboost]."
						mobcreation.ki += pboost
						mobcreation.ki_max += pboost
						usr <<"<font color = green>Strength Set to [pboost]."
						mobcreation.strength += pboost
						mobcreation.strength_max += pboost
						usr <<"<font color = green>Defence set to [pboost]."
						mobcreation.defence += pboost
						mobcreation.defence_max += pboost
						usr <<"<font color = green>Speed set to [pboost]."
						mobcreation.speed_max += pboost
						mobcreation.speed += pboost
						usr <<"<font color = green>Zenni set to [pboost]."
						mobcreation.zenni += pboost
						usr <<"<font color = green>Stamina set to 5 hundred."
						mobcreation.stamina_max = 3000
						mobcreation.stamina = 3000
					else
mob
	var
		kiboosted=0;strboosted=0;defboosted=0;plboosted=0;save_file_1=0;save_file_2=0;save_file_3=0;displayicon=0;tpsboosted=0
var/list/Forbidden_Words=list("goten","brolly","broly","barbock","fucked","bitch","fuck","ass","dumbass","dumb","asshole","rape","stupid","homo","gay","fag","faggot","god","idiot","goku","vegeta","vegito","shenron","cell","trunks","gohan","gotenks","krillin","majin","buu","frieza","uub","gogeta","piccolo")
var/list/NameList=list()
var/list/Allowed_Letters=list("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"," ")
mob/Login()
	..()
mob/var/joinedg=0
mob/var/tmp/stepsused=0
mob/Guest
	Login()
		MK()
		if(key!="[mainkey1]"||key!="AngelReincarnation"||key!="YugiMotou111"||key!="Nik Van Wagner")CheckBan()
		loc=locate(9,8,6)
		winset(src,"Splash","is-maximized=true")
		src.AddName()
		/*ceye=client.eye
		client.perspective=EYE_PERSPECTIVE
		for(var/spectate_spots/s in world)
			s.stepsused=0
			client.eye=s
			while(s.stepsused<3)sleep(10)
		client.eye=ceye
		client.perspective=EDGE_PERSPECTIVE
spectate_spots
	parent_type=/mob
	density=0
	New()
		loc=locate(326,68,1)
		while(src)
			step_rand(src)
			stepsused++
			sleep(15)
proc
	locate_spectator()
		var/list/list = new
		for(var/spectate_spots/s in world)
			list += s
			s.stepsused=0
		return pick(list)*/
mob
	proc
		UpdateDisplayIcon()
			if(Oozaru||!src)return
			var/icon/PI = icon(icon,"",SOUTH)
			if(!PI||!src||Oozaru)return
			for(var/X in overlays)
				if(!X)return
				PI.Blend(icon(X:icon,"",SOUTH),ICON_OVERLAY)
			for(var/X in underlays)
				if(!X)return
				PI.Blend(icon(X:icon,"",SOUTH),ICON_UNDERLAY)
			displayicon=PI
		ApplyIconHair()
			if(newskin=="tan")
				skin="tan"
				icon='Male - Tan.dmi'
			if(newskin=="white")
				skin="white"
				icon='Male - White.dmi'
			if(newskin=="dark")
				skin="dark"
				icon='Male - Dark.dmi'
			if(newskin=="tanf")
				skin="tanf"
				icon='Female - Tan.dmi'
			if(newskin=="whitef")
				skin="whitef"
				icon='Female - White.dmi'
			if(newskin=="darkf")
				skin="darkf"
				icon='Female - Dark.dmi'
			if(newhair=="Bald")hair = "Bald"
			if(newhair=="Goku")
				hair="Goku"
				hair_icon='Hair - Goku.dmi'
				overlays+=hair_icon
			if(newhair=="Vegeta")
				hair="Vegeta"
				hair_icon='Hair - Vegeta.dmi'
				overlays+=hair_icon
			if(newhair=="Teen Gohan")
				hair="Teen Gohan"
				hair_icon='Hair - Teen Gohan.dmi'
				overlays+=hair_icon
			if(newhair=="Adult Gohan")
				hair="Adult Gohan"
				hair_icon='Hair - Adult Gohan.dmi'
				overlays+=hair_icon
			if(newhair=="Future Gohan")
				hair = "Future Gohan"
				hair_icon = 'Hair - Future Gohan.dmi'
				overlays += hair_icon
			if(newhair=="Hercule")
				hair="Hercule"
				hair_icon='Hair - Hercule.dmi'
				overlays+=hair_icon
			if(newhair=="Raditz")
				hair="Raditz"
				hair_icon='Hair - Raditz.dmi'
				overlays+=hair_icon
			if(newhair=="Trunks Long")
				hair="Trunks Long"
				hair_icon='Hair - Trunks Long.dmi'
				overlays+=hair_icon