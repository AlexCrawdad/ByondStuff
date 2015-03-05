mob
	var
		gone_stronger=0
		worst_enemy_start=0
		worst_enemy_complete=0
		NW_kills=0
mob/NPC/Hercule
	icon_state = "Hercule"
	name="{NPC}Hercule"
	density=1
	safe=1
	New()
		..()
		src.AddName()
	verb
		Talk()
			set category = null
			set src in oview(2)
			if(usr.talking || usr.fused)return
			usr.talking = 1
			switch(alert("Hello there, [usr]. What can I do for you today?","Hercule","Use Skill Points","Quest","Nothing"))
				if("Use Skill Points")
					if(!usr.skill_points)
						usr<<"<font color=white>Hercule:</font> You don't have any SPs!"
						usr.talking = 0
						return
					switch(input("Which do you wish to use your SPs on?","SPs")in list("Block","Counter","Reflect","Dodge","Critical","Cancel"))
						if("Cancel")
							usr.talking=0
							return
						if("Block")
							var/TP = input ("How many SPs do you wish to use? [usr.skill_points] SPs|Base: [usr.block_max]") as num
							if(TP > usr.skill_points)
								usr<<"<font color=white>Hercule:</font> You don't have that many SPs!"
								usr.talking = 0
								return
							if(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							while(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							if(TP < 0)
								usr<<"<font color=white>Hercule:</font> You must enter a positive number!"
								usr.talking = 0
								return
							if(usr.block_max < 75)
								if(round(usr.block_max+TP)>75)
									usr<<"<font color=white>Hercule:</font> You cannot use that many!"
									usr.talking=0
									return
								usr.block_max += TP
								usr.block += TP
								usr<<"<font color=white>Hercule:</font> Block +[TP]%!"
								usr.skill_points -= TP
								usr.talking = 0
								if(usr.block_max > 75)
									usr.block_max = 75
								if(usr.block > 75)
									usr.block = 75
								return
							else
								usr<<"<font color=white>Hercule:</font> Already 75%!"
								usr.talking = 0
								return
						if("Counter")
							var/TP = input ("How many SPs do you wish to use? [usr.skill_points] SPs|Base: [usr.counter_max]") as num
							if(TP > usr.skill_points)
								usr<<"<font color=white>Hercule:</font> You don't have that many SPs!"
								usr.talking = 0
								return
							if(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							while(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							if(TP < 0)
								usr<<"<font color=white>Hercule:</font> You must enter a positive number!"
								usr.talking = 0
								return
							if(usr.counter_max < 75)
								if(round(usr.counter_max+TP)>75)
									usr<<"<font color=white>Hercule:</font> You cannot use that many!"
									usr.talking=0
									return
								usr.counter_max += TP
								usr.counter += TP
								usr<<"<font color=white>Hercule:</font> Counter +[TP]%!"
								usr.skill_points -= TP
								usr.talking = 0
								if(usr.counter_max > 75)
									usr.counter_max = 75
								if(usr.counter > 75)
									usr.counter = 75
								return
							else
								usr<<"<font color=white>Hercule:</font> Already 75%!"
								usr.talking = 0
								return
						if("Reflect")
							var/TP = input ("How many SPs do you wish to use? [usr.skill_points] SPs|Base: [usr.reflect_max]") as num
							if(TP > usr.skill_points)
								usr<<"<font color=white>Hercule:</font> You don't have that many SPs!"
								usr.talking = 0
								return
							if(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							while(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							if(TP < 0)
								usr<<"<font color=white>Hercule:</font> You must enter a positive number!"
								usr.talking = 0
								return
							if(usr.reflect_max < 75)
								if(round(usr.reflect_max+TP)>75)
									usr<<"<font color=white>Hercule:</font> You cannot use that many!"
									usr.talking=0
									return
								usr.reflect_max += TP
								usr.reflect += TP
								usr<<"<font color=white>Hercule:</font> Reflect +[TP]%!"
								usr.skill_points -= TP
								usr.talking = 0
								if(usr.reflect_max > 75)
									usr.reflect_max = 75
								if(usr.reflect > 75)
									usr.reflect = 75
								return
							else
								usr<<"<font color=white>Hercule:</font> Already 75%!"
								usr.talking = 0
								return
						if("Dodge")
							var/TP = input ("How many SPs do you wish to use? [usr.skill_points] SPs|Base: [usr.dodge_max]") as num
							if(TP > usr.skill_points)
								usr<<"<font color=white>Hercule:</font> You don't have that many SPs!"
								usr.talking = 0
								return
							if(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							while(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							if(TP < 0)
								usr<<"<font color=white>Hercule:</font> You must enter a positive number!"
								usr.talking = 0
								return
							if(usr.dodge_max < 75)
								if(round(usr.dodge_max+TP)>75)
									usr<<"<font color=white>Hercule:</font> You cannot use that many!"
									usr.talking=0
									return
								usr.dodge_max += TP
								usr.dodge += TP
								usr<<"<font color=white>Hercule:</font> Dodge +[TP]%!"
								usr.skill_points -= TP
								usr.talking = 0
								if(usr.dodge_max > 75)
									usr.dodge_max = 75
								if(usr.dodge > 75)
									usr.dodge = 75
								return
							else
								usr<<"<font color=white>Hercule:</font> Already 75%!"
								usr.talking = 0
								return
						if("Critical")
							var/TP = input ("How many SPs do you wish to use? [usr.skill_points] SPs|Base: [usr.critical_max]") as num
							if(TP > usr.skill_points)
								usr<<"<font color=white>Hercule:</font> You don't have that many SPs!"
								usr.talking = 0
								return
							if(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							while(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							if(TP < 0)
								usr<<"<font color=white>Hercule:</font> You must enter a positive number!"
								usr.talking = 0
								return
							if(usr.critical_max<75)
								if(round(usr.critical_max+TP)>75)
									usr<<"<font color=white>Hercule:</font> You cannot use that many!"
									usr.talking=0
									return
								usr.critical_max += TP
								usr.critical += TP
								usr<<"<font color=white>Hercule:</font> Critical +[TP]%!"
								usr.skill_points -= TP
								usr.talking = 0
								if(usr.critical_max > 75)
									usr.critical_max = 75
								if(usr.critical > 75)
									usr.critical = 75
								return
							else
								usr<<"<font color=white>Hercule:</font> Already 75%!"
								usr.talking = 0
								return
				if("Quest")
					if(!usr.worst_enemy_start)
						switch(alert("Help me out?","Quest: Worst Enemy","Yes","Not Yet"))
							if("Yes")
								usr.worst_enemy_start=1
								usr.NW_kills=0
								usr.contents += new/obj/Quests/Hercule/Worst_Enemy
								usr.talking=0
								usr<<"<font color=white>Hercule:</font> Go <font color=red>kill 10 <font color=green>Nemekian Warriors</font>!"
								usr<<"<font color=white>Hercule:</font> Wheeeew... I mean Thanks [usr]!"
								return
							else
								usr<<"<font color=white>Hercule:</font> Go on, kill them!"
								usr.talking=0
					else
						if(!usr.worst_enemy_complete&&usr.NW_kills>=10)

							usr.NW_kills=0
							usr.exp+=12000000
							usr<<"\white EXP +12000000"
							usr.Level_Up()
							for(var/obj/Quests/Hercule/Worst_Enemy/Q)del(Q)
							usr.talking=0
							usr.worst_enemy_complete = 1
							usr<<"<font color=white>Hercule:</font> Thanks [usr]!"
							usr.exp+=9000000
							usr.Level_Up()
							return
						else
							usr<<"<font color=white>Hercule:</font> Go kill 10 Namekian Warriors!"
							usr.talking=0
							return
			if("Nothing")
				usr.talking=0
				return
		Set_Spawn_Point()
			set src in oview(2)
			set category=null
			switch(alert("Set spawn point here?","Spawn Point","Yes","No"))
				if("Yes")usr.spawn_point = "Hercule"
				else return