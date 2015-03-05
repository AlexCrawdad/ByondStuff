mob
	var
		Past_Present_Future_quest=0
		Past_Present_Future_completed=0
		killed_raditz=0
		saiba_menace_quest=0
		saiba_menace_completed=0
		killed_saibas=0
		Saiba_passkey=0
		vampire_quest_part_1=0
		vampire_quest_part_1_completed=0
		vampire_quest_part_2=0
		vampire_quest_part_2_completed=0
		vampire_quest_finale=0
		vampire_quest_finale_completed=0
		vampires_killed=0
		vampire_lord_killed=0
	NPC
		Trunks
			name = "{NPC}Trunks"
			icon_state="Trunks"
			density = 1
			safe = 1
			New()
				..()
				src.AddName()
			verb
				Talk()
					set src in oview(2)
					set category = null
					if(usr.talking||usr.fused)return
					usr.talking=1
					switch(alert("Hiya, [usr]! How may I help you?","","Learn Techniques","Quests","Never Mind"))
						if("Never Mind")
							usr.talking=0
							return
						if("Quests")
							if(!usr.Past_Present_Future_quest && !usr.Past_Present_Future_completed && !usr.saiba_menace_quest && !usr.saiba_menace_completed)
								usr<<"<font color=white>Trunks:</font> [usr]! Can you help me with something?"
								sleep(15)
								switch(alert("You able to help me out?","Quest: Past,Present and Future","Yes","Not at the Moment"))
									if("Yes")
										usr.Past_Present_Future_quest = 1
										usr.contents += new/obj/Quests/Trunks/Past_Present_Future
										usr<<"<font color=white>Trunks:</font> Good, i have Upgraded the Time machine to be able to Travel on a Larger scale!"
										usr<<"<font color=white>Trunks:</font> Go to the Past and Kill Raditz, i'll Give you the Passkey for that time Period!"

										usr<<"<font color=white>Trunks:</font> just as a Precaution, mom designed this Time Machine to not create Alternate timelines, so its safer for everyday use."
										sleep(10)
										usr.talking=0
										usr.Raditz_passkey=1
										usr.contents += new/obj/Quests/Trunks/Past_Present_Future
									else
										usr<<"<font color=white>Trunks:</font> Erm, guess I'll have to find someone else."
										usr.talking=0
										return
							else if(usr.Past_Present_Future_quest && !usr.Past_Present_Future_completed && !usr.saiba_menace_quest && !usr.saiba_menace_completed)
								if(usr.killed_raditz)
									usr<<"<font color=white>Trunks:</font> Thank you, [usr]! There you go, my personal sword as promised!"
									usr.Past_Present_Future_completed = 1
									usr.contents -= new/obj/Quests/Trunks/Past_Present_Future
									usr.contents += new/obj/Equipment/Trunks_Sword
									usr.powerlevel_max+=9000000
									usr.ki_max+=9000000
									usr.kidefense_max+=9000000
									usr.strength_max+=9000000
									usr.defence_max+=9000000
									usr.tp+=200000
									usr.exp+=7000000
									usr.Level_Up()
									usr.strength = usr.strength_max
									usr.defence = usr.defence_max
									usr.powerlevel = usr.powerlevel_max
									usr.ki = usr.ki_max
									usr.kidefense = usr.kidefense_max
									usr.talking=0
									for(var/obj/Quests/Trunks/Past_Present_Future/Q)
										del(Q)
								if(!usr.killed_raditz)
									usr<<"<font color=white>Trunks:</font> [usr], you didn't kill Raditz yet! Please go back and kill him!"
									usr.talking=0
									return
							else if(usr.Past_Present_Future_quest && usr.Past_Present_Future_completed && !usr.saiba_menace_quest && !usr.saiba_menace_completed)
								switch(alert("Alright, [usr]! You defeated Raditz!","Next Quest: Saiba Menace!","Go.","Later"))
									if("Go.")
										usr.saiba_menace_quest = 1
										usr.contents += new/obj/Quests/Trunks/Saiba_Menace
										usr<<"<font color=white>Trunks:</font> Wow thanks again for beating raditz, goku entrusted me with your training..."
										sleep(15)
										usr<<"<font color=white>Trunks:</font> So he would KILL me if he knew i let you down!"
										sleep(15)
										usr<<"<font color=white>Trunks:</font> Anyway, go defeat a few <font color=red>Saibas</font> from the past to advance in your training@!."
										sleep(10)
										usr.talking=0
										usr.Saiba_passkey=1
										usr.killed_saibas=0
									else
										usr<<"<font color=white>Trunks:</font> Cya later, don't wait too long, you need to get Stronger!."
										usr.talking=0
										return
							else if(usr.Past_Present_Future_quest && usr.Past_Present_Future_completed && usr.saiba_menace_quest && !usr.saiba_menace_completed)
								if(usr.killed_saibas>=5)
									usr<<"<font color=white>Trunks:</font> You're doing great! Continue training at this rate and you'll even surpass me!"
									usr.saiba_menace_completed = 1
									usr.contents -= new/obj/Quests/Trunks/Saiba_Menace
									usr.powerlevel_max+=20000000
									usr.ki_max+=20000000
									usr.kidefense_max+=20000000
									usr.strength_max+=20000000
									usr.defence_max+=20000000
									usr.tp+=400000
									usr.exp+=30000000
									usr.Level_Up()
									usr.strength = usr.strength_max
									usr.defence = usr.defence_max
									usr.powerlevel = usr.powerlevel_max
									usr.ki = usr.ki_max
									usr.kidefense = usr.kidefense_max
									usr.talking=0
									for(var/obj/Quests/Trunks/Saiba_Menace/Q)
										del(Q)
								else
									usr<<"<font color=white>Trunks:</font> [usr], go defeat them, the world is counting on your training!!"
									usr.talking=0
									return
						if("Learn Techniques")
							if(usr.race=="Half Saiyan")
								if(usr.level>=250&&!usr.learn_finishbuster)
									usr.learn_finishbuster=1
									usr.contents+=new/obj/Technique/FinishBuster
									usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Finish Buster."
									usr.talking=0
									return
								if(usr.level>=400&&!usr.learn_burningattack)
									usr.learn_burningattack=1
									usr.contents+=new/obj/Technique/BurningAttack
									usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Burning Attack."
									usr.talking=0
									return
								if(usr.level<250)
									usr<<"\white Trunks:\font Get to level 250 and I'll teach you something."
									usr.talking=0
									return
								if(usr.level<400)
									usr<<"\white Trunks:\font Get to level 400 and I'll teach you something."
									usr.talking=0
									return
							else
								usr<<"\white Trunks:\font How are you doing?"
								usr.talking=0
								return