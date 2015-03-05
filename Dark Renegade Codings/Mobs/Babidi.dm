mob/var/majin = 0
mob/var/gone_majin = 0
mob/NPC/
	Babidi
		name = "{NPC}Babidi"
		icon_state = "Babidi"
		density = 1
		safe = 1
		New()
			..()
			src.AddName()
		verb
			Talk()
				set src in oview(2)
				set category = null
				if(usr.talking||usr.fused)return
				usr.talking=1
				if(usr.race != "Alien")
					if(!usr.majin && usr.karma == "Evil" && usr.karma_rating >= 50 && !usr.gone_majin && usr.level >= 500)
						usr.gone_majin = 1
						switch(alert("Do you wish to join my army?","Join Babidi?","Yes","Not Yet"))
							if("Yes")
								usr<<"<font color=white>Babidi:</font> He He He, I sense evil deep within your soul. Let me unlock it!"
								sleep(50)
								usr<<"<font color=white>You feel Babidi take control of your mind!"
								usr.icon_state = "enrage"
								usr.frozen = 1
								usr.doing = 1
								sleep(40)
								if(!usr)return
								usr<<"<font color=white>Babidi:</white> He He. How do you feel [usr]? He He..."
								usr.icon_state = ""
								usr.frozen = 0
								usr.doing = 0
								usr.powerlevel_max *= 2
								usr.ki_max *= 2
								usr.kidefense_max *= 2
								usr.strength_max *= 2
								usr.defence_max *= 2
								usr.overlays += 'Majin.dmi'
								usr.strength = usr.strength_max
								usr.defence = usr.defence_max
								usr.powerlevel = usr.powerlevel_max
								usr.ki = usr.ki_max
								usr.kidefense = usr.kidefense_max
								usr.safe = 0
								usr.majin = 1
								usr.gone_majin = 1
								usr.talking=0
								return
							if("Not Yet")
								usr.gone_majin = 0
								usr.talking=0
								usr<<"<font color=white>Babidi:</font> Then what do you want? Go away!"
								return
					else
						usr.talking=0
						usr<<"<font color=white>Babidi:</font> Go away!"
						return
				else
					usr<<"<font color=white>Babidi:</font> Go away!"
					usr.talking=0
					return
			Set_Spawn_Point()
				set src in oview(2)
				set category=null
				switch(alert("Set spawn point here?","Spawn Point","Yes","No"))
					if("Yes")usr.spawn_point = "Babidi"
					else return