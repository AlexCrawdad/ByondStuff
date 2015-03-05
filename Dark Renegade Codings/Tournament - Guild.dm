var/guildtournytime=0
var/guildtournament=0
var/guildmatch=0
var/list/GuildEntries=list()
var/guildstarted=0
var/list/GuildTeamOne=list()
var/list/GuildTeamTwo=list()
var/GuildOneTeam=0
var/GuildTwoTeam=0
var/list/GuildWinners=list()
var/list/GuildLosers=list()
mob/var/guildtourny=0
var/tmp/firstguild=""
var/tmp/secondguild=""
var/tmp/firstguildleader=""
var/tmp/secondguildleader=""
mob
	var
		tmp
			guildsecond=0
			guildfirst=0
mob/GuildTournament
	verb
		Enter_Tournament()
			set category="Channels"
			set name="Enter Guild Tournament"
			if(dead)
				usr<<"\red You are dead!"
				return
			if(fused)
				usr<<"\red You are fused!"
				return
			for(var/obj/O in usr)
				if(O.dball)
					usr<<"You cannot enter the tournament with the dragonballs!"
					return
			if(buku_lock||in_hbtc||challenge||guild_challenge||grav_trainer)
				usr<<"\red You're doing something that tournament doesn't allow!"
				return
			if(jailed)
				usr<<"\red You are in jail!"
				return
			if(!pk)
				usr<<"You are not a combatant, train more!"
				return
			//for(var/mob/PC/M in world)
				//if(M!=usr)
					//if(M.client)
						//if(M.client.address==client.address)
							//if(M.guildtourny)
								//usr<<"Your another character is already in tournament!"
								//return
			if(guildstarted)
				usr<<"<font color='#5f520e'>The Guild Tournament has already started</font></b></u>"
				return
			if(!guildtournament)
				usr<<"<font color='#5f520e'>Guild Tournament isn't open yet."
				return
			if(guildtourny)
				usr<<"<font color='#5f520e'><b><u>You're already in the Guild Tournament!</font></b></u>"
				return
			if(z!=4&&z!=3&&z!=2&&z!=1)
				usr<<"You're not in right place!"
				return
			if(guild_name==""||!guild_name)
				usr<<"You must be in a guild to register!"
				return
			if(firstguildleader==""&&!guild_leader&&firstguild!=guild_name&&secondguild!=guild_name)
				usr<<"The Guild Tournament requires a guild leader to register first!"
				return
			if(secondguildleader==""&&!guild_leader&&secondguild!=guild_name&&firstguild!=guild_name)
				usr<<"The Guild Tournament requires a guild leader to register first!"
				return
			if(firstguild!=""&&secondguild!=""&&guild_name!=firstguild&&guild_name!=secondguild)
				usr<<"The guild entry is full!"
				return
			else
				loc=locate(154,111,6)
				GuildEntries.Add(usr)
				guildtourny=1
				insafezone=0
				szactivated=0
				traintimer=0
				wait_room=1
				safe=1
				temptraintimer=0
				if(firstguild==""&&guild_leader)
					if(secondguildleader!=usr)
						firstguildleader=usr
						firstguild=guild_name
				if(secondguild==""&&guild_leader)
					if(firstguildleader!=usr)
						secondguildleader=usr
						secondguild=guild_name
				if(guild_name==firstguild)
					GuildOneTeam+=1
					GuildTeamOne.Add(usr)
					guildfirst=1
					world<<"<font color='#5f520e'><b><u>[usr] joined the Guild Tournament! [usr] is in [firstguild]!</font></b></u>"
					return
				if(guild_name==secondguild)
					GuildTwoTeam+=1
					GuildTeamTwo.Add(usr)
					guildsecond=1
					world<<"<font color='#5f520e'><b><u>[usr] joined the Guild Tournament! [usr] is in [secondguild]!</font></b></u>"
					return
		Leave_Tournament()
			set category="Channels"
			set name="Leave Guild Tournament"
			if(!guildtournament)
				usr<<"<font color='#5f520e'>Guild Tournament isn't open yet."
				return
			if(guildstarted)
				usr<<"<font color='#5f520e'>You cannot leave the Guild Tournament!</font>"
				return
			if(!guildtourny)
				usr<<"<font color='#5f520e'><b><u>You're not in the Guild Tournament!</font></b></u>"
				return
			else
				loc=locate(167,194,1)
				guildtourny=0
				safe=0
				wait_room=0
				GuildEntries.Remove(usr)
				world<<"<font color='#5f520e'><b><u>[usr] left the Guild Tournament!</font></b></u>"
				if(usr==firstguildleader)
					firstguildleader=""
					firstguild=""
				if(usr==secondguildleader)
					secondguildleader=""
					secondguild=""
				if(GuildTeamOne.Find(usr))
					GuildTeamOne.Remove(usr)
					guildfirst=0
					GuildOneTeam-=1
					return
				if(GuildTeamTwo.Find(usr))
					GuildTeamTwo.Remove(usr)
					guildsecond=0
					GuildTwoTeam-=1
					return
proc
	GuildKILLTOURNY()
		for(var/mob/PC/M in world)
			M.verbs-=new/mob/GuildTournament/verb/Enter_Tournament()
			M.verbs-=new/mob/GuildTournament/verb/Leave_Tournament()
			M.wait_room=0
			if(M.guildtourny)
				M.guildtourny=0
				M.guildfirst=0
				M.guildsecond=0
				M.safe=0
				M.loc=locate(167,194,1)
		GuildEntries=list()
		GuildWinners=list()
		GuildLosers=list()
		GuildTeamTwo=list()
		GuildTeamOne=list()
		GuildOneTeam=0
		GuildTwoTeam=0
		guildtournament=0
		guildstarted=0
		firstguild=""
		secondguild=""
		firstguildleader=""
		secondguildleader=""
		spawn(70)AutoRevive()
proc
	AutoStartGuildTourney()
		if(guildtournament)return
		else
			GuildTeamTwo=list()
			GuildTeamOne=list()
			GuildLosers=list()
			world<<"<center><font face ='Palatino Linotype'  size=3><font color='Green'><b><center>Tournament : Guild Tournament! <br>Time to enter : You have 2 minutes.<br><font face ='Palatino Linotype'  size = 1>How to join : To join, please go to Channels tab and select Enter Guild Tournament."
			guildtournament=1
			for(var/mob/PC/M in world)
				M.verbs+=new/mob/GuildTournament/verb/Enter_Tournament()
				M.verbs+=new/mob/GuildTournament/verb/Leave_Tournament()
			spawn(70)AutoRevive()
			spawn(1200)AutoStopGuildTourney()
	AutoStopGuildTourney()
		if(guildtournament)
			world<<"<center><font face ='Palatino Linotype'  size=3><font color='Green'><b><center>The Guild Tournament entry has now ended."
			world<<"<font face ='Palatino Linotype'  size=1><font color='Green'><b>The following people are in the Guild Tournament:"
			world<<"<font face ='Palatino Linotype'  size=1><font color='Green'><b>[firstguild]:"
			for(var/mob/PC/M in GuildTeamOne)world<<"[M]"
			world<<"<font face ='Palatino Linotype'  size=1><font color='#143806'><b>[secondguild]:"
			for(var/mob/PC/M in GuildTeamTwo)world<<"[M]"
			for(var/mob/M in world)
				M.verbs-=new/mob/GuildTournament/verb/Enter_Tournament()
				M.verbs-=new/mob/GuildTournament/verb/Leave_Tournament()
			if(GuildOneTeam<2||GuildTwoTeam<2)
				world<<"<center><font face ='Palatino Linotype'  size=3>Not enough players, Guild Tournament cancelled."
				GuildKILLTOURNY()
				return
			Guild_Tournament_AI()
proc
	Guild_Tournament_AI()
		guildstarted=1
		if(GuildTeamOne.len<1&&GuildTeamTwo.len<1)
			world<<"<center><font face ='Palatino Linotype'  size=3>Guild Tournament over, all contestants have left..."
			GuildKILLTOURNY()
			return
		if(GuildTeamOne.len<1&&GuildTeamTwo.len>=1)
			world<<"<center><font face ='Palatino Linotype'  size=3>Guild Tournament over, winner is: <font color='#143806'>[secondguild]</font>!"
			for(var/mob/PC/M in world)
				if(M.guildsecond)
					spawn(1)
						var/amount=500
						amount=6000*tournyhostgain
						M.tp+=200000000
						while(amount>0)
							if(!M)return
							M.exp=M.tnl
							M.Level_Up()
							amount--
							sleep(0.155)
					M.loc=locate(167,194,1)
					if(GuildLosers.Find(M))GuildLosers.Remove(M)
					spawn(3)if(M)M.SafeTimer()
			for(var/mob/PC/C in GuildLosers)
				var/amount=1000
				amount=3000*tournyhostgain
				C.tp+=100000000
				C<<"<font color= '#0099FF'>Loser reward: You've been granted [amount] levels for just participating the Guild tournament, [C]!"
				GuildLosers.Remove(C)
				spawn(70)if(C)
					while(amount>0)
						if(!C)return
						C.exp=C.tnl
						C.Level_Up()
						amount-=1
						sleep(0.155)
			GuildKILLTOURNY()
			return
		if(GuildTeamOne.len>=1&&GuildTeamTwo.len<1)
			world<<"<center><font face ='Palatino Linotype'  size=3>Guild Tournament over, winner is: <font color='Green'>[firstguild]</font>!"
			for(var/mob/PC/M in world)
				if(M.guildfirst)
					M.loc=locate(167,194,1)
					if(GuildLosers.Find(M))GuildLosers.Remove(M)
					spawn(3)if(M)M.SafeTimer()
					var/amount=1500
					amount=6000*tournyhostgain
					M.tp+=200000000
					spawn(70)if(M)
						while(amount>0)
							if(!M)return
							M.exp=M.tnl
							M.Level_Up()
							amount-=1
			for(var/mob/PC/C in GuildLosers)
				var/amount=1000
				amount=3000*tournyhostgain
				C.tp+=100000000
				C<<"<font color= '#0099FF'>Loser reward: You've been granted [amount] levels for just participating the Guild Tournament, [C]!"
				GuildLosers.Remove(C)
				spawn(70)if(C)
					while(amount>0)
						if(!C)return
						C.exp=C.tnl
						C.Level_Up()
						amount-=1
						sleep(0.155)
			GuildKILLTOURNY()
			return
		if(GuildTeamOne.len>=1&&GuildTeamTwo.len>=1)
			GuildFixEntries()
			if(guildmatch)return
			world<<"<center><font face ='Palatino Linotype'  size=3>Tournament: Are you ready for battle?"
			world<<"<center><font face ='Palatino Linotype'  size=3>Tournament: Next up is..."
			GuildMatches()
	GuildFixEntries()
		for(var/mob/PC/M in GuildTeamOne)if(M.dead)GuildTeamOne.Remove(M)
		for(var/mob/PC/M in GuildTeamTwo)if(M.dead)GuildTeamTwo.Remove(M)
		var/list/Cop=list()
		var/list/Cop2=list()
		for(var/mob/PC/A in GuildTeamOne)
			var/good=1
			if(A&&ismob(A)&&A.client&&A.z==6)
				for(var/mob/B in Cop)
					if(A==B)good=0
				if(good)Cop+=A
				else
		for(var/mob/PC/B in GuildTeamTwo)
			var/good=1
			if(B&&ismob(B)&&B.client&&B.z==6)
				for(var/mob/C in Cop2)
					if(B==C)good=0
				if(good)Cop2+=B
				else
		GuildTeamOne=Cop
		GuildTeamTwo=Cop2
	GuildMatches()
		GuildFixEntries()
		var/chance=rand(1,2)
		var/mob/A=GuildTeamOne[1]
		var/mob/B=GuildTeamTwo[1]
		if(GuildTeamOne.len>=2)
			if(chance==1)A=GuildTeamOne[1]
			if(chance==2)A=GuildTeamOne[2]
		if(GuildTeamTwo.len>=2)
			if(chance==1)B=GuildTeamTwo[1]
			if(chance==2)B=GuildTeamTwo[2]
		if(!A||!B||A==B||A.z!=6||B.z!=6)
			GuildMatches()
			return
		guildmatch=1
		if(!(A&&B))
			guildmatch=0
			Guild_Tournament_AI()
			return
		world<<"<center><font face ='Palatino Linotype'  size=3>Tournament: [A] V.S. [B]!"
		world<<"<center><font face ='Palatino Linotype'  size=3>Tournament: You have 3 seconds to prepare yourselves!"
		world<<"<center><font face ='Palatino Linotype'  size=3>Tournament: 3!"
		sleep(10)
		world<<"<center><font face ='Palatino Linotype'  size=3>Tournament: 2!"
		sleep(10)
		world<<"<center><font face ='Palatino Linotype'  size=3>Tournament: 1!"
		sleep(10)
		if(!A||A.z!=6||A.dead)
			world<<"<center><font face ='Palatino Linotype'  size=3>[B] from <font color='#143806'>[secondguild]</font> has won their round because their opponent has left!"
			GuildOneTeam--
			if(A)
				if(!GuildLosers.Find(A))GuildLosers.Add(A)
				GuildTeamTwo.Remove(A)
				A.guildtourny=0
			guildmatch=0
			Guild_Tournament_AI()
			return
		if(!B||B.z!=6||B.dead)
			world<<"<center><font face ='Palatino Linotype'  size=3>[A] from <font color='Green'>[firstguild]</font> has won their round because their opponent has left!"
			GuildTwoTeam--
			if(B)
				if(!GuildLosers.Find(B))GuildLosers.Add(B)
				GuildTeamOne.Remove(B)
				B.guildtourny=0
			guildmatch=0
			Guild_Tournament_AI()
			return
		world<<"<center><font face ='Palatino Linotype'  size=3>Tournament: FIGHT!"
		if(A)
			A.dir=EAST
			A.loc=locate(148,66,6)
			A.safe=0
			A.wait_room=0
		if(B)
			B.dir=WEST
			B.loc=locate(162,66,6)
			B.safe=0
			B.wait_room=0
		GuildFight(A,B)
		GuildFixEntries()
		guildmatch=0
		Guild_Tournament_AI()
proc
	GuildFight(mob/A,mob/B)
		while(1)
			if(!B||B.z!=6||B.dead)
				if(!B)world<<"<center><font face ='Palatino Linotype'  size=3>[A] from <font color='Green'>[firstguild]</font> has won their round because their opponent has left!"
				else
					world<<"<center><font face ='Palatino Linotype'  size=3>[A] has eliminated [B]!"
					B.wait_room=0
					GuildTeamTwo.Remove(B)
					B.guildtourny=0
					if(!GuildLosers.Find(B))GuildLosers.Add(B)
				if(!A.dead)
					GuildWinners.Add(A)
					A.safe=1
					A.wait_room=1
					A.loc=locate(154,111,6)
				GuildTwoTeam--
				GuildEntries.Remove(A)
				return
			if(!A||A.z!=6||A.dead)
				if(!A)world<<"<center><font face ='Palatino Linotype'  size=3>[B] from <font color='#143806'>[secondguild]</font> has won their round because their opponent has left!"
				else
					world<<"<center><font face ='Palatino Linotype'  size=3>[B] has eliminated [A]!"
					GuildTeamOne.Remove(A)
					A.guildtourny=0
					if(!GuildLosers.Find(A))GuildLosers.Add(A)
					A.wait_room=0
				if(!B.dead)
					GuildWinners.Add(B)
					B.safe=1
					B.loc=locate(154,111,6)
					B.wait_room=1
				GuildOneTeam--
				GuildEntries.Remove(B)
				return
			else sleep(10)
