mob/var/gone_ki_boost=0
mob/var/krillin_quest_complete = 0
mob/var/krillin_quest_start

mob
	NPC
		Krillin
			name = "{NPC}Krillin"
			icon_state = "Krillin"
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
					switch(alert("What can I do for you?","","Learn Techniques","Quest","Never Mind"))
						if("Never Mind")
							usr.talking=0
							return
						if("Learn Techniques")
							if(usr.race=="Human" || usr.race=="Saiyan"|| usr.race=="Half Saiyan")
								if(!usr.learn_distructodisk)
									usr.learn_distructodisk=1
									usr.contents+=new/obj/Technique/DistructoDisk
									usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Distructo Disk."
									usr<<"\white Krillin: MAHAHA! That is some pwning technique you just learned from meh!"
									usr.talking=0
									return
								else
									usr<<"\white Krillin: You already learned Distructo Disk!!!"
									usr.talking=0
									return
							else
								usr<<"\white Krillin: Erm...you're not one of us!"
								usr.talking=0
								return
						if("Quest")
							if(!usr.krillin_quest_start)
								usr<<"<font color=white>Krillin:</font> WHO THE HECK ARE YOU!?"
								sleep(15)
								usr<<"<font color=white>You:</font> [usr]. Sorry, didnt mean to Scare you."
								sleep(15)
								usr<<"<font color=white>Krillin:</font> Ohhhh, [usr]! Goku and Yamcha told me you are a great Warrior!"
								sleep(15)
								usr<<"<font color=white>Krillin:</font> Take my Quest."
								if(!usr)return
								switch(alert("Break your Knuckles?","Quest: Fawwwkon Paaaaawnch","Yes","Not Yet"))
									if("Yes")
										usr.talking=0
										usr.krillin_quest_start = 1
										usr.contents += new/obj/Quests/Krillin/Falcon_Pawnch
										usr<<"<font color=white>Krillin:</font> Alrigh!- *cough* I mean, Okay, there is a rock around this island, hit it."
										usr.talking=0
										return
									else
										usr.talking=0
										usr<<"<font color=white>Krillin:</font> come back later."
										return
							else
								if(!usr.krillin_quest_complete)
									if(usr.falcon_pawnched)
										usr.talking=0
										usr<<"<font color=white>Krillin:</font> Great work!"
										usr.powerlevel_max+=2500000
										usr.ki_max+=2500000
										usr.kidefense_max+=2500000
										usr.strength_max+=2500000
										usr.defence_max+=2500000
										usr.tp+=5000
										usr.exp+=9000000
										usr.Level_Up()
										usr.strength = usr.strength_max
										usr.defence = usr.defence_max
										usr.powerlevel = usr.powerlevel_max
										usr.ki = usr.ki_max
										usr.kidefense = usr.kidefense_max
										usr.krillin_quest_complete = 1
										for(var/obj/Quests/Krillin/Falcon_Pawnch/Q)del(Q)
										sleep(15)
										usr<<"<font color=white>Krillin:</font> Feel Stronger?"
										sleep(4)
										usr<<"<font color=white>You:</font> A little... Thanks"
										return
									else
										usr.talking=0
										usr<<"<font color=white>Krillin:</font> Punch it!"
										return
								else
									usr.talking=0
									usr<<"<font color=white>Krillin:</font> Keep up your training [usr]!"
									return




mob/var/falcon_pawnched = 0
mob
	NPC
		Falcon_Puncher_rock
			name = "Rock"
			density = 1
			safe = 1
			it_blocked = 1
			itspecialblocked = 1
			New()
				..()
				src.AddName()
			verb/Hit_Rock()
				set src in oview(8)
				set category = "Actions"
				if(src in get_step(usr,usr.dir))
					if(usr.falcon_pawnched)
						usr<<"You have already hit the rock!"
						return
					else
						usr<<"You hit the rock!"
						usr.powerlevel_max +=25000
						usr.ki_max+=25000
						usr.kidefense_max+=25000
						usr.strength_max+=25000
						usr.defence_max+=25000
						usr.tp+=25000
						usr.exp+=100000
						usr.Level_Up()
						usr.strength = usr.strength_max
						usr.defence = usr.defence_max
						usr.powerlevel = usr.powerlevel_max
						usr.ki = usr.ki_max
						usr.kidefense = usr.kidefense_max
						usr.falcon_pawnched = 1
				else return