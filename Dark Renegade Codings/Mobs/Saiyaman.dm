mob/var/saiyaman_quest_start = 0
mob/var/saiyaman_quest_complete = 0
mob
	NPC
		Saiyaman
			name = "{NPC}Saiyaman"
			icon = 'Saiyaman.dmi'
			icon_state = ""
			density = 1
			safe = 1
			New()
				..()
				src.AddName()
			verb
				Talk()
					set src in oview(2)
					if(usr.talking || usr.fused)return
					usr.talking=1
					if(!usr.saiyaman_quest_start)
						usr<<"<font color=white>Saiyaman:</font> Hello citizen, [usr]! I require your assistance, can you lend it?"
						sleep(15)
						switch(alert("You able to help me out?","Quest: Lost Identity","Yes","Not at the Moment"))
							if("Yes")
								usr.saiyaman_quest_start = 1
								usr.contents += new/obj/Quests/Saiyaman/Lost_Identity
								usr<<"<font color=white>Saiyaman:</font> Awesome! As you see, I've lost my helmet. I think <font colour = red>Goten</font> was running around somewhere with it."
								usr<<"<font color=white>Saiyaman:</font> If you could grab it off him, that would be great!"
								usr.talking=0
								return
							else
								usr<<"<font color=white>Saiyaman:</font> Ohh, ok. I will have to find another person then."
								usr.talking=0
								return
					else
						if(!usr.saiyaman_quest_complete&&usr.obtained_helmet)
							usr.talking=0
							usr<<"<font color=white>Saiyaman:</font> Thanks for that, [usr]! Now I can get back to fighting crime!"
							usr.saiyaman_quest_complete = 1
							usr.contents -= new/obj/Quests/Saiyaman/Lost_Identity
							usr.contents += new/obj/Equipment/Head/Helmet
							src.icon_state = "helmet"
							spawn(150) src.icon_state = ""
							for(var/obj/Quests/Saiyaman/Lost_Identity/Q)del(Q)
							return
						if(usr.saiyaman_quest_complete&&usr.obtained_helmet)
							usr<<"<font color=white>Saiyaman:</font> Don't tell everyone my identity!"
							usr.talking=0
							return
						if(!usr.saiyaman_quest_complete&&!usr.obtained_helmet)
							usr<<"<font color=white>Saiyaman:</font> Please get my helmet back, [usr]!"
							usr.talking=0
							return