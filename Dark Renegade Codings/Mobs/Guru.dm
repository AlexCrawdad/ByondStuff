mob/var/guru_quest_start = 0
mob/var/guru_quest_complete = 0
mob/var/thug_kills = 0
mob/NPC
	Guru
		name = "{NPC}Guru"
		icon = 'Guru.dmi'
		density = 1
		safe = 1
		New()
			..()
			src.AddName()
		verb
			Talk()
				set src in oview(2)
				set category = null
				if(usr.talking || usr.fused)return
				usr.talking=1
				if(usr.karma == "Good")
					if(!usr.guru_quest_start)
						usr<<"<font color=white>Guru:</font> Greetings, [usr]. My time is near, but I have one last request. Will you help me?"
						sleep(15)
						switch(alert("Begin your training?","Quest: Dying Namek","Yes","Not Yet"))
							if("Yes")
								usr.guru_quest_start = 1
								usr.contents += new/obj/Quests/Guru/Dying_Namek
								usr<<"<font color=white>Guru:</font> Thank you. There's a village nearby that is being attacked by Frieza's thugs. Please, help them."
								usr.talking=0
							else
								usr.talking=0
								return
					else
						if(!usr.guru_quest_complete)
							if(usr.thug_kills >= 3)
								usr<<"<font color=white>Guru:</font> All of Namek thanks you, [usr]!"
								usr<<"<font color=white><I>Guru smiles softly at you, as he takes his last breath, then his body lies motionless..."
								usr.powerlevel_max += 1000000
								usr.ki_max += 1000000
								usr.strength_max += 700000
								usr.defence_max += 700000
								usr.strength += 700000
								usr.defence += 700000
								usr.guru_quest_complete = 1
								usr.talking=0
								for(var/obj/Quests/Guru/Dying_Namek/Q)del(Q)
							else
								usr<<"<font color=white>Guru:</font> You must stop Frieza's thugs..."
								usr.talking=0
								return
						else
							usr<<"\white <I>You look at the body of the once leader of the Namekians as it lays there, lifelessly..."
							usr.talking=0
				else
					usr<<"<font color=white>Guru:</font> Please leave..."
					usr.talking=0
					return
			Set_Spawn_Point()
				set src in oview(2)
				set category=null
				switch(alert("Set spawn point here?","Spawn Point","Yes","No"))
					if("Yes")usr.spawn_point = "Guru"
					else return