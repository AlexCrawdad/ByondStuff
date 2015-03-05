mob/var/first_quest_start=0
mob/var/first_quest_complete=0
mob/var/Join_the_Z_start=0
mob/var/Join_the_Z_complete=0
mob/var/used_rock=0
mob
	NPC
		MainQuestGuy
			name = "{NPC}-Goku"
			icon_state = "Cell Games Goku"
			density = 1
			it_blocked = 1
			itspecialblocked = 1
			safe = 1
			New()
				..()
				src.AddName()
			verb
				Talk()
					set src in oview(2)
					if(usr.talking || usr.fused)
						return
					else
						usr.talking=1
						if(!usr.first_quest_start)
							usr<<"<font color='#5f520e'>Goku:</font> Whats your Name hero?"
							sleep(20)
							usr<<"<font color=white>You:</font> [usr]."
							sleep(20)
							usr<<"<font color='#5f520e'>Goku:</font> Okay [usr], are you Ready?"
							switch(alert("Ready?","Quest: First Quest","Yes","No"))
								if("Yes")
									usr.first_quest_start = 1
									usr.contents += new/obj/Quests/Goku/First_Quest
									usr<<"<font color='#5f520e'>Goku:</font> Alright, This world is very Unique! But more of that later."
									sleep(30)
									usr<<"<font color='#5f520e'>Goku:</font>There's a rock on this island, Right-Click it and hit 'Use Rock'!"
									usr.talking=0
									return
								else
									usr<<"<font color='#5f520e'>Goku:</font> You have to complete this to continue!"
									usr.talking=0
									return
						else
							if(!usr.first_quest_complete&&usr.used_rock)
								usr.talking=0
								usr<<"<font color='#5f520e'>Goku:</font>Very good [usr], You have done Well!"
								usr.first_quest_complete = 1
								usr.powerlevel_max+=2000
								usr.ki_max+=2000
								usr.kidefense_max+=2000
								usr.strength_max+=2000
								usr.defence_max+=2000
								usr.tp+=2000
								usr.exp+=1000000
								usr.Level_Up()
								usr.strength = usr.strength_max
								usr.defence = usr.defence_max
								usr.powerlevel = usr.powerlevel_max
								usr.ki = usr.ki_max
								usr.kidefense = usr.kidefense_max
								usr.contents += new/obj/Quests/Goku/First_Quest
								//spawn(150) src.icon_state = ""
								for(var/obj/Quests/Goku/First_Quest/Q)del(Q)
								sleep(20)
								usr<<"<font color='#5f520e'>Goku:</font> Okay [usr], you can now advance!"
								sleep(10)
								usr.loc=locate(167,224,1)
								usr<<"<font color='#5f520e'>Goku:</font> I have used Instant Transmission to take you to the Safezone!"
								usr<<"<font color='#5f520e'>Goku:</font> Talk to Yamcha for your next quest [usr]."
								sleep(10)
								usr<<"<font color=green>(Telepathy)</font>Goku: Be Careful [usr]!"
								sleep(10)
								usr<<"<font color=green>(Telepathy)</font>Goku: By the way, Meditation is good for Stats, Self Training and doing quests are good for Levels! *Gokus voice slowly fades away*"
								return
							if(!usr.first_quest_complete&&!usr.used_rock)
								usr<<"<font color='#5f520e'>Goku:</font> use it!"
								usr.talking=0


mob
	NPC
		Boost_Rock
			name= "Rock"
			density =0
			it_blocked = 1
			safe=1
			New()
				..()
				src.AddName()
			verb
				Use_Rock()
					set src in oview(2)
					if(usr.used_rock==1)
						usr<<"You've already used it!"
						usr.talking=0
						return
					if(usr.first_quest_start==0)
						usr<<"You're not doing this quest"
						return
					else
						usr.used_rock=1
						usr<<"You used the rock!"
						return
