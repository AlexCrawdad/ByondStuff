mob/var/weg_quest_complete = 0
mob/var/weg_quest_start

mob
	NPC
		weg
			name = "{NPC}Man"
			icon_state = "HoHW"
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
					if(!usr.weg_quest_start)
						usr<<"<font color=white>Man:</font> G- Go Back!"
						sleep(30)
						usr<<"<font color=white>You:</font> Why? Whats your name?"
						sleep(30)
						usr<<"<font color=white>Man:</font> N- n- no time! If you don't leave, the tuffles will kill you too!"
						sleep(30)
						usr<<"<font color=white>You:</font> I will help you."
						sleep(30)
						usr<<"<font color=white>Man:</font> Since you insist *Cough*."
						sleep(30)
						usr<<"<font color=white>Man:</font> Hurry and kill 100 of the tuffles that invaded here! One of them should have what I need, bring it back!."
						sleep(30)
						if(!usr)return
						switch(alert("Help him?","Quest: Unknown Problem","Yes","Not Yet"))
							if("Yes")
								usr.talking=0
								usr.weg_quest_start = 1
								usr.tuffle_kills = 0
								usr.contents += new/obj/Quests/Man/Unknown_Problem
								usr<<"He is dying, Hurry!"
								usr.talking=0
								return
							else
								usr.talking=0
								usr<<"..."
								return
					else
						if(!usr.weg_quest_complete)
							if(usr.tuffle_kills>=100)
								usr.talking=0
								usr<<"<font color=white>Man:</font> Th- Thank you!"
								sleep(30)
								usr<<"<font color=white>Man:</font> P- Pour the vial of liquid in- in my mouth.."
								sleep(20)
								usr<<"<font color=white><i>You pour the vial of liquid in his mouth... after a few seconds it looks as if he gets worse...</i></font>"
								sleep(40)
								usr<<"<font color=white><i>Then, he springs up and looks good as new!</i></font>"
								sleep(20)
								usr<<"<font color=white>Man:</font> Much better!"
								sleep(30)
								usr<<"<font color=white>Man:</font> My name is Heller, you have saved my life, and countless others [usr]!"
								sleep(20)
								usr<<"<font color=white>Heller:</font> Therefore, I shall grant you a few levels, and give you a few Stats!"
								sleep(30)
								usr.powerlevel_max+=100000000
								usr.ki_max+=100000000
								usr.kidefense_max+=100000000
								usr.strength_max+=100000000
								usr.defence_max+=100000000
								usr.tp+=10000
								usr.exp+=100000000
								usr.Level_Up()
								usr.strength = usr.strength_max
								usr.defence = usr.defence_max
								usr.powerlevel = usr.powerlevel_max
								usr.ki = usr.ki_max
								usr.kidefense = usr.kidefense_max
								usr.weg_quest_complete = 1
								for(var/obj/Quests/Man/Unknown_Problem/Q)del(Q)
								usr<<"<font color=white>Heller:</font> Done, if you ever need help in the future, you know who to call!"
								return
							else
								usr.talking=0
								usr<<"<font color=white>Man:</font> H-Hurry [usr]!"
								return
						else
							usr.talking=0
							usr<<"<font color=white>Heller:</font> Thanks again [usr]!"
							return




