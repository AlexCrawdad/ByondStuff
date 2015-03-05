var/hunter_event=0
var/hunter_event_timer=0
var/hunter_event_temp_timer=0
var/hunter_event_started=0
mob/var/tmp/hunting=0
mob/var/tmp/hunted=0
var/list/HunterEntries=list()
proc
	HunterAutoStart()
		world<<"<font color=gray><u>[servername]:</u><font color=red> The Hunter Event is now active!</font></font>"
		hunter_event=1
		hunter_event_started=0
		hunter_event_temp_timer=0
		for(var/mob/PC/M in world)if(M&&M.loggedin)
			M.verbs+=new/mob/Hunter/verb/Enter_Tournament()
			M.verbs+=new/mob/Hunter/verb/Leave_Tournament()
		spawn(70)AutoRevive()
		spawn(1200)if(hunter_event)HunterAutoStop()
	HunterAutoStop()
		for(var/mob/PC/M in world)if(M&&M.loggedin)
			M.verbs-=new/mob/Hunter/verb/Enter_Tournament()
			M.verbs-=new/mob/Hunter/verb/Leave_Tournament()
		if(HunterEntries.len<=1)
			world<<"<font color=gray><u>[servername]:</u><font color=red> The Hunter Event has been cancelled!</font></font>"
			KILLHUNTER()
			return
		world<<"<font color=gray><u>[servername]:</u><font color=red> The Hunter Event has begun!</font></font>"
		Hunter_AI()
	Hunter_AI()
		hunter_event_started=1
		for(var/mob/PC/M in world)if(M.hunting)M<<"<font color=gray><u>[servername]:</u><font color=red> The player will be automatically picked at random to be the hunted!</font></font>"
		var/mob/PC/A=pick(HunterEntries)
		for(var/mob/PC/M in world)if(M.hunting)M<<"<font color=gray><u>[servername]:</u><font color=red> [A] is the player to be hunted!</font></font>"
		A.hunted=1
		for(var/mob/PC/M in world)if(M.hunting&&M!=A)M.loc=locate(260,288,1)
		for(var/mob/PC/M in world)if(M.hunting&&M==A)M.loc=locate(92,74,1)
		for(var/mob/PC/M in world)if(M.hunting)
			M<<"<font color=gray><u>[servername]:</u><font color=red> Let's the hunting commence!</font></font>";M.ITCHECK()
		spawn(10)Hunter_Timer()
	Hunter_Timer()
		hunter_event_temp_timer=0
		while(hunter_event)
			sleep(600)
			hunter_event_temp_timer++
			if(hunter_event_temp_timer>=10)
				spawn(300)if(hunter_event)for(var/mob/PC/M in world)if(M.hunting)M<<"<font color=gray><u>[servername]:</u><font color=red> The Hunter Event has expired!</font></font>"
				for(var/mob/PC/M in world)if(M.hunting&&!M.hunted)
					M<<"<font color=gray><u>[servername]:</u><font color=red> Since [src] haven't been caught, you get bonus of 4,000 tps!</font></font>"
					M.tp+=4000
				for(var/mob/PC/M in world)if(M.hunting&&M.hunted)
					M<<"<font color=gray><u>[servername]:</u><font color=red> Since you haven't been caught, you get bonus of 5,000 tps!</font></font>"
					M.tp+=5000
				KILLHUNTER()
				break
	KILLHUNTER()
		for(var/mob/PC/M in world)
			M.verbs-=new/mob/Hunter/verb/Enter_Tournament()
			M.verbs-=new/mob/Hunter/verb/Leave_Tournament()
			M.wait_room=0
			if(M&&M.loggedin&&!M.challenge)for(var/obj/hudNumbers/N in M.client.screen)if(N)del(N)
			if(M.hunting)
				M.hunted=0
				M.hunting=0
				M.safe=0
				M.loc=locate(167,194,1)
				M.SafeTimer()
				for(var/obj/hudNumbers/N in M.client.screen)del(N)
		HunterEntries=list()
		hunter_event=0
		hunter_event_started=0
		hunter_event_temp_timer=0
		spawn(70)AutoRevive()
mob/Hunter
	verb
		Enter_Tournament()
			set category="Channels"
			set name="Enter Hunter Event"
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
					usr<<"You cannot enter the Hunter Event with the dragonballs!"
					return
			if(buku_lock||in_hbtc||challenge||guild_challenge||grav_trainer||in_war)
				usr<<"\red You're doing something that Hunter Event doesn't allow!</font>"
				return
			if(jailed)
				usr<<"\red You are in jail!</font>"
				return
			if(!pk)
				usr<<"You are not a combatant, train more!"
				return
			for(var/mob/PC/M in world)
				if(M!=usr)
					if(M.client)
						if(M.client.address==client.address)
							if(M.hunting&&!M.canMK)
								usr<<"Your other character is already in Hunter Event!"
								return
			if(hunter_event_started)
				usr<<"<font color=white>The Hunter Event has already started!</font></b></u>"
				return
			if(!hunter_event)
				usr<<"<font color=white>Hunter Event isn't open yet.</font>"
				return
			if(hunting)
				usr<<"<font color=white><b><u>You're already in the Hunter Event!</font></b></u>"
				return
			if(z!=4&&z!=3&&z!=2&&z!=1)
				usr<<"You're not in right place!"
				return
			var/checkcount=0
			checkcount=0
			for(var/mob/PC/M in world)if(M.hunting)checkcount++
			if(checkcount>=10)
				usr<<"Hunter Event is full!"
				return
			else
				wait_room=1
				CustomFadeScreen()
				sleep(20)
				if(!usr)return
				if(hunter_event_started)
					wait_room=0
					return
				checkcount=0
				for(var/mob/PC/M in world)if(M.hunting)checkcount++
				if(checkcount>=10)
					usr<<"Hunter Event is full!"
					wait_room=0
					return
				for(var/mob/PC/M in world)
					if(M!=usr)
						if(M.client)
							if(M.client.address==client.address)
								if(M.horde&&!M.canMK)
									usr<<"Your other character is already in Horde Event!"
									wait_room=0
									return
				if(!hunter_event)
					usr<<"<font color=white>Hunter Event isn't open yet.</font>"
					wait_room=0
					return
				loc=locate(154,111,6)
				spawn(20)if(usr&&hunting)
					loc=locate(154,111,6)
				HunterEntries.Add(usr)
				hunting=1
				insafezone=0
				tourny_afk_timer=0
				szactivated=0
				traintimer=0
				safe=1
				temptraintimer=0
				world<<"<font color=white><b><u>[usr] has joined the Hunter Event!</font></b></u>"
				var/count=0
				count=0
				for(var/mob/PC/M in world)if(M.hunting)count++
				world<<"<font color=white><b><u>Hunter Event spots remaining: [round(10-count)]</font></b></u>"
		Leave_Tournament()
			set category="Channels"
			set name="Leave Hunter Event"
			if(spamming_enter)return
			spamming_enter=1
			spawn(50)if(usr)spamming_enter=0
			if(!hunter_event)
				usr<<"<font color=white>Horde Event isn't open yet."
				return
			if(hunter_event_started)
				usr<<"<font color=white>The Horde Event has already started!</font></b></u>"
				return
			if(!hunting)
				usr<<"<font color=white><b><u>You're not in the Horde Event!</font></b></u>"
				return
			else
				wait_room=0
				CustomFadeScreen()
				sleep(20)
				if(!usr)return
				if(horde_event_started)
					wait_room=1
					return
				loc=locate(167,194,1)
				SafeTimer()
				hunting=0
				tourny_afk_timer=0
				safe=0
				HunterEntries.Remove(usr)
				world<<"<font color=white><b><u>[usr] has left the Hunter Event!</font></b></u>"
				verbs-=new/mob/Hunter/verb/Enter_Tournament()
				verbs-=new/mob/Hunter/verb/Leave_Tournament()
				var/count=0
				count=0
				for(var/mob/PC/M in world)if(M.hunting)count++
				world<<"<font color=white><b><u>Hunter Event spots remaining: [round(10-count)]</font></b></u>"
var/event_on=0
var/event_exp_on=0
var/event_timer=0
var/event_temp_timer=0
world/proc/EventCycle()
	set background=1
	event_on=0
	event_exp_on=0
	event_temp_timer=0
	while(1)
		sleep(600)
		if(!event_on)event_timer++
		if(event_timer>=33&&!event_on)
			event_on=1
			event_exp_on=1
			event_temp_timer=0
			event_timer=0
			world<<"<font color=gray><u>[servername]:</u> The Experience Event has been activated for an hour! You will gain an extra 50% experience.</font>"
		if(event_on)event_temp_timer++
		if(event_on&&event_temp_timer>=60)
			event_temp_timer=0
			event_timer=0
			event_on=0
			event_exp_on=0
			world<<"<font color=gray><u>[servername]:</u> The Experience Event has been de-activated!</font>"
	return
var/TPevent_on=0
var/TPevent_exp_on=0
var/TPevent_timer=0
var/TPevent_temp_timer=0
world/proc/TPEventCycle()
	set background=1
	TPevent_on=0
	TPevent_exp_on=0
	TPevent_temp_timer=0
	while(1)
		sleep(600)
		if(!TPevent_on)TPevent_timer++
		if(TPevent_timer>=31&&!TPevent_on)
			TPevent_on=1
			TPevent_exp_on=1
			TPevent_temp_timer=0
			TPevent_timer=0
			world<<"<font color=gray><u>[servername]:</u> The TP Event has been activated for a half-hour! You will gain an extra 50% training points.</font>"
		if(TPevent_on)TPevent_temp_timer++
		if(TPevent_on&&TPevent_temp_timer>=30)
			TPevent_temp_timer=0
			TPevent_timer=0
			TPevent_on=0
			TPevent_exp_on=0
			world<<"<font color=gray><u>[servername]:</u> The TP Event has been de-activated!</font>"
	return
var/Customevent_on=0
var/Customevent_timer=0
var/Customevent_temp_timer=0
world/proc/CustomEventCycle()
	set background=1
	Customevent_on=0
	Customevent_temp_timer=0
	while(1)
		sleep(600)
		if(!Customevent_on)Customevent_timer++
		if(Customevent_timer>=100&&!Customevent_on)
			Customevent_on=1
			Customevent_temp_timer=0
			Customevent_timer=0
			world<<"<font color=gray><u>[servername]:</u> The Custom Event has been activated for a half-hour! You will be limited to using custom techniques only.</font>"
		if(Customevent_on)Customevent_temp_timer++
		if(Customevent_on&&Customevent_temp_timer>=30)
			Customevent_temp_timer=0
			Customevent_timer=0
			Customevent_on=0
			world<<"<font color=gray><u>[servername]:</u> The Custom Event has been de-activated!</font>"
	return
var/zenni_event_on=0
var/zenni_event_timer=0
var/zenni_event_temp_timer=0
var/tmp/zenni_event_count=0
world/proc/Zenni_Event_Cycle()
	set background=1
	zenni_event_on=0
	zenni_event_temp_timer=0
	while(1)
		sleep(600)
		if(!zenni_event_on)zenni_event_timer++
		if(zenni_event_timer>=28&&!zenni_event_on)
			zenni_event_on=1
			zenni_event_temp_timer=0
			zenni_event_timer=0
			world<<"<font color=gray><u>[servername]:</u> The Zenni Event has been activated for a half-hour! Get rich by doing this event!</font>"
			var/db1=0
			var/db2=0
			var/db3=0
			var/db4=0
			var/db5=0
			var/db6=0
			var/db7=0
			var/db8=0
			var/db9=0
			var/db10=0
			var/db11=0
			var/db12=0
			var/db13=0
			var/db14=0
			var/db15=0
			var/db16=0
			var/db17=0
			var/db18=0
			var/db19=0
			var/db20=0
			spawn(1)
				while(!db1)
					var/turf/T=locate(rand(1,400),rand(1,400),1)
					if(T.dbable)
						new/obj/event_zeniebag(T)
						db1=1
						break
				while(!db2)
					var/turf/T=locate(rand(1,400),rand(1,400),1)
					if(T.dbable)
						new/obj/event_zeniebag(T)
						db2=1
						break
				while(!db3)
					var/turf/T=locate(rand(1,400),rand(1,400),1)
					if(T.dbable)
						new/obj/event_zeniebag(T)
						db3=1
						break
				while(!db4)
					var/turf/T=locate(rand(1,400),rand(1,400),1)
					if(T.dbable)
						new/obj/event_zeniebag(T)
						db4=1
						break
				while(!db5)
					var/turf/T=locate(rand(1,400),rand(1,400),1)
					if(T.dbable)
						new/obj/event_zeniebag(T)
						db5=1
						break
				while(!db6)
					var/turf/T=locate(rand(1,400),rand(1,400),2)
					if(T.dbable)
						new/obj/event_zeniebag(T)
						db6=1
						break
				while(!db7)
					var/turf/T=locate(rand(1,400),rand(1,400),2)
					if(T.dbable)
						new/obj/event_zeniebag(T)
						db7=1
						break
				while(!db8)
					var/turf/T=locate(rand(1,400),rand(1,400),2)
					if(T.dbable)
						new/obj/event_zeniebag(T)
						db8=1
						break
				while(!db9)
					var/turf/T=locate(rand(1,400),rand(1,400),2)
					if(T.dbable)
						new/obj/event_zeniebag(T)
						db9=1
						break
				while(!db10)
					var/turf/T=locate(rand(1,400),rand(1,400),2)
					if(T.dbable)
						new/obj/event_zeniebag(T)
						db10=1
						break
				while(!db11)
					var/turf/T=locate(rand(1,400),rand(1,400),3)
					if(T.dbable)
						new/obj/event_zeniebag(T)
						db11=1
						break
				while(!db12)
					var/turf/T=locate(rand(1,400),rand(1,400),3)
					if(T.dbable)
						new/obj/event_zeniebag(T)
						db12=1
						break
				while(!db13)
					var/turf/T=locate(rand(1,400),rand(1,400),3)
					if(T.dbable)
						new/obj/event_zeniebag(T)
						db13=1
						break
				while(!db14)
					var/turf/T=locate(rand(1,400),rand(1,400),3)
					if(T.dbable)
						new/obj/event_zeniebag(T)
						db14=1
						break
				while(!db15)
					var/turf/T=locate(rand(1,400),rand(1,400),3)
					if(T.dbable)
						new/obj/event_zeniebag(T)
						db15=1
						break
				while(!db16)
					var/turf/T=locate(rand(1,400),rand(1,400),4)
					if(T.dbable)
						new/obj/event_zeniebag(T)
						db16=1
						break
				while(!db17)
					var/turf/T=locate(rand(1,400),rand(1,400),4)
					if(T.dbable)
						new/obj/event_zeniebag(T)
						db17=1
						break
				while(!db18)
					var/turf/T=locate(rand(1,400),rand(1,400),4)
					if(T.dbable)
						new/obj/event_zeniebag(T)
						db18=1
						break
				while(!db19)
					var/turf/T=locate(rand(1,400),rand(1,400),4)
					if(T.dbable)
						new/obj/event_zeniebag(T)
						db19=1
						break
				while(!db20)
					var/turf/T=locate(rand(1,400),rand(1,400),4)
					if(T.dbable)
						new/obj/event_zeniebag(T)
						db20=1
						break
				zenni_event_count=20
		if(zenni_event_on)zenni_event_temp_timer++
		if(zenni_event_on&&zenni_event_temp_timer>=30)
			zenni_event_on=0
			zenni_event_temp_timer=0
			zenni_event_timer=0
			world<<"<font color=gray><u>[servername]:</u> The Zenni Event has been de-activated!</font>"
			for(var/obj/event_zeniebag/z in world)if(z)del(z)
			zenni_event_count=0
var/crystal_event_on=0
var/crystal_event_timer=0
var/crystal_event_temp_timer=0
var/tmp/crystal_event_count=0
world/proc/Crystal_Event_Cycle()
	set background=1
	crystal_event_on=0
	crystal_event_temp_timer=0
	while(1)
		sleep(600)
		if(!crystal_event_on)crystal_event_timer++
		if(crystal_event_timer>=34&&!crystal_event_on)
			crystal_event_on=1
			crystal_event_temp_timer=0
			crystal_event_timer=0
			world<<"<font color=gray><u>[servername]:</u> The Crystal Event has been activated for a half-hour! Get random stuff by doing this event!</font>"
			var/db1=0
			var/db2=0
			var/db3=0
			var/db4=0
			var/db5=0
			var/db6=0
			var/db7=0
			var/db8=0
			var/db9=0
			var/db10=0
			var/db11=0
			var/db12=0
			var/db13=0
			var/db14=0
			var/db15=0
			var/db16=0
			var/db17=0
			var/db18=0
			var/db19=0
			var/db20=0
			spawn(1)
				while(!db1)
					var/turf/T=locate(rand(1,400),rand(1,400),1)
					if(T.dbable)
						new/obj/Equipment/Green_Drop_1(T)
						db1=1
						break
				while(!db2)
					var/turf/T=locate(rand(1,400),rand(1,400),1)
					if(T.dbable)
						new/obj/Equipment/Green_Drop_2(T)
						db2=1
						break
				while(!db3)
					var/turf/T=locate(rand(1,400),rand(1,400),1)
					if(T.dbable)
						new/obj/Equipment/Green_Drop_1(T)
						db3=1
						break
				while(!db4)
					var/turf/T=locate(rand(1,400),rand(1,400),1)
					if(T.dbable)
						new/obj/Equipment/Orange_Drop_1(T)
						db4=1
						break
				while(!db5)
					var/turf/T=locate(rand(1,400),rand(1,400),1)
					if(T.dbable)
						new/obj/Equipment/Orange_Drop_2(T)
						db5=1
						break
				while(!db6)
					var/turf/T=locate(rand(1,400),rand(1,400),2)
					if(T.dbable)
						new/obj/Equipment/Orange_Drop_3(T)
						db6=1
						break
				while(!db7)
					var/turf/T=locate(rand(1,400),rand(1,400),2)
					if(T.dbable)
						new/obj/Equipment/Purple_Drop_1(T)
						db7=1
						break
				while(!db8)
					var/turf/T=locate(rand(1,400),rand(1,400),2)
					if(T.dbable)
						new/obj/Equipment/Purple_Drop_2(T)
						db8=1
						break
				while(!db9)
					var/turf/T=locate(rand(1,400),rand(1,400),2)
					if(T.dbable)
						new/obj/Equipment/Purple_Drop_3(T)
						db9=1
						break
				while(!db10)
					var/turf/T=locate(rand(1,400),rand(1,400),2)
					if(T.dbable)
						new/obj/Equipment/Red_Drop_1(T)
						db10=1
						break
				while(!db11)
					var/turf/T=locate(rand(1,400),rand(1,400),3)
					if(T.dbable)
						new/obj/Equipment/Red_Drop_2(T)
						db11=1
						break
				while(!db12)
					var/turf/T=locate(rand(1,400),rand(1,400),3)
					if(T.dbable)
						new/obj/Equipment/Red_Drop_3(T)
						db12=1
						break
				while(!db13)
					var/turf/T=locate(rand(1,400),rand(1,400),3)
					if(T.dbable)
						new/obj/Equipment/Yellow_Drop_1(T)
						db13=1
						break
				while(!db14)
					var/turf/T=locate(rand(1,400),rand(1,400),3)
					if(T.dbable)
						new/obj/Equipment/Yellow_Drop_2(T)
						db14=1
						break
				while(!db15)
					var/turf/T=locate(rand(1,400),rand(1,400),3)
					if(T.dbable)
						new/obj/Equipment/Yellow_Drop_3(T)
						db15=1
						break
				while(!db16)
					var/turf/T=locate(rand(1,400),rand(1,400),4)
					if(T.dbable)
						new/obj/Equipment/Red_Drop_2(T)
						db16=1
						break
				while(!db17)
					var/turf/T=locate(rand(1,400),rand(1,400),4)
					if(T.dbable)
						new/obj/Equipment/Yellow_Drop_1(T)
						db17=1
						break
				while(!db18)
					var/turf/T=locate(rand(1,400),rand(1,400),4)
					if(T.dbable)
						new/obj/Equipment/Purple_Drop_2(T)
						db18=1
						break
				while(!db19)
					var/turf/T=locate(rand(1,400),rand(1,400),4)
					if(T.dbable)
						new/obj/Equipment/Orange_Drop_1(T)
						db19=1
						break
				while(!db20)
					var/turf/T=locate(rand(1,400),rand(1,400),4)
					if(T.dbable)
						new/obj/Equipment/Purple_Drop_1(T)
						db20=1
						break
				crystal_event_count=20
		if(crystal_event_on)crystal_event_temp_timer++
		if(crystal_event_on&&crystal_event_temp_timer>=30)
			crystal_event_on=0
			crystal_event_temp_timer=0
			crystal_event_timer=0
			world<<"<font color=gray><u>[servername]:</u> The Crystal Event has been de-activated!</font>"
			for(var/obj/Equipment/Purple_Drop_1/z in world)if(z&&!z.crystal_stored)del(z)
			for(var/obj/Equipment/Purple_Drop_2/z in world)if(z&&!z.crystal_stored)del(z)
			for(var/obj/Equipment/Purple_Drop_3/z in world)if(z&&!z.crystal_stored)del(z)
			for(var/obj/Equipment/Orange_Drop_1/z in world)if(z&&!z.crystal_stored)del(z)
			for(var/obj/Equipment/Orange_Drop_2/z in world)if(z&&!z.crystal_stored)del(z)
			for(var/obj/Equipment/Orange_Drop_3/z in world)if(z&&!z.crystal_stored)del(z)
			for(var/obj/Equipment/Yellow_Drop_1/z in world)if(z&&!z.crystal_stored)del(z)
			for(var/obj/Equipment/Yellow_Drop_2/z in world)if(z&&!z.crystal_stored)del(z)
			for(var/obj/Equipment/Yellow_Drop_3/z in world)if(z&&!z.crystal_stored)del(z)
			for(var/obj/Equipment/Red_Drop_1/z in world)if(z&&!z.crystal_stored)del(z)
			for(var/obj/Equipment/Red_Drop_2/z in world)if(z&&!z.crystal_stored)del(z)
			for(var/obj/Equipment/Red_Drop_3/z in world)if(z&&!z.crystal_stored)del(z)
			for(var/obj/Equipment/Green_Drop_1/z in world)if(z&&!z.crystal_stored)del(z)
			for(var/obj/Equipment/Green_Drop_2/z in world)if(z&&!z.crystal_stored)del(z)
			for(var/obj/Equipment/Green_Drop_3/z in world)if(z&&!z.crystal_stored)del(z)
			crystal_event_count=0





obj
	event_zeniebag
		name="ZenniBag"
		icon='MoneyBag.dmi'
		icon_state="moneybag"
		verb
			PickUp()
				set name="Pick Up"
				set category=null
				set src in oview(0)
				zenni_event_count--
				usr<<"<font color=white>You get <b>[applycommas(usr.level*5)]</b> zennies!"
				usr.zenni+=usr.level*5
				usr<<sound('zenni.wav')
				del(src)