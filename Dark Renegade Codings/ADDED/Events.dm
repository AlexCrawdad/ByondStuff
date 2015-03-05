
turf/ZombieBlocker/zombie_blocker=1
var/tmp/horde_seconds=0
var/tmp/horde_whole_time=horde_waves_number+62
proc
	HordeAutoStart()
		world<<"<font color=gray><u>[servername]:</u><font color=red> The Horde Event is now active!</font></font>"
		horde_event=1
		for(var/mob/PC/M in world)if(M&&M.loggedin)
			M.verbs+=new/mob/Horde/verb/Enter_Tournament()
			M.verbs+=new/mob/Horde/verb/Leave_Tournament()
		spawn(70)AutoRevive()
		spawn(1200)if(horde_event)HordeAutoStop()
	HordeAutoStop()
		for(var/mob/PC/M in world)if(M&&M.loggedin)
			M.verbs-=new/mob/Horde/verb/Enter_Tournament()
			M.verbs-=new/mob/Horde/verb/Leave_Tournament()
		if(HordeEntries.len<=1)
			world<<"<font color=gray><u>[servername]:</u><font color=red> The Horde Event has been cancelled!</font></font>"
			KILLHORDE()
			return
		world<<"<font color=gray><u>[servername]:</u><font color=red> The Horde Event has begun!</font></font>"
		Horde_Spawn_AI()
	Horde_Spawn_AI()
		horde_event_started=1
		for(var/mob/PC/M in world)if(M&&M.loggedin&&M.horde)M.loc=locate(2,400,6)
		horde_waves_number=0
		var/tmp/playercount=0
		var/tmp/count=0
		var/tmp/result=0
		horde_seconds=0
		horde_whole_time=horde_waves_number+62
		while(horde_event)
			count=0
			for(var/mob/Horde/H in world)if(H)count++
			if(count<1)
				for(var/mob/PC/M in world)if(M&&M.loggedin&&M.horde)
					M.frozen=1
					M.loc=locate(2,400,6)
				for(var/mob/Horde/H in world)if(H)del(H)
				horde_seconds=0
				horde_seconds-=15
				horde_waves_number++
				if(horde_waves_number>10)
					world<<"<font color=gray><u>[servername]:</u><font color=red> The Horde Event has ended!</font></font>"
					var/tmp/randomnumber=rand(1,2)
					if(randomnumber==1)
						for(var/mob/PC/H in HordeEntries)if(H&&H.loggedin&&H.horde)
							H<<"<font color=gray><u>You've been granted with 50,000 TPS just for participating in the Horde Event!</u></font>"
							H.tp+=50000
							H.frozen=0
					if(randomnumber==2)
						for(var/mob/PC/M in world)if(M&&M.loggedin&&M.horde)
							var/amount=500
							amount=500
							M.tp+=5000
							M<<"<font color=gray><u>You've been granted 500 levels for just participating in the Horde Event!</u></font>"
							spawn(70)if(M)
								while(amount>0)
									if(!M)return
									M.exp=M.tnl
									M.Level_Up()
									amount--
									sleep(0.155)
					KILLHORDE()
					return
				result=horde_waves_number*2
				while(result)
					result--
					var/mob/Horde/S=new
					S.loc=locate(rand(35,39),rand(390,390),6)
					sleep(1)
				for(var/mob/PC/M in world)if(M&&M.loggedin&&M.horde)
					M.frozen=0
					for(var/obj/hudNumbers/o in M.client.screen)if(o)del(o)
					new/obj/hudNumbers(M.client)
			horde_whole_time=horde_waves_number+62
			horde_seconds++
			if(horde_seconds>=horde_whole_time)
				horde_seconds=0
				world<<"<font color=gray><u>[servername]:</u><font color=red> The Horde Event has expired!</font></font>"
				var/tmp/randomnumber=rand(1,2)
				if(randomnumber==1)
					for(var/mob/PC/H in HordeEntries)if(H&&H.loggedin&&H.horde)
						H<<"<font color=gray><u>You've been granted with 10,000 TPS just for participating in the Horde Event!</u></font>"
						H.tp+=10000
				if(randomnumber==2)
					for(var/mob/PC/M in world)if(M&&M.loggedin&&M.horde)
						var/amount=250
						amount=250
						M.tp+=1000
						M<<"<font color=gray><u>You've been granted 250 levels for just participating in the Horde Event!</u></font>"
						spawn(70)if(M)
							while(amount>0)
								if(!M)return
								M.exp=M.tnl
								M.Level_Up()
								amount--
								sleep(0.155)
				KILLHORDE()
				return
			count=0
			for(var/mob/Horde/H in world)if(H)count++
			for(var/mob/PC/C in world)if(C.horde)for(var/obj/hudNumbers/o in C.client.screen)o.icon_state="[count]"
/*			for(var/mob/PC/M in world)if(M.horde)
				M.tourny_afk_timer++
				if(M&&M.tourny_afk_timer>=40&&M.tourny_afk_timer<45)M<<"<font color=red>You have [45-M.tourny_afk_timer] seconds left before getting booted for being afk!</font>"
				if(M.tourny_afk_timer>45)
					M<<"<font color=red>You've been removed from Horde Event for being afk!</font>"
					M.tourny_afk_timer=0
					M.horde=0
					if(HordeEntries.Find(M))HordeEntries.Remove(M)
					for(var/obj/hudNumbers/N in M.client.screen)del(N)
					M.loc=locate(167,194,1)
					M.SafeTimer()*/
			playercount=0
			for(var/mob/PC/M in world)if(M&&M.horde)playercount++
			if(!playercount)KILLHORDE()
			sleep(10)
	KILLHORDE()
		for(var/mob/Horde/H in world)if(H)del(H)
		for(var/mob/PC/M in world)
			M.verbs-=new/mob/Horde/verb/Enter_Tournament()
			M.verbs-=new/mob/Horde/verb/Leave_Tournament()
			M.wait_room=0
			if(M&&M.loggedin&&!M.challenge)for(var/obj/hudNumbers/N in M.client.screen)if(N)del(N)
			if(M.horde)
				M.horde=0
				M.safe=0
				M.loc=locate(167,194,1)
				M.SafeTimer()
				for(var/obj/hudNumbers/N in M.client.screen)del(N)
		HordeEntries=list()
		horde_event=0
		horde_event_started=0
		horde_waves_number=0
		spawn(70)AutoRevive()
mob/Horde
	verb
		Enter_Tournament()
			set category="Channels"
			set name="Enter Horde Event"
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
					usr<<"You cannot enter the Horde Event with the dragonballs!"
					return
			if(buku_lock||in_hbtc||challenge||guild_challenge||grav_trainer||in_war)
				usr<<"\red You're doing something that Horde Event doesn't allow!</font>"
				return
			if(jailed)
				usr<<"\red You are in jail!</font>"
				return
			if(!pk)
				usr<<"You are not a combatant, train more!"
				return
			if(horde_event_started)
				usr<<"<font color=white>The Horde Event has already started!</font></b></u>"
				return
			if(!horde_event)
				usr<<"<font color=white>Horde Event isn't open yet.</font>"
				return
			if(horde)
				usr<<"<font color=white><b><u>You're already in the Horde Event!</font></b></u>"
				return
			if(z!=4&&z!=3&&z!=2&&z!=1)
				usr<<"You're not in right place!"
				return
			var/checkcount=0
			checkcount=0
			for(var/mob/PC/M in world)if(M.horde)checkcount++
			if(checkcount>=10)
				usr<<"Horde Event is full!"
				return
			else
				wait_room=1
				sleep(20)
				if(!usr)return
				if(horde_event_started)
					wait_room=0
					return
				checkcount=0
				for(var/mob/PC/M in world)if(M.horde)checkcount++
				if(checkcount>=10)
					usr<<"Horde Event is full!"
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
				if(!horde_event)
					usr<<"<font color=white>Horde Event isn't open yet.</font>"
					wait_room=0
					return
				loc=locate(154,111,6)
				spawn(20)if(usr&&horde)
					loc=locate(154,111,6)
				HordeEntries.Add(usr)
				horde=1
				insafezone=0
				tourny_afk_timer=0
				szactivated=0
				traintimer=0
				safe=1
				temptraintimer=0
				world<<"<font color=white><b><u>[usr] has joined the Horde Event!</font></b></u>"
				var/count=0
				count=0
				for(var/mob/PC/M in world)if(M.horde)count++
				world<<"<font color=white><b><u>Horde Event spots remaining: [round(10-count)]</font></b></u>"
		Leave_Tournament()
			set category="Channels"
			set name="Leave Horde Event"
			if(spamming_enter)return
			spamming_enter=1
			spawn(50)if(usr)spamming_enter=0
			if(!horde_event)
				usr<<"<font color=white>Horde Event isn't open yet."
				return
			if(horde_event_started)
				usr<<"<font color=white>The Horde Event has already started!</font></b></u>"
				return
			if(!horde)
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
				horde=0
				tourny_afk_timer=0
				safe=0
				HordeEntries.Remove(usr)
				world<<"<font color=white><b><u>[usr] has left the Horde Event!</font></b></u>"
				verbs-=new/mob/Horde/verb/Enter_Tournament()
				verbs-=new/mob/Horde/verb/Leave_Tournament()
				var/count=0
				count=0
				for(var/mob/PC/M in world)if(M.horde)count++
				world<<"<font color=white><b><u>Horde Event spots remaining: [round(10-count)]</font></b></u>"
var/horde_event=0
var/horde_event_started=0
var/horde_timer=0
var/horde_waves_number=0
mob/var/horde=0
var/list/HordeEntries=list()
var/icon/xmas_hat_icon='Xmas hat.dmi'
var/icon/xmas_hat_icon_newlogin='Xmas hat newlogin.dmi'
mob/Horde
	icon='Events.dmi'
	name="{NPC}Zombie"
	icon_state="zombie"
	karma="Evil"
	race="Human"
	level=600
	powerlevel=4000000
	powerlevel_max=4000000
	ki=20000000
	ki_max=20000000
	kidefense=20000000
	kidefense_max=20000000
	strength=6500000
	strength_max=6500000
	defence=6700000
	defence_max=6700000
	speed=2700
	zenni=25000
	pk=1
	New()
		..()
		if(horde_waves_number>15)spawn(1)if(src)WanderExtreme()
		if(horde_waves_number>9&&horde_waves_number<15)spawn(1)if(src)WanderHard()
		if(horde_waves_number>4&&horde_waves_number<10)spawn(1)if(src)WanderMed()
		if(horde_waves_number<5)spawn(1)if(src)Wander()
		spawn(10)if(src)WALKRAND()
	proc/WALKRAND()
		while(src)
			var/Found=FALSE
			for(var/mob/PC/P in oview(40)).
				step_towards(src,P)
				Found=TRUE
				break
			if(Found!=TRUE)sleep(8)
			sleep(8)
mob/Monster
	icon='Events.dmi'
	Reindeer
		name="{NPC}Reindeer"
		icon='Christmas.dmi'
		icon_state="Reindeer"
		eventpeep=1
		exp=100000
		karma="Good"
		race="Mammal"
		level=600
		powerlevel=4000000
		powerlevel_max=4000000
		ki=20000000
		ki_max=20000000
		kidefense=20000000
		kidefense_max=20000000
		strength=6500000
		strength_max=6500000
		defence=6700000
		defence_max=6700000
		speed=2700
		zenni=25000
		New()
			..()
			CreateName()
			spawn(10)if(src)WanderMed()
	Zombie
		name="{NPC}Zombie"
		icon_state="zombie"
		eventpeep=1
		karma="Evil"
		race="Human"
		safe=1
		dead=1
		New()
			..()
			CreateName()
			spawn(10)if(src)WALKRAND()
		proc/WALKRAND()
			while(src)
				var/Found=FALSE
				for(var/mob/PC/P in oview(8)).
					step_rand(src,2)
					Found=TRUE
					break
				if(Found!=TRUE)sleep(8)
				sleep(8)
	Ghost
		name="{NPC}Ghost"
		icon_state="ghost"
		eventpeep=1
		safe=1
		dead=1
		karma="Evil"
		race="Human"
		New()
			..()
			CreateName()
			spawn(10)if(src)WALKRAND()
		proc/WALKRAND()
			while(src)
				var/Found=FALSE
				for(var/mob/PC/P in oview(8)).
					step_rand(src,2)
					Found=TRUE
					break
				if(Found!=TRUE)sleep(8)
				sleep(8)







mob/proc/CustomFadeScreen()
	if(!ismob(src))return
	frozen=1
	doing=1
	var/obj/HUD/FadeIn/f=new
	var/obj/HUD/FadeOut/fo=new
	if(client)
		client.screen+=f
		spawn(30)if(src)
			client.screen+=fo
			client.screen-=f
			frozen=0
			doing=0
			spawn(30)if(src)client.screen-=fo
	.=..()



mob/proc/DAMAGEEFFECT()
	if(!ismob(src))return
	var/obj/HUD/BloodIn/f=new
	var/obj/HUD/BloodOut/fo=new
	if(client)
		client.screen+=f
		spawn(2)if(src)
			client.screen+=fo
			client.screen-=f
			spawn(2)if(src)client.screen-=fo
	.=..()





obj/HUD
	FadeIn
		layer=9001
		icon='FadeIn.dmi'
		screen_loc="SOUTHWEST to NORTHEAST"
	FadeOut
		layer=9001
		icon='FadeOut.dmi'
		screen_loc="SOUTHWEST to NORTHEAST"
	BloodIn
		layer=9001
		icon='BloodIn.dmi'
		screen_loc="SOUTHWEST to NORTHEAST"
	BloodOut
		layer=9001
		icon='BloodOut.dmi'
		screen_loc="SOUTHWEST to NORTHEAST"



obj
	hudNumbers
		icon='Numbers.dmi'
		icon_state="90"
		layer=1005
		New(client/c)
			screen_loc="8,15"
			c.screen+=src