mob/var/Gaurd_kills=0
mob/var/RebelFriend_start=0
mob/var/RebelFriend_finished=0
mob/NPC/RebelFriend
	icon = 'NPCs3.dmi'
	icon_state = "RebelFriend"
	name = "{NPC}Rebel Helper"
	density = 1
	safe = 1
	it_lock=1
	it_blocked=1
	New()
		..()
		src.AddName()
	verb
		Talk()
			set category=null
			set src in oview(2)
			if(usr.talking||usr.fused)return
			usr.talking = 1
			if(!usr.RebelFriend_start)
				usr<<"<font color=white>Rebel Helper:</font> Shhh, the gaurds can't hear us here!"
				sleep(15)
				usr<<"<font color=white>Rebel Helper:</font> They are very strong, i wan't to free my friends, but i can't."
				sleep(10)
				usr<<"<font color=white>Rebel Helper:</font> Will you Help?"
				if(!usr)return
				switch(alert("Please?","Quest: Rebel Takeover","Yes","No"))
					if("Yes")
						usr.RebelFriend_start=1
						usr.Gaurd_kills=0
						usr.contents += new/obj/Quests/RebelFriend/Rebel_Takeover
						usr.talking=0
						usr<<"<font color=white>Rebel Helper:</font> Thanks!"
						return
					else
						usr<<"<font color=white>Rebel Helper:</font> okay, Get stronger then come Back."
						usr.talking=0
						return
			else
				if(usr.Gaurd_kills>=5)

					usr.Gaurd_kills=0
					usr.exp+=120000000
					usr<<"\white EXP +120000000"
					usr.Level_Up()
					for(var/obj/Quests/RebelFriend/Rebel_Takeover/Q)del(Q)
					usr.talking=0
					usr<<"<font color=white>Rebel Helper:</font> Thank you!"
					return
				else
					if(!usr.Gaurd_kills>=10)
						usr<<"<font color=white>Rebel Helper:</font> Go kill 10 Gaurds!"
						usr.talking=0
						return
					else
						if(usr.RebelFriend_finished)
							usr<<"<font color=white>Rebel Helper:</font> Thanks again!"
							usr.talking=0