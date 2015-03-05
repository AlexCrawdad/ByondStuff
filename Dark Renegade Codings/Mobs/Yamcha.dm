mob/var/warrior_quest_start=0
mob/var/warrior_quest_complete=0
mob/var/strength_test_start=0
mob/var/strength_test_complete=0
mob/var/green_kills=0
mob/NPC/Yamcha
	icon='Chibi Goku.dmi'
	name="{NPC}Yamcha"
	density=1
	safe=1
	New()
		..()
		src.CreateName()
	verb
		Talk()
			set category=null
			set src in oview(2)
			if(usr.talking||usr.fused||!usr.first_quest_complete)return
			usr.talking = 1
			if(!usr.strength_test_start)
				usr<<"<font color=white>Yamcha:</font> Hi, [usr]. Goku has Mentioned much about you!"
				sleep(15)
				usr<<"<font color=white>Yamcha:</font> Be Warned, [usr]. you CAN be Killed!"
				if(!usr)return
				switch(alert("Begin your training?","Quest: A Test of Strength","Yes","Not Yet"))
					if("Yes")
						usr.strength_test_start=1
						usr.green_kills=0
						usr.contents += new/obj/Quests/Yamcha/A_Test_of_Strength
						usr.talking=0
						usr<<"<font color=white>Yamcha:</font> Good to hear! What I want you to do is to <font color=red>kill 5 Dragons</font>!"
						usr.loc=locate(262,318,1)
						usr<<"<font size=+1>To Kill them Hit 1 key until they are Knocked out, then hit 2!"
						usr<<"<font size=+1>To go Back to the Safe Zone press 'Q' and go Left until you hit a Dirt Island, then fly down around the walls of the Safezone, to the door."
						return
					else
						usr<<"<font color=white>Yamcha:</font> Okay, get stronger then come back."
						usr.talking=0
						return
			else
				if(!strength_test_complete)
					if(usr.green_kills>=5)
						usr.green_kills=0
						usr.exp+=1200000
						usr<<"\white EXP +1200000"
						usr.Level_Up()
						for(var/obj/Quests/Yamcha/A_Test_of_Strength/Q)del(Q)
						if(usr.race=="Human"&&usr.level>=500)
							if(!usr.learn_spiritball)
								usr.learn_spiritball=1
								usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Spirit Ball."
								usr.contents+=new/obj/Technique/SpiritBall
						usr.talking=0
						usr<<"<font color=white>Yamcha:</font> Go see Krillin, out side, for your Next Quest!"
						return
					else
						usr<<"<font color=white>Yamcha:</font> Kill em [usr]!"
						usr.talking=0
						return
				else
					usr.talking=0
					usr<<"<font color=white>Yamcha:</font> You're doing well [usr]!"
					return
	/*				else
						switch(alert("Hi [usr]. What can I do for you today?","Yamcha","Use Training Points","Nothing"))
							if("Use Training Points")
								switch(input("Where do you wish to use your TPs?","TPs")in list("Powerlevel","Ki","Ki Defense","Strength","Defense","Stamina","Cancel"))
									if("Cancel")
										usr.talking=0
										return
									if("Exp")
										var/TP=input("How many TPs do you wish to use? [num2text(round(usr.tp),15)] TPs") as num
										var/pl=20*TP
										if(TP>usr.tp)
											usr<<"<font color=white>Yamcha:</font> You don't have that many TPs!"
											usr.talking=0
											return
										if(TP==0||TP==null||!TP)
											usr.talking=0
											return
										while(TP==0||TP==null||!TP)
											usr.talking=0
											return
										if(TP<0)
											usr<<"<font color=white>Yamcha:</font> You must enter a positive number!"
											usr.talking=0
											return
										usr.powerlevel_max+=pl
										usr.powerlevel+=pl
										usr<<"<font color=white>Yamcha:</font> You have gained [num2text(round(pl),15)] Exp!"
										usr.tp-=TP
										usr.talking=0
										return
									if("Stamina")
										var/TP=input("How many TPs do you wish to use? [num2text(round(usr.tp),15)] TPs") as num
										var/pl=TP/1.5
										if(TP>usr.tp)
											usr<<"<font color=white>Yamcha:</font> You don't have that many TPs!"
											usr.talking=0
											return
										if(TP==0||TP==null||!TP)
											usr.talking=0
											return
										while(TP==0||TP==null||!TP)
											usr.talking=0
											return
										if(TP<0)
											usr<<"<font color=white>Yamcha:</font> You must enter a positive number!"
											usr.talking=0
											return
										usr.stamina_max+=pl
										usr<<"<font color=white>Yamcha:</font> You have gained [num2text(round(pl),15)] Stamina!"
										usr.tp-=TP
										usr.talking=0
										return
									if("Powerlevel")
										var/TP=input("How many TPs do you wish to use? [num2text(round(usr.tp),15)] TPs") as num
										var/pl=rand(400,500)*TP
										if(TP>usr.tp)
											usr<<"<font color=white>Yamcha:</font> You don't have that many TPs!"
											usr.talking=0
											return
										if(TP==0||TP==null||!TP)
											usr.talking=0
											return
										while(TP==0||TP==null||!TP)
											usr.talking=0
											return
										if(TP<0)
											usr<<"<font color=white>Yamcha:</font> You must enter a positive number!"
											usr.talking=0
											return
										usr.powerlevel_max+=pl
										usr.powerlevel+=pl
										usr<<"<font color=white>Yamcha:</font> You have gained [num2text(round(pl),15)] Powerlevel!"
										usr.tp-=TP
										usr.talking=0
										return
									if("Ki")
										var/TP=input("How many TPs do you wish to use? [num2text(round(usr.tp),15)] TPs") as num
										var/pl=rand(400,500)*TP
										if(TP>usr.tp)
											usr<<"<font color=white>Yamcha:</font> You don't have that many TPs!"
											usr.talking=0
											return
										if(TP==0||TP==null||!TP)
											usr.talking=0
											return
										while(TP==0||TP==null||!TP)
											usr.talking=0
											return
										if(TP<0)
											usr<<"<font color=white>Yamcha:</font> You must enter a positive number!"
											usr.talking=0
											return
										usr.ki_max+=pl
										usr.ki+=pl
										usr<<"<font color=white>Yamcha:</font> You have gained [num2text(round(pl),15)] Ki!"
										usr.tp-=TP
										usr.talking=0
										return
									if("Ki Defense")
										var/TP = input ("How many TPs do you wish to use? [num2text(round(usr.tp),15)] TPs") as num
										var/pl = rand(400,500) * TP
										if(TP > usr.tp)
											usr<<"<font color=white>Yamcha:</font> You don't have that many TPs!"
											usr.talking = 0
											return
										if(TP == 0 || TP == null || !TP)
											usr.talking = 0
											return
										while(TP == 0 || TP == null || !TP)
											usr.talking = 0
											return
										if(TP < 0)
											usr<<"<font color=white>Yamcha:</font> You must enter a positive number!"
											usr.talking = 0
											return
										usr.kidefense_max += pl
										usr.kidefense += pl
										usr<<"<font color=white>Yamcha:</font> You have gained [num2text(round(pl),15)] Ki Defense!"
										usr.tp -= TP
										usr.talking = 0
										return
									if("Strength")
										var/TP=input("How many TPs do you wish to use? [num2text(round(usr.tp),15)] TPs") as num
										var/str=rand(80,100)*TP
										if(TP>usr.tp)
											usr<<"<font color=white>Yamcha:</font> You don't have that many TPs!"
											usr.talking=0
											return
										if(TP==0||TP==null||!TP)
											usr.talking=0
											return
										while(TP==0||TP==null||!TP)
											usr.talking=0
											return
										if(TP<0)
											usr<<"<font color=white>Yamcha:</font> You must enter a positive number!"
											usr.talking=0
											return
										usr.strength+=str
										usr.strength_max+=str
										usr<<"<font color=white>Yamcha:</font> You have gained [num2text(round(str),15)] Strength!"
										usr.tp-=TP
										usr.talking=0
										return
									if("Defense")
										var/TP=input("How many TPs do you wish to use? [num2text(round(usr.tp),15)] TPs") as num
										var/str=rand(80,100)*TP
										if(TP>usr.tp)
											usr<<"<font color=white>Yamcha:</font> You don't have that many TPs!"
											usr.talking=0
											return
										if(TP==0||TP==null||!TP)
											usr.talking=0
											return
										while(TP==0||TP==null||!TP)
											usr.talking=0
											return
										if(TP<0)
											usr<<"<font color=white>Yamcha:</font> You must enter a positive number!"
											usr.talking=0
											return
										usr.defence+=str
										usr.defence_max+=str
										usr<<"<font color=white>Yamcha:</font> You have gained [num2text(round(str),15)] Defense!"
										usr.tp-=TP
										usr.talking=0
										return
							if("Nothing")
								usr.talking=0
								return*/