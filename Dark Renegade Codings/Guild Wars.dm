var
	gwar_on=0
	gwar_blocked=0
	guild_war_1
	guild_war_2
	guildies1=0
	guildies2=0
	war_member_limit1=0
	war_member_limit2=0
	war_use=0
	guildies_limit=0
	guild_war_starter
mob/var/Guild_War = 0
mob/var/warl = 0
mob/var/inwar = 0
mob/var/war_opponent
mob/var/tmp/guild_challenging=0
obj
	GuildArena
		var/time=15
		var/mob/C1
		var/mob/C2
		New()
			..()
			spawn while(1)
				time-=1
				if(time<=0)
					if(C1)
						C1.guild_challenge=0
						C1.guild_challenger=""
					if(C2)
						C2.guild_challenge=0
						C2.guild_challenger=""
					for(var/mob/M in world)M << "<font color=red><u>Guild Information:</u> \white [C2] didn't reply to [C1]'s Guild Challenge!"
					C1.guild_challenging=0
					del(src)
				sleep(10)
		proc
			ChallengeMob(mob/A,mob/B)
				switch(alert(A,"Do you accept [B]'s Guild Challenge? You have 15 seconds to reply.","Guild Challenge","Decline","Accept"))
					if("Accept")
						for(var/obj/O in B)
							if(O.dball)
								if(B)
									B<<"You cannot guild challenge with the dragonballs!"
									B.guild_challenge=0
									B.guild_challenger=""
									B.guild_challenging=0
								if(A)
									A<<"[B] cannot guild challenge right now!"
									A.guild_challenge=0
									A.guild_challenger=""
									A.guild_challenging=0
								del(src)
						for(var/obj/O in A)
							if(O.dball)
								if(A)
									A<<"You cannot guild challenge with the dragonballs!"
									A.guild_challenge=0
									A.guild_challenger=""
									A.guild_challenging=0
								if(B)
									B<<"[A] cannot guild challenge right now!"
									B.guild_challenge=0
									B.guild_challenger=""
									B.guild_challenging=0
								del(src)
						if(A.z!=4&&A.z!=3&&A.z!=2&&A.z!=1)
							if(A)
								A<<"You aren't in right place!"
								A.guild_challenge=0
								A.guild_challenger=""
								A.guild_challenging=0
							if(B)
								B<<"[A] isn't in right place!"
								B.guild_challenge=0
								B.guild_challenger=""
								B.guild_challenging=0
							del(src)
						if(B.z!=4&&B.z!=3&&B.z!=2&&B.z!=1)
							if(A)
								A<<"[B] isn't in right place!"
								A.guild_challenge=0
								A.guild_challenger=""
								A.guild_challenging=0
							if(B)
								B<<"You aren't in right place!"
								B.guild_challenge=0
								B.guild_challenger=""
								B.guild_challenging=0
							del(src)
						if(A.babatourny||A.tourny||A.challenge||A.dead||A.in_war)
							if(A)
								A<<"You aren't ready!"
								A.guild_challenge=0
								A.guild_challenger=""
								A.guild_challenging=0
							if(B)
								B<<"[A] isn't ready!"
								B.guild_challenge=0
								B.guild_challenger=""
								B.guild_challenging=0
							del(src)
						if(B.babatourny||B.tourny||B.challenge||B.dead||B.in_war)
							if(A)
								A<<"[B] isn't ready!"
								A.guild_challenge=0
								A.guild_challenger=""
								A.guild_challenging=0
							if(B)
								B<<"You aren't ready!"
								B.guild_challenge=0
								B.guild_challenger=""
								B.guild_challenging=0
							del(src)
						if(A.dead)
							if(A)
								A<<"You are dead."
								A.guild_challenge=0
								A.guild_challenger=""
								A.guild_challenging=0
							if(B)
								B.guild_challenging=0
								B.guild_challenge=0
								B.guild_challenger=""
							del(src)
						if(B.dead)
							if(A)
								A<<"[B] is dead."
								A.guild_challenge=0
								A.guild_challenger=""
								A.guild_challenging=0
							if(B)
								B.guild_challenge=0
								B.guild_challenger=""
								B.guild_challenging=0
							del(src)
						if(!B)
							if(A)
								A.guild_challenge=0
								A.guild_challenger=""
								A.guild_challenging=0
							del(src)
						if(!A)
							if(B)
								B.guild_challenge=0
								B.guild_challenger=""
								B.guild_challenging=0
							del(src)
						for(var/mob/M in world)M << "<font color=red><u>Guild Information:</u> \white [A] has \green <u>accepted</u> \white [B]'s Guild Challenge!"
						B.loc=locate(150,101,5)
						A.loc=locate(166,101,5)
						spawn(3)if(B)B.loc=locate(150,101,5)
						spawn(3)if(A)A.loc=locate(166,101,5)
						B.dir=EAST
						A.dir=WEST
						A.safe=0
						B.safe=0
						A.grav=0
						B.grav=0
						B.guild_challenger=A
						A.guild_challenger=B
						del(src)
					if("Decline")
						if(A)
							A.guild_challenge = 0
							A.guild_challenger = ""
							A.guild_challenging=0
						if(B)
							for(var/mob/M in world)M << "<font color=red><u>Guild Information:</u> \white [A] has \red <u>declined</u> \white [B]'s Guild Challenge!"
							B.guild_challenger = ""
							B.guild_challenge = 0
							B.guild_challenging=0
						del(src)
obj
	GuildChallenges
		var/time=15
		var/mob/C1
		var/mob/C2
		New()
			..()
			spawn while(1)
				time-=1
				if(time<=0)
					gwar_on=0
					world<<"<font color=red><u>Guild Information:</u> \white [C2] didn't reply to [C1]'s Guild War request!"
					del(src)
				sleep(10)
		proc
			ChallengeWar(mob/A,mob/B)
				switch(alert(A,"[B] has challenged you for a Guild War, do you accept? You have 15 seconds to reply!","","No","Yes"))
					if("No")
						gwar_on=0
						guild_war_starter=null
						world<<"<font color=red><u>Guild Information:</u> \white [A] declined [B]'s Guild War request!"
						del(src)
					if("Yes")
						if(A.z!=4&&A.z!=3&&A.z!=2&&A.z!=1)
							B<<"[A] isn't in right place!"
							gwar_on=0
							del(src)
						if(B.z!=4&&B.z!=3&&B.z!=2&&B.z!=1)
							A<<"[B] isn't in right place!"
							gwar_on=0
							del(src)
						world<<"<font color=red><u>Guild Information:</u> \white [A] accepted the [B]'s Guild War request!"
						B.verbs+=new/mob/GuildLeaderWar/verb/Guild_War_Start
						B.verbs+=new/mob/GuildLeaderWar/verb/Guild_War_Cancel
						A.verbs+=new/mob/GuildLeaderWar/verb/Guild_War_Cancel
						world<<"<font color=red><u>Guild Information:</u></font> [B.guild_name] has declared war on [A.guild_name]!"
						guild_war_2=A.guild_name
						guild_war_1=B.guild_name
						for(var/mob/M in world)if(M.guild_name==guild_war_1||M.guild_name==guild_war_2)M.verbs+=new/mob/GuildVerbsWar/verb/Guild_War_Join
						spawn(1)GuildWarStart(B,A)
						del(src)
mob/GuildLeaderWar
	verb
		Guild_War_Cancel()
			set category="Guild"
			switch(alert("Do you want to cancel the war?","Cancel","No","Yes"))
				if("No")return
				else
					gwar_on=0
					gwar_blocked=0
					guild_war_1=null
					guild_war_2=null
					guild_war_starter=null
					world<<"<center>\white [src] has <font color=red><u>cancelled</u></font> the war!"
					for(var/mob/PC/M in world)
						if(M.in_war&&M.z==5)
							M.in_war=0
							M.safe=0
							M.loc=locate(167,194,1)
							M.SafeTimer()
						M.verbs-=new/mob/GuildVerbsWar/verb/Guild_War_Join
						M.verbs-=new/mob/GuildLeaderWar/verb/Guild_War_Start
						M.verbs-=new/mob/GuildLeaderWar/verb/Guild_War_Cancel
		Guild_War_Start()
			set category = "Guild"
			if(!in_war)
				usr<<"You have not registered for war!"
				return
			switch(alert("Do you want to start or cancel the war?","","Start","Cancel"))
				if("Start")
					switch(alert("All set up for war?","","Yes","No"))
						if("No")return
						else
							for(var/mob/L in world)
								if(L.guild_name==guild_war_2)
									if(L.guild_leader)
										switch(alert(L,"[usr] is ready. Are you ready for war?","","Yes","No"))
											if("No")
												usr<<"[L] isn't ready"
												return
											else
												if(!L.in_war)
													L<<"You have not registered for war!"
													usr<<"[L] has not registered for war!"
													return
												if(L.babatourny||L.tourny||L.challenge||L.dead||L.guild_challenge)
													L<<"You are not ready!"
													usr<<"[L] is not ready!"
													return
												if(babatourny||tourny||challenge||dead||guild_challenge)
													usr<<"You are not ready!"
													L<<"[usr] is not ready!"
													return
												if(!guildies2||!guildies1)
													for(var/mob/PC/D in world)
														D.verbs-=new/mob/GuildVerbsWar/verb/Guild_War_Join
														D.verbs-=new/mob/GuildLeaderWar/verb/Guild_War_Start
												for(var/mob/PC/M in world)
													if(M.in_war)
														if(M.guild==usr.guild)M.loc=locate(325,41,5)
														if(M.guild!=usr.guild)M.loc=locate(371,51,5)
														M.it_lock=1
														M.it_blocked=1
														M.safe=0
													M.verbs-=new/mob/GuildVerbsWar/verb/Guild_War_Join
													M.verbs-=new/mob/GuildLeaderWar/verb/Guild_War_Start
												guildies2=0
												guildies1=0
												for(var/mob/T1 in world)
													if(T1.guild_name==guild_war_1&&T1.in_war)guildies1+=1
													if(T1.guild_name==guild_war_2&&T1.in_war)guildies2+=1
												world<<"<font color=red><u>Guild Information:</u></font> [usr.guild_name] and [L.guild_name]'s Guild War has <font color=green><u>started</u></font>!"
												gwar_on=1
												gwar_blocked=1
												return
				else
					return
mob/GuildVerbsWar
	verb
		Guild_War_Join()
			set category = "Guild"
			if(dead)return
			if(!in_war)
				switch(alert("Go to War?","","Yes","No"))
					if("No")return
					if("Yes")
						if(!gwar_on)
							usr<<"The war has been cancelled."
							return
						if(gwar_blocked)
							usr<<"Sorry, the war has already started!"
							return
						for(var/obj/O in usr)
							if(O.dball)
								usr<<"You can't bring the dragonballs to the war!"
								return
						if(babatourny||tourny||challenge||dead||guild_challenge||grav_trainer)return
						in_war=1
						safe=1
						if(guild_name==guild_war_2)
							loc=locate(117,66,5)
							world<<"<font color=red><u>Guild Information:</u></font><font color=white> [src] of [guild_war_2] has joined the war!"
						if(guild_name==guild_war_1)
							loc=locate(117,66,5)
							world<<"<font color=red><u>Guild Information:</u></font><font color=white> [src] of [guild_war_1] has joined the war!"
						return
			else
				switch(alert("Resign from War?","","Yes","No"))
					if("No")return
					if("Yes")
						if(!gwar_on)
							src<<"The war has been cancelled."
							return
						if(gwar_blocked)
							src<<"Sorry, the war has already started!"
							return
						if(babatourny||tourny||challenge||dead||guild_challenge||grav_trainer)return
						if(guild_name==guild_war_2)
							loc = locate(167,194,1)
							world<<"<font color=red><u>Guild Information:</u></font><font color=white> [src] of [guild_war_2] has resigned from the war!"
						if(guild_name==guild_war_1)
							loc = locate(167,194,1)
							world<<"<font color=red><u>Guild Information:</u></font><font color=white> [src] of [guild_war_1] has resigned from the war!"
						in_war=0
						safe=0
						return
proc
	GuildWarCheck()
		if(gwar_on)
			if(guildies2<=0)
				gwar_on=0
				gwar_blocked=0
				usr<<output("<font color=red><u>Guild Information:</u></font><font color=white> [guild_war_1] has defeated [guild_war_2]!","output4")
				guild_war_1=null
				guild_war_2=null
				for(var/mob/PC/M in world)
					if(M.in_war)
						M.loc=locate(167,194,1)
						M.it_lock=0
						M.it_blocked=0
						M.in_war=0
				guild_war_starter=null
			if(guildies1<=0)
				gwar_on=0
				gwar_blocked=0
				usr<<output("<font color=red><u>Guild Information:</u></font><font color=white> [guild_war_2] has defeated [guild_war_1]!","output4")
				guild_war_1=null
				guild_war_2=null
				for(var/mob/PC/M in world)
					if(M.in_war)
						M.loc=locate(167,194,1)
						M.it_lock=0
						M.in_war=0
						M.it_blocked=0
				guild_war_starter=null
proc
	GuildWarStart(mob/A,mob/B)
		gwar_on=1
		gwar_blocked=0
		guild_war_1=A.guild_name
		guild_war_2=B.guild_name
		A.in_war=1
		B.in_war=1
		war_member_limit1=guildies_limit
		war_member_limit2=guildies_limit
		for(var/mob/PC/C in world)
			C.in_war=0
			if(C.guild==A.guild||C.guild==B.guild)
				C.verbs+=new/mob/GuildVerbsWar/verb/Guild_War_Join
				C << "Get ready for war! To join go to the Guild tab and click Guild War Join."
		usr<<output("<font color=red><u>Guild Information:</u></font><font color=white> [A.guild_name] and [B.guild_name] are going to war!","output4")
mob
	proc
		GWUpdate()
			if(in_war&&z==5)
				in_war=0
				loc=locate(167,194,1)
				it_lock=0
				it_blocked=0
				if(guild_name==guild_war_1)
					guildies1-=1
					usr<<output("<font color=red><u>Guild Information:</u></font><font color=white> [src] of [guild_war_1] has been defeated! [guild_war_1] members remaining: [guildies1]!","output4")
					war_member_limit1+=1
				if(guild_name==guild_war_2)
					guildies2-=1
					usr<<output("<font color=red><u>Guild Information:</u></font><font color=white> [src] of [guild_war_2] has been defeated! [guild_war_2] members remaining: [guildies2]!","output4")
					war_member_limit2+=1
				GuildWarCheck()