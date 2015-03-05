obj
	Flag
		icon='Flag.dmi'
		density=1
		layer=5
		Flag1
			New()
				loc=locate(12,74,1)
		Flag2
			New()
				loc=locate(15,268,1)
		Flag3
			New()
				loc=locate(90,121,2)
		Flag4
			New()
				loc=locate(58,316,2)
		Flag5
			New()
				loc=locate(62,363,2)
		Flag6
			New()
				loc=locate(38,177,2)
		Flag7
			New()
				loc=locate(237,71,2)
		Flag8
			New()
				loc=locate(239,278,2)
		Flag9
			New()
				loc=locate(340,353,2)
		Flag10
			New()
				loc=locate(308,95,2)
		Flag11
			New()
				loc=locate(196,125,3)
		Flag12
			New()
				loc=locate(276,75,3)
		Flag13
			New()
				loc=locate(261,345,4)
		Flag14
			New()
				loc=locate(240,118,4)
		Flag15
			New()
				loc=locate(97,114,4)
		Flag16
			New()
				loc=locate(65,278,5)
		FlagLetter1
			icon='FlagFont.dmi'
			icon_state=""
			layer=6
			New()
				pixel_x=-5
		FlagLetter2
			icon='FlagFont.dmi'
			icon_state=""
			layer=6
			New()
				pixel_x=5
turf/var/guildowner
mob
	var
		guildbuyer=0
	proc
		GuildFlag(GuildNumber,FL1,FL2)
			switch(GuildNumber)
				if(1)
					var/obj/Flag/Flag1/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("World Save Files/Map.sav")
					S["MapObj"]<<MapObj
				if(2)
					var/obj/Flag/Flag2/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("World Save Files/Map.sav")
					S["MapObj"]<<MapObj
				if(3)
					var/obj/Flag/Flag3/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("World Save Files/Map.sav")
					S["MapObj"]<<MapObj
				if(4)
					var/obj/Flag/Flag4/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("World Save Files/Map.sav")
					S["MapObj"]<<MapObj
				if(5)
					var/obj/Flag/Flag5/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("World Save Files/Map.sav")
					S["MapObj"]<<MapObj
				if(6)
					var/obj/Flag/Flag6/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("World Save Files/Map.sav")
					S["MapObj"]<<MapObj
				if(7)
					var/obj/Flag/Flag7/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("World Save Files/Map.sav")
					S["MapObj"]<<MapObj
				if(8)
					var/obj/Flag/Flag8/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("World Save Files/Map.sav")
					S["MapObj"]<<MapObj
				if(9)
					var/obj/Flag/Flag9/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("World Save Files/Map.sav")
					S["MapObj"]<<MapObj
				if(10)
					var/obj/Flag/Flag10/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("World Save Files/Map.sav")
					S["MapObj"]<<MapObj
				if(11)
					var/obj/Flag/Flag11/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("World Save Files/Map.sav")
					S["MapObj"]<<MapObj
				if(12)
					var/obj/Flag/Flag12/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("World Save Files/Map.sav")
					S["MapObj"]<<MapObj
				if(13)
					var/obj/Flag/Flag13/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("World Save Files/Map.sav")
					S["MapObj"]<<MapObj
				if(14)
					var/obj/Flag/Flag14/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("World Save Files/Map.sav")
					S["MapObj"]<<MapObj
				if(15)
					var/obj/Flag/Flag15/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("World Save Files/Map.sav")
					S["MapObj"]<<MapObj
				if(16)
					var/obj/Flag/Flag16/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("World Save Files/Map.sav")
					S["MapObj"]<<MapObj
turf
	var
		guild_name=""
		lastname
turf/Guild_Houses
	var/buying=0
	Guild_House1
		var/cost=15000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
					if(M.buku)
						M<<"You cannot enter while flying!"
						return
				if(src.guild_name==""||src.guild_name==null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(M.guildbuyer)
									M << "You already bought a guild house!"
									return
								if(M.level<2500)
									M<<"You must be 2,500 level to be able to buy this GH!"
									return
								if(!M.guild_leader)
									M<<"You must be a guild leader to be able to buy this GH!"
									return
								if(src.buying)
									usr<<"Someone is already buying this Guild House!"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You don't have enough zenni!"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone!"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You don't have enough zenni!"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone!"
										src.buying=0
										return
									src.guild_name=M.guild_name
									for(var/turf/Guild_Houses/Guild_House1/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("World Save Files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									src.guildowner=M.name
									M.zenni -= cost
									M << "Purchase Successful!"
									M.guildbuyer=1
									src.buying=0
									//spawn(7)M.GuildFlag(1,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House!"
						src.buying=0
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(338,53,6)
						M.it_lock = 1
						M.it_blocked = 1
						return
					else
						M << "This Guild House belongs to [src.guild_name]!"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(329,57,6)
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc=locate(271,52,6)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc=locate(305,57,6)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc=locate(369,125,6)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(22,356,1)
				M.it_lock = 0
				M.safe=0
				M.it_blocked=0
	Guild_House2
		var/cost = 15000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
					if(M.buku)
						M<<"You cannot enter while flying!"
						return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(M.level<2500)
									M<<"You must be 2,500 level to be able to buy this GH!"
									return
								if(!M.guild_leader)
									M<<"You must be a guild leader to be able to buy this GH!"
									return
								if(M.guildbuyer)
									M << "You already bought a guild house!"
									return
								if(src.buying)
									usr<<"Someone is already buying this Guild House!"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You don't have enough zenni!"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone!"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You don't have enough zenni!"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone!"
										src.buying=0
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House2/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("World Save Files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									src.guildowner=M.name
									M.zenni -= cost
									M << "Purchase Successful!"
									M.guildbuyer=1
									src.buying=0
									//spawn(7)M.GuildFlag(2,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House!"
						src.buying=0
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(338,75,6)
						M.it_lock = 1
						M.it_blocked = 1
						return
					else
						M << "This Guild House belongs to [src.guild_name]!"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(329,83,6)
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc=locate(305,79,6)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc=locate(272,75,6)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc=locate(369,147,6)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(338,274,1)
				M.it_lock = 0
				M.it_blocked=0
				M.safe=0
				return
	Guild_House3
		var/cost = 15000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
					if(M.buku)
						M<<"You cannot enter while flying!"
						return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(M.level<2500)
									M<<"You must be 2,500 level to be able to buy this GH!"
									return
								if(!M.guild_leader)
									M<<"You must be a guild leader to be able to buy this GH!"
									return
								if(src.buying)
									usr<<"Someone is already buying this Guild House!"
									return
								if(M.guildbuyer)
									M << "You already bought a guild house!"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You don't have enough zenni!"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone!"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You don't have enough zenni!"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone!"
										src.buying=0
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House3/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("World Save Files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									src.guildowner=M.name
									M.zenni -= cost
									M << "Purchase Successful!"
									M.guildbuyer=1
									src.buying=0
									//spawn(7)M.GuildFlag(3,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House!"
						src.buying=0
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(338,97,6)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]!"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(329,105,6)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(304,99,6)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(271,96,6)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(369,169,6)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(41,226,1)
				M.it_lock = 0
				M.grav=0
				M.safe=0
				M.it_blocked=0
				return
	Guild_House4
		var/cost = 15000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(M.level<2500)
									M<<"You must be 2,500 level to be able to buy this GH!"
									return
								if(!M.guild_leader)
									M<<"You must be a guild leader to be able to buy this GH!"
									return
								if(M.guildbuyer)
									M << "You already bought a guild house!"
									return
								if(src.buying)
									usr<<"Someone is already buying this Guild House!"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You don't have enough zenni!"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone!"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You don't have enough zenni!"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone!"
										src.buying=0
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House4/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("World Save Files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									src.guildowner=M.name
									M.zenni -= cost
									M << "Purchase Successful!"
									M.guildbuyer=1
									src.buying=0
									//spawn(7)M.GuildFlag(4,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House!"
						src.buying=0
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(338,119,6)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]!"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(329,123,6)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(305,122,6)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(271,118,6)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(369,191,6)
		Exit
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(370,139,1)
				M.it_lock = 0
				M.grav=0
				M.it_blocked=0
				M.safe=0
				return
	Guild_House5
		var/cost = 15000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(M.level<2500)
									M<<"You must be 2,500 level to be able to buy this GH!"
									return
								if(!M.guild_leader)
									M<<"You must be a guild leader to be able to buy this GH!"
									return
								if(M.guildbuyer)
									M << "You already bought a guild house!"
									return
								if(src.buying)
									usr<<"Someone is already buying this Guild House!"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You don't have enough zenni!"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone!"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You don't have enough zenni!"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone!"
										src.buying=0
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House5/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("World Save Files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									src.guildowner=M.name
									M.zenni -= cost
									M << "Purchase Successful!"
									M.guildbuyer=1
									src.buying=0
									//spawn(7)M.GuildFlag(5,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House!"
						src.buying=0
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(337,140,6)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]!"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(329,145,6)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(304,143,6)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(271,140,6)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(368,212,6)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(51,143,2)
				M.it_lock = 0
				M.safe=0
				M.grav=0
				M.it_blocked=0
				return
	Guild_House6
		var/cost = 15000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(M.level<2500)
									M<<"You must be 2,500 level to be able to buy this GH!"
									return
								if(!M.guild_leader)
									M<<"You must be a guild leader to be able to buy this GH!"
									return
								if(M.guildbuyer)
									M << "You already bought a guild house!"
									return
								if(src.buying)
									usr<<"Someone is already buying this Guild House!"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You don't have enough zenni!"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone!"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You don't have enough zenni!"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone!"
										src.buying=0
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House6/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("World Save Files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									src.guildowner=M.name
									M.zenni -= cost
									M << "Purchase Successful!"
									M.guildbuyer=1
									src.buying=0
									//spawn(7)M.GuildFlag(6,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House!"
						src.buying=0
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(337,162,6)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]!"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(329,167,6)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(306,165,6)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(271,162,6)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(368,234,6)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(47,357,2)
				M.it_lock = 0
				M.grav=0
				M.safe=0
				M.it_blocked=0
				return
	Guild_House7
		var/cost = 15000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(M.level<2500)
									M<<"You must be 2,500 level to be able to buy this GH!"
									return
								if(!M.guild_leader)
									M<<"You must be a guild leader to be able to buy this GH!"
									return
								if(M.guildbuyer)
									M << "You already bought a guild house!"
									return
								if(src.buying)
									usr<<"Someone is already buying this Guild House!"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You don't have enough zenni!"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone!"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You don't have enough zenni!"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone!"
										src.buying=0
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House7/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("World Save Files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									src.guildowner=M.name
									M.zenni -= cost
									M << "Purchase Successful!"
									M.guildbuyer=1
									src.buying=0
									//spawn(7)M.GuildFlag(7,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House!"
						src.buying=0
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(337,184,6)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]!"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(329,189,6)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(304,186,6)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(271,184,6)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(368,256,6)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(303,63,2)
				M.it_lock = 0
				M.grav=0
				M.safe=0
				M.it_blocked=0
				return
	Guild_House8
		var/cost = 15000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(M.level<2500)
									M<<"You must be 2,500 level to be able to buy this GH!"
									return
								if(!M.guild_leader)
									M<<"You must be a guild leader to be able to buy this GH!"
									return
								if(M.guildbuyer)
									M << "You already bought a guild house!"
									return
								if(src.buying)
									usr<<"Someone is already buying this Guild House!"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You don't have enough zenni!"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone!"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You don't have enough zenni!"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone!"
										src.buying=0
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House8/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("World Save Files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									src.guildowner=M.name
									M.zenni -= cost
									M << "Purchase Successful!"
									M.guildbuyer=1
									src.buying=0
									//spawn(7)M.GuildFlag(8,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House!"
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(337,206,6)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]!"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(329,211,6)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(304,208,6)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(271,206,6)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(368,278,6)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(254,345,2)
				M.it_lock = 0
				M.grav=0
				M.safe=0
				M.it_blocked=0
				return
	Guild_House9
		var/cost = 15000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(M.level<2500)
									M<<"You must be 2,500 level to be able to buy this GH!"
									return
								if(!M.guild_leader)
									M<<"You must be a guild leader to be able to buy this GH!"
									return
								if(M.guildbuyer)
									M << "You already bought a guild house!"
									return
								if(src.buying)
									usr<<"Someone is already buying this Guild House!"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You don't have enough zenni!"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone!"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You don't have enough zenni!"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone!"
										src.buying=0
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House9/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("World Save Files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									src.guildowner=M.name
									M.zenni -= cost
									M << "Purchase Successful!"
									M.guildbuyer=1
									src.buying=0
									//spawn(7)M.GuildFlag(9,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House!"
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(337,228,6)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]!"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(329,233,6)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(304,230,6)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(271,228,6)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(368,300,6)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(42,226,3)
				M.it_lock = 0
				M.grav=0
				M.safe=0
				M.it_blocked=0
				return
	Guild_House10
		var/cost = 15000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(M.level<2500)
									M<<"You must be 2,500 level to be able to buy this GH!"
									return
								if(!M.guild_leader)
									M<<"You must be a guild leader to be able to buy this GH!"
									return
								if(M.guildbuyer)
									M << "You already bought a guild house!"
									return
								if(src.buying)
									usr<<"Someone is already buying this Guild House!"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You don't have enough zenni!"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone!"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You don't have enough zenni!"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone!"
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House10/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("World Save Files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									src.guildowner=M.name
									M.zenni -= cost
									M << "Purchase Successful!"
									M.guildbuyer=1
									src.buying=0
									//spawn(7)M.GuildFlag(10,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House!"
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(337,250,6)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]!"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(329,255,6)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(304,252,6)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(271,250,6)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(368,322,6)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(329,341,3)
				M.it_lock = 0
				M.grav=0
				M.safe=0
				M.it_blocked=0
				return
	Guild_House11
		var/cost = 15000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(M.level<2500)
									M<<"You must be 2,500 level to be able to buy this GH!"
									return
								if(!M.guild_leader)
									M<<"You must be a guild leader to be able to buy this GH!"
									return
								if(M.guildbuyer)
									M << "You already bought a guild house!"
									return
								if(src.buying)
									usr<<"Someone is already buying this Guild House!"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You don't have enough zenni!"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone!"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You don't have enough zenni!"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone!"
										src.buying=0
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House11/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("World Save Files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									src.guildowner=M.name
									M.zenni -= cost
									M << "Purchase Successful!"
									M.guildbuyer=1
									src.buying=0
									//spawn(7)M.GuildFlag(11,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House!"
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(337,272,6)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]!"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(329,277,6)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(304,273,6)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(271,272,6)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(368,344,6)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(91,47,3)
				M.it_lock = 0
				M.grav=0
				M.safe=0
				M.it_blocked=0
				return
	Guild_House12
		var/cost = 15000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(M.level<2500)
									M<<"You must be 2,500 level to be able to buy this GH!"
									return
								if(!M.guild_leader)
									M<<"You must be a guild leader to be able to buy this GH!"
									return
								if(M.guildbuyer)
									M << "You already bought a guild house!"
									return
								if(src.buying)
									usr<<"Someone is already buying this Guild House!"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You don't have enough zenni!"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone!"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You don't have enough zenni!"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone!"
										src.buying=0
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House12/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("World Save Files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									src.guildowner=M.name
									M.zenni -= cost
									M << "Purchase Successful!"
									M.guildbuyer=1
									src.buying=0
									//spawn(7)M.GuildFlag(12,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House!"
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(337,294,6)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]!"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(329,299,6)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(304,295,6)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(271,294,6)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(368,366,6)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(335,61,3)
				M.it_lock = 0
				M.grav=0
				M.safe=0
				M.it_blocked=0
				return
	Guild_House13
		var/cost = 15000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(M.level<2500)
									M<<"You must be 2,500 level to be able to buy this GH!"
									return
								if(!M.guild_leader)
									M<<"You must be a guild leader to be able to buy this GH!"
									return
								if(M.guildbuyer)
									M << "You already bought a guild house!"
									return
								if(src.buying)
									usr<<"Someone is already buying this Guild House!"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You don't have enough zenni!"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone!"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You don't have enough zenni!"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone!"
										src.buying=0
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House13/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("World Save Files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									src.guildowner=M.name
									M.zenni -= cost
									M << "Purchase Successful!"
									M.guildbuyer=1
									src.buying=0
									//spawn(7)M.GuildFlag(13,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House!"
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(337,316,6)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]!"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(329,321,6)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(304,317,6)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(271,316,6)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(368,388,6)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(279,69,4)
				M.it_lock = 0
				M.grav=0
				M.safe=0
				M.it_blocked=0
				return
	Guild_House14
		var/cost = 15000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(M.level<2500)
									M<<"You must be 2,500 level to be able to buy this GH!"
									return
								if(!M.guild_leader)
									M<<"You must be a guild leader to be able to buy this GH!"
									return
								if(M.guildbuyer)
									M << "You already bought a guild house!"
									return
								if(src.buying)
									usr<<"Someone is already buying this Guild House!"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You don't have enough zenni!"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone!"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You don't have enough zenni!"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone!"
										src.buying=0
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House14/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("World Save Files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									src.guildowner=M.name
									M.zenni -= cost
									M << "Purchase Successful!"
									M.guildbuyer=1
									src.buying=0
									//spawn(7)M.GuildFlag(14,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House!"
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(337,338,6)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]!"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(329,343,6)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(304,339,6)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(271,338,6)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(368,102,6)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(89,266,4)
				M.it_lock = 0
				M.grav=0
				M.safe=0
				M.it_blocked=0
				return
	Guild_House15
		var/cost = 15000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(M.level<2500)
									M<<"You must be 2,500 level to be able to buy this GH!"
									return
								if(!M.guild_leader)
									M<<"You must be a guild leader to be able to buy this GH!"
									return
								if(M.guildbuyer)
									M << "You already bought a guild house!"
									return
								if(src.buying)
									usr<<"Someone is already buying this Guild House!"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You don't have enough zenni!"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone!"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You don't have enough zenni!"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone!"
										src.buying=0
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House15/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("World Save Files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									src.guildowner=M.name
									M.zenni -= cost
									M << "Purchase Successful!"
									M.guildbuyer=1
									src.buying=0
									//spawn(7)M.GuildFlag(15,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House!"
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(337,360,6)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]!"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(329,365,6)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(304,360,6)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(271,360,6)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(368,80,6)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(261,281,4)
				M.it_lock = 0
				M.grav=0
				M.safe=0
				M.it_blocked=0
				return
	Guild_House16
		var/cost = 15000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(M.level<2500)
									M<<"You must be 2,500 level to be able to buy this GH!"
									return
								if(!M.guild_leader)
									M<<"You must be a guild leader to be able to buy this GH!"
									return
								if(M.guildbuyer)
									M << "You already bought a guild house!"
									return
								if(src.buying)
									usr<<"Someone is already buying this Guild House!"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You don't have enough zenni!"
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone!"
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You don't have enough zenni!"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone!"
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House16/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("World Save Files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									src.guildowner=M.name
									M.zenni -= cost
									M << "Purchase Successful!"
									M.guildbuyer=1
									src.buying=0
									//spawn(7)M.GuildFlag(16,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House!"
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(337,382,6)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]!"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(329,387,6)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(304,382,6)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(271,382,6)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(368,58,6)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(344,369,4)
				M.it_lock = 0
				M.grav=0
				M.it_blocked=0
				M.safe=0
				return