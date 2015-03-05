mob
	NPC
		Vegeta
			name = "{NPC}Vegeta"
			icon_state = "Vegeta"
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
					if(usr.race=="Saiyan")
						if(usr.level>=75)
							if(!usr.learn_galickgun)
								usr.learn_galickgun=1
								usr.contents+=new/obj/Technique/GalickGun
								usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Galick Gun."
								usr.talking=0
								return
							else
								usr.talking=0
						if(usr.level>=300)
							if(!usr.learn_finalflash)
								usr.learn_finalflash=1
								usr.contents+=new/obj/Technique/FinalFlash
								usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Final Flash."
								usr.talking=0
								return
							else
								usr.talking=0
						if(usr.level>=750)
							if(!usr.learn_bigbangattack)
								usr.learn_bigbangattack=1
								usr.contents+=new/obj/Technique/BigBangAttack
								usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Big Bang Attack."
								usr.talking=0
								return
							else
								usr.talking=0
						if(usr.level>1000)
							if(usr.train_chromosome)
								if(!usr.learn_finalshine)
									usr.learn_finalshine=1
									usr.contents+=new/obj/Technique/FinalShine
									usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Final Shine."
									usr.talking=0
									return
							else
								usr.talking=0
						else
							usr<<"\white Vegeta:\font Get out of here, punk!"
							usr.talking=0
							return
					else
						usr<<"\white Vegeta:\font Get out of here, punk!"
						usr.talking=0
						return