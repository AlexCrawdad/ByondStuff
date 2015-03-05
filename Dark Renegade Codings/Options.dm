mob/var/tab_vitals=1
mob/var/tab_skills=1
mob/var/tab_quests=1
mob/var/tab_masteries=1
mob/var/tab_inventory=1
mob/var/ooc_on=1
mob/var/gooc_on=1
mob/var/onSimulations=1
mob/var/auction_on=1
mob/var/tab_guild=1
mob/var/wisper_on=1
mob/var/tab_Simulation=1
mob/var/tab_server=1
mob/var/attackguild=0
mob/var/attackparty=0
mob/var/sound_on=0
mob/var/xmas_hat_enabled=0
mob/var/tmp/attacktarget=0
mob
	var
		trans1t=""
		trans2t=""
		trans3t=""
		trans4t=""
		trans5t=""
		trans6t=""
		oldsize
		oldpos
		oldwinsize
		oldwinpos
		Quake_Effect_Toggle = 0

mob/PC
	verb
		Stamina_Check()
			set category = "Channels"
			set background=1
			switch(input("What do you want to check your stamina on?")in list("Self-Train","Dual-Train","Meditate","Cancel"))
				if("Cancel")return
				if("Meditate")
					var/staminacheck=0
					var/days=0
					var/hours=0
					var/minutes=0
					var/seconds=0
					staminacheck=stamina_max
					if(staminacheck>=600000000)return
					Start
					if(staminacheck>=129600)
						days+=1
						staminacheck-=129600
						goto Start
					if(staminacheck>=5400)
						hours+=1
						staminacheck-=5400
						goto Start
					if(staminacheck>=90)
						minutes+=1
						staminacheck-=90
						goto Start
					if(staminacheck>=1.5)
						seconds+=1
						staminacheck-=1.5
						goto Start
					if(days>=1)usr<<"<center><font color=white>Your maximum training time with meditate is approx:</font> <font color = aqua>[days]</font> days(24hrs), <font color = lime>[hours] </font>hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else if(hours>=1)usr<<"<center><font color=white>Your maximum training time with meditate is approx:</font> <font color = lime>[hours]</font> hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else usr<<"<center><font color=white>Your maximum training time with meditate is approx:</font> <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					staminacheck=0
					days=0
					hours=0
					minutes=0
					seconds=0
					staminacheck=round(stamina_max-stamina)
					if(staminacheck>=600000000)return
					Start2
					if(staminacheck>=129600)
						days+=1
						staminacheck-=129600
						goto Start2
					if(staminacheck>=5400)
						hours+=1
						staminacheck-=5400
						goto Start2
					if(staminacheck>=90)
						minutes+=1
						staminacheck-=90
						goto Start2
					if(staminacheck>=1.5)
						seconds+=1
						staminacheck-=1.5
						goto Start2
					if(days>=1)usr<<"<center><font color=white>Your training time remaining with meditate is approx:</font> <font color = aqua>[days] </font>days(24hrs), <font color = lime>[hours] </font>hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else if(hours>=1)usr<<"<center><font color=white>Your training time remaining with meditate is approx:</font> <font color = lime>[hours] </font>hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else usr<<"<center><font color=white>Your training time remaining with meditate is approx:</font> <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					return
				if("Dual-Train")
					var/staminacheck=0
					var/days=0
					var/hours=0
					var/minutes=0
					var/seconds=0
					staminacheck=stamina_max
					if(staminacheck>=600000000)return
					Start
					if(staminacheck>=1036800)
						days+=1
						staminacheck-=1036800
						goto Start
					if(staminacheck>=43200)
						hours+=1
						staminacheck-=43200
						goto Start
					if(staminacheck>=720)
						minutes+=1
						staminacheck-=720
						goto Start
					if(staminacheck>=12)
						seconds+=1
						staminacheck-=12
						goto Start
					if(days>=1)usr<<"<center><font color=white>Your maximum training time with dual train is approx:</font> <font color = aqua>[days]</font> days(24hrs), <font color = lime>[hours] </font>hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else if(hours>=1)usr<<"<center><font color=white>Your maximum training time with dual train is approx:</font> <font color = lime>[hours]</font> hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else usr<<"<center><font color=white>Your maximum training time with dual train is approx:</font> <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					staminacheck=0
					days=0
					hours=0
					minutes=0
					seconds=0
					staminacheck=round(stamina_max-stamina)
					if(staminacheck>=600000000)return
					Start2
					if(staminacheck>=1036800)
						days+=1
						staminacheck-=1036800
						goto Start2
					if(staminacheck>=43200)
						hours+=1
						staminacheck-=43200
						goto Start2
					if(staminacheck>=720)
						minutes+=1
						staminacheck-=720
						goto Start2
					if(staminacheck>=12)
						seconds+=1
						staminacheck-=12
						goto Start2
					if(days>=1)usr<<"<center><font color=white>Your training time remaining with dual train is approx:</font> <font color = aqua>[days] </font>days(24hrs), <font color = lime>[hours] </font>hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else if(hours>=1)usr<<"<center><font color=white>Your training time remaining with dual train is approx:</font> <font color = lime>[hours] </font>hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else usr<<"<center><font color=white>Your training time remaining with dual train is approx:</font> <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					return
				if("Self-Train")
					var/staminacheck=0
					var/days=0
					var/hours=0
					var/minutes=0
					var/seconds=0
					staminacheck=stamina_max
					if(staminacheck>=600000000)return
					Start
					if(staminacheck>=518400)
						days+=1
						staminacheck-=518400
						goto Start
					if(staminacheck>=21600)
						hours+=1
						staminacheck-=21600
						goto Start
					if(staminacheck>=360)
						minutes+=1
						staminacheck-=360
						goto Start
					if(staminacheck>=6)
						seconds+=1
						staminacheck-=6
						goto Start
					if(days>=1)usr<<"<center><font color=white>Your maximum training time with self train is approx:</font> <font color = aqua>[days]</font> days(24hrs), <font color = lime>[hours] </font>hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else if(hours>=1)usr<<"<center><font color=white>Your maximum training time with self train is approx:</font> <font color = lime>[hours]</font> hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else usr<<"<center><font color=white>Your maximum training time with self train is approx:</font> <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					staminacheck=0
					days=0
					hours=0
					minutes=0
					seconds=0
					staminacheck=round(stamina_max-stamina)
					if(staminacheck>=600000000)return
					Start2
					if(staminacheck>=518400)
						days+=1
						staminacheck-=518400
						goto Start2
					if(staminacheck>=21600)
						hours+=1
						staminacheck-=21600
						goto Start2
					if(staminacheck>=360)
						minutes+=1
						staminacheck-=360
						goto Start2
					if(staminacheck>=6)
						seconds+=1
						staminacheck-=6
						goto Start2
					if(days>=1)usr<<"<center><font color=white>Your training time remaining with self train is approx:</font> <font color = aqua>[days] </font>days(24hrs), <font color = lime>[hours] </font>hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else if(hours>=1)usr<<"<center><font color=white>Your training time remaining with self train is approx:</font> <font color = lime>[hours] </font>hours, <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					else usr<<"<center><font color=white>Your training time remaining with self train is approx:</font> <font color = yellow>[minutes]</font> minutes and <font color=red>[seconds]</font> seconds</center>"
					return
	verb
		Ranks_OnOff()
			set category = "Training"
			set background=1
			if(usr.traininfo_on)
				usr.traininfo_on=0
				usr<<"Training Info is OFF"
			else
				usr.traininfo_on=1
				usr<<"Training Info is ON"
		Fix_Me()
			set category = "Channels"
			switch(input("What do you need help with?")in list("Fix Equipment","Overlays/Underlays","Rest/Fly/IT","Dead on Earth","Lost Transform verbs","Cancel"))
				if("Cancel")
					return
				if("Lost Transform verbs")
					if(usr.race=="Saiyan"&&usr.rage_chromosome)
						usr<<"\red I can't do that!"
						return
					else
						for(var/obj/Transform/Transform/T1 in usr)del(T1)
						for(var/obj/Transform/Revert/T2 in usr)del(T2)
						var/obj/Transform/Transform/T1=new
						var/obj/Transform/Revert/T2=new
						T1.loc=usr
						T2.loc=usr
						usr<<"\white Robot: You should get it back by now."
						return
				if("Fix Equipment")
					for(var/obj/O in usr)
						O.suffix=null
						O.equiped=0
					usr.weight=0
					usr.overlays-=usr.overlays
					usr.underlays-=usr.underlays
					usr.head="EMPTY"
					usr.back="EMPTY"
					usr.chest="EMPTY"
					usr.legs="EMPTY"
					usr.feet="EMPTY"
					usr.arms="EMPTY"
					usr.hands="EMPTY"
					usr.waist="EMPTY"
					usr.underclothes="EMPTY"
					usr.clothes="EMPTY"
					usr.clothes_eq=0
					usr.scouter=0
					usr.scouter_eq=0
					usr.armor=0
					usr.armor_eq=0
					usr.under=0
					usr.under_eq=0
					usr.helmet=0
					usr.helmet_eq=0
					usr.gloves=0
					usr.gloves_eq=0
					usr.z_sword=0
					usr.radar=0
					usr.hench_equiped=0
					usr.saiyan_equiped=0
					usr.sellable_items=0
					usr.weightgi = 0
					usr.weightcape = 0
					usr.weightarmor = 0
					usr.weightarm = 0
					usr.weightleg = 0
					usr.weightankle = 0
					usr.weightwrist = 0
					usr.weighthead = 0
					usr.f_armor=0
					if(usr.afk)usr.overlays+='afk.dmi'
					if(usr.sixteenitem)
						usr.powerlevel_max-=20000000
						usr.ki_max-=20000000
						usr.kidefense_max-=20000000
						usr.strength_max-=20000000
						usr.defence_max-=20000000
						usr.sixteenitem=0
					if(usr.supremeitem)
						usr.powerlevel_max-=30000000
						usr.ki_max-=30000000
						usr.kidefense_max-=30000000
						usr.strength_max-=30000000
						usr.defence_max-=30000000
						usr.supremeitem=0
					if(usr.evilitem)
						usr.strength_max-=100000000
						usr.evilitem=0
					if(usr.sauronitem)
						usr.defence_max-=10000000
						usr.strength_max-=10000000
						usr.powerlevel_max-=10000000
						usr.ki_max-=10000000
						usr.sauronitem=0
					if(usr.vegitoitem)
						usr.defence_max-=100000000
						usr.strength_max-=100000000
						usr.powerlevel_max-=100000000
						usr.ki_max-=100000000
						usr.vegitoitem=0
					if(usr.gokuitem)
						usr.defence_max-=500000000
						usr.strength_max-=500000000
						usr.powerlevel_max-=500000000
						usr.ki_max-=500000000
						usr.gokuitem=0
					if(usr.greenmonkitem)
						usr.stamina_max-=1000000
						usr.greenmonkitem=0
					if(usr.redmonkitem)
						usr.strength_max-=1500000000
						usr.redmonkitem=0
					if(usr.yellowmonkitem)
						usr.ki_max-=1500000000
						usr.yellowmonkitem=0
					if(usr.whitemonkitem)
						usr.powerlevel_max-=1500000000
						usr.whitemonkitem=0
					if(usr.greymonkitem)
						usr.defence_max-=1500000000
						usr.kidefense_max-=1500000000
						usr.greymonkitem=0
					if(usr.race=="Saiyan"||usr.race=="Half Saiyan"&&usr.Oozaru)
						if(usr.form_5&&!usr.form_6&&usr.rage_chromosome&&usr.powerlevel_max>=3500000)
							usr.icon = 'GOozaru2.dmi'
							usr.icon_state = ""
							usr.overlays += new/obj/techs/Overlays/GOozaru_top
						else
							usr.icon = 'Oozaru.dmi'
							usr.icon_state = ""
							usr.overlays += new/obj/techs/Overlays/Oozaru_top
					usr<<"\white Robot: Your equipment is now fixed."
					return
				if("Fix Icon")
					switch(input(usr,"Are you sure?","Fix Icon")in list("Yes","No"))
						if("Yes")
							usr.Skin_Apply()
							switch(usr.race)
								if("Bio-Android")
									if(!usr.form_1)usr.icon='Bio Android - Form 1.dmi'
									if(usr.form_1)usr.icon='Bio Android - Form 2.dmi'
									if(usr.form_2)usr.icon='Bio Android - Form 3.dmi'
								if("Majin")
									if(!usr.form_1)usr.icon='Majin - Form 1.dmi'
									if(usr.form_1)usr.icon='Majin - Form 2.dmi'
									if(usr.form_2)usr.icon='Majin - Form 3.dmi'
									if(usr.form_3)usr.icon='Majin - Form 4.dmi'
									if(usr.form_4)usr.icon='Majin - Form 5.dmi'
								if("Namekian")
									usr.icon='Namek - Normal.dmi'
									if(usr.form_3)usr.icon='Namek - Super.dmi'
								if("Konat")
									usr.icon='Konat - Form 1.dmi'
									if(usr.form_3)usr.icon='Namek - Super.dmi'
								if("Tuffle")
									usr.icon='Bebi - Form 1.dmi'
									if(usr.form_1)usr.icon='Bebi - Form 2.dmi'
									if(usr.form_2)usr.icon='Bebi - Form 2.dmi'
									if(usr.form_3)usr.icon='Bebi - Form 3.dmi'
									if(usr.form_4)usr.icon='Bebi - Form 3.dmi'
								if("Android")
									if(usr.form_1)usr.icon='Android13form2.dmi'
									if(usr.form_2)usr.icon='Android17form2.dmi'
							usr<<"\white Robot: You are now back to normal."
							return
				if("Overlays/Underlays")
					usr.overlays -= usr.overlays
					for(var/obj/Equipment/O in usr.contents)
						if(O.eq)O.eq=0
						usr.head="EMPTY"
						usr.back="EMPTY"
						usr.chest="EMPTY"
						usr.legs="EMPTY"
						usr.feet="EMPTY"
						usr.arms="EMPTY"
						usr.hands="EMPTY"
						usr.waist="EMPTY"
						usr.underclothes="EMPTY"
						usr.clothes="EMPTY"
						usr.clothes_eq=0
						usr.scouter=0
						usr.scouter_eq=0
						usr.armor=0
						usr.armor_eq=0
						usr.under=0
						usr.under_eq=0
						usr.helmet=0
						usr.helmet_eq=0
						usr.gloves=0
						usr.gloves_eq=0
						usr.z_sword=0
						usr.radar=0
						usr.hench_equiped=0
						usr.saiyan_equiped=0
						usr.sellable_items=0
						usr.weightgi = 0
						usr.weightcape = 0
						usr.weightarmor = 0
						usr.weightarm = 0
						usr.weightleg = 0
						usr.weightankle = 0
						usr.weightwrist = 0
						usr.weighthead = 0
						usr.f_armor=0
						O.suffix = null
						O.equiped=0
						usr.gitems =0
					usr.underlays -= usr.underlays
					for(var/obj/Equipment/O in usr.contents)
						if(O.eq)O.eq=0
						usr.head="EMPTY"
						usr.back="EMPTY"
						usr.chest="EMPTY"
						usr.legs="EMPTY"
						usr.feet="EMPTY"
						usr.arms="EMPTY"
						usr.hands="EMPTY"
						usr.waist="EMPTY"
						usr.underclothes="EMPTY"
						usr.clothes="EMPTY"
						usr.clothes_eq=0
						usr.scouter=0
						usr.scouter_eq=0
						usr.armor=0
						usr.armor_eq=0
						usr.under=0
						usr.under_eq=0
						usr.helmet=0
						usr.helmet_eq=0
						usr.gloves=0
						usr.gloves_eq=0
						usr.z_sword=0
						usr.radar=0
						usr.hench_equiped=0
						usr.saiyan_equiped=0
						usr.sellable_items=0
						usr.weightgi = 0
						usr.weightcape = 0
						usr.weightarmor = 0
						usr.weightarm = 0
						usr.weightleg = 0
						usr.weightankle = 0
						usr.weightwrist = 0
						usr.weighthead = 0
						usr.f_armor=0
						O.suffix = null
						O.equiped=0
						usr.gitems =0
					if(usr.aura_on)usr.aura_on=0
					if(usr.sixteenitem)
						usr.powerlevel_max-=20000000
						usr.ki_max-=20000000
						usr.kidefense_max-=20000000
						usr.strength_max-=20000000
						usr.defence_max-=20000000
						usr.sixteenitem=0
					if(usr.supremeitem)
						usr.powerlevel_max-=30000000
						usr.ki_max-=30000000
						usr.kidefense_max-=30000000
						usr.strength_max-=30000000
						usr.defence_max-=30000000
						usr.supremeitem=0
					if(usr.evilitem)
						usr.strength_max-=100000000
						usr.evilitem=0
					if(usr.sauronitem)
						usr.defence_max-=10000000
						usr.strength_max-=10000000
						usr.powerlevel_max-=10000000
						usr.ki_max-=10000000
						usr.sauronitem=0
					if(usr.vegitoitem)
						usr.defence_max-=100000000
						usr.strength_max-=100000000
						usr.powerlevel_max-=100000000
						usr.ki_max-=100000000
						usr.vegitoitem=0
					if(usr.gokuitem)
						usr.defence_max-=500000000
						usr.strength_max-=500000000
						usr.powerlevel_max-=500000000
						usr.ki_max-=500000000
						usr.gokuitem=0
					if(usr.greenmonkitem)
						usr.stamina_max-=1000000
						usr.greenmonkitem=0
					if(usr.redmonkitem)
						usr.strength_max-=1500000000
						usr.redmonkitem=0
					if(usr.yellowmonkitem)
						usr.ki_max-=1500000000
						usr.yellowmonkitem=0
					if(usr.whitemonkitem)
						usr.powerlevel_max-=1500000000
						usr.whitemonkitem=0
					if(usr.greymonkitem)
						usr.defence_max-=1500000000
						usr.kidefense_max-=1500000000
						usr.greymonkitem=0
					if(usr.afk)usr.overlays+='afk.dmi'
					if(usr.majin)usr.overlays += 'Majin.dmi'
					if(usr.race == "Saiyan" && usr.has_tail)usr.overlays += 'Tail.dmi'
					if(usr.race=="Saiyan"||usr.race=="Half Saiyan"&&usr.Oozaru)
						if(usr.form_5&&!usr.form_6&&usr.rage_chromosome&&usr.powerlevel_max>=3500000)
							usr.icon = 'GOozaru2.dmi'
							usr.icon_state = ""
							usr.overlays += new/obj/techs/Overlays/GOozaru_top
						else
							usr.icon = 'Oozaru.dmi'
							usr.icon_state = ""
							usr.overlays += new/obj/techs/Overlays/Oozaru_top
					usr<<"\white Robot: You are now back to normal."
					return
				if("Rest/Fly/IT")
					usr.density = 1
					usr.boxing = 0
					usr.buku = 0
					usr.doing = 0
					usr.frozen = 0
					usr.powering = 0
					usr.buku_lock = 0
					usr.icon_state = ""
					usr.charging = 0
					usr.attack_lock	= 0
					usr.ki_lock	= 0
					usr.it_lock	= 0
					usr.buku_lock = 0
					usr.playing = 0
					usr.buku_lock = 0
					usr.grav = 0
					usr.rest=0
					usr.hiting = 0
					usr.dualtrain = 0
					usr.dt_delay = 0
					usr.it_blocked=0
					usr<<"\white Robot: You now should be able to do things normally."
					return
				if("Dead on Earth")
					usr.charging = 0
					usr.icon_state = ""
					usr.overlays -= 'Halo.dmi'
					usr.overlays -= 'Halo.dmi'
					usr.overlays -= 'Halo.dmi'
					usr.dead = 0
					usr.density = 1
					usr.boxing = 0
					usr.buku = 0
					usr.doing = 0
					usr.frozen = 0
					usr.powering = 0
					usr.buku_lock = 0
					usr.icon_state = ""
					usr.charging = 0
					usr.attack_lock	= 0
					usr.ki_lock	= 0
					usr.it_lock	= 0
					usr.buku_lock = 0
					usr.playing = 0
					usr.buku_lock = 0
					usr.grav = 0
					usr.hiting = 0
					usr.dualtrain = 0
					usr.dt_delay = 0
					usr.it_blocked=0
					usr<<"\white Robot: You are now alive."
					return
		Display_Color()
			set category="Channels"
			set name="Change Display Color"
			nameColor=input("Select name color","Name Color",nameColor)as color
			AddName(AtName(name),color2Add=nameColor)
			return
		Use_Tps()
			set category = "Channels"
			switch(input("Where do you wish to use your TPs?","TPs")in list("Powerlevel","Ki","Ki Defense","Strength","Defense","Stamina","Cancel"))
				if("Cancel")
					usr.talking=0
					return
				if("Exp")
					var/TP=input("How many TPs do you wish to use? [num2text(round(usr.tp),15)] TPs") as num
					var/pl=20*TP
					if(TP>usr.tp)
						usr<<"<font color=white>Yamcha:</font> You don't have that many TPs!"
						usr.talking=0
						return
					if(TP==0||TP==null||!TP)
						usr.talking=0
						return
					while(TP==0||TP==null||!TP)
						usr.talking=0
						return
					if(TP<0)
						usr<<"<font color=white>Yamcha:</font> You must enter a positive number!"
						usr.talking=0
						return
					usr.powerlevel_max+=pl
					usr.powerlevel+=pl
					usr<<"<font color=white>Yamcha:</font> You have gained [num2text(round(pl),15)] Exp!"
					usr.tp-=TP
					usr.talking=0
					return
				if("Stamina")
					var/TP=input("How many TPs do you wish to use? [num2text(round(usr.tp),15)] TPs") as num
					var/pl=TP/1.5
					if(TP>usr.tp)
						usr<<"<font color=white>Yamcha:</font> You don't have that many TPs!"
						usr.talking=0
						return
					if(TP==0||TP==null||!TP)
						usr.talking=0
						return
					while(TP==0||TP==null||!TP)
						usr.talking=0
						return
					if(TP<0)
						usr<<"<font color=white>Yamcha:</font> You must enter a positive number!"
						usr.talking=0
						return
					usr.stamina_max+=pl
					usr<<"<font color=white>Yamcha:</font> You have gained [num2text(round(pl),15)] Stamina!"
					usr.tp-=TP
					usr.talking=0
					return
				if("Powerlevel")
					var/TP=input("How many TPs do you wish to use? [num2text(round(usr.tp),15)] TPs") as num
					var/pl=rand(100,200)*TP
					if(TP>usr.tp)
						usr<<"<font color=white>Yamcha:</font> You don't have that many TPs!"
						usr.talking=0
						return
					if(TP==0||TP==null||!TP)
						usr.talking=0
						return
					while(TP==0||TP==null||!TP)
						usr.talking=0
						return
					if(TP<0)
						usr<<"<font color=white>Yamcha:</font> You must enter a positive number!"
						usr.talking=0
						return
					usr.powerlevel_max+=pl
					usr.powerlevel+=pl
					usr<<"<font color=white>Yamcha:</font> You have gained [num2text(round(pl),15)] Powerlevel!"
					usr.tp-=TP
					usr.talking=0
					return
				if("Ki")
					var/TP=input("How many TPs do you wish to use? [num2text(round(usr.tp),15)] TPs") as num
					var/pl=rand(100,200)*TP
					if(TP>usr.tp)
						usr<<"<font color=white>Yamcha:</font> You don't have that many TPs!"
						usr.talking=0
						return
					if(TP==0||TP==null||!TP)
						usr.talking=0
						return
					while(TP==0||TP==null||!TP)
						usr.talking=0
						return
					if(TP<0)
						usr<<"<font color=white>Yamcha:</font> You must enter a positive number!"
						usr.talking=0
						return
					usr.ki_max+=pl
					usr.ki+=pl
					usr<<"<font color=white>Yamcha:</font> You have gained [num2text(round(pl),15)] Ki!"
					usr.tp-=TP
					usr.talking=0
					return
				if("Ki Defense")
					var/TP = input ("How many TPs do you wish to use? [num2text(round(usr.tp),15)] TPs") as num
					var/pl = rand(100,200) * TP
					if(TP > usr.tp)
						usr<<"<font color=white>Yamcha:</font> You don't have that many TPs!"
						usr.talking = 0
						return
					if(TP == 0 || TP == null || !TP)
						usr.talking = 0
						return
					while(TP == 0 || TP == null || !TP)
						usr.talking = 0
						return
					if(TP < 0)
						usr<<"<font color=white>Yamcha:</font> You must enter a positive number!"
						usr.talking = 0
						return
					usr.kidefense_max += pl
					usr.kidefense += pl
					usr<<"<font color=white>Yamcha:</font> You have gained [num2text(round(pl),15)] Ki Defense!"
					usr.tp -= TP
					usr.talking = 0
					return
				if("Strength")
					var/TP=input("How many TPs do you wish to use? [num2text(round(usr.tp),15)] TPs") as num
					var/str=rand(75,150)*TP
					if(TP>usr.tp)
						usr<<"<font color=white>Yamcha:</font> You don't have that many TPs!"
						usr.talking=0
						return
					if(TP==0||TP==null||!TP)
						usr.talking=0
						return
					while(TP==0||TP==null||!TP)
						usr.talking=0
						return
					if(TP<0)
						usr<<"<font color=white>Yamcha:</font> You must enter a positive number!"
						usr.talking=0
						return
					usr.strength+=str
					usr.strength_max+=str
					usr<<"<font color=white>Yamcha:</font> You have gained [num2text(round(str),15)] Strength!"
					usr.tp-=TP
					usr.talking=0
					return
				if("Defense")
					var/TP=input("How many TPs do you wish to use? [num2text(round(usr.tp),15)] TPs") as num
					var/str=rand(75,150)*TP
					if(TP>usr.tp)
						usr<<"<font color=white>Yamcha:</font> You don't have that many TPs!"
						usr.talking=0
						return
					if(TP==0||TP==null||!TP)
						usr.talking=0
						return
					while(TP==0||TP==null||!TP)
						usr.talking=0
						return
					if(TP<0)
						usr<<"<font color=white>Yamcha:</font> You must enter a positive number!"
						usr.talking=0
						return
					usr.defence+=str
					usr.defence_max+=str
					usr<<"<font color=white>Yamcha:</font> You have gained [num2text(round(str),15)] Defense!"
					usr.tp-=TP
					usr.talking=0
					return
		Options()
			set category = "Channels"
			switch(input("What would you like to configure?","Options",)in list("Toggle Earth Quake Effect","Toggle Finish Text","Toggle Tabs","Chat Options","Techniques Options","Whisper Notification","Toggle FT Info","Training Visibility","Damage Info","Toggle Meditate Info","Toggle Challenges","Event Options","Toggle Challenge Info","Cancel"))
				if("Cancel")return

				if("Event Options")switch(input("What events would you like to configure?","Options")in list("Christmas","Cancel"))
					if("Cancel")return
					if("Christmas")switch(input("Configure what option?","Options")in list("Enable Christmas Hat","Disable Christmas Hat","Cancel"))
						if("Cancel")return
						if("Disable Christmas Hat")
							xmas_hat_enabled=0
							return
						if("Enable Christmas Hat")
							xmas_hat_enabled=1
							return

				if("Toggle Finish Text")
					switch(input("What do you want to do?","Finish Text",)in list("Enable Finish Text","Disable Finish Text","Edit Finish Text","Cancel"))
						if("Cancel")return
						if("Enable Finish Text")
							customfinish=1
							return
						if("Disable Finish Text")
							customfinish=0
							return
						if("Edit Finish Text")
							var/ft1=input("Type in the text you want to say when you finish off your enemy:")as text
							ft1=html_encode(ft1)
							if(lentext(ft1)>80)
								usr<<"80 characters max."
								return
							customfinishtxt=ft1
							return
				if("Toggle Tabs")
					switch(input("Which Tab?","Toogle Tabs") in list ("Guild Members","Server","Simulations","Vitals","Skills","Quests","Inventory","Masteries","Cancel"))
						if("Cancel")return
						if("Server")
							switch(alert("On or Off","","On","Off"))
								if("On")tab_server=1
								if("Off")tab_server=0
						if("Simulations")
							switch(alert("On or Off","","On","Off"))
								if("On")tab_Simulation=1
								if("Off")tab_Simulation=0
						if("Guild Members")
							switch(alert("On or Off","","On","Off"))
								if("On")tab_guild=1
								if("Off")tab_guild=0
						if("Vitals")
							switch(alert("On or Off","","On","Off"))
								if("On")tab_vitals=1
								if("Off")tab_vitals=0
						if("Skills")
							switch(alert("On or Off","","On","Off"))
								if("On")tab_skills=1
								if("Off")tab_skills=0
						if("Quests")
							switch(alert("On or Off","","On","Off"))
								if("On")tab_quests=1
								if("Off")tab_quests=0
						if("Inventory")
							switch(alert("On or Off","","On","Off"))
								if("On")tab_inventory=1
								if("Off")tab_inventory=0
						if("Masteries")
							switch(alert("On or Off","","On","Off"))
								if("On")tab_masteries=1
								if("Off")tab_masteries=0
				if("Chat Options")
					switch(input("What options would you like to configure?","Options")in list("Toggle OOC","Toggle Guild OOC","Toggle Simulations","Toggle Whispers","Toggle Trade","Cancel"))
						if("Toggle Simulations")
							switch(alert("On or Off","","On","Off"))
								if("On")onSimulations=1
								if("Off")onSimulations=0
						if("Toggle Guild OOC")
							switch(alert("On or Off","","On","Off"))
								if("On")
									gooc_on=1
									for(var/mob/PC/C in world)if(C.guild_name==guild_name)C << "[usr] has turned his guild OOC \green ON"
								if("Off")
									gooc_on=0
									for(var/mob/PC/C in world)if(C.guild_name==guild_name)C << "[usr] has turned his guild OOC \red OFF"
						if("Toggle OOC")
							switch(alert("On or Off","","On","Off"))
								if("On")
									ooc_on=1
									world<<"[src] turned their OOC \green ON"
								if("Off")
									ooc_on=0
									world<<"[usr] turned their OOC \red OFF"
						if("Toggle Whispers")
							switch(alert("On or Off","","On","Off"))
								if("On")
									wisper_on=1
									world<<"[usr] turned their whispers \green ON"
								if("Off")
									wisper_on=0
									world<<"[usr] turned their whispers \red OFF"
						if("Toggle Trade")
							switch(alert("On or Off","","On","Off"))
								if("On")
									tradeon=1
									usr<<"You turned your trade channel \green ON"
								if("Off")
									tradeon=0
									usr<<"You turned your trade channel \red OFF"
				if("Techniques Options")
					switch(input("What do you wish to change?")in list("Ki Usage","Homing Settings","Kill/KO","Transformation Options","Transformation Text"/*,"Instant Transmission Options"*/,"Cancel"))
						if("Cancel")return
						if("Transformation Text")
							alert("Not all races go up to Form 6. If you don't want any text, leave it blank. HTML is NOT allowed. 45 characters max.")
							var/t1=input(usr,"Type in the text you want to say when you transform into your First form/Invert Power:")as text
							t1=html_encode(t1)
							if(lentext(t1)>80)
								usr<<"80 characters max."
								return
							trans1t=t1
							var/t2=input("Type in the text you want to say when you transform into your Second form:")as text
							t2=html_encode(t2)
							if(lentext(t2)>80)
								usr<<"80 characters max."
								return
							trans2t=t2
							var/t3=input("Type in the text you want to say when you transform into your Third form:")as text
							t3=html_encode(t3)
							if(lentext(t3)>80)
								usr<<"80 characters max."
								return
							trans3t=t3
							var/t4=input("Type in the text you want to say when you transform into your Fourth form:")as text
							t4=html_encode(t4)
							if(lentext(t4)>80)
								usr<<"80 characters max."
								return
							trans4t=t4
							var/t5=input("Type in the text you want to say when you transform into your Fifth form:")as text
							t5=html_encode(t5)
							if(lentext(t5)>80)
								usr<<"80 characters max."
								return
							trans5t=t5
							var/t6=input("Type in the text you want to say when you transform into your Sixth form:")as text
							t6=html_encode(t6)
							if(lentext(t6)>80)
								usr<<"80 characters max."
								return
							trans6t=t6
						if("Transformation Options")
							switch(alert("Do you want to damage your surroundings when transforming?","","Yes","No"))
								if("Yes")crater_on=1
								else crater_on=0
							switch(alert("Do you want to unleash your aura when transforming?","","Yes","No"))
								if("Yes")
									trans_aura_on=1
									return
								else
									trans_aura_on=0
									return
						if("Homing Settings")
							switch(alert("What do you wish to change?","","Change Target Options","Cancel"))
								if("Cancel")return
								if("Set Target Name")
									var/nm=input("Set the target's name. (Case sensitive)")as text
									if(!nm)return
									attacktarget="[nm]"
								if("Change Target Options")
									switch(alert("Do you want your homing attacks to target your GUILD members?","Guild Members","Yes","No"))
										if("Yes")attackguild=1
										else attackguild=0
									switch(alert("Do you want your homing attacks to target your PARTY members?","PARTY Members","Yes","No"))
										if("Yes")attackparty=1
										else attackparty=0
						if("Ki Usage")
							var/xx=input("How much ki % do you wish to use in your attacks?(Default is 50%)")as num
							if(xx<=0)xx=1
							if(xx>=100)xx=100
							if(xx>0&&xx<=100)
								var/xxx=round(xx)
								alert("Ki usage set to: [xxx]%")
								kiuse=xxx/100
								return
							else
								alert("Input a number from 1-100.")
								return
						if("Kill/KO")
							switch(alert("Do you want your techniques to Kill or KO?","","Kill","KO"))
								if("Kill")
									kill=1
									return
								else
									kill=0
									return

						if("Toggle Earth Quake Effect")
							if(src.Quake_Effect_Toggle == 0)
								src << "<font color = red>Earth Quake effect is now disabled!"
								src.Quake_Effect_Toggle = 1
							else
								src << "<font color = green>Earth Quake effect is now enabled!"
								src.Quake_Effect_Toggle = 0


				if("Whisper Notification")
					switch(alert("Toggle IM sounds On or Off","","On","Off"))
						if("On")
							usr.sound_on=1
							return
						if("Off")
							usr.sound_on=0
							return

				if("Damage Info")
					if(!damage_enabled)
						switch(alert("This option enables you to see the damage you caused and received.","Toggle Damage Information?","Yes","No"))
							if("Yes")
								usr<<"<font color=red>Damage Information has been enabled!</font>"
								damage_enabled=1
								return
							if("No")return
					if(damage_enabled)
						switch(alert("This option disables you to see the damage you caused and received.","Toggle Damage Information?","Yes","No"))
							if("Yes")
								usr<<"<font color=red>Damage Information has been disabled!</font>"
								damage_enabled=0
								return
							if("No")return

				if("Training Visibility")
					if(!level_on)
						switch(alert("This option enables you to see your stat gains on output.","Enable?","Yes","No"))
							if("Yes")
								usr<<"<font color=green>Level gains is now visible!"
								level_on=1
								return
							else return
					else
						switch(alert("This option disables you to see your stat gains on output.","Disable?","Yes","No"))
							if("Yes")
								usr<<"<font color=red>Level gains is now invisible!"
								level_on=0
								return
							else return

				if("Toggle FT Info")
					if(!ft_toggler)
						switch(input("Do you want to enable the gain information for FT?")in list("Yes","No"))
							if("Yes")ft_toggler=1
						return
					switch(input("Do you want to disable the gain information for FT")in list("Yes","No"))
						if("Yes")ft_toggler=0
					return

				if("Toggle Meditate Info")
					if(!med_toggler)
						switch(input("Do you want to enable the gain information?")in list("Yes","No"))
							if("Yes")med_toggler=1
						return
					switch(input("Do you want to disable the gain information?")in list("Yes","No"))
						if("Yes")med_toggler=0
					return

				if("Toggle Challenges")
					switch(alert("Toggle Challenges On or Off","","On","Off"))
						if("On")
							challenge_on=1
							return
						if("Off")
							challenge_on=0
							return

				if("Toggle Challenge Info")
					switch(alert("Toggle Challenge Info On or Off","","On","Off"))
						if("On")
							arenatxt=1
							return
						if("Off")
							arenatxt=0
							return

	verb
		AdminHelp()
			set category = "Channels"
			set name = "Admin Help"
			if(VoteMute.Find(key))
				usr<<"You have been muted!"
				return
			var/T=input("Admin Help:")as null|text
			if(T==""||T==null||T==0||!T)return
			if(lentext(T)>20)
				usr<<"Please use shorter sentence."
				return
			if(Check_For_Spam(T,SPAM)==TRUE)
				usr<<"Please do not use linebreak characters."
				return
			if(admin_muted)
				usr<<"You are muted!"
				return
			if(adminsay_delay>=3)
				usr<<"You must wait 30 seconds before using Admin Help again."
				admin_muted=1
				spawn(300)if(usr)admin_muted=0
				return
			T = html_encode(T)
			if(lentext(T)>250)
				ChatLog(src,"Admin Help: [T]")
				src<<"Your message cannot exceed 250 characters."
				T=copytext(T,1,151)
			for(var/mob/PC/C in world)if(C.GMLevel)C << "\red (ADMIN HELP): [usr] Says: [T]"
			usr<<"\red Message sent."
			adminsay_delay+=1
			spawn(120)if(usr)adminsay_delay-=1

		Online_Enforcers()
			set category="Channels"
			if(spam_delay)return
			spam_delay=1
			var/count=0
			usr<<"----------------------"
			for(var/mob/M in world)
				if(M.GMLevel>=1 && !M.adminhidden && M.afk)
					count ++
					usr<<"[M]([M.key])-----[M.GMLevel] \red (AFK)"
				if(M.GMLevel>=1 && !M.adminhidden && !M.afk)
					count ++
					usr<<"[M]([M.key])-----[M.GMLevel]"
			usr<<"<font color=green>Online Enforcers: [count]"
			usr<<"----------------------"
			spawn(50)if(usr)spam_delay=0

		Emote(T as text)
			set category = "Channels"
			if(T==null||!T)return
			if(VoteMute.Find(key))
				usr<<"You have been muted!"
				return
			if(channelmute=="All")
				usr<<"All chat channels have been muted."
				return
			if(World_Mute&&!GMLevel)
				usr<<"The World is muted!"
				return
			if(saymute)
				usr<<"You have been muted for Flood Supression"
				return
			for(var/mob/C in world)
				if(C!=usr)
					if(C.client)
						if(C.client.address==client.address)
							if(C.muted&&C.GMLevel<=0||C.oocmute||C.mutedperm&&!GMLevel)
								usr<<"Your another character is muted, hence you cannot MUTE AVOID!"
								return
			if(muted)
				usr<<"You are muted!"
				return
			if(oocmute||mutedperm)
				usr<<"You are muted!"
				return
			if(say_delay>=5&&!GMLevel)
				world<<"<font color = #00B211>Dragon AI:</font> \white [usr] has been automatically <font color=red>muted</font> for 30 seconds for \red spamming."
				say_delay=0
				oocmute=1
				spawn(300)if(usr&&oocmute)
					oocmute=0
					world<<"<font color=green>Dragon AI:</font> <font color=red>[usr] has been automatically unmuted!</font>"
				return
			if(CapsCount(T)<0)
				if(!GMLevel)
					world<<"<font color = #00B211>Dragon AI:</font> \white [usr] has been automatically <font color=red>muted</font> for 30 seconds for using \red caps."
					oocmute=1
					spawn(300)if(usr&&oocmute)
						oocmute=0
						world<<"<font color=green>Dragon AI:</font> <font color=red>[usr] has been automatically unmuted!</font>"
					return
			if(Check_For_Profanity(T,PROFANITY)==TRUE)
				if(!GMLevel)
					world<<"<font color = #00B211>Dragon AI:</font> \white [usr] has been automatically <font color=red>muted</font> for 30 seconds for \red linking."
					oocmute=1
					spawn(300)if(usr&&oocmute)
						oocmute=0
						world<<"<font color=green>Dragon AI:</font> <font color=red>[usr] has been automatically <font color=red>unmuted</font>!</font>"
					return
			if(Check_For_Spam(T,SPAM)==TRUE)
				usr<<"Please do not use linebreak characters."
				return
			if(!T)
				ChatLog(usr,"[name] [T]")
				return
			if(lentext(T)>250)
				ChatLog(usr,"[name] [T]")
				usr<<"Your message can not exceed 250 characters."
				T=copytext(T,1,151)
			if(afk)
				world<<"<font color=white>[usr] is <font color=green>back."
				afk=0
				overlays-='AFK.dmi'
			view(8)<<"<font color=#6495ED>[usr] [T]"
			say_delay+=1
			spawn(110)if(usr)say_delay-=1

		AFK()
			set category = "Channels"
			set name = "AFK Toggle"
			if(!afk&&!spam_delay)
				afk=1
				overlays+='AFK.dmi'
				world<<"<font color=white>[usr] is <font color=red>AFK."
				spam_delay=1
				spawn(35)if(usr)spam_delay=0
				return
			if(afk&&!spam_delay)
				afk=0
				overlays-='AFK.dmi'
				world<<"<font color=white>[usr] is <font color=green>back."
				spam_delay=1
				spawn(35)if(usr)spam_delay=0
				return

		Drop_Zenni()
			set name = "Drop Zenni"
			set category = "Channels"
			var/dropgold = input("How much zenni(es) do you want to drop? (You have [num2text(zenni,100)] zenni(es)!)","Drop zenni(es)")as null|num
			if(!dropgold)return
			if(dropgold<1)
				usr<<"<font color=red>You have to drop AT LEAST 1 zenni!"
				return
			if(dropgold>usr.zenni)
				usr<<"<font color=red>You don't have that much zenni(es) to drop!"
				return
			else
				var/obj/zeniebag/O=new /obj/zeniebag(usr.loc)
				O.zenni=dropgold
				usr.zenni-=dropgold
				usr<<"<font color=white>You drop <B>[dropgold]</b> zenni(es)."
				view(6)<<"<font color=white>[usr] drops <b>[dropgold]</B> zenni(es)."
				return


obj
	zeniebag
		name = "Money"
		icon = 'MoneyBag.dmi'
		icon_state = "moneybag"
		var
			zenni=0
		verb
			PickUp()
				set name = "Pick Up"
				set category = null
				set src in oview(0)
				usr<<"<font color=white>You get <b>[zenni]</b> zennies!"
				usr.zenni+=zenni
				del(src)
mob/var/tmp/list/Ignored=list()
mob/PC
	verb
		Donate_Training_Points(mob/PC/M in view(8))
			set hidden=1
			set category="Channels"
			if(!M.client)return
			if(M.client.address==client.address&&M.client.computer_id==client.computer_id)
				usr<<"You cannot trade with your alt."
				return
			usr<<"This enables you to donate your training points to another player at half of your training points cost."
			sleep(10)
			if(!usr||!M)return
			switch(input("Are you sure you want to donate [M] your training points?")in list("Yes","No"))
				if("No"||!M)return
				if("Yes")
					var/oldtp=tp
					tp/=2
					var/amount=input("How much training points? Max tps you can donate is [tp]!") as null|num
					if(!amount||!M)
						tp=oldtp
						return
					if(amount>tp)
						usr<<"Error: The amount you're trying to donate is over your current training points!"
						tp=oldtp
						return
					else
						tp-=amount
						M.tp+=amount
						usr<<"<font color=green>Donation Information:</font> [amount] of tps has been successfully donated to [M]!"
						M<<"<font color=green>Donation Information:</font> You received [amount] of tps from [usr]!"
						return
		Ignore(mob/PC/C in world)
			set category = "Channels"
			if(C==usr)
				usr<<"You cannot ingore yourself!"
				return
			if(C.GMLevel)
				usr<<"You cannot ingore an admin!"
				return
			if(istype(C,/mob/PC))
				var/X=alert("Do you want to ignore all messages from [C]?","Ignore [C]","Yes","No")
				if(X=="No"||!usr||!C)return
				else
					if(Ignored.Find(C))
						usr<<"You have already ignored [C]."
						return
					Ignored+=C
					usr<<"You are now ignoring [C]."
					if(!C.Ignored.Find(usr))C<<"[usr] has added you to their ignore list."
					return
			else
				usr<<"You can only ignore players!"
				return
		Unignore(mob/PC/C in Ignored)
			set category="Channels"
			var/X=alert("Do you want to un-ignore [C]?","Unignore [C]","Yes","No")
			if(X=="No"||!usr)return
			else
				Ignored-=C
				usr<<"You are no longer ignoring [C]."
				if(!C.Ignored.Find(usr))C<<"[usr] has removed you from their ignore list."
				return
		Check_Ingore_List()
			set category="Channels"
			var/count=0
			usr<<"---Ignored Players---"
			for(var/mob/PC/C in Ignored)
				usr<<"[C]"
				count++
			usr<<"You're currently ignoring [count] player(s)!"
			return

