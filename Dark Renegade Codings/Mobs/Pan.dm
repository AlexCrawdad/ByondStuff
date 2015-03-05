mob
	NPC
		Pan
			name = "{NPC}Pan"
			icon_state = "Pan"
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
					switch(alert("Hello, [usr]! How may I help you?","","Learn Techniques","Never Mind"))
						if("Never Mind")
							usr.talking=0
							return
						if("Learn Techniques")
							if(usr.race=="Half Saiyan")
								if(!usr.learn_angryblast)
									if(usr.level>=2000)
										usr.learn_angryblast=1
										usr.contents+=new/obj/Technique/AngryBlast
										usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Angry Blast."
										usr<<"\white Pan: Use that technique to put off a sweet revenge..."
										usr.talking=0
										return
									else
										usr<<"\white Pan: You're not strong enough to master this technique of mine!"
										usr.talking=0
										return
								else
									usr<<"\white Pan: Use that for your revenge!!!"
									usr.talking=0
									return
							else
								usr<<"\white Pan: Pardon me! I cannot simply teach you this!"
								usr.talking=0
								return
