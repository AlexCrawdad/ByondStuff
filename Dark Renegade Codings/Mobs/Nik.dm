mob/var/nik_quest_complete = 0
mob/var/nik_quest_start

mob
	NPC
		nik
			name = "{NPC}Nik"
			icon_state = "Nik"
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
					if(!usr.nik_quest_start)
						usr<<"<font color=white>Nik:</font> HoHW said you helped him."
						sleep(30)
						usr<<"<font color=white>Nik:</font> Since you did, i think i can trust you?"
						sleep(30)
						usr<<"<font color=white>You:</font> You can."
						sleep(30)
						usr<<"<font color=white>Nik:</font> Alright, the battle between us and the tuffles is going badly, care to assist?"
						if(!usr)return
						switch(alert("Ready?","Quest: West earth's Invasion","Yes","Not Yet"))
							if("Yes")
								usr.talking=0
								usr.nik_quest_start = 1
								usr.tuffle_kills = 0
								usr.contents += new/obj/Quests/Nik/West_earths_Invasion
								usr<<"<font color=white>Nik:</font> They're everywhere! Kill off 250 of them [usr]!!"
								usr.talking=0
								return
							else
								usr.talking=0
								usr<<"..."
								return
					else
						if(!usr.nik_quest_complete)
							if(usr.tuffle_kills>=250)
								usr.talking=0
								usr<<"<font color=white>Nik:</font> Thanks!"
								sleep(30)
								usr<<"<font color=white>Nik:</font> We can now live in peace!"
								sleep(20)
								usr<<"<font color=white>You:</font> It was easy!"
								sleep(30)
								usr<<"<font color=white>Nik:</font> Everyone is right, you <i>are</i> Strong!"
								sleep(20)
								usr<<"<font color=white>Nik:</font> As promised, heres your Reward!"
								usr.powerlevel_max+=260000000
								usr.ki_max+=240000000
								usr.kidefense_max+=32000000
								usr.strength_max+=250000000
								usr.defence_max+=200000000
								usr.tp+=50000
								usr.exp+=300000000
								usr.Level_Up()
								usr.strength = usr.strength_max
								usr.defence = usr.defence_max
								usr.powerlevel = usr.powerlevel_max
								usr.ki = usr.ki_max
								usr.kidefense = usr.kidefense_max
								usr.nik_quest_complete = 1
								for(var/obj/Quests/Nik/West_earths_Invasion/Q)del(Q)
								return
							else
								usr.talking=0
								usr<<"<font color=white>Nik:</font> We're Dying, hurry up [usr]!"
								return
						else
							usr.talking=0
							usr<<"<font color=white>Nik:</font> Hi [usr]!"
							return