mob/var/kk_quest_start = 0
mob/var/kk_quest_complete = 0
mob/var/kk_quest_training = 0
mob/var/spawn_point = "Yamcha"
mob/var/gotspiritbomb=0
mob/NPC
	King_Kai
		name = "{NPC}King Kai"
		icon_state = "King Kai"
		density = 1
		safe = 1
		it_blocked = 1
		itspecialblocked = 1
		energy_code = 2215368
		New()
			..()
			src.AddName()
		verb/Talk()
			set src in oview(2)
			set category = null
			if(usr.talking)return
			usr.talking=1
			if(src in view(1,usr))
				if(usr.race=="Kai")
					var/talk = input("What do you need, [usr]?")in list("I want to be revived","I want to go to Supreme Kais","More Training","Never Mind")
					switch(talk)
						if("Never Mind")
							usr.talking=0
							return
						if("I want to be revived")
							usr.talking=0
							usr<<"<font color=white>King Kai:</white> I see you are ready to go, let me revive you."
							usr.powerlevel = usr.powerlevel_max
							usr.ki = usr.ki_max
							usr.Power_Redefine()
							usr.overlays -= 'Halo.dmi'
							spawn(10)if(usr)usr.SafeTimer()
							usr.loc=locate(167,194,1)
							usr.safe = 1
							usr.dead = 0
							spawn(300)if(usr)usr.safe = 0
						if("I want to go to Supreme Kais")
							usr.talking=0
							usr<<"<font color=white>King Kai:</white> Very well."
							usr.loc = locate(110,361,5)
							return
						if("More Training")
							if(usr.karma == "Good" && usr.karma_rating >= 30)
								if(!usr.gotspiritbomb)
									usr.talking=0
									usr<<"<font color=white>King Kai:</white> Very well, I shall teach you my most powerful technique."
									usr.contents += new/obj/Technique/SpiritBomb
									usr.gotspiritbomb=1
									usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Spirit Bomb."
									return
								else
									usr<<"<font color=white>King Kai:</white> You already learned Spirit Bomb!"
									usr.talking=0
									return
							else
								usr.talking=0
								usr<<"<font color=white>King Kai:</white> You must be pure of heart so I can teach you."
								return
				else
					if(!usr.kk_quest_start)
						usr<<"<font color=white>King Kai:</font> Greetings, [usr]. I see you're quite a strong warrior. Would you like me to aid your training?"
						sleep(15)
						if(!usr)return
						switch(alert("Begin your training?","Quest: Warrior's Worth","Yes","Not Yet"))
							if("Yes")
								usr.talking=0
								usr.kk_quest_start = 1
								usr.contents += new/obj/Quests/King_Kai/A_Warriors_Worth
								usr<<"<font color=white>King Kai:</font> Good to Hear! I'll teach you a skill called the <font color=red>Kaio Ken</font>, but only if you can prove yourself!"
								usr<<"<font color=white>King Kai:</font> If you can catch Bubbles and hit Gregory, then I will consider you worth enough."
								usr.talking=0
								return
							else
								usr.talking=0
								usr<<"<font color=white>King Kai:</font> Oh, that's unfortunate to hear."
								return
					else
						if(!usr.kk_quest_complete)
							if(usr.gregory_hit && usr.bubbles_caught)
								usr.talking=0
								usr<<"<font color=white>King Kai:</font> Great work! You truly are worthy of such a powerful technique."
								usr.kk_quest_complete = 1
								usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Kaioken."
								usr.contents += new/obj/Technique/Kaioken
								for(var/obj/Quests/King_Kai/A_Warriors_Worth/Q)del(Q)
								return
							else
								usr.talking=0
								usr<<"<font color=white>King Kai:</font> You still aren't ready, keep training!"
								return
						else
							var/talk = input("What do you need, [usr]?")in list("I want to be revived","I want to go to Supreme Kais","More Training","Never Mind")
							switch(talk)
								if("Never Mind")
									usr.talking=0
									return
								if("I want to be revived")
									usr.talking=0
									usr<<"<font color=white>King Kai:</white> I see you are ready to go, let me revive you."
									usr.Power_Redefine()
									usr.powerlevel=usr.powerlevel_max
									usr.ki=usr.ki_max
									usr.overlays -= 'Halo.dmi'
									spawn(10)if(usr)usr.SafeTimer()
									usr.loc=locate(167,194,1)
									usr.safe = 1
									usr.dead = 0
									spawn(300)if(usr)usr.safe = 0
								if("I want to go to Supreme Kais")
									usr.talking=0
									usr<<"<font color=white>King Kai:</white> Very well."
									usr.loc = locate(110,361,5)
									return
								if("More Training")
									if(usr.karma == "Good" && usr.karma_rating >= 30)
										if(!usr.gotspiritbomb)
											usr.talking=0
											usr<<"<font color=white>King Kai:</white> Very well, I shall teach you my most powerful technique."
											usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Spirit Bomb."
											usr.contents += new/obj/Technique/SpiritBomb
											usr.gotspiritbomb=1
											return
										else
											usr<<"<font color=white>King Kai:</white> You already learned Spirit Bomb!"
											usr.talking=0
											return
									else
										usr.talking=0
										usr<<"<font color=white>King Kai:</white> You must be pure of heart so I can teach you."
										return
			else
				usr.talking=0
				return