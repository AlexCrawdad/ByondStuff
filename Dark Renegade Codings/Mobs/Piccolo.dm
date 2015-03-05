mob
	var/got_def_boost=0
	var/cell_fight_start=0
	var/cell_fight_complete=0
	var/cell_kill=0
	NPC
		Piccolo
			name = "{NPC}Piccolo"
			icon_state = "Piccolo"
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
					if(!usr.cell_fight_start)
						usr<<"<font color=green>Piccolo:</font> Hmm, your Power is Immense..."
						sleep(15)
						usr<<"<font color=green>Piccolo:</font> I think you are Strong enough to Take on Cell."
						if(!usr)return
						switch(alert("Ready [usr]?","Quest: Cell Destruction","Yes","Not Yet"))
							if("Yes")
								usr.cell_fight_start=1
								usr.cell_kill=0
								usr.contents += new/obj/Quests/Piccolo/Cell_Destruction
								usr.talking=0
								usr<<"<font color=green>Piccolo:</font> He is North of Here!"
								return
							else
								usr<<"<font color=green>Piccolo:</font> COWARD!"
								usr<<"<font color=green>Piccolo:</font> you'd leave us all here to Die!!"
								sleep(4)
								usr<<"<font color=green>Piccolo:</font><font color=yellow> SPECIAL BEAM CANNON!"
								usr.talking=0
								usr.sight |= BLIND
								sleep(20)
								usr.powerlevel = 0
								usr.DeathCheck(src)
								sleep(10)
								usr.sight &= ~BLIND
								return
					else
						if(!usr.cell_fight_complete&&usr.cell_kill)
							usr.cell_fight_complete=1
							usr.powerlevel_max+=10000000
							usr.ki_max+=10000000
							usr.kidefense_max+=10000000
							usr.strength_max+=10000000
							usr.defence_max+=10000000
							usr.tp+=50000
							usr.strength = usr.strength_max
							usr.defence = usr.defence_max
							usr.powerlevel = usr.powerlevel_max
							usr.ki = usr.ki_max
							usr.kidefense = usr.kidefense_max
							usr.exp+=3000000
							usr<<"\white EXP +3000000"
							usr.Level_Up()
							for(var/obj/Quests/Piccolo/Cell_Destruction/Q)del(Q)
							usr.talking=0
							usr<<"<font color=green>Piccolo:</font> oh dear, it appears you Succeded...!"
							sleep(5)
							usr<<"<font color=green>Piccolo:</font><font color=red> DEMON WAVE!"
							usr.sight |= BLIND
							sleep(20)
							usr.powerlevel = 0
							usr.DeathCheck(src)
							sleep(10)
							usr.sight &= ~BLIND
							sleep(20)
							usr<<"<font color=green>(Telepathy)</font>Goku:AHG! sorry [usr] heh, Piccolo hates strong Opponents."
							sleep(3)
							usr<<"<font color=green>(Telepathy)</font>Goku:Let me see if i have the Dragonballs..."
							sleep(20)
							usr<<"<font color=green>(Telepathy)</font>Goku:Yeah! Right here!"
							sleep(10)
							world<<"<font color=yellow>Goku has used the </font><font color=green>Earth Dragonballs </font><font color=yellow>to Revive <font color=red>[usr]</font>!!!!"
							usr.learn_zanzoken=1
							usr.contents+=new/obj/Technique/Zanzoken
							if(usr.race=="Namekian")
								if(usr.level>=75&&!usr.learn_lightgrenade)
									usr.learn_lightgrenade=1
									usr.contents+=new/obj/Technique/LightGrenade
									usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Light Grenade."

								if(usr.level>=200&&!usr.learn_specialbeam)
									usr.learn_specialbeam=1
									usr.contents+=new/obj/Technique/SpecialBeamCannon
									usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Special Beam Cannon."

								else
									usr<<"\white Piccolo:\font Use your techniques and speed wisely!"

							usr.Power_Redefine()
							usr.ki=usr.ki_max
							usr.stamina=0
							usr.powerlevel=usr.powerlevel_max
							usr.overlays-='Halo.dmi'
							usr.loc=locate(167,224,1)
							usr.safe=0
							usr.dead=0
							usr.it_lock=0
							usr.it_blocked=0
							sleep(2)
							usr<<"<font color=green>(Telepathy)</font>Goku:Alright, there you go!"
							return
						else
							usr<<"<font color=green>Piccolo:</font> Go kill cell!"
							usr.talking=0
							return


	/*					switch(input("What can I do for you?","")in list("Def Boost","Learn Techniques","Use Training Points","Never Mind"))
							if("Never Mind")
								usr.talking=0
								return
							if("Def Boost")
								switch(input("I can boost your defense, but this is ONE time only! Are you sure you want it now?")in list("Yes","Never Mind"))
									if("Never Mind")
										usr.talking=0
										return
									if("Yes")
										if(usr.got_def_boost)
											usr<<"<font color=white>Piccolo:</font> You already got this boost!"
											usr.talking=0
											return
										else
											usr<<"<font color=white>Piccolo:</font> Boosting you now!"
											usr.icon_state="enrage"
											sleep(30)
											usr.icon_state=""
											usr.defence_max*=2
											usr.got_def_boost=1
											usr<<"<font color=white>Piccolo:</font> There you go, feeling more brave?"
											usr.talking=0
											return
							if("Use Training Points")
								if(usr.level<1000)
									usr<<"<font color=white>Piccolo:</font> Train more!"
									usr.talking=0
									return
								switch(input("Where do you wish to use your TPs?","TPs")in list("Powerlevel","Ki","Ki Defense","Strength","Defense","Stamina","Cancel"))
									if("Cancel")
										usr.talking=0
										return
									if("Stamina")
										var/TP = input ("How many TPs do you wish to use? [num2text(round(usr.tp),15)] TPs") as num
										var/pl = TP/1.5
										if(TP > usr.tp)
											usr<<"<font color=white>Piccolo:</font> You don't have that many TPs!"
											usr.talking = 0
											return
										if(TP == 0 || TP == null || !TP)
											usr.talking = 0
											return
										while(TP == 0 || TP == null || !TP)
											usr.talking = 0
											return
										if(TP < 0)
											usr<<"<font color=white>Piccolo:</font> You must enter a positive number!"
											usr.talking = 0
											return
										usr.stamina_max += pl
										usr<<"<font color=white>Piccolo:</font> You have gained [num2text(round(pl),15)] Stamina!"
										usr.tp -= TP
										usr.talking = 0
										return
									if("Powerlevel")
										var/TP = input ("How many TPs do you wish to use? [num2text(round(usr.tp),15)] TPs") as num
										var/pl = rand(400,500) * TP
										if(TP > usr.tp)
											usr<<"<font color=white>Piccolo:</font> You don't have that many TPs!"
											usr.talking = 0
											return
										if(TP == 0 || TP == null || !TP)
											usr.talking = 0
											return
										while(TP == 0 || TP == null || !TP)
											usr.talking = 0
											return
										if(TP < 0)
											usr<<"<font color=white>Piccolo:</font> You must enter a positive number!"
											usr.talking = 0
											return
										usr.powerlevel_max += pl
										usr.powerlevel += pl
										usr<<"<font color=white>Piccolo:</font> You have gained [num2text(round(pl),15)] Powerlevel!"
										usr.tp -= TP
										usr.talking = 0
										return
									if("Ki")
										var/TP = input ("How many TPs do you wish to use? [num2text(round(usr.tp),15)] TPs") as num
										var/pl = rand(400,500) * TP
										if(TP > usr.tp)
											usr<<"<font color=white>Piccolo:</font> You don't have that many TPs!"
											usr.talking = 0
											return
										if(TP == 0 || TP == null || !TP)
											usr.talking = 0
											return
										while(TP == 0 || TP == null || !TP)
											usr.talking = 0
											return
										if(TP < 0)
											usr<<"<font color=white>Piccolo:</font> You must enter a positive number!"
											usr.talking = 0
											return
										usr.ki_max += pl
										usr.ki += pl
										usr<<"<font color=white>Piccolo:</font> You have gained [num2text(round(pl),15)] Ki!"
										usr.tp -= TP
										usr.talking = 0
										return
									if("Ki Defense")
										var/TP = input ("How many TPs do you wish to use? [num2text(round(usr.tp),15)] TPs") as num
										var/pl = rand(400,500) * TP
										if(TP > usr.tp)
											usr<<"<font color=white>Piccolo:</font> You don't have that many TPs!"
											usr.talking = 0
											return
										if(TP == 0 || TP == null || !TP)
											usr.talking = 0
											return
										while(TP == 0 || TP == null || !TP)
											usr.talking = 0
											return
										if(TP < 0)
											usr<<"<font color=white>Piccolo:</font> You must enter a positive number!"
											usr.talking = 0
											return
										usr.kidefense_max += pl
										usr.kidefense += pl
										usr<<"<font color=white>Piccolo:</font> You have gained [num2text(round(pl),15)] Ki Defense!"
										usr.tp -= TP
										usr.talking = 0
										return
									if("Strength")
										var/TP = input ("How many TPs do you wish to use? [num2text(round(usr.tp),15)] TPs") as num
										var/str = rand(80,100) * TP
										if(TP > usr.tp)
											usr<<"<font color=white>Piccolo:</font> You don't have that many TPs!"
											usr.talking = 0
											return
										if(TP == 0 || TP == null || !TP)
											usr.talking = 0
											return
										while(TP == 0 || TP == null || !TP)
											usr.talking = 0
											return
										if(TP < 0)
											usr<<"<font color=white>Piccolo:</font> You must enter a positive number!"
											usr.talking = 0
											return
										usr.strength += str
										usr.strength_max += str
										usr<<"<font color=white>Piccolo:</font> You have gained [num2text(round(str),15)] Strength!"
										usr.tp -= TP
										usr.talking = 0
										return
									if("Defense")
										var/TP = input ("How many TPs do you wish to use? [num2text(round(usr.tp),15)] TPs") as num
										var/str = rand(80,100) * TP
										if(TP > usr.tp)
											usr<<"<font color=white>Piccolo:</font> You don't have that many TPs!"
											usr.talking = 0
											return
										if(TP == 0 || TP == null || !TP)
											usr.talking = 0
											return
										while(TP == 0 || TP == null || !TP)
											usr.talking = 0
											return
										if(TP < 0)
											usr<<"<font color=white>Piccolo:</font> You must enter a positive number!"
											usr.talking = 0
											return
										usr.defence += str
										usr.defence_max += str
										usr<<"<font color=white>Piccolo:</font> You have gained [num2text(round(str),15)] Defense!"
										usr.tp -= TP
										usr.talking = 0
										return
							if("Learn Techniques")
								if(usr.level>=50&&!usr.learn_zanzoken)
									usr.learn_zanzoken=1
									usr.contents+=new/obj/Technique/Zanzoken
									usr<<"\white Piccolo:\font Not only strength is useful, so is speed too."
									sleep(30)
									usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Zanzoken."
									sleep(30)
									usr<<"\white Piccolo:\font Use it wisely, [usr]!"
									usr.viral_heart = 1
									spawn(50) usr.Viral_Heart()
									spawn(350) alert("You have contracted the Viral Heart Disease, you need to head to the future and gain a cure from trunks!")
									usr.talking=0
									return
								if(usr.race=="Namekian")
									if(usr.level>=75&&!usr.learn_lightgrenade)
										usr.learn_lightgrenade=1
										usr.contents+=new/obj/Technique/LightGrenade
										usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Light Grenade."
										usr.talking=0
										return
									if(usr.level>=200&&!usr.learn_specialbeam)
										usr.learn_specialbeam=1
										usr.contents+=new/obj/Technique/SpecialBeamCannon
										usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Special Beam Cannon."
										usr.talking=0
										return
									else
										usr.talking=0
										usr<<"\white Piccolo:\font Use your techniques and speed wisely!"
										return
								if(usr.level<50)
									usr<<"\white Piccolo:\font Get to level 50 and I'll teach you something."
									usr.talking=0
									return
								if(usr.race=="Namekian")
									if(usr.level<75)
										usr<<"\white Piccolo:\font Get to level 75 and I'll teach you something."
										usr.viral_heart = 1
										spawn(50) usr.Viral_Heart()
										spawn(350) alert("You have contracted the Viral Heart Disease, you need to head to the future and gain a cure from trunks!")
										usr.talking=0
										return
									if(usr.level<200)
										usr<<"\white Piccolo:\font Get to level 200 and I'll teach you something."
										usr.viral_heart = 1
										spawn(50) usr.Viral_Heart()
										spawn(350) alert("You have contracted the Viral Heart Disease, you need to head to the future and gain a cure from trunks!")
										usr.talking=0
										return
									else
										usr.talking=0
										usr.viral_heart = 1
										spawn(50) usr.Viral_Heart()
										spawn(350) alert("You have contracted the Viral Heart Disease, you need to head to the future and gain a cure from trunks!")
										usr<<"\white Piccolo:\font Use your techniques and speed wisely!"
										return
								else
									usr.talking=0
									usr<<"\white Piccolo:\font Use your techniques and speed wisely!"
									return*/