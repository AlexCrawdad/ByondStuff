mob
	NPC
		Gogeta
			name = "{NPC}Gogeta"
			icon_state="Gogeta"
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
					switch(alert("Greetings, [usr]! What do you want?","Gogeta","Learn Techniques","Cancel"))
						if("Learn Techniques")
							if(usr.race == "Saiyan" || usr.race=="Half Saiyan")
								if(usr.level>=3000&&!usr.learn_soul_punisher)
									usr.learn_soul_punisher=1
									usr.contents+=new/obj/Technique/SoulPunisher
									usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Soul Punisher."
									usr<<"\white Gogeta:\font [usr]! Use this to annihilate your enemies!"
									usr.talking=0
									return
								if(usr.level<3000&&!usr.learn_soul_punisher)
									usr<<"\white Gogeta:\font HMPH! You're too weak to learn my powerful technique!"
									usr.talking=0
									return
								if(usr.learn_soul_punisher)
									usr<<"\white Gogeta: Use Soul Punisher to annihilate your enemies!"
									usr.talking=0
							else
								usr<<"\white Gogeta: ..."
								usr.talking=0
						if("Cancel")
							usr.talking=0
							return