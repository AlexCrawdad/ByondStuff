var/rtournytime=0
var/rtournament=0
var/rmatch=0
var/list/REntries=list()
var/rstarted=0
var/list/RWinners=list()
var/list/RLosers=list()
mob/var/rtourny=0
var/rtournament_race="Android"
var/rtournament_racenum=1
mob/Tournament
	verb
		REnter_Tournament()
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
			//for(var/mob/PC/M in world)
				//if(M!=usr)
					//if(M.client)
						//if(M.client.address==client.address)
							//if(M.tourny)
								//usr<<"Your another character is already in tournament!"
								//return
			if(rstarted)
				usr<<"<font color='#5f520e'>The tournament has already started</font></b></u>"
				return
			if(!rtournament)
				usr<<"<font color='#5f520e'>Tournament isn't open yet."
				return
			if(rtourny)
				usr<<"<font color='#5f520e'><b><u>You're already in the tournament!</font></b></u>"
				return
			if(z!=4&&z!=3&&z!=2&&z!=1)
				usr<<"You're not in right place!"
				return
			if(race!=rtournament_race)
				usr<<"Only [rtournament_race]s can join this tournament!"
				return
			else
				wait_room=1
				loc=locate(154,111,6)
				REntries.Add(usr)
				rtourny=1
				insafezone=0
				szactivated=0
				traintimer=0
				safe=1
				temptraintimer=0
				world<<"<font color='#5f520e'><b><u>[usr] has joined the tournament!</font></b></u>"
		RLeave_Tournament()
			set category="Channels"
			set name="Exit Tournament"
			if(!rtournament)
				usr<<"<font color='#5f520e'>Tournament isn't open yet."
				return
			if(rstarted)
				usr<<"<font color='#5f520e'>You cannot leave the tournament!</font>"
				return
			if(!rtourny)
				usr<<"<font color='#5f520e'><b><u>You're not in the tournament!</font></b></u>"
				return
			else
				wait_room=0
				loc=locate(167,194,1)
				rtourny=0
				safe=0
				REntries.Remove(usr)
				world<<"<font color='#5f520e'><b><u>[usr] has left the tournament!</font></b></u>"
proc
	RPrize(var/mob/PC/M in RWinners)
		world<<"Tournament News: [M] has won the race tournament and will receive 400 levels!"
		rstarted=0
		spawn(1)
			var/amount=500
			amount=500
			while(amount>0)
				if(!M)return
				M.exp=M.tnl
				M.Level_Up()
				amount-=1
				sleep(0.155)
		M.loc=locate(167,194,1)
		M.wait_room=0
		spawn(3)if(M)M.SafeTimer()
		for(var/mob/PC/C in RLosers)
			var/amount=125
			amount=200
			C<<"<font color= '#0099FF'>Loser reward: You've been granted 200 levels for just participating the race tournament, [C]!"
			RLosers.Remove(C)
			spawn(70)if(C)
				while(amount>0)
					if(!C)return
					C.exp=C.tnl
					C.Level_Up()
					amount-=1
					sleep(0.155)
proc
	RKILLTOURNY()
		for(var/mob/PC/M in world)
			M.verbs-=new/mob/Tournament/verb/REnter_Tournament()
			M.verbs-=new/mob/Tournament/verb/RLeave_Tournament()
			M.wait_room=0
			if(M.rtourny)
				M.rtourny=0
				M.safe=0
				M.loc=locate(167,194,1)
		RLosers=list()
		REntries=list()
		RWinners=list()
		rtournament=0
		rstarted=0
		spawn(70)AutoRevive()
proc
	RAutoStartTourney()
		if(rtournament)return
		else
			REntries=list()
			RWinners=list()
			RLosers=list()
			world<<"<center><font face ='Palatino Linotype'  size=3><font color='Green'><b><center>Tournament : Race Tournament!<br>Time to enter : You have 2 minutes.<br><font face ='Palatino Linotype'  size = 1>How to join : To join, please go to Channels tab and select Enter Tournament."
			rtournament=1
			for(var/mob/PC/M in world)
				M.verbs+=new/mob/Tournament/verb/REnter_Tournament()
				M.verbs+=new/mob/Tournament/verb/RLeave_Tournament()
			spawn(70)AutoRevive()
			spawn(1200)RAutoStopTourney()
	RAutoStopTourney()
		if(rtournament)
			world<<"<center><font face ='Palatino Linotype'  size=3><font color='Green'><b><center>The tournament entry has now ended."
			world<<"<font face ='Palatino Linotype'  size=1><font color='Green'><b>The following people are in the tournament:"
			for(var/mob/PC/M in world)if(M.rtourny)world<<"[M]"
			if(REntries.len<=1&&RWinners.len<1)
				world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Not enough players, tournament cancelled."
				for(var/mob/PC/C in world)
					if(REntries.Find(C))
						var/amount=125
						amount=200
						C<<"<font color= '#0099FF'>Loser reward: You've been granted 200 levels for just participating the Race Tournament, [C]!"
						REntries.Remove(C)
						spawn(70)if(C)
							while(amount>0)
								if(!C)return
								C.exp=C.tnl
								C.Level_Up()
								amount-=1
								sleep(0.155)
				RKILLTOURNY()
				return
			RTournament_AI()
proc
	RTournament_AI()
		rstarted=1
		if(RLosers.len>0&&RWinners.len<1&&REntries.len<1)
			for(var/mob/PC/C in RLosers)
				var/amount=125
				amount=200
				C<<"<font color= '#0099FF'>Loser reward: You've been granted 200 levels for just participating the Race Tournament, [C]!"
				RLosers.Remove(C)
				spawn(70)if(C)
					while(amount>0)
						if(!C)return
						C.exp=C.tnl
						C.Level_Up()
						amount-=1
						sleep(0.155)
		if(REntries.len<1&&RWinners.len<1)
			world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament over, all contestants have left..."
			RKILLTOURNY()
			return
		if(REntries.len<1&&RWinners.len==1)
			rtournament=0
			world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament over, winner is:"
			for(var/mob/PC/M in RWinners)
				world<<M
				RPrize(M)
			RKILLTOURNY()
			return
		if(REntries.len<2)RNextRound()
		else
			RFixEntries()
			if(rmatch)return
			if(!REntries||REntries.len<2)
				RTournament_AI()
				return
			world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament: Are you ready for battle?"
			world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament: Next up is..."
			RMatches()
	RFixEntries()
		var/list/Cop=list()
		for(var/mob/PC/M in REntries)if(M.dead||M.z!=6)REntries.Remove(M)
		for(var/mob/PC/M in RWinners)if(M.dead||M.z!=6)RWinners.Remove(M)
		for(var/mob/PC/A in REntries)
			var/good=1
			if(A&&ismob(A)&&A.client&&A.z==6)
				for(var/mob/B in Cop)
					if(A==B)good=0
				if(good)Cop+=A
				else
		REntries=Cop
	RMatches()
		RFixEntries()
		if(!REntries||REntries.len<2)
			RTournament_AI()
			return
		var/mob/A=REntries[1]
		var/mob/B=REntries[2]
		if(!A||!B||A==B||A.z!=6||B.z!=6)
			RMatches()
			return
		rmatch=1
		if(!(A && B))
			rmatch=0
			RTournament_AI()
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
			RWinners.Add(B)
			REntries.Remove(B)
			if(A)
				if(!RLosers.Find(A))RLosers.Add(A)
				REntries.Remove(A)
				A.rtourny=0
			rmatch=0
			RTournament_AI()
			return
		if(!B|| B.z!=6||B.dead)
			world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>[A] has won their round because their opponent has left!"
			RWinners.Add(A)
			REntries.Remove(A)
			if(B)
				if(!RLosers.Find(A))RLosers.Add(B)
				REntries.Remove(B)
				B.rtourny=0
			rmatch=0
			RTournament_AI()
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
		RFight(A,B)
		RFixEntries()
		rmatch=0
		RTournament_AI()
proc
	RFight(mob/A,mob/B)
		while(1)
			if(!B||B.z!=6||B.dead)
				if(!B)world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>[A] has won their round because their opponent has left!"
				else
					world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>[A] has eliminated [B]!"
					B.wait_room=0
					REntries.Remove(B)
					B.tourny=0
					if(!RLosers.Find(B))RLosers.Add(B)
				if(!A.dead)
					RWinners.Add(A)
					A.safe=1
					A.wait_room=1
					A.loc=locate(154,111,6)
				REntries.Remove(A)
				return
			if(!A||A.z!=6||A.dead)
				if(!A)world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>[B] has won their round because their opponent has left!"
				else
					world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>[B] has eliminated [A]!"
					A.wait_room=0
					REntries.Remove(A)
					A.tourny=0
					if(!RLosers.Find(A))RLosers.Add(A)
				if(!B.dead)
					RWinners.Add(B)
					B.safe=1
					B.wait_room=1
					B.loc=locate(154,111,6)
				REntries.Remove(B)
				return
			else sleep(10)
	RNextRound()
		for(var/mob/PC/M in RWinners)
			REntries.Add(M)
			M.loc=locate(154,111,6)
			M.wait_room=1
			RWinners.Remove(M)
		if(REntries.len==1)
			world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament over, winner is:"
			for(var/mob/PC/M in REntries)
				world<<M
				RPrize(M)
			RKILLTOURNY()
			return
		if(RLosers.len>0&&RWinners.len<1&&REntries.len<1)
			for(var/mob/PC/C in RLosers)
				var/amount=125
				amount=200
				C<<"<font color= '#0099FF'>Loser reward: You've been granted 200 levels for just participating the Race Tournament, [C]!"
				RLosers.Remove(C)
				spawn(70)if(C)
					while(amount>0)
						if(!C)return
						C.exp = C.tnl
						C.Level_Up()
						amount -= 1
						sleep(0.155)
		if(REntries.len<1&&RWinners.len<1)
			world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament over, all contestants have left..."
			RKILLTOURNY()
			return
		world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament News: The next round will now begin!"
		RTournament_AI()
