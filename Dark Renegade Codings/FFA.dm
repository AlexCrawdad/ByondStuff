var/ffatournament=0
var/ffatournament_started=0
var/list/FFAEntries=list()
var/list/FFAWinners=list()
var/list/FFALosers=list()
mob/var/ffatourny=0
var/ffastarted=0
mob/Tournament
	verb
		FFAEnter_Tournament()
			set category="Channels";set name="Enter Tournament"
			if(spamming_enter)return
			spamming_enter=1
			spawn(50)if(usr)spamming_enter=0
			if(dead)
				usr<<"\red You are dead!</font>"
				return
			if(fused)
				usr<<"\red You are fused!</font>"
				return
			for(var/obj/O in usr)
				if(O.dball)
					usr<<"You cannot enter the tournament with the dragonballs!"
					return
			if(buku_lock||in_hbtc||challenge||guild_challenge||grav_trainer||in_war)
				usr<<"\red You're doing something that tournament doesn't allow!</font>"
				return
			if(jailed)
				usr<<"\red You are in jail!</font>"
				return
			if(!pk)
				usr<<"You are not a combatant, train more!"
				return
/*			for(var/mob/PC/M in world)
				if(M!=usr)
					if(M.client)
						if(M.client.address==client.address)
							if(M.ffatourny&&!M.canMK)
								usr<<"Your other character is already in tournament!"
								return*/
			if(ffastarted)
				usr<<"<font color=white>The tournament has already started!</font>"
				return
			if(!ffatournament)
				usr<<"<font color=white>Tournament isn't open yet.</font>"
				return
			if(ffatourny)
				usr<<"<font color=white><b><u>You're already in the tournament!</font></b></u>"
				return
			if(z!=4&&z!=3&&z!=2&&z!=1)
				usr<<"You're not in right place!"
				return
			var/checkcount=0
			checkcount=0
			for(var/mob/PC/M in world)if(M.ffatourny)checkcount++
			if(checkcount>=10)
				usr<<"FFA tournament is full!"
				return
			else
				wait_room=1
				CustomFadeScreen()
				sleep(20)
				if(!usr)return
				if(ffastarted)
					wait_room=0
					return
				checkcount=0
				for(var/mob/PC/M in world)if(M.ffatourny)checkcount++
				if(checkcount>=10)
					wait_room=0
					usr<<"FFA tournament is full!"
					return
				if(!ffatournament)
					usr<<"<font color=white>Tournament isn't open yet.</font>"
					wait_room=0
					return
				loc=locate(154,111,6)
				spawn(20)if(usr&&ffatourny)
					loc=locate(154,111,6)
				FFAEntries.Add(usr)
				ffatourny=1
				insafezone=0
				szactivated=0
				traintimer=0
				tourny_afk_timer=0
				safe=1
				temptraintimer=0
				world<<"<font color=white><b><u>[usr] has joined the FFA Tournament!</font></b></u>"
				var/count=0
				count=0
				for(var/mob/PC/M in world)if(M.ffatourny)count++
				world<<"<font color=white><b><u>FFA Tournament spots remaining: [round(10-count)]</font></b></u>"
		FFALeave_Tournament()
			set category="Channels"
			set name="Leave Tournament"
			if(spamming_enter)return
			spamming_enter=1
			spawn(50)if(usr)spamming_enter=0
			if(!ffatournament)
				usr<<"<font color=white>Tournament isn't open yet.</font>"
				return
			if(ffastarted)
				usr<<"<font color=white>The tournament has already started!</font>"
				return
			if(!ffatourny)
				usr<<"<font color=white><b><u>You're not in the tournament!</font></b></u>"
				return
			else
				wait_room=0
				CustomFadeScreen()
				sleep(20)
				if(!usr)return
				if(ffastarted)
					wait_room=1
					return
				loc=locate(167,194,1)
				SafeTimer()
				ffatourny=0
				tourny_afk_timer=0
				safe=0
				FFAEntries.Remove(usr)
				world<<"<font color=white><b><u>[usr] has left the FFA Tournament!</font></b></u>"
				verbs-=new/mob/Tournament/verb/FFAEnter_Tournament()
				verbs-=new/mob/Tournament/verb/FFALeave_Tournament()
				var/count=0
				count=0
				for(var/mob/PC/M in world)if(M.ffatourny)count++
				world<<"<font color=white><b><u>FFA Tournament spots remaining: [round(10-count)]</font></b></u>"
proc
	FFAPrize(var/mob/PC/M in Winners)
		world<<"Tournament News: [M] has won the FFA Tournament and will get some levels!"
		started=0
		spawn(1)
			var/amount=500
			amount=7000*tournyhostgain
			while(amount>0)
				if(!M)return
				M.exp=M.tnl
				M.Level_Up()
				amount--
				sleep(0.155)
		M.loc=locate(167,194,1)
		M.wait_room=0
		M.SafeTimer()
		for(var/mob/PC/C in FFALosers)
			var/amount=250
			amount=3500*tournyhostgain
			C<<"<font color=gray>Loser reward: You've been granted [amount] levels for just participating in the FFA Tournament, [C]!</font>"
			FFALosers.Remove(C)
			spawn(70)if(C)
				while(amount>0)
					if(!C)return
					C.exp=C.tnl
					C.Level_Up()
					amount--
					sleep(0.155)
proc
	FFAKILLTOURNY()
		for(var/mob/PC/M in world)
			M.verbs-=new/mob/Tournament/verb/FFAEnter_Tournament()
			M.verbs-=new/mob/Tournament/verb/FFALeave_Tournament()
			M.wait_room=0
			if(M&&M.loggedin&&!M.challenge)for(var/obj/hudNumbers/N in M.client.screen)if(N)del(N)
			if(M.ffatourny)
				M.ffatourny=0
				M.safe=0
				M.loc=locate(167,194,1)
				M.SafeTimer()
				for(var/obj/hudNumbers/N in M.client.screen)del(N)
		FFALosers=list()
		FFAEntries=list()
		FFAWinners=list()
		ffatournament=0
		ffastarted=0
		spawn(70)AutoRevive()
proc
	FFAAutoStartTourney()
		if(ffatournament)return
		else
			FFAEntries=list()
			FFAWinners=list()
			FFALosers=list()
			world<<"<center><font size=3 color=red><b>The FFA Tournament has begun! You have 2 minutes to enter.</b></font><br><font size=1>To join, please go to Channels tab and select Enter Tournament.</font></center>"
			ffatournament=1
			for(var/mob/PC/M in world)
				M.verbs+=new/mob/Tournament/verb/FFAEnter_Tournament()
				M.verbs+=new/mob/Tournament/verb/FFALeave_Tournament()
			spawn(70)AutoRevive()
			spawn(1200)FFAAutoStopTourney()
	FFAAutoStopTourney()
		if(ffatournament)
			world<<"<center><font size=3 color=red><b>The tournament entry has now ended.</b></font></center>"
			world<<"<font size=1><font color=red><b>The following people are in the tournament:"
			for(var/mob/PC/M in world)
				if(M.ffatourny)world<<"[M]"
				M.verbs-=new/mob/Tournament/verb/FFAEnter_Tournament()
				M.verbs-=new/mob/Tournament/verb/FFALeave_Tournament()
			if(FFAEntries.len<=1&&FFAWinners.len<1)
				world<<"<center><font size=3 color=#5f9ea0>Not enough players, FFA Tournament cancelled.</font></center>"
				for(var/mob/PC/C in world)
					if(FFAEntries.Find(C))
						var/amount=250
						amount=3500*tournyhostgain
						C<<"<font color=gray>Loser reward: You've been granted [amount] levels for just participating in the FFA Tournament, [C]!</font>"
						FFAEntries.Remove(C)
						spawn(70)if(C)
							while(amount>0)
								if(!C)return
								C.exp=C.tnl
								C.Level_Up()
								amount--
								sleep(0.155)
				FFAKILLTOURNY()
				return
			FFATournament_AI()
proc
	FFATournament_AI()
		ffastarted=1
		for(var/mob/PC/C in world)if(C.ffatourny)for(var/obj/hudNumbers/N in C.client.screen)del(N)
		var/count=0
		for(var/mob/PC/C in world)if(C.ffatourny)
			count++
			new/obj/hudNumbers(C.client)
		for(var/mob/PC/C in world)if(C.ffatourny)for(var/obj/hudNumbers/o in C.client.screen)o.icon_state="[count]"
		if(FFALosers.len>0&&FFAWinners.len<1&&FFAEntries.len<1)
			for(var/mob/PC/C in FFALosers)
				var/amount=250
				amount=3500*tournyhostgain
				C<<"<font color=gray>Loser reward: You've been granted [amount] levels for just participating in the Junior Tournament, [C]!</font>"
				FFALosers.Remove(C)
				spawn(70)if(C)
					while(amount>0)
						if(!C)return
						C.exp=C.tnl
						C.Level_Up()
						amount--
						sleep(0.155)
		if(FFAEntries.len<1&&FFAWinners.len<1)
			world<<"<center><font size=3 color=#5f9ea0>Tournament over, all contestants have left...</font></center>"
			FFAKILLTOURNY()
			return
		if(FFAEntries.len<1&&FFAWinners.len==1)
			ffatournament=0
			world<<"<center><font size=3 color=#5f9ea0>Tournament over, winner is:</font></center>"
			for(var/mob/PC/M in FFAWinners)
				world<<M
				FFAPrize(M)
			FFAKILLTOURNY()
			return
		if(!FFAEntries||FFAEntries.len<2)
			FFATournament_AI()
			return
		for(var/mob/NPC/M in world)if(M.name=="{NPC}Tournament Announcer")
			M.icon_state="announcing"
			spawn(40)if(M)M.icon_state="idle"
		world<<"<center><font size=3 color=#5f9ea0>Tournament Announcer: Are you ready for battle?</font></center>"
		world<<"<center><font size=3 color=#5f9ea0>Tournament Announcer: Get ready to fight...</font></center>"
		world<<"<center><font size=3 color=#5f9ea0>Tournament Announcer: 3...</font></center>"
		sleep(10)
		world<<"<center><font size=3 color=#5f9ea0>Tournament Announcer: 2...</font></center>"
		sleep(10)
		world<<"<center><font size=3 color=#5f9ea0>Tournament Announcer: 1...</font></center>"
		sleep(10)
		world<<"<center><font size=3 color=#5f9ea0>Tournament Announcer: FIGHT!</font></center>"
		for(var/mob/PC/C in world)if(C.ffatourny)
			C.safe=0
			C.wait_room=0
			C.loc=locate(rand(147,163),rand(70,62),6)
			spawn(1)if(C)C.loc=locate(rand(147,163),rand(70,62),6)
			C.tourny_afk_timer=0
		FFAFight()
	FFAFight()
		while(1)
			for(var/mob/PC/M in world)if(M.ffatourny)
				M.safe=0
				if(!M.KO)M.tourny_afk_timer++
			for(var/mob/PC/M in world)if(M&&!M.KO&&M.ffatourny&&M.tourny_afk_timer>40&&M.tourny_afk_timer<45)M<<"<font color=red>You have [45-M.tourny_afk_timer] seconds left before getting booted for being afk!</font>"
			for(var/mob/PC/M in world)if(M&&M.ffatourny&&M.tourny_afk_timer>45)
				world<<"<center><font size=3 color=#5f9ea0>[M] has been eliminated due to being afk!</font></center>"
				M.tourny_afk_timer=0
				M.wait_room=0
				FFAEntries.Remove(M)
				M.ffatourny=0
				if(FFALosers.Find(M))FFALosers.Remove(M)
				for(var/obj/hudNumbers/N in M.client.screen)del(N)
				M.loc=locate(167,194,1)
				M.SafeTimer()
			for(var/mob/PC/M in world)if(M.ffatourny)
				if(!M||M.z!=6||M.dead)
					M.wait_room=0
					FFAEntries.Remove(M)
					M.ffatourny=0
					if(!FFALosers.Find(M))FFALosers.Add(M)
			for(var/mob/PC/C in world)if(C.ffatourny)for(var/obj/hudNumbers/N in C.client.screen)del(N)
			var/count=0
			count=0
			for(var/mob/PC/M in world)if(M.ffatourny)
				count++
				new/obj/hudNumbers(M.client)
			for(var/mob/PC/M in world)if(M.ffatourny)for(var/obj/hudNumbers/o in M.client.screen)o.icon_state="[count]"
			if(count<1)
				world<<"<center><font size=3 color=#5f9ea0>Tournament over, all contestants have left...</font></center>"
				for(var/mob/PC/C in FFALosers)
					var/amount=250
					amount=3500*tournyhostgain
					C<<"<font color=gray>Loser reward: You've been granted [amount] levels for just participating in the FFA Tournament, [C]!</font>"
					FFALosers.Remove(C)
					spawn(70)if(C)
						while(amount>0)
							if(!C)return
							C.exp=C.tnl
							C.Level_Up()
							amount--
							sleep(0.155)
				FFAKILLTOURNY()
				return
			if(count==1)
				world<<"<center><font size=3 color=#5f9ea0>Tournament over, winner is:</font></center>"
				for(var/mob/PC/M in FFAEntries)
					world<<M
					FFAPrize(M)
				FFAKILLTOURNY()
				return
			sleep(10)