mob/var/bulma_quest_complete = 0
mob
	NPC
		icon='NPCs.dmi'
		Dr_Briefs
			name = "{NPC}Dr. Briefs"
			icon_state = "Dr. Briefs"
			density = 1
			safe = 1
			New()
				..()
				src.AddName()
			verb
				Talk()
					set src in oview(2)
					set category=null
					if(usr.talking)return
					usr.talking = 1
					if(usr.bulma_quest_start && !usr.bulma_quest_complete)
						usr<<"<font color=white>Dr.Briefs:</font> Greetings, [usr]. I see you've brought the part I requested from Bulma!"
						sleep(15)
						if(usr.inven_min < usr.inven_max)
							for(var/obj/Quests/Bulma/Malfunction/Q)del(Q)
							for(var/obj/Equipment/Spanner/O)del(O)
							usr<<"<font color=white>Dr.Briefs:</font> Thanks for your help, [usr]! Here's a little something for your trouble."
							usr.bulma_quest_complete = 1
							usr.contents += new/obj/Equipment/Capsule
							usr.talking = 0
							return
						else
							usr<<"<font color=white>Dr.Briefs:</font> Your inventory is full!"
							usr.talking = 0
							return
					else
						usr<<"\white Dr.Briefs: Have you talked to my daughter lately?"
						usr.talking = 0
						return
