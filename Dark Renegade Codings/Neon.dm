mob/var/Neon_quest_start = 0
mob/var/Neon_quest_complete = 0
mob/var/obtained_Amulet=0
mob
	NPC
		Amulet
			name= "Amulet"
			icon='BrolyNecklace.dmi'
			icon_state= ""
			density =0
			it_blocked = 1
			safe=1
			New()
				..()
				src.AddName()
			verb
				Talk()
					set src in oview(2)
					if(usr.obtained_Amulet==1)
						usr<<"You've already got the Amulet!"
						usr.talking=0
						return
					if(usr.Neon_quest_start==0)
						usr<<"You're Not Doing This Quest"
						return
					else
						usr.obtained_Amulet=1
						usr<<"You Found the Amulet!"
						return

mob
	NPC
		Neon
			name = "{NPC}Neon"
			icon = 'Neon.dmi'
			icon_state = ""
			density = 1
			safe = 1
			New()
				..()
				src.AddName()
			verb
				Talk()
					set src in oview(2)
					if(usr.talking || usr.fused)
						return
					if(usr.level <=9990)
						usr<<"Must be above level 10k"
						usr.talking=0
						return
					else
						usr.talking=1
						if(!usr.Neon_quest_start)
							usr<<"<font color='#5f520e'>Neon:</font> [usr]! I require your assistance, can you lend it?"
							sleep(15)
							switch(alert("Help Me?","Quest: Find Amulet","Yes","No"))
								if("Yes")
									usr.Neon_quest_start = 1
									usr.contents += new/obj/Quests/Neon/Lost_Amulet
									usr<<"<font color='#5f520e'>Neon:</font> Go! . I think <font colour = '#4d503b'>It</font> was Hidden somewhere Near..."
									usr.talking=0
									return
								else
									usr<<"<font color='#5f520e'>Neon:</font> go away!"
									usr.talking=0
									return
						else
							if(!usr.Neon_quest_complete&&usr.obtained_Amulet)
								usr.talking=0
								usr<<"<font color='#5f520e'>Neon:</font>Thank you for Finding it, it was a Fake! here for your Bravery, is the Real one."
								usr.Neon_quest_complete = 1
								usr.powerlevel_max *= 2.5
								usr.ki_max *= 2.5
								usr.kidefense_max *= 2.5
								usr.strength_max *= 2.5
								usr.defence_max *= 2.5
								usr.tp+=2000
								usr.overlays += 'BrolyNecklace.dmi'
								usr.strength = usr.strength_max
								usr.defence = usr.defence_max
								usr.powerlevel = usr.powerlevel_max
								usr.ki = usr.ki_max
								usr.kidefense = usr.kidefense_max
								usr.contents += new/obj/Quests/Neon/Lost_Amulet
								spawn(150) src.icon_state = ""
								for(var/obj/Quests/Neon/Lost_Amulet/Q)del(Q)
								return
							if(!usr.Neon_quest_complete&&!usr.obtained_Amulet)
								usr<<"<font color='#5f520e'>Neon:</font> Get the Amulet!"
								usr.talking=0