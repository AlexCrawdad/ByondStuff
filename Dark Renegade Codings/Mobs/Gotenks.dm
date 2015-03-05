mob
	NPC
		Gotenks
			icon_state = "Gotenks"
			name = "{NPC}Gotenks"
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
					switch(input("What can I do for you?","")in list("Learn Techniques","Never Mind"))
						if("Never Mind")
							usr.talking=0
							return
						if("Learn Techniques")
							switch(input("What could you like to learn?")in list("Super Ghost Kamikaze","Never Mind"))
								if("Never Mind")
									usr.talking=0
									return
								if("Super Ghost Kamikaze")
									if(usr.race!="Saiyan"&&usr.race!="Human"&&usr.race!="Half Saiyan"&&usr.race!="Majin")
										usr<<"<font color=white>Gotenks:</font> I'm sorry, but you aren't one of us."
										usr.talking=0
										return
									if(usr.learn_ghost)
										usr<<"<font color=white>Gotenks:</font> Excuse me, [usr]! But, you already learned this technique!"
										usr.talking=0
										return
									else
										if(usr.level<5000)
											usr<<"<font color=white>Gotenks:</font> You aren't strong enough to learn this technique!"
											usr.talking=0
											return
										else
											usr<<"<font color=white>Gotenks:</font> There you go, my signature attack!"
											usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Super Ghost Kamikaze Attack."
											usr.learn_ghost=1
											usr.contents += new/obj/Technique/SGhostAttack
											usr.talking=0
											return