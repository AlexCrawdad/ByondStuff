var/jrtournytime=0
var/jrtournament=0
var/jrmatch=0
var/list/jrEntries=list()
var/jrstarted=0
var/list/jrWinners=list()
var/list/jrLosers=list()
mob/var/jrtourny=0
mob/var/JRTW=0
mob/Tournament
	verb
		JREnter_Tournament()
			set category="Channels"
			set name="Enter Tournament"
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
			if(level>=10000)
				usr<<"You cannot join this tournament! This tournament is exclusively available to these players with level of less than 10,000!"
				return
			//for(var/mob/PC/M in world)
				//if(M != usr)
					//if(M.client)
						//if(M.client.address==client.address)
							//if(M.tourny)
								//usr<<"Your another character is already in tournament!"
								//return
			if(jrstarted)
				usr<<"<font color='#5f520e'>The tournament has already started</font></b></u>"
				return
			if(!jrtournament)
				usr<<"<font color='#5f520e'>Tournament isn't open yet."
				return
			if(jrtourny)
				usr<<"<font color='#5f520e'><b><u>You're already in the tournament!</font></b></u>"
				return
			if(z!=4&&z!=3&&z!=2&&z!=1)
				usr<<"You're not in right place!"
				return
			else
				wait_room=1
				loc=locate(154,111,6)
				jrEntries.Add(usr)
				jrtourny=1
				insafezone=0
				szactivated=0
				traintimer=0
				safe=1
				temptraintimer=0
				world<<"<font color='#5f520e'><b><u>[usr] has joined the tournament!</font></b></u>"
		JRLeave_Tournament()
			set category="Channels"
			set name="Exit Tournament"
			if(!jrtournament)
				usr<<"<font color='#5f520e'>Tournament isn't open yet."
				return
			if(jrstarted)
				usr<<"<font color='#5f520e'>You cannot leave the tournament!</font>"
				return
			if(!jrtourny)
				usr<<"<font color='#5f520e'><b><u>You're not in the tournament!</font></b></u>"
				return
			else
				wait_room=0
				loc=locate(167,194,1)
				jrtourny=0
				safe=0
				jrEntries.Remove(usr)
				world<<"<font color='#5f520e'><b><u>[usr] has left the tournament!</font></b></u>"
proc
	jrPrize(var/mob/PC/M in Winners)
		world<<"Tournament News: [M] has won the Junior Tournament and will receive some levels!"
		started=0
		spawn(1)
			var/amount=500
			amount=1500*tournyhostgain
			while(amount>0)
				if(!M)return
				M.exp=M.tnl
				M.Level_Up()
				amount--
				sleep(0.155)
		M.loc=locate(167,194,1)
		M.wait_room=0
		spawn(3)if(M)M.SafeTimer()
		for(var/mob/PC/C in jrLosers)
			var/amount=200
			amount=750*tournyhostgain
			C<<"<font color= '#0099FF'>Loser reward: You've been granted [amount] levels for just participating the Junior Tournament, [C]!"
			jrLosers.Remove(C)
			spawn(70)if(C)
				while(amount>0)
					if(!C)return
					C.exp=C.tnl
					C.Level_Up()
					amount-=1
					sleep(0.155)
proc
	jrKILLTOURNY()
		for(var/mob/PC/M in world)
			M.verbs-=new/mob/Tournament/verb/JREnter_Tournament()
			M.verbs-=new/mob/Tournament/verb/JRLeave_Tournament()
			M.wait_room=0
			if(M.jrtourny)
				M.jrtourny=0
				M.safe=0
				M.loc = locate(167,194,1)
		jrLosers=list()
		jrEntries=list()
		jrWinners=list()
		jrtournament=0
		jrstarted=0
		spawn(70)AutoRevive()
proc
	jrAutoStartTourney()
		if(jrtournament)return
		else
			jrEntries=list()
			jrWinners=list()
			jrLosers=list()
			world<<"<center><font face ='Palatino Linotype'  size=3><font color='Green'><b><center>Tournament : Junior Tournament!<br>Time to enter : You have 2 minutes.<br><font face ='Palatino Linotype'  size = 1>How to enter : To join, please go to Channels tab and select Enter Tournament."
			jrtournament=1
			for(var/mob/PC/M in world)
				M.verbs+=new/mob/Tournament/verb/JREnter_Tournament()
				M.verbs+=new/mob/Tournament/verb/JRLeave_Tournament()
			spawn(70)AutoRevive()
			spawn(1200)jrAutoStopTourney()
	jrAutoStopTourney()
		if(jrtournament)
			world<<"<center><font face ='Palatino Linotype'  size=3><font color='Green'><b><center>The tournament entry has now ended."
			world<<"<font face ='Palatino Linotype'  size=1><font color='Green'><b>The following people are in the tournament:"
			for(var/mob/PC/M in world)if(M.jrtourny)world<<"[M]"
			if(jrEntries.len<=1&&jrWinners.len<1)
				world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Not enough players, tournament cancelled."
				for(var/mob/PC/C in world)
					if(jrEntries.Find(C))
						var/amount=150
						amount=750*tournyhostgain
						C<<"<font color= '#0099FF'>Loser reward: You've been granted [amount] levels for just participating the Junior Tournament, [C]!"
						jrEntries.Remove(C)
						spawn(70)if(C)
							while(amount>0)
								if(!C)return
								C.exp=C.tnl
								C.Level_Up()
								amount-=1
								sleep(0.155)
				jrKILLTOURNY()
				return
			jrTournament_AI()
proc
	jrTournament_AI()
		jrstarted=1
		if(jrLosers.len>0&&jrWinners.len<1&&jrEntries.len<1)
			for(var/mob/PC/C in jrLosers)
				var/amount=150
				amount=750*tournyhostgain
				C<<"<font color= '#0099FF'>Loser reward: You've been granted [amount] levels for just participating the Junior Tournament, [C]!"
				jrLosers.Remove(C)
				spawn(70)if(C)
					while(amount>0)
						if(!C)return
						C.exp=C.tnl
						C.Level_Up()
						amount-=1
						sleep(0.155)
		if(jrEntries.len<1&&jrWinners.len<1)
			world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament over, all contestants have left..."
			jrKILLTOURNY()
			return
		if(jrEntries.len<1&&jrWinners.len==1)
			jrtournament=0
			world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament over, winner is:"
			for(var/mob/PC/M in jrWinners)
				world<<M
				jrPrize(M)
			jrKILLTOURNY()
			return
		if(jrEntries.len<2)jrNextRound()
		else
			jrFixEntries()
			if(jrmatch)return
			if(!jrEntries||jrEntries.len<2)
				jrTournament_AI()
				return
			world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament: Are you ready for battle?"
			world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament: Next up is..."
			jrMatches()
	jrFixEntries()
		var/list/Cop=list()
		for(var/mob/PC/M in jrEntries)if(M.dead||M.z!=6)jrEntries.Remove(M)
		for(var/mob/PC/M in jrWinners)if(M.dead||M.z!=6)jrWinners.Remove(M)
		for(var/mob/PC/A in jrEntries)
			var/good=1
			if(A&&ismob(A)&&A.client&&A.z==6)
				for(var/mob/B in Cop)
					if(A==B)good=0
				if(good)Cop+=A
				else
		jrEntries=Cop
	jrMatches()
		jrFixEntries()
		if(!jrEntries||jrEntries.len<2)
			jrTournament_AI()
			return
		var/mob/A=jrEntries[1]
		var/mob/B=jrEntries[2]
		if(!A||!B||A==B||A.z!=6||B.z!=6)
			jrMatches()
			return
		jrmatch=1
		if(!(A && B))
			jrmatch=0
			jrTournament_AI()
			return
		world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament: [A] V.S. [B]!"
		world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament: You have 3 seconds to prepare yourselves!"
		world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament: 3!"
		sleep(10)
		world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament: 2!"
		sleep(10)
		world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament: 1!"
		sleep(10)
		if(!A||A.z!=6||A.dead)
			world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>[B] has won their round because their opponent has left!"
			jrWinners.Add(B)
			jrEntries.Remove(B)
			if(A)
				if(!jrLosers.Find(A))jrLosers.Add(A)
				jrEntries.Remove(A)
				A.jrtourny=0
			jrmatch=0
			jrTournament_AI()
			return
		if(!B||B.z!=6||B.dead)
			world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>[A] has won their round because their opponent has left!"
			jrWinners.Add(A)
			jrEntries.Remove(A)
			if(B)
				if(!jrLosers.Find(B))jrLosers.Add(B)
				jrEntries.Remove(B)
				B.jrtourny=0
			jrmatch=0
			jrTournament_AI()
			return
		world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament: FIGHT!"
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
		jrFight(A,B)
		jrFixEntries()
		jrmatch=0
		jrTournament_AI()
proc
	jrFight(mob/A,mob/B)
		while(1)
			if(!B||B.z!=6||B.dead)
				if(!B)world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>[A] has won their round because their opponent has left!"
				else
					world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>[A] has eliminated [B]!"
					B.wait_room=0
					jrEntries.Remove(B)
					B.jrtourny=0
					if(!jrLosers.Find(B))jrLosers.Add(B)
				if(!A.dead)
					jrWinners.Add(A)
					A.safe=1
					A.wait_room=1
					A.loc=locate(154,111,6)
				jrEntries.Remove(A)
				return
			if(!A||A.z!=6||A.dead)
				if(!A)world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>[B] has won their round because their opponent has left!"
				else
					world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>[B] has eliminated [A]!"
					A.wait_room=0
					jrEntries.Remove(A)
					A.jrtourny=0
					if(!jrLosers.Find(A))jrLosers.Add(A)
				if(!B.dead)
					jrWinners.Add(B)
					B.safe=1
					B.wait_room=1
					B.loc=locate(154,111,6)
				jrEntries.Remove(B)
				return
			else sleep(10)
	jrNextRound()
		for(var/mob/PC/M in jrWinners)
			jrEntries.Add(M)
			M.loc=locate(154,111,6)
			M.wait_room=1
			jrWinners.Remove(M)
		if(jrEntries.len==1)
			world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament over, winner is:"
			for(var/mob/PC/M in jrEntries)
				world<<M
				jrPrize(M)
			jrKILLTOURNY()
			return
		if(jrLosers.len>0&&jrWinners.len<1&&jrEntries.len<1)
			for(var/mob/PC/C in jrLosers)
				var/amount=150
				amount=750*tournyhostgain
				C<<"<font color= '#0099FF'>Loser reward: You've been granted [amount] levels for just participating the Junior Tournament, [C]!"
				jrLosers.Remove(C)
				spawn(70)if(C)
					while(amount>0)
						if(!C)return
						C.exp=C.tnl
						C.Level_Up()
						amount-=1
						sleep(0.155)
		if(jrEntries.len<1&&jrWinners.len<1)
			world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament over, all contestants have left..."
			jrKILLTOURNY()
			return
		world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament News: The next round will now begin!"
		jrTournament_AI()
