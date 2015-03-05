mob
	var
		gone_unlock=0
		unlock=0
mob
	NPC
		Goku
			name = "{NPC}Goku"
			icon_state="Goku"
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
					switch(alert("What do you want?","Goku","Unlock Potential","Learn Techniques","Cancel"))
						if("Unlock Potential")
							if(!usr.gone_unlock)
								switch(alert("Unlock Potential","Unlock?","Yes","Not Yet"))
									if("Yes")
										usr<<"<font color=white>Goku:</font> I sense power deep within your soul. Let me unlock it..."
										sleep(50)
										usr<<"<font color=white>You feel Goku unlock your power!"
										usr.frozen = 1
										usr.doing = 1
										sleep(40)
										if(!usr)return
										usr<<"<font color=white>Goku:</white> There, do you feel stronger, [usr]?"
										usr.icon_state = ""
										usr.frozen = 0
										usr.doing = 0
										usr.powerlevel_max *= 2
										usr.powerlevel = usr.powerlevel_max
										usr.safe = 0
										usr.unlock = 1
										usr.gone_unlock = 1
										usr.talking=0
										return
									if("Not Yet")
										usr.gone_unlock = 0
										usr.talking=0
										usr<<"<font color=white>Goku:</font> I bid you farewell..."
										return
							else
								usr<<"<font color=white>Goku:</font> I can only unlock your potential once..."
								usr.talking=0
								return
						if("Learn Techniques")
							if(usr.level>=600&&!usr.learn_afterimage)
								usr.learn_afterimage=1
								usr.contents+=new/obj/Technique/AfterImage
								usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> After Image."
								usr.talking=0
								return
							if(usr.level<600&&!usr.learn_afterimage)
								usr<<"\white Goku:\font Get to level 600 and I'll teach you something."
								usr.talking=0
								return
							if(usr.race == "Saiyan" && usr.learn_dragonfist)
								usr<<"\white Goku: They said that getting stink means getting stronger at the same time."
								usr.talking=0
								return
							if(usr.race=="Saiyan"&&!usr.learn_dragonfist)
								if(usr.level>=1200&&!usr.learn_dragonfist)
									usr.learn_dragonfist=1
									usr.contents+=new/obj/Technique/DragonFist
									usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Dragon Fist."
									usr.talking=0
									return
								else
									usr<<"\white Goku:\font Get to level 1200 and I'll teach you something."
									usr.talking=0
									return
							else
								usr<<"\white Goku: They said that getting stink means getting stronger at the same time."
								usr.talking=0
						if("Cancel")
							usr.talking=0
							return
				Set_Spawn_Point()
					set src in oview(2)
					set category=null
					switch(alert("Set spawn point here?","Spawn Point","Yes","No"))
						if("Yes")usr.spawn_point = "Goku"
						else return