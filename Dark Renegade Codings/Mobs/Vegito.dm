mob
	NPC
		Vegito
			name = "{NPC}Vegito"
			icon_state="Vegito"
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
					switch(alert("[usr], hai there! What do you want?","Vegito","Learn Techniques","Cancel"))
						if("Learn Techniques")
							if(usr.race == "Saiyan" || usr.race=="Half Saiyan")
								if(usr.level>=3000&&!usr.learn_final_kamehameha)
									usr.learn_final_kamehameha=1
									usr.contents+=new/obj/Technique/FinalDeathKamehameha
									usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Final Kamehameha."
									usr<<"\white Vegito:\font Hmph...use this Final Kamehameha to kill anyone who DARE to stand in your path!"
									usr.talking=0
									return
								if(usr.level<3000&&!usr.learn_final_kamehameha)
									usr<<"\white Vegito:\font Aww, [usr], you aren't strong enough to learn my technique!"
									usr.talking=0
									return
								if(usr.learn_final_kamehameha)
									usr<<"\white Vegito: Isn't this a nice weather, [usr]?"
									usr.talking=0
							else
								usr<<"\white Vegito: Isn't this a nice weather, [usr]?"
								usr.talking=0
						if("Cancel")
							usr.talking=0
							return