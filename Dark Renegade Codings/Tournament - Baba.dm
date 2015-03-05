var/babatournytime=0
var/babatournament=0
var/babamatch=0
var/list/BabaEntries=list()
var/babastarted=0
var/list/BabaTeamOne=list()
var/list/BabaTeamTwo=list()
var/BabaOne=0
var/rnum = 1
var/BabaOneTeam=0
var/BabaTwoTeam=0
var/list/BabaWinners=list()
var/list/BabaLosers=list()
mob/var/babatourny=0
mob
	var
		tmp
			babasecond=0
			babafirst=0
mob/BabaTournament
	verb
		Enter_Tournament()
			set category="Channels"
			set name="Enter Baba Tournament"
			if(dead)
				usr<<output("\red You are dead!","MainMapPan.Training Box")
				return
			if(fused)
				usr<<output("\red You are fused!","MainMapPan.Training Box")
				return
			for(var/obj/O in usr)
				if(O.dball)
					usr<<output("You cannot enter the tournament with the dragonballs!","MainMapPan.Training Box")
					return
			if(buku_lock||in_hbtc||challenge||guild_challenge||grav_trainer)
				usr<<output("\red You're doing something that tournament doesn't allow!","MainMapPan.Training Box")
				return
			if(jailed)
				usr<<output("\red You are in jail!","MainMapPan.Training Box")
				return
			if(!pk)
				usr<<output("You are not a combatant, train more!","MainMapPan.Training Box")
				return
			//for(var/mob/PC/M in world)
				//if(M!=usr)
					//if(M.client)
						//if(M.client.address==client.address)
							//if(M.babatourny)
								//usr<<output("Your another character is already in tournament!","MainMapPan.Training Box")
								//return
			if(babastarted)
				usr<<output("<font color='#5f520e'>The Baba Tournament has already started</font></b></u>","MainMapPan.Training Box")
				return
			if(!babatournament)
				usr<<output("<font color='#5f520e'>Baba Tournament isn't open yet.","MainMapPan.Training Box")
				return
			if(babatourny)
				usr<<output("<font color='#5f520e'><b><u>You're already in the Baba Tournament!</font></b></u>","MainMapPan.Training Box")
				return
			if(z!=4&&z!=3&&z!=2&&z!=1)
				usr<<output("You're not in right place!","MainMapPan.Training Box")
				return
			else
				loc=locate(154,111,6)
				BabaEntries.Add(usr)
				babatourny=1
				insafezone=0
				szactivated=0
				traintimer=0
				wait_room=1
				safe=1
				temptraintimer=0
				if(BabaOneTeam>0&&BabaTwoTeam>0)
					if(BabaOneTeam>=BabaTwoTeam)BabaOne=1
					if(BabaOneTeam<=BabaTwoTeam)BabaOne=0
				if(!BabaOne)
					BabaOne=1
					BabaOneTeam+=1
					BabaTeamOne.Add(usr)
					babafirst=1
					usr<<output("<font color='Red'><b><u>[usr] joined the Baba Tournament! [usr] is in the Red Team!</font></b></u>","MainMapPan.Training Box")
					return
				if(BabaOne)
					BabaOne=0
					BabaTwoTeam+=1
					BabaTeamTwo.Add(usr)
					babasecond=1
					usr<<output("<font color='Blue'><b><u>[usr] joined the Baba Tournament! [usr] is in the Blue Team!</font></b></u>","MainMapPan.Training Box")
					return
		Leave_Tournament()
			set category="Channels"
			set name="Leave Baba Tournament"
			if(!babatournament)
				usr<<output("<font color='#5f520e'>Baba Tournament isn't open yet.","MainMapPan.Training Box")
				return
			if(babastarted)
				usr<<output("<font color='#5f520e'>You cannot leave the Baba Tournament!</font>","MainMapPan.Training Box")
				return
			if(!babatourny)
				usr<<output("<font color='#5f520e'><b><u>You're not in the Baba Tournament!</font></b></u>","MainMapPan.Training Box")
				return
			else
				loc = locate(167,194,1)
				babatourny=0
				safe=0
				wait_room=0
				BabaEntries.Remove(usr)
				usr<<output("<font color='#5f520e'><b><u>[usr] left the Baba Tournament!</font></b></u>","MainMapPan.Training Box")
				if(BabaTeamOne.Find(usr))
					BabaTeamOne.Remove(usr)
					babafirst=0
					BabaOneTeam-=1
					BabaOne=0
					return
				if(BabaTeamTwo.Find(usr))
					BabaTeamTwo.Remove(usr)
					babasecond=0
					BabaTwoTeam-=1
					BabaOne=1
					return
proc
	BabaKILLTOURNY()
		for(var/mob/PC/M in world)
			M.verbs -= new/mob/BabaTournament/verb/Enter_Tournament()
			M.verbs -= new/mob/BabaTournament/verb/Leave_Tournament()
			M.wait_room=0
			if(M.babatourny)
				M.babatourny = 0
				M.babafirst=0
				M.babasecond=0
				M.safe=0
				M.loc = locate(167,194,1)
		BabaEntries=list()
		BabaWinners=list()
		BabaLosers=list()
		BabaTeamTwo=list()
		BabaTeamOne=list()
		BabaOne=0
		BabaOneTeam=0
		BabaTwoTeam=0
		babatournament=0
		babastarted=0
		spawn(70)AutoRevive()
proc
	AutoStartBabaTourney()
		if(babatournament)return
		else
			BabaTeamTwo=list()
			BabaTeamOne=list()
			BabaLosers=list()
			world<<"<center><font face ='Palatino Linotype'  size=3><font color='Green'><b><center>Tournament : Baba Tournament!<br>Time to enter: You have 2 minutes.<br><font face ='Palatino Linotype'  size = 1>How to join : To join, please go to Channels tab and select Enter Baba Tournament."
			babatournament=1
			for(var/mob/PC/M in world)
				M.verbs+=new/mob/BabaTournament/verb/Enter_Tournament()
				M.verbs+=new/mob/BabaTournament/verb/Leave_Tournament()
			spawn(70)AutoRevive()
			spawn(1200)AutoStopBabaTourney()
	AutoStopBabaTourney()
		if(babatournament)
			usr<<output("<center><font face ='Palatino Linotype'  size=3><font color='White'><b><center>Time-Up for Entry of Baba Tournament.","MainMapPan.Training Box")
			usr<<output("<font face ='Palatino Linotype'  size=1><font color='Green'><b>Following are the participants:","MainMapPan.Training Box")
			usr<<output("<font face ='Palatino Linotype'  size=1><font color='red'><b>The Red Team:","MainMapPan.Training Box")
			for(var/mob/PC/M in BabaTeamOne)world<<"[M]"
			usr<<output("<font face ='Palatino Linotype'  size=1><font color='#143806'><b>The Blue Team:","MainMapPan.Training Box")
			for(var/mob/PC/M in BabaTeamTwo)world<<"[M]"
			for(var/mob/M in world)
				M.verbs-=new/mob/BabaTournament/verb/Enter_Tournament()
				M.verbs-=new/mob/BabaTournament/verb/Leave_Tournament()
			if(BabaOneTeam<2||BabaTwoTeam<2)
				usr<<output("<center><font face ='Palatino Linotype'  size=3>Baba Tournament canacelled! Reason - Not enough players!.","MainMapPan.Training Box")
				BabaKILLTOURNY()
				return
			Baba_Tournament_AI()
proc
	Baba_Tournament_AI()
		babastarted=1
		if(BabaTeamOne.len<1&&BabaTeamTwo.len<1)
			usr<<output("<center><font face ='Palatino Linotype'  size=3>Baba Tournament finished, all contestants have left...","MainMapPan.Training Box")
			BabaKILLTOURNY()
			return
		if(BabaTeamOne.len<1&&BabaTeamTwo.len>=1)
			usr<<output("<center><font face ='Palatino Linotype'  size=3>Winner of Baba Tournament is: <font color='#143806'>Blue Team</font>!","MainMapPan.Training Box")
			for(var/mob/PC/M in world)
				if(M.babasecond)
					spawn(1)
						var/amount=500
						amount=5000*tournyhostgain
						while(amount>0)
							if(!M)return
							M.exp=M.tnl
							M.Level_Up()
							amount--
							sleep(0.155)
					M.loc=locate(167,194,1)
					if(BabaLosers.Find(M))BabaLosers.Remove(M)
					spawn(3)if(M)M.SafeTimer()
			for(var/mob/PC/C in BabaLosers)
				var/amount=500
				amount=2500*tournyhostgain
				C.tp+=50000000
				C<<"<font color= '#0099FF'>Participating Reward: You've been granted [amount] levels for just participating the Baba Tournament, [C]!"
				BabaLosers.Remove(C)
				spawn(70)if(C)
					while(amount>0)
						if(!C)return
						C.exp=C.tnl
						C.Level_Up()
						amount-=1
						sleep(0.155)
			BabaKILLTOURNY()
			return
		if(BabaTeamOne.len>=1&&BabaTeamTwo.len<1)
			usr<<output("<center><font face ='Palatino Linotype'  size=3>Winner of Baba Tournament is: <font color='Red'>Red Team</font>!","MainMapPan.Training Box")
			for(var/mob/PC/M in world)
				if(M.babafirst)
					M.loc=locate(167,194,1)
					if(BabaLosers.Find(M))BabaLosers.Remove(M)
					spawn(3)if(M)M.SafeTimer()
					var/amount=1000
					amount=5000
					M.tp+=100000000
					spawn(70)if(M)
						while(amount>0)
							if(!M)return
							M.exp=M.tnl
							M.Level_Up()
							amount-=1
			for(var/mob/PC/C in BabaLosers)
				var/amount=500
				amount=2500*tournyhostgain
				C.tp+=50000000
				C<<"<font color= '#0099FF'>Participating Reward: You've been granted [amount] levels for just participating the Baba Tournament, [C]!"
				BabaLosers.Remove(C)
				spawn(70)if(C)
					while(amount>0)
						if(!C)return
						C.exp=C.tnl
						C.Level_Up()
						amount-=1
						sleep(0.155)
			BabaKILLTOURNY()
			return
		if(BabaTeamOne.len>=1&&BabaTeamTwo.len>=1)
			BabaFixEntries()
			if(babamatch)return
			usr<<output("<center><font face ='Palatino Linotype'  size=3>Tournament : Battle Starting","MainMapPan.Training Box")
			usr<<output("<center><font face ='Palatino Linotype'  size=3>Tournament : Next up is...","MainMapPan.Training Box")
			BabaMatches()
	BabaFixEntries()
		for(var/mob/PC/M in BabaTeamOne)if(M.dead)BabaTeamOne.Remove(M)
		for(var/mob/PC/M in BabaTeamTwo)if(M.dead)BabaTeamTwo.Remove(M)
		var/list/Cop=list()
		var/list/Cop2=list()
		for(var/mob/PC/A in BabaTeamOne)
			var/good=1
			if(A&&ismob(A)&&A.client&&A.z==6)
				for(var/mob/B in Cop)
					if(A==B)good=0
				if(good)Cop+=A
				else
		for(var/mob/PC/B in BabaTeamTwo)
			var/good=1
			if(B&&ismob(B)&&B.client&&B.z==6)
				for(var/mob/C in Cop2)
					if(B==C)good=0
				if(good)Cop2+=B
				else
		BabaTeamOne=Cop
		BabaTeamTwo=Cop2
	BabaMatches()
		BabaFixEntries()
		var/chance=rand(1,2)
		var/mob/A=BabaTeamOne[1]
		var/mob/B=BabaTeamTwo[1]
		if(BabaTeamOne.len>=2)
			if(chance==1)A=BabaTeamOne[1]
			if(chance==2)A=BabaTeamOne[2]
		if(BabaTeamTwo.len>=2)
			if(chance==1)B=BabaTeamTwo[1]
			if(chance==2)B=BabaTeamTwo[2]
		if(!A||!B||A==B||A.z!=6||B.z!=6)
			BabaMatches()
			return
		babamatch=1
		if(!(A&&B))
			babamatch=0
			Baba_Tournament_AI()
			return
		usr<<output("<center><font face ='Palatino Linotype'  size=3>Tournament : [A] V.S. [B]!","MainMapPan.Training Box")
		usr<<output("<center><font face ='Palatino Linotype'  size=3>Tournament : You have 3 seconds to prepare yourselves!","MainMapPan.Training Box")
		usr<<output("<center><font face ='Palatino Linotype'  size=3>Tournament : 3!","MainMapPan.Training Box")
		sleep(10)
		usr<<output("<center><font face ='Palatino Linotype'  size=3>Tournament : 2!","MainMapPan.Training Box")
		sleep(10)
		usr<<output("<center><font face ='Palatino Linotype'  size=3>Tournament : 1!","MainMapPan.Training Box")
		sleep(10)
		if(!A||A.z!=6||A.dead)
			usr<<output("<center><font face ='Palatino Linotype'  size=3>[B] from <font color='#143806'>Blue Team</font> has won their round because their opponent has left!","MainMapPan.Training Box")
			BabaOneTeam--
			if(A)
				if(!BabaLosers.Find(A))BabaLosers.Add(A)
				BabaTeamTwo.Remove(A)
				A.babatourny=0
			babamatch=0
			Baba_Tournament_AI()
			return
		if(!B||B.z!=6||B.dead)
			usr<<output("<center><font face ='Palatino Linotype'  size=3>[A] from <font color='Green'>Red Team</font> has won their round because their opponent has left!","MainMapPan.Training Box")
			BabaTwoTeam--
			if(B)
				if(!BabaLosers.Find(B))BabaLosers.Add(B)
				BabaTeamOne.Remove(B)
				B.babatourny=0
			babamatch=0
			Baba_Tournament_AI()
			return
		usr<<output("<center><font face ='Palatino Linotype'  size=3>Tournament : FIGHT!","MainMapPan.Training Box")
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
		BabaFight(A,B)
		BabaFixEntries()
		babamatch=0
		Baba_Tournament_AI()
proc
	BabaFight(mob/A,mob/B)
		while(1)
			if(!B||B.z!=6||B.dead)
				if(!B)usr<<output("<center><font face ='Palatino Linotype'  size=3>[A] from <font color='Green'>Red Team</font> has won their round because their opponent has left!","MainMapPan.Training Box")
				else
					usr<<output("<center><font face ='Palatino Linotype'  size=3>[A] has eliminated [B]!","MainMapPan.Training Box")
					B.wait_room=0
					BabaTeamTwo.Remove(B)
					B.babatourny=0
					if(!BabaLosers.Find(B))BabaLosers.Add(B)
				if(!A.dead)
					BabaWinners.Add(A)
					A.safe=1
					A.wait_room=1
					A.loc=locate(154,111,6)
				BabaTwoTeam--
				BabaEntries.Remove(A)
				return
			if(!A||A.z!=6||A.dead)
				if(!A)usr<<output("<center><font face ='Palatino Linotype'  size=3>[B] from <font color='#143806'>Blue Team</font> has won their round because their opponent has left!","MainMapPan.Training Box")
				else
					usr<<output("<center><font face ='Palatino Linotype'  size=3>[B] has eliminated [A]!","MainMapPan.Training Box")
					BabaTeamOne.Remove(A)
					A.babatourny=0
					if(!BabaLosers.Find(A))BabaLosers.Add(A)
					A.wait_room=0
				if(!B.dead)
					BabaWinners.Add(B)
					B.safe=1
					B.loc=locate(154,111,6)
					B.wait_room=1
				BabaOneTeam--
				BabaEntries.Remove(B)
				return
			else sleep(10)
