mob/var/roshi_quest_start = 0
mob/var/roshi_quest_complete = 0
mob/var/got_rock = 0
mob
	NPC
		Master_Roshi
			name = "{NPC}Master Roshi"
			icon_state="Roshi"
			density = 1
			safe = 1
			New()
				..()
				src.AddName()
			verb
				Talk()
					set src in oview(2)
					set category=null
					if(usr.talking || usr.fused)return
					usr.talking=1
					if(!usr.roshi_quest_start)
						usr<<"<font color=white>Master Roshi:</font> Hi [usr]. I have an interesting skill to teach if you want to learn?"
						sleep(15)
						switch(alert("You want to learn the Kamehameha Wave?","","Yes","No"))
							if("Yes")
								usr.roshi_quest_start=1
								usr<<"<font color=white>Master Roshi:</font> I have hidden a rock somewhere around this island. Find it and I'll teach you a powerful technique!"
								usr<<"<font color=white>Master Roshi:</font> Good to hear! I'll need you to find this rock that I have thrown somewhere in the world!"
								usr.talking=0
								usr.contents += new/obj/Quests/Master_Roshi/Masters_Technique
								return
							else
								usr<<"<font color=white>Master Roshi:</font> When you change your mind, come see me."
								usr.talking=0
								return
					else
						if(!usr.roshi_quest_complete)
							if(usr.got_rock)
								usr<<"<font color=white>Master Roshi:</font> Good work, [usr]!"
								usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Kamehameha."
								usr.roshi_quest_complete = 1
								usr.contents+=new/obj/Technique/Kamehameha
								for(var/obj/Quests/Master_Roshi/Masters_Technique/Q)del(Q)
								usr.talking=0
								return
							if(!usr.got_rock)
								usr<<"<font color=white>Master Roshi:</font> You haven't found the rock yet!"
								usr.talking=0
								return
						if(usr.roshi_quest_complete)
							usr.talking=0
							usr<<"<font color=white>Master Roshi:</font> How are you on this fine day?"
							return
				Set_Spawn_Point()
					set src in oview(2)
					set category=null
					switch(alert("Set spawn point here?","Spawn Point","Yes","No"))
						if("Yes")
							usr.spawn_point = "Roshi"
						else
							return