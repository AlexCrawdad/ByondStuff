mob/var/Syn_quest_start = 0
mob/var/Syn_quest_complete = 0
mob/var/obtained_dragonball=0
mob
	NPC
		Greendragonball
			name= "Greendragonball"
			icon='greenstar.dmi'
			density =0
			safe=1
			New()
				..()
				src.AddName()
			verb
				Talk()
					set src in oview(2)
					if(usr.obtained_dragonball==1)
						usr<<"You Already Grabbed The Dragonball"
						usr.talking=0
						return
					if(usr.Syn_quest_start==0)
						usr<<"Your Not Doing This Quest"
						return
					else
						usr.obtained_dragonball=1
						usr<<"You Found Syns Dragonball"
						return

mob
	NPC
		Syn
			name = "{NPC}Syn"
			icon = 'Syn.dmi'
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
					if(usr.level <=9999)
						usr<<"Must be above level 10k"
						usr.talking=0
						return
					else
						usr.talking=1
						if(!usr.Syn_quest_start)
							usr<<"<font color='#5f520e'>Syn:</font> Weak , [usr]! I require your assistance, can you lend it?"
							sleep(15)
							switch(alert("Help Me?","Quest: Find Dragonball","Yes","No"))
								if("Yes")
									usr.Syn_quest_start = 1
									usr.contents += new/obj/Quests/Syn/Lost_Dragonball
									usr<<"<font color='#5f520e'>Syn:</font> Go! . I think <font colour = '#4d503b'>It</font> was laying on water turning green."
									usr.talking=0
									return
								else
									usr<<"<font color='#5f520e'>Syn:</font> Get away before i kill you."
									usr.talking=0
									return
						else
							if(!usr.Syn_quest_complete&&usr.obtained_dragonball)
								usr.talking=0
								usr<<"<font color='#5f520e'>Syn:</font>Now i can destroy the world but ill give you a fighting chance"
								usr.Syn_quest_complete = 1
								usr.powerlevel_max *= 1.5
								usr.ki_max *= 1.5
								usr.kidefense_max *= 1.5
								usr.strength_max *= 1.5
								usr.defence_max *= 1.5
								usr.tp+=1000
								usr.contents += new/obj/Quests/Syn/Lost_Dragonball
								spawn(150) src.icon_state = ""
								for(var/obj/Quests/Syn/Lost_Dragonball/Q)del(Q)
								return
							if(!usr.Syn_quest_complete&&!usr.obtained_dragonball)
								usr<<"<font color='#5f520e'>Syn:</font> Get my Dragonball, [usr]!"
								usr.talking=0