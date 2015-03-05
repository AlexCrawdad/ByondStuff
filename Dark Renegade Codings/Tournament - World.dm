var/tournytime=0
var/tournament=0
var/match=0
var/list/Entries=list()
var/started=0
var/list/Winners=list()
var/list/Losers=list()
mob/var/tourny=0
mob/var/WTM=0
mob/Tournament
	verb
		Enter_Tournament()
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
			if(started)
				usr<<"<font color='#5f520e'>The tournament has already started</font></b></u>"
				return
			if(!tournament)
				usr<<"<font color='#5f520e'>Tournament isn't open yet."
				return
			if(tourny)
				usr<<"<font color='#5f520e'><b><u>You're already in the tournament!</font></b></u>"
				return
			if(z!=4&&z!=3&&z!=2&&z!=1)
				usr<<"You're not in right place!"
				return
			else
				wait_room=1
				loc=locate(154,111,6)
				Entries.Add(usr)
				tourny=1
				insafezone=0
				szactivated=0
				traintimer=0
				safe=1
				temptraintimer=0
				world<<"<font color='#5f520e'><b><u>[usr] has joined the tournament!</font></b></u>"
		Leave_Tournament()
			set category="Channels"
			set name="Exit Tournament"
			if(!tournament)
				usr<<"<font color='#5f520e'>Tournament isn't open yet."
				return
			if(started)
				usr<<"<font color='#5f520e'>You cannot leave the tournament!</font>"
				return
			if(!tourny)
				usr<<"<font color='#5f520e'><b><u>You're not in the tournament!</font></b></u>"
				return
			else
				wait_room=0
				loc=locate(167,194,1)
				tourny=0
				safe=0
				Entries.Remove(usr)
				world<<"<font color='#5f520e'><b><u>[usr] has left the tournament!</font></b></u>"
proc
	Prize(var/mob/PC/M in Winners)
		world<<"Tournament News: [M] has won the World Tournament and will receive some levels!"
		started=0
		spawn(1)
			var/amount=500
			amount=2000*tournyhostgain
			while(amount>0)
				if(!M)return
				M.exp=M.tnl
				M.Level_Up()
				amount--
				sleep(0.155)
		M.loc=locate(167,194,1)
		M.wait_room=0
		spawn(3)if(M)M.SafeTimer()
		for(var/mob/PC/C in Losers)
			var/amount=300
			amount=1000*tournyhostgain
			C<<"<font color= '#0099FF'>Loser reward: You've been granted [amount] levels for just participating the World Tournament, [C]!"
			Losers.Remove(C)
			spawn(70)if(C)
				while(amount>0)
					if(!C)return
					C.exp=C.tnl
					C.Level_Up()
					amount-=1
					sleep(0.155)
proc
	KILLTOURNY()
		for(var/mob/PC/M in world)
			M.verbs-=new/mob/Tournament/verb/Enter_Tournament()
			M.verbs-=new/mob/Tournament/verb/Leave_Tournament()
			M.wait_room=0
			if(M.tourny)
				M.tourny=0
				M.safe=0
				M.loc=locate(167,194,1)
		Losers=list()
		Entries=list()
		Winners=list()
		tournament=0
		started=0
		spawn(70)AutoRevive()
proc
	AutoStartTourney()
		if(tournament)return
		else
			Entries=list()
			Winners=list()
			Losers=list()
			world<<"<center><font face ='Palatino Linotype'  size=3><font color='Green'><b><center>Tournament : World Tournament!<br>Time to enter : You have 2 minutes.<br><font face ='Palatino Linotype'  size = 1>How to join : To join, please go to Channels tab and select Enter Tournament."
			tournament = 1
			for(var/mob/PC/M in world)
				M.verbs+=new/mob/Tournament/verb/Enter_Tournament()
				M.verbs+=new/mob/Tournament/verb/Leave_Tournament()
			spawn(70)AutoRevive()
			spawn(1200)AutoStopTourney()
	AutoStopTourney()
		if(tournament)
			world<<"<center><font face ='Palatino Linotype'  size=3><font color='Green'><b><center>The tournament entry has now ended."
			world<<"<font face ='Palatino Linotype'  size=1><font color='Green'><b>The following people are in the tournament:"
			for(var/mob/PC/M in world)if(M.tourny)world<<"[M]"
			if(Entries.len<=1&&Winners.len<1)
				world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Not enough players, tournament cancelled."
				for(var/mob/PC/C in world)
					if(Entries.Find(C))
						var/amount=250
						amount=1000*tournyhostgain
						C<<"<font color= '#0099FF'>Loser reward: You've been granted [amount] levels for just participating the World Tournament, [C]!"
						Entries.Remove(C)
						spawn(70)if(C)
							while(amount>0)
								if(!C)return
								C.exp=C.tnl
								C.Level_Up()
								amount-=1
								sleep(0.155)
				KILLTOURNY()
				return
			Tournament_AI()
proc
	Tournament_AI()
		started=1
		if(Losers.len>0&&Winners.len<1&&Entries.len<1)
			for(var/mob/PC/C in Losers)
				var/amount=300
				amount=1000*tournyhostgain
				C<<"<font color= '#0099FF'>Loser reward: You've been granted [amount] levels for just participating the World Tournament, [C]!"
				Losers.Remove(C)
				spawn(70)if(C)
					while(amount>0)
						if(!C)return
						C.exp=C.tnl
						C.Level_Up()
						amount-=1
						sleep(0.155)
		if(Entries.len<1&&Winners.len<1)
			world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament over, all contestants have left..."
			KILLTOURNY()
			return
		if(Entries.len<1&&Winners.len==1)
			tournament=0
			world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament over, winner is:"
			for(var/mob/PC/M in Winners)
				world<<M
				Prize(M)
			KILLTOURNY()
			return
		if(Entries.len<2)NextRound()
		else
			FixEntries()
			if(match)return
			if(!Entries||Entries.len<2)
				Tournament_AI()
				return
			world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament: Are you ready for battle?"
			world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament: Next up is..."
			Matches()
	FixEntries()
		var/list/Cop=list()
		for(var/mob/PC/M in Entries)if(M.dead||M.z!=6)Entries.Remove(M)
		for(var/mob/PC/M in Winners)if(M.dead||M.z!=6)Winners.Remove(M)
		for(var/mob/PC/A in Entries)
			var/good=1
			if(A&&ismob(A)&&A.client&&A.z==6)
				for(var/mob/B in Cop)
					if(A==B)good=0
				if(good)Cop+=A
				else
		Entries=Cop
	Matches()
		FixEntries()
		if(!Entries||Entries.len<2)
			Tournament_AI()
			return
		var/mob/A=Entries[1]
		var/mob/B=Entries[2]
		if(!A||!B||A==B||A.z!=6||B.z!=6)
			Matches()
			return
		match=1
		if(!(A && B))
			match=0
			Tournament_AI()
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
			Winners.Add(B)
			Entries.Remove(B)
			if(A)
				if(!Losers.Find(A))Losers.Add(A)
				Entries.Remove(A)
				A.tourny=0
			match=0
			Tournament_AI()
			return
		if(!B|| B.z!=6||B.dead)
			world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>[A] has won their round because their opponent has left!"
			Winners.Add(A)
			Entries.Remove(A)
			if(B)
				if(!Losers.Find(A))Losers.Add(B)
				Entries.Remove(B)
				B.tourny=0
			match=0
			Tournament_AI()
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
		Fight(A,B)
		FixEntries()
		match=0
		Tournament_AI()
proc
	Fight(mob/A,mob/B)
		while(1)
			if(!B||B.z!=6||B.dead)
				if(!B)world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>[A] has won their round because their opponent has left!"
				else
					world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>[A] has eliminated [B]!"
					B.wait_room=0
					Entries.Remove(B)
					B.tourny=0
					if(!Losers.Find(B))Losers.Add(B)
				if(!A.dead)
					Winners.Add(A)
					A.safe=1
					A.wait_room=1
					A.loc=locate(154,111,6)
				Entries.Remove(A)
				return
			if(!A||A.z!=6||A.dead)
				if(!A)world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>[B] has won their round because their opponent has left!"
				else
					world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>[B] has eliminated [A]!"
					A.wait_room=0
					Entries.Remove(A)
					A.tourny=0
					if(!Losers.Find(A))Losers.Add(A)
				if(!B.dead)
					Winners.Add(B)
					B.safe=1
					B.wait_room=1
					B.loc=locate(154,111,6)
				Entries.Remove(B)
				return
			else sleep(10)
	NextRound()
		for(var/mob/PC/M in Winners)
			Entries.Add(M)
			M.loc=locate(154,111,6)
			M.wait_room=1
			Winners.Remove(M)
		if(Entries.len==1)
			world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament over, winner is:"
			for(var/mob/PC/M in Entries)
				world<<M
				Prize(M)
			KILLTOURNY()
			return
		if(Losers.len>0&&Winners.len<1&&Entries.len<1)
			for(var/mob/PC/C in Losers)
				var/amount=250
				amount=1000*tournyhostgain
				C<<"<font color= '#0099FF'>Loser reward: You've been granted [amount] levels for just participating the World Tournament, [C]!"
				Losers.Remove(C)
				spawn(70)if(C)
					while(amount>0)
						if(!C)return
						C.exp = C.tnl
						C.Level_Up()
						amount -= 1
						sleep(0.155)
		if(Entries.len<1&&Winners.len<1)
			world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament over, all contestants have left..."
			KILLTOURNY()
			return
		world<<"<center><font face ='Palatino Linotype'  size=3><font color=#5f9ea0>Tournament News: The next round will now begin!"
		Tournament_AI()
