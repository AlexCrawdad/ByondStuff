mob/var/tmp/tourny_afk_timer=0
mob/var/tmp/commandlocked=0
mob/var/tmp/commandspam=0
var/exphostgain=0.5
var/tournyhostgain=1
mob/proc/SpamGuard()
	if(commandlocked)return
	commandspam++
	if(commandspam>4)
		commandspam=0
		src<<"<font color=green>Dragon AI:</font> <font color=white>You will lag for 3 seconds due to command spam.</font>"
		commandlocked=1
		spawn(50)if(src)commandlocked=0
		return
	spawn(20)if(src&&commandspam>0)commandspam--
	return
mob/proc/RegSpamGuard()
	if(commandlocked)return
	commandspam++
	if(commandspam>4)
		commandspam=0
		src<<"<font color=green>Dragon AI:</font> <font color=white>You will lag for 3 seconds due to command spam.</font>"
		commandlocked=1
		spawn(50)if(src)commandlocked=0
		return
	spawn(10)if(src&&commandspam>0)commandspam--
	return
mob
	proc
		SafeTimer()
			insafezone=1
			szactivated=1
			safe=1
			temptraintimer=0
			traintimer=0
			timer()
		Skills_Checker()
			if(weight>0)
				critical-=25
				dodge-=25
				reflect-=25
				block-=25
				counter-=25
				if(critical<1)critical=1
				if(dodge<1)dodge=1
				if(reflect<1)reflect=1
				if(block<1)block=1
				if(counter<1)counter=1
				powerlevel/=2
				ki/=2
				strength/=2
				defence/=2
				kidefense/=2
			if(critical_max>100)critical_max=100
			if(critical>100)critical=100
			if(dodge_max>100)dodge_max=100
			if(dodge>100)dodge=100
			if(reflect_max>100)reflect_max=100
			if(reflect>100)reflect=100
			if(block_max>100)block_max=100
			if(block>100)block=100
			if(counter_max>100)counter_max=100
			if(counter>100)counter=100
		LocationChecker()
			insafezone=0
			szactivated=0
			traintimer=0
			if(z!=5&&z!=7&&z!=6&&safe)
				insafezone=1
				szactivated=1
				traintimer=0
				temptraintimer=0
				timer()
			if(z==7)
				in_hbtc=1
				temptraintimer=0
				insafezone=0
				szactivated=0
				traintimer=0
			if(z!=7)in_hbtc=0
	var
		tmp
			levelexp=0
			wait_room=0
			fused_using=0
			fe_using=0
			sd_using=0
			gmwatching=0
			using=0
			wished=0
			afk=0
			dt_delay=0
			finalformfuse=0
			target=0
			owner=""
			asking_fuse=0
			waiting=0
			firing_bomb=0
			regen_dead=0
			tourny_watch=0
			blocking=0
			countering=0
			deflecting=0
			dodging=0
			regen_delay=0
			talking=0
			grav_delay=0
			candy_zapped=0
			nameColor=""
			hiting=0
			grav=0
			makingitem=0
			saving=0
			challenger=""
			VP = 0
			Valiants = 0
			LotteryNumber = 0
			PlanetDestructionS=0
			kienzan_target=""
			saymute=0
			spam_delay=0
			cant_trans=0
			GMLocked=0
			tp_delay=0
			power_delay=0
			boxing_delay=0
			focus_boxing_delay=0
			rest_delay=0
			finish_delay=0
			cooldown=0
			doing=0
			say_delay=0
			adminsay_delay=0
			admin_muted=0
			buku=0
			boxing=0
			focus_boxing=0
			trans_delay=0
			rest=0
			ki_lock=0
			attack_lock=0
			charging=0
			galing=0
			buku_lock=0
			it_lock=0
			aura_on=0
			speeding=0
			frozen=0
			splits=0
			cells=0
			e_db_1=0;e_db_2=0;e_db_3=0;e_db_4=0;e_db_5=0;e_db_6=0;e_db_7=0;n_db_1=0;n_db_2=0;n_db_3=0;n_db_4=0;n_db_5=0;n_db_6=0;n_db_7=0;b_db_1=0;b_db_2=0;b_db_3=0;b_db_4=0;b_db_5=0;b_db_6=0;b_db_7=0
			vote_boosting=0
			eventpeep=0
			spamming_enter=0
			Yessub=0
		oldadminchat=0
		traininfo_on=1
		safe=0
		rank_boosted=0
		vote_boosted=0
		permtpsboosted=0
		damage_enabled=0
		lcooldown=0;scooldown=0;mcooldown=0;smallshard=0;largeshard=0;massshard=0
		mutedperm=0
		adminhidden=0
		oocmute=0
		challenge=0
		rage_chromosome=0;train_chromosome=0;legendary_chromosome=0;god_chromosome=0;gene_model13=0;gene_model17=0;gene_chaotic=0;gene_angelic=0;gene_chaos=0;gene_holy=0;gene_mystic=0;gene_warrior=0;gene_demonic=0;gene_saint=0;gene_cooler=0;gene_frieza=0
		banked_interest = 0
		unarmed_tnl=100;unarmed_exp=0;unarmed_skill_max=5;unarmed_skill=0;ki_skill_max=5;ki_skill=0;ki_tnl=0;ki_exp=0
		level_random=0
		jailed=0
		level_on=0
		customfinish=0
		customfinishtxt=""
		f_armor=0
		rank = "<FONT COLOR=#ff0000>N</FONT><FONT COLOR=#8b0000>u</FONT><FONT COLOR=#c60000>b</FONT><FONT COLOR=#ff0000>c</FONT><FONT COLOR=#c60000>a</FONT><FONT COLOR=#8b0000>k</FONT><FONT COLOR=#ff0000>e</FONT></FONT>"
		condition = "Healthy"
		weightgi=0;weightcape=0;weightarmor=0;weightarm=0;weightleg=0;weightankle=0;weightwrist=0;weighthead=0
		BoughtFlash = 0
		FlashLevel = 1
		FlashUses = 0
		StoreOpen = 0
		splits_max=0
		title="Player"
		race=""
		karma="Good"
		class
		karma_rating=25
		skin=""
		level=1;exp=0;tnl=50
		stamina_exp=0;stamina_tnl=100
		tp=0
		custom_points=0
		powerlevel=500;powerlevel_max=500;power_bonus = 70;ki=250;ki_max=250;ki_bonus = 60;strength=50;strength_max=50;strength_bonus = 50;defence=50;defence_max=50;defence_bonus = 40
		speed=5000;speed_max=5000
		stamina=0;stamina_max=1000
		rage=0;rage_max=100
		pvp_rating = 1000
		zenni=500
		eats=0;kills=0;deaths=0;dead=0
		inven_min=0;inven_max=25
		energy_code=0
		random=0;random2=0
		pk=0
		mchips=0;chips=0;chips_max=0
		in_arena=0
		kidefense=100
		kidefense_max=100
		weight=0
		add_exp=0
		wishes=0;egrant=0;nwishes=0;ngrant=0;bwishes=0;bgrant=0
		in_war=0
		fused=0
		follow=""
		FuseFollower=0
		followmob=0
		it_taken=0
		challenge_on=1
		trans_aura_on=1;crater_on=1;inverted=0
		dodge=0;block=0;reflect=0;critical=0;counter=0;dodge_max=5;block_max=5;reflect_max=5;critical_max=5;counter_max=5
		head="EMPTY";back="EMPTY";chest="EMPTY";legs="EMPTY";feet="EMPTY";arms="EMPTY";hands="EMPTY";waist="EMPTY";underclothes="EMPTY";clothes="EMPTY";clothes_eq=0;GItem_eq=0;scouter=0;scouter_eq=0;scouter_channel=1;armor=0;armor_eq=0;under=0;under_eq=0;helmet=0;helmet_eq=0;gloves=0;gloves_eq=0;z_sword=0;radar=0;hench_equiped=0;saiyan_equiped=0;sellable_items=0
		hunger=0;hungerblock=0
		is_temp_sub=0
		AutoFinish=0
	PC
		verb
			View_Map()
				set category="Channels"
				if(spam_delay)return
				spam_delay=1
				switch(input("What do you want to do?")in list("View Location","View Earth's Map","View Namek's Map","View Planet Vegeta's Map","View Planet Yardrat's Map","Cancel"))
					if("Cancel")
						spam_delay=0
						return
					if("View Location")
						winshow(usr,"Guide",1)
						usr<<browse(null)
						if(z==1)
							var/tmp/icon/M=icon('Map Earth.png')
							var/xx=x
							var/yy=y
							M.DrawBox(rgb(160,0,0),(xx-5)-2,(yy-2)-2,(xx-5)+2,(yy-2)+2)
							usr<<browse(M)
							spawn(25)if(usr)spam_delay=0
							return
						else
							if(z==2)
								var/tmp/icon/M=icon('Map Namek.png')
								var/xx=x
								var/yy=y
								M.DrawBox(rgb(160,0,0),(xx-5)-2,(yy-2)-2,(xx-5)+2,(yy-2)+2)
								usr<<browse(M)
								spawn(25)if(usr)spam_delay=0
								return
							else
								if(z==3)
									var/tmp/icon/M=icon('Map Vegeta.png')
									var/xx=x
									var/yy=y
									M.DrawBox(rgb(160,0,0),(xx-5)-2,(yy-2)-2,(xx-5)+2,(yy-2)+2)
									usr<<browse(M)
									spawn(25)if(usr)spam_delay=0
									return
								else
									if(z==4)
										var/tmp/icon/M=icon('Map Yardrat.png')
										var/xx=x
										var/yy=y
										M.DrawBox(rgb(160,0,0),(xx-5)-2,(yy-2)-2,(xx-5)+2,(yy-2)+2)
										usr<<browse(M)
										spawn(25)if(usr)spam_delay=0
										return
									else
										usr<<"You cannot check your location here."
										spawn(25)if(usr)spam_delay=0
										return
					if("View Earth's Map")
						winshow(usr,"Guide",1)
						usr<<browse(null)
						var/tmp/icon/M=icon('Map Earth.png')
						usr<<browse(M)
						spawn(25)if(usr)spam_delay=0
						return
					if("View Namek's Map")
						winshow(usr,"Guide",1)
						usr<<browse(null)
						var/tmp/icon/M=icon('Map Namek.png')
						usr<<browse(M)
						spawn(25)if(usr)spam_delay=0
						return
					if("View Planet Vegeta's Map")
						winshow(usr,"Guide",1)
						usr<<browse(null)
						var/tmp/icon/M=icon('Map Vegeta.png')
						usr<<browse(M)
						spawn(25)if(usr)spam_delay=0
						return
					if("View Planet Yardrat's Map")
						winshow(usr,"Guide",1)
						usr<<browse(null)
						var/tmp/icon/M=icon('Map Yardrat.png')
						usr<<browse(M)
						spawn(25)if(usr)spam_delay=0
						return
obj
	var
		guild=""
		weight=0
		dball=0
		equiped
		value=0
		condition
		condition_max
		armour_protection
		hench_armour
		saiyan_armour
		item_owner
		lastx
		lasty
		lastz
		cooldown
		owner
		power=0
		target=""
		owners=""
		range=20
		npc=0
client
	North()
		for(var/obj/Spaceship/S in world)if(S.owner==usr)S.dir=NORTH
		if(usr.thrown)return 0
		if(usr.frozen)
			if(usr.firing_bomb)
				for(var/obj/Tech/B in world)
					if(B.owner==usr)
						if(B.name!=usr.custom_name&&B.controldisabled)return
						B.dir=NORTH
						return 0
				for(var/obj/techs/Overlays/B in world)
					if(B.name!=usr.custom_name&&B.controldisabled)return
					if(B.owner==usr)
						B.dir=NORTH
						return 0
			else
				for(var/obj/Tech/B in world)
					if(B.name!=usr.custom_name&&B.controldisabled)return
					if(B.owner==usr&&usr.clasharrow==NORTH)
						usr.clasharrow=SOUTH
						var/multi=1
						if(usr.form_1)multi=2
						if(usr.form_2)multi=2.2
						if(usr.form_3||usr.inverted)multi=2.3
						if(usr.form_4)multi=2.4
						if(usr.form_5)multi=2.5
						if(usr.form_6)multi=2.6
						B.clashrush+=(usr.ki_max*(0.06*multi))
						return 0
		return ..()
	South()
		for(var/obj/Spaceship/S in world)if(S.owner==usr)S.dir=SOUTH
		if(usr.thrown)return 0
		if(usr.frozen)
			if(usr.firing_bomb)
				for(var/obj/Tech/B in world)
					if(B.name!=usr.custom_name&&B.controldisabled)return
					if(B.owner==usr)
						B.dir=SOUTH
						return 0
				for(var/obj/techs/Overlays/B in world)
					if(B.name!=usr.custom_name&&B.controldisabled)return
					if(B.owner==usr)
						B.dir=SOUTH
						return 0
			else
				for(var/obj/Tech/B in world)
					if(B.name!=usr.custom_name&&B.controldisabled)return
					if(B.owner==usr&&usr.clasharrow==SOUTH)
						usr.clasharrow=NORTH
						var/multi=1
						if(usr.form_1)multi=2
						if(usr.form_2)multi=2.2
						if(usr.form_3||usr.inverted)multi=2.3
						if(usr.form_4)multi=2.4
						if(usr.form_5)multi=2.5
						if(usr.form_6)multi=2.6
						B.clashrush+=(usr.ki_max*(0.06*multi))
						return 0
		return ..()
	East()
		for(var/obj/Spaceship/S in world)if(S.owner==usr)S.dir=EAST
		if(usr.thrown)return 0
		if(usr.frozen)
			if(usr.firing_bomb)
				for(var/obj/Tech/B in world)
					if(B.name!=usr.custom_name&&B.controldisabled)return
					if(B.owner==usr)
						B.dir=EAST
						return 0
				for(var/obj/techs/Overlays/B in world)
					if(B.name!=usr.custom_name&&B.controldisabled)return
					if(B.owner==usr)
						B.dir=EAST
						return 0
			else
				for(var/obj/Tech/B in world)
					if(B.name!=usr.custom_name&&B.controldisabled)return
					if(B.owner==usr&&usr.clasharrow==EAST)
						usr.clasharrow=WEST
						var/multi=1
						if(usr.form_1)multi=2
						if(usr.form_2)multi=2.2
						if(usr.form_3||usr.inverted)multi=2.3
						if(usr.form_4)multi=2.4
						if(usr.form_5)multi=2.5
						if(usr.form_6)multi=2.6
						B.clashrush+=(usr.ki_max*(0.06*multi))
						return 0
		return ..()
	West()
		for(var/obj/Spaceship/S in world)if(S.owner==usr)S.dir=WEST
		if(usr.thrown)return 0
		if(usr.frozen)
			if(usr.firing_bomb)
				for(var/obj/Tech/B in world)
					if(B.name!=usr.custom_name&&B.controldisabled)return
					if(B.owner==usr)
						B.dir=WEST
						return 0
				for(var/obj/techs/Overlays/B in world)
					if(B.name!=usr.custom_name&&B.controldisabled)return
					if(B.owner==usr)
						B.dir=WEST
						return 0
			else
				for(var/obj/Tech/B in world)
					if(B.name!=usr.custom_name&&B.controldisabled)return
					if(B.owner==usr&&usr.clasharrow==usr.dir)
						usr.clasharrow=EAST
						var/multi=1
						if(usr.form_1)multi=2
						if(usr.form_2)multi=2.2
						if(usr.form_3||usr.inverted)multi=2.3
						if(usr.form_4)multi=2.4
						if(usr.form_5)multi=2.5
						if(usr.form_6)multi=2.6
						B.clashrush+=(usr.ki_max*(0.06*multi))
						return 0
		return ..()

mob/Guest/Move()return
mob/var/tmp
	is_moving=0
	MN;MS;MW;ME
	QueN;QueS;QueE;QueW
mob/verb
	MoveNorth()
		set hidden=1;set instant=1
		if(train||!IME)return
		MN=1;MS=0;QueN=1;MovementLoop()
		return
	StopNorth()
		set hidden=1;set instant=1
		if(train||!IME)return
		MN=0
		return
	MoveSouth()
		set hidden=1;set instant=1
		if(train||!IME)return
		MN=0;MS=1;QueS=1;MovementLoop()
		return
	StopSouth()
		set hidden=1;set instant=1
		if(train||!IME)return
		MS=0
		return
	MoveEast()
		set hidden=1;set instant=1
		if(train||!IME)return
		ME=1;MW=0;QueE=1;MovementLoop()
		return
	StopEast()
		set hidden=1;set instant=1
		if(train||!IME)return
		ME=0
		return
	MoveWest()
		set hidden=1;set instant=1
		if(train||!IME)return
		ME=0;MW=1;QueW=1;MovementLoop()
		return
	StopWest()
		set hidden=1;set instant=1
		if(train||!IME)return
		MW=0
		return
mob/proc/MovementLoop()
	if(train||!IME)return
	walk(src,0)
	if(is_moving)return;is_moving=1
	var/FirstStep=1
	while(MN||ME||MW||MS||QueN||QueS||QueE||QueW)
		if(!IME)
			QueN=0;QueS=0;QueE=0;QueW=0
			is_moving=0
			FirstStep=0
			return
		if(MN||QueN)
			if(ME||QueE)if(!step(src,NORTHEAST)&&!step(src,NORTH))step(src,EAST)
			else if(MW||QueW)if(!step(src,NORTHWEST)&&!step(src,NORTH))step(src,WEST)
			else step(src,NORTH)
		else if(MS||QueS)
			if(ME||QueE)if(!step(src,SOUTHEAST)&&!step(src,SOUTH))step(src,EAST)
			else if(MW||QueW)if(!step(src,SOUTHWEST)&&!step(src,SOUTH))step(src,WEST)
			else step(src,SOUTH)
		else if(ME||QueE)step(src,EAST)
		else if(MW||QueW)step(src,WEST)
		QueN=0;QueS=0;QueE=0;QueW=0
		if(FirstStep){sleep(1);FirstStep=0}
		sleep(1)
	is_moving=0
	return
mob/Move()
	if(frozen||KO)return
	if(regen_dead||gravityfieldon||binded||GMLocked)return
	if(dead&&z!=5)
		if(race!="Android")loc=locate(41,311,5)
		if(race=="Android")loc=locate(221,150,5)
	dualtrain=0
	boxing=0
	meditation=0
	rest=0
	if(!dead)overlays-='Halo.dmi'
	overlays-=icon('Techs.dmi',"galaticdonut")
	overlays-=icon('Techs.dmi',"demonshackle")
	overlays-=icon('Techs.dmi',"imprisonmentball")
	overlays-='LUP.dmi'
	if(afk)
		world<<"<font color=white>[src] is <font color=green>back."
		overlays-='AFK.dmi'
		afk=0
	var/walkdelay=speed/1000
	if(weight>0)walkdelay+=4
	if(buku)
		walkdelay-=2
		if(sonicspeed)walkdelay-=6
	if(z==7||z==6)itblocked=1
	if(z!=7&&z!=6)itblocked=0
	if(walkdelay<1&&!sonicspeed)walkdelay=1
	if(speeding<=0)
		.=..()
		if(.)
			speeding=1
			if(thrown)speeding=0
			if(weight>0&&!buku)
				var/xp=weight
				if(xp>10)xp=10
				exp+=xp
				if(expbuff)exp+=xp
				if(!staminabuff)stamina+=xp*0.4
				stamina_exp+=xp*0.5
				spawn(1)if(src)
					Fatigue_Level_Up()
					Level_Up()
					Tired_KO()
			sleep(walkdelay)
			speeding=0
	if(z==1||z==2||z==3||z==4)
		if(y==1)
			if(dir==SOUTH||dir==SOUTHEAST||dir==SOUTHWEST)y=400
			return
		if(y==400)
			if(dir==NORTH||dir==NORTHWEST||dir==NORTHEAST)y=1
			return
		if(x==1)
			if(dir==WEST||dir==SOUTHWEST||dir==NORTHWEST)x=400
			return
		if(x==400)
			if(dir==EAST||dir==SOUTHEAST||dir==SOUTHWEST)x=1
			return
mob/PC/Stat()
	if(tab_vitals&&statpanel("Stats"))
		stat(src)
		switch(race)
			if("Bio-Android")stat("Absorbs:","[absorb_kill]")
			if("Android")
				if(src.gene_model13)
					stat("Gene Type:","Model 13")
					stat("Life Drains","[src.lifedrain_kill]")
					stat("-----","")
					stat("Chips:","[src.chips]/10")
					stat("Mega Chips:","[src.mchips]/5")
				if(src.gene_model17)
					stat("Gene Type:","Model 17")
					stat("Life Drains","[src.lifedrain_kill]")
					stat("-----","")
					stat("Chips:","[src.chips]/15")
					stat("Mega Chips:","[src.mchips]/3")
			if("Demon")
				if(src.gene_chaotic)
					stat("Gene Type:","Chaotic")
				if(src.gene_angelic)
					stat("Gene Type:","Angelic")
			if("Dragon")
				if(src.gene_chaos)
					stat("Gene Type:","Chaos")
				if(src.gene_holy)
					stat("Gene Type:","Holy")
			if("Namekian")
				if(src.gene_warrior)
					stat("Gene Type:","Warrior")
				if(src.gene_mystic)
					stat("Gene Type:","Mystic")
			if("Half Saiyan")
				if(src.gene_saint)
					stat("Gene Type:","Saint")
				if(src.gene_demonic)
					stat("Gene Type:","Demonic")
			if("Changeling")
				if(src.gene_frieza)
					stat("Gene Type:","Frieza")
				if(src.gene_cooler)
					stat("Gene Type:","Cooler")
			if("Tuffle")stat("Infects:","[absorb_kill]")
			if("Majin")stat("Eats:","[eats]")
			if("Saiyan")
				if(legendary_chromosome)stat("Gene Type:","Legendary")
				if(god_chromosome)stat("Gene Type:","Saiyan God")
				if(train_chromosome)stat("Gene Type:","Pride")
				if(rage_chromosome)stat("Gene Type:","Honour")
		stat("--------","")
		stat("Level:","[applycommas(level)]")
		stat("Exp:","[round((exp/tnl)*100)]%(Gain : [EXPrebirthgain] %)")
		stat("Class:",class)
		stat("Rank:","[src.rank]")
		stat("Zenni Rank:","[src.z_rank]")
		if(src.majin == 0)
			if(src.powerlevel >= (src.powerlevel_max / 2))
				src.condition = "Healthy"

			if(src.powerlevel <= (src.powerlevel_max / 2))
				src.condition = "Wounded"

			if(src.powerlevel <= (src.powerlevel_max / 4))
				src.condition = "Heavily Wounded"

			if(src.powerlevel <= (src.powerlevel / 10))
				src.condition = "Near Death"

			if(src.viral_heart == 1)
				src.condition = "Viral Heart Disease"
		else
			if(src.powerlevel >= (src.powerlevel_max / 2))
				src.condition = "Healthy (Majined)"

			if(src.powerlevel <= (src.powerlevel_max / 2))
				src.condition = "Wounded (Majined)"

			if(src.powerlevel <= (src.powerlevel_max / 4))
				src.condition = "Heavily Wounded (Majined)"

			if(src.powerlevel <= (src.powerlevel / 10))
				src.condition = "Near Death (Majined)"

			if(src.viral_heart == 1)
				src.condition = "Viral Heart Disease (Majined)"

		stat("Condition:",condition)
		stat("Vip Points","[usr.VP] Points")
		stat("Valiants","[usr.Valiants] $")
		stat("Karma:","[karma]: [karma_rating]%")
		stat("--------","")
		stat("Powerlevel:","[applycommas(powerlevel)] / [applycommas(powerlevel_max)] - ( Class Bonus [src.power_bonus])(Gain : [powerlevelrebirthgain] %)")
		stat("Ki:","[applycommas(ki)] / [applycommas(ki_max)] - ( Class Bonus [src.ki_bonus])(Gain : [kirebirthgain] %)")
		stat("Ki Defense:","[applycommas(kidefense)] / [applycommas(kidefense_max)](Gain : [kidefenserebirthgain] %)")
		stat("Strength:","[applycommas(strength)] / [applycommas(strength_max)] - ( Class Bonus [src.strength_bonus])(Gain : [strengthrebirthgain] %)")
		stat("Defense:","[applycommas(defence)] / [applycommas(defence_max)] - ( Class Bonus [src.defence_bonus])(Gain : [defenserebirthgain] %)")
		stat("Stamina:","[src.stamina] / [src.stamina_max](Gain : [staminarebirthgain] %)")
		stat("Speed:","[2+round(((5002-speed)/500),0.5)] Steps per second")
		stat("Hunger:","[usr.hunger] %")
		stat("--------","")
		stat("Rage:","[rage] %")
		stat("HBTC Entrie(s):","[hbtc_times] / 6")
		stat("--------","")
//		stat("Focus Train Multiplier","x[ftexp]")
//		stat("Shadow Spar Multiplier","x[ssexp]")
//		stat("--------","")
		if(in_hbtc&&hbtc_timer)stat("Time left in HBTC:","[hbtc_timer] minutes")
		if(insafezone)stat("Time left in Safe Zone:","[120-traintimer] minutes")
		if(scouter_eq||race=="Android")
			stat("--------","")
			stat("Location:","[x], [y], [z]")
	if(tab_server&&statpanel("Server"))
		stat("CPU Usage:","[world.cpu]%")
		stat("Efficiency:","[100-world.cpu]%")
		stat("Online Time:","[Time()]")
		stat("--------","")
		stat("Players Online:","[players]")
		if(!jrtournament)stat("Junior Tournament Status:","[120-jrtournament_timer] minutes left")
		if(jrtournament)stat("Junior Tournament Status:","Active")
		if(!tournament)stat("World Tournament Status:","[130-tournament_timer] minutes left")
		if(tournament)stat("World Tournament Status:","Active")
		if(!babatournament)stat("Baba Tournament Status:","[135-babatournament_timer] minutes left")
		if(babatournament)stat("Baba Tournament Status:","Active")
		if(!guildtournament)stat("Guild Tournament Status:","[140-guildtournament_timer] minutes left")
		if(guildtournament)stat("Guild Tournament Status:","Active")
		if(!ffatournament)
			if(200-ffatournament_timer>1)stat("FFA Tournament Status:","[200-ffatournament_timer] Minutes Left")
			else stat("FFA Tournament Status:","[200-ffatournament_timer] Minutes Left")
		if(ffatournament)stat("FFA Tournament Status:","Active")
		if(!horde_event)stat("Horde Event Status:","[125-horde_timer] minutes left")
		if(horde_event)stat("Horde Event Status:","Active")
//		if(!hunter_event)stat("Hunter Event Status:","[32-hunter_event_timer] minutes left")
//		if(hunter_event)stat("Hunter Event Status:","Active")
		if(!event_exp_on)stat("EXP Event Status:","[33-event_timer] minutes left")
		if(event_exp_on)stat("EXP Event Status:","Active")
		if(!TPevent_on)stat("TP Event Status:","[31-TPevent_timer] minutes left")
		if(TPevent_on)stat("TP Event Status:","Active")
		if(!zenni_event_on)stat("Zenni Event Status:","[28-zenni_event_timer] minutes left")
		if(zenni_event_on)stat("Zenni Event Status:","Active")
		if(!crystal_event_on)stat("Crystal Event Status:","[34-crystal_event_timer] minutes left")
		if(crystal_event_on)stat("Crystal Event Status:","Active")
	if(tab_skills&&statpanel("Skills"))
		switch(leveldone)
			if(0)stat("Training Mode:","Warrior")
			if(1)stat("Training Mode:","Assasin")
			if(2)stat("Training Mode:","Deadly Shadow")
			if(3)stat("Training Mode:","Demon")
			if(4)stat("Training Mode:","Immortal")
			if(5)stat("Training Mode:","God")
			if(6)stat("Training Mode:","Legend")
			if(7)stat("Training Mode:","Inferno")
			if(8)stat("Training Mode:","Titan")
			if(9)stat("Training Mode:","Dragon Mode")
			if(10)stat("Training Mode:","Psuedo God Of Destruction")
			if(11)stat("Training Mode:","True God of Destruction")
		levelexp=leveldone
		stat("--------","")
		if(tp>0)stat("Training Points:","[applycommas(tp)]")
		if(skill_points>0)stat("Skill Points:",skill_points)
		if(custom_points > 0)stat("Custom Points:",custom_points)
		if(race=="Saiyan"||race=="Half Saiyan")
			stat("--------","")
			stat("Trans. Lvl:","[round(ssj_level)]")
			stat("Trans. Exp:","[round(ssj_exp)] %")
			stat("Trans. Delay:","[round(upkeep / 1.5)/10] sec")
			stat("--------","")
		if(race=="Human"||race=="Changeling"||race=="Demon"||race=="Saibaman"||race=="Demon"||race=="Kai"||race=="Galactic Warrior"||race=="Makyo")
			stat("--------","")
			stat("Trans. Level:","[round(form_1_level)]")
			stat("Trans. Exp:","[round(form_1_exp)] %")
			stat("Trans. Delay:","[round(upkeep / 1.5)/10] sec")
			stat("--------","")
		stat("Unarmed:","[round((unarmed_skill / unarmed_skill_max) * 100)] %")
		stat("Ki:","[round((ki_skill / ki_skill_max) * 100)] %")
		stat("--------","")
		stat("Counter:","[counter]%")
		stat("Block:","[block]%")
		stat("Dodge:","[dodge]%")
		stat("Reflect:","[reflect]%")
		stat("Critical:","[critical]%")
		stat("--------","")
		stat("Kills/Deaths:","[kills] / [deaths]")
		stat("Arena Win/Loss:","[arena_win] / [arena_lose]")
		stat("--------","")
		stat("Earth Wishes:","[wishes] / 7")
		stat("Namek Wishes:","[nwishes] / 5")
		stat("Black Star Wishes:","[bwishes] / 1")
	if(tab_quests&&statpanel("Quests"))for(var/obj/Quests/O in contents)stat(O)
	if(tab_inventory&&statpanel("Inventory"))
		stat("Head:",head)
		stat("Back:",back)
		stat("Chest:",chest)
		stat("Clothes:",clothes)
		stat("Underclothing:",underclothes)
		stat("Arms:",arms)
		stat("Hands:",hands)
		stat("Legs:",legs)
		stat("Feet:",feet)
		stat("--------","")
		for(var/obj/Equipment/O1 in src)stat(O1)
		for(var/obj/Gym/GI in src)stat(GI)
		for(var/obj/Props/Furnature/GF in src)stat(GF)
		for(var/obj/Earth_Dragonballs/O2 in src)stat(O2)
		for(var/obj/Namek_Dragonballs/O3 in src)stat(O3)
		for(var/obj/Black_Dragonballs/O4 in src)stat(O4)
		stat("--------","")
		stat("Zenni:","[applycommas(zenni)]")
		stat("Banked Zenni:","[applycommas(banked_zenni)]")
		stat("Space:","[inven_min] / [inven_max]")
	if(in_guild&&tab_guild&&statpanel("Guild Members"))
		for(var/mob/PC/M in world)if(M.guild_name==guild_name)
			stat(M)
			stat("Level:","[applycommas(M.level)]")
			stat("Race:",M.race)
			stat("Rank:",M.guild_rank)
			stat("Guild Rank:",M.guild_challenge_rank)
			stat("","")
	if(tab_Simulation&&statpanel("Simulation"))
		stat("Current Simulation:","[Simulation]")
		stat("Simulation Part:","[part]")
		stat("Simulation Difficulty:","[Simulation_difficulty]")
		for(var/mob/Simulation/M in world)
			stat(M)
			var/planet
			switch(M.z)
				if(1)planet="Earth"
				if(2)planet="Namek"
				if(3)planet="Future Earth"
				if(4)planet="Planet Vegeta"
			stat("Location:","[planet]")
			stat("","")

	if(tab_masteries&&statpanel("Masteries"))
		stat("Transformation Mastery:","[TransMastery] /5")
		stat("Invert Mastery:","[InvertMastery] /5")
		stat("Gravity Mastery:","[GravityMastery] /2(UNADDED)")
		stat("Powerlevel Mastery:","[PLMastery]/4")
		stat("Strength Mastery:","[STRMastery]/4")
		stat("Defense Mastery:","[DEFMastery]/4")
		stat("Ki Mastery:","[KIMastery]/4")

proc/applycommas(number)
	number=round(number,1)
	number=num2text(number,1000000)
	var/digits=length(number)
	var/remaining=0
	var/returnnumber
	while(digits>=1)
		if(digits>3)
			var/end=","+copytext(number,digits-2,digits+1)
			var/get=end
			returnnumber=get+returnnumber
			remaining=(length(get)-1)+remaining
			digits-=3
		else
			var/get=copytext(number,1,(length(number)+1)-remaining)
			returnnumber=get+returnnumber
			digits=0
	return returnnumber


