mob/var/chest_boost = 0
mob/var/chest_boost_used = 0
mob/NPC/
	Chest
		name = "Chest"
		icon_state = "closed"
		density = 1
		it_blocked = 1
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
				if(!usr.chest_boost && !usr.chest_boost_used && usr.level >= 1000)
					usr.chest_boost_used = 1
					switch(alert("Do you wish to use the Chest?","use Chest?","Yes","Not Yet"))
						if("Yes")
							usr<<"you have Used the Chest!!!!"
							sleep(50)
							usr<<"you feel more Powerful!!"
							usr.icon_state = "enrage"
							usr.frozen = 1
							usr.doing = 1
							sleep(40)
							if(!usr)return
							usr<<"okay."
							usr.icon_state = ""
							usr.frozen = 0
							usr.doing = 0
							usr.powerlevel_max *= 3
							usr.ki_max *= 3
							usr.kidefense_max *= 3
							usr.strength_max *= 3
							usr.defence_max *= 3
							usr.strength = usr.strength_max
							usr.defence = usr.defence_max
							usr.powerlevel = usr.powerlevel_max
							usr.ki = usr.ki_max
							usr.kidefense = usr.kidefense_max
							usr.safe = 0
							usr.chest_boost = 1
							usr.chest_boost_used = 1
							usr.talking=0
							return
						if("Not Yet")
							usr.chest_boost_used = 0
							usr.talking=0
							usr<<"Okay, come Back later"
							return
				else
					usr.talking=0
					usr<<"You do not meet the Requirement to Use this, or Have already used it!"
					return