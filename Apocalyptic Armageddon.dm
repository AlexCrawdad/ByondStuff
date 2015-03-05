#define DEBUG
#define yes TRUE
#define no FALSE
#define start_at 2
#define FADE_LAYER 1024
#define reds rgb(255,0,0)
#define greens rgb(0,255,0)
#define blues rgb(0,0,255)
#define whites rgb(255,255,255)
#define pinks rgb(255,0,255)
#define purples rgb(200,0,255)
#define yellows rgb(255,255,0)


mob/var/tmp/alt_checked=0
var
	channelmute=""
	players=0
	grass_damage=1
	MK=1
	eventenabled=0
	cantsaveatall=0
	tournament_timer=0;jrtournament_timer=0;babatournament_timer=0;guildtournament_timer=0;ffatournament_timer=0
	LRAllow[0]
	mainname="Vegito"
	gamename="Dragonball: Apocalyptic Armageddon"
	shortname="AA"
	gameversion="14.4 Stable"
	mainkey1="Vegito9000"
	baninfo="<font color=red>You are banned. If you feel this is in error, please Message Vegito9000."
	forums="http://dbz-aa.forumotion.com/";voteplace="http://www.top-site-list.com/byond/vote/452574";donations=""
	servername="<u><FONT COLOR=#008000>D</FONT><FONT COLOR=#007a00>B</FONT><FONT COLOR=#007300>Z</FONT><FONT COLOR=#006b00> </FONT><FONT COLOR=#006400>A</FONT><FONT COLOR=#006400>A</FONT><FONT COLOR=#006400> </FONT><FONT COLOR=#006400>I</FONT><FONT COLOR=#006400>n</FONT><FONT COLOR=#006400>f</FONT><FONT COLOR=#006400>o</FONT><FONT COLOR=#006400>r</FONT><FONT COLOR=#006400>m</FONT><FONT COLOR=#006400>a</FONT><FONT COLOR=#006b00>t</FONT><FONT COLOR=#007300>i</FONT><FONT COLOR=#007a00>o</FONT><FONT COLOR=#008000>n</FONT></FONT></u>:"
	EXPinfo="<u><FONT COLOR=#808080>T</FONT><FONT COLOR=#969696>r</FONT><FONT COLOR=#ababab>a</FONT><FONT COLOR=#c0c0c0>i</FONT><FONT COLOR=#d5d5d5>n</FONT><FONT COLOR=#ebebeb>i</FONT><FONT COLOR=#ffffff>n</FONT><FONT COLOR=#f0f0f0>g</FONT><FONT COLOR=#e0e0e0> </FONT><FONT COLOR=#d0d0d0>I</FONT><FONT COLOR=#c0c0c0>n</FONT><FONT COLOR=#ababab>f</FONT><FONT COLOR=#969696>o</FONT><FONT COLOR=#808080></u></FONT></FONT>"
	serverinformation="The Main server!";bkserverinformation="Backup, Join Only if Main is Offline!"
	mainserver=1;cangeton=1
	serverhost="Valiant Productions"
	halloween=0;christmas=1
world
	view=8
	version=266
	loop_checks=1
	tick_lag=1
	mob=/mob/Guest
	name="Dragonball Apocalyptic Armageddon"
	map_format=TILED_ICON_MAP
	status="<font size=-2>Loading Hub...</font>"
	hub="Vegito9000.DBZApocalypticArmageddon"
	hub_password="fB2iWTGmYlHjyiLH"
	New()
		..()
		log="AA_Error_Log_v[gameversion].txt"
		log<<"Started up at: [time2text(world.realtime)]"
		//spawn(5)AutoChecker()
		INTEREST()
		spawn(30)SPAWN();spawn(30)AutoTournament();spawn(30)jrAutoTournament();spawn(30)AutoBabaTournament();spawn(30)AutoGuildTournament();spawn(30)AutoFFA()
		spawn(100)Earth_Dragonball_Spawn();spawn(100)Namek_Dragonball_Spawn();spawn(100)Black_Dragonball_Spawn()
		spawn(150)TPandZenniREPOP();spawn(150)SERVER_AD()
		spawn(300)Simulation_Chooser()
		spawn(600)AutoHorde();spawn(600)Zenni_Event_Cycle();spawn(600)Crystal_Event_Cycle();spawn(600)EventCycle();spawn(600)TPEventCycle()
//		spawn(600)AutoHunter()





	Del()
		for(var/mob/PC/M in world)if(M.client)del(M)
		..()

client
	script="<STYLE>BODY {background: black; color: #999999;font-size: -2;font-weight: bold;font-family:Tahoma}</STYLE>"
	perspective=EDGE_PERSPECTIVE
	Del()
		if(istype(mob,/mob/Guest))return ..()
		if(istype(mob,/mob/PC))
			players--
			spawn(1)world.UpdatePlayers()
			SaveChar()
			world<<"<font color = gray><u>[servername]:</u> <font color=red>[mob]([src]) has <u><font color=red>left</font></u> the Fight."
		for(var/mob/P in world)if(P.name=="PC-[src.key]-PC")del(P)
		..()
	New()
		..()
		mob.frozen=1
		mob.itspecialblocked=1
		if(key=="Guest-[computer_id]")
			winshow(src,"serverinfo",1)
			winset(src,"serverinfo1","text='You are not allowed to join this game using a guest key! Please Create an Account on BYOND!'")
			sleep(20)
			del(src)
		if(!mainserver&&!cangeton&&mob.key!=mainkey1)
			winshow(src,"serverinfo",1)
			winset(src,"serverinfo1","text='This server is closed!'")
			sleep(20)
			del(src)
		if(GM_WorldShutDownProc)
			winshow(src,"serverinfo",1)
			winset(src,"serverinfo1","text='This server is closing.'")
			sleep(20)
			del(src)
		winset(src,"mainwindow","is-maximized=true")
		mouse_pointer_icon='DRMouse.dmi'
mob/var/canMK=0
mob/proc/MK()
	if(!MK)
		for(var/mob/M in world)
			if(M!=src)
				if(M.client)
					if(!M.canMK)
						if(M.client.address==client.address)
							alt_checked++
							if(alt_checked>=2)
								src<<"<font color=red><u>Multi-keying</u> is disabled!"
								del(src)



world/Topic(T)
	if(T=="Test")return "Pass"
	return ..()
world/Topic(T)
	if(T=="Test")return "Pass"
	return ..()
	spawn(18)
		src<<"<b><font size=2>Welcome to <u>[shortname]</u>; version [gameversion]!"
		world<<"<b><font size=-1><font color=green>Dragon AI:<font color=white> <font size=2> Welcome [src], If you need any help just ask any Enforcer!"
		//spawn(6)src<<"<b><font size=2>Please help keep the server alive by »<a href=[donations]>Subscribing</a>«, Thank You! ~Vegito9000"
		spawn(12)src<<"<b><font size=2>Please post your idea on the »<a href=[forums]>forums</a>«, thank you!"
		spawn(14)src<<"<b><font size=2>Please vote for Us! We want to be FIRST! »<a href=[voteplace]></a>«, Thanks ~Vegito9000"
		spawn(18)src<<"<b><font size=2>Please report any bugs you have found to an enforcer!"
		spawn(20)src<<"<b><font size=3><font color=red>Please Don't ask for Moderator. if you do you Will be Muted or Booted."
	..()
proc
	AutoRevive()
		for(var/mob/PC/M in world)
			if(!M.client||!M.loggedin)continue
			if(M.dead)
				M.Power_Redefine()
				M.ki=M.ki_max
				M.stamina=0
				M.powerlevel=M.powerlevel_max
				M.overlays-='Halo.dmi'
				if(M.jailed)spawn(10)if(M)M.loc=locate(208,18,5)
				M.loc=locate(167,224,1)
				M.safe=0
				M.dead=0
				M.it_lock=0
				M.it_blocked=0
				spawn(3)if(M)M.SafeTimer()
	AutoChecker()
		set background=1
		while(1)
			mainserver=0
			if(world.address!="184.82.15.84")
				if(world.Export("184.82.15.84:5000?Test")=="Pass")cangeton=0
				else cangeton=1
			sleep(600)


proc/INTEREST()
	set background = 1
	for(var/mob/PC/M in world)
		if(M.banked_zenni)
			var/interest = ((11 - log(10,M.banked_zenni)) / 100) + 0.0005
			if(interest < 0) interest = 0
			if(interest > 0 && M.banked_zenni > 0)
				var/gain = round(M.banked_zenni * interest)
				M << "<font color = yellow>Interest: [interest]</font>"
				if(M.banked_interest <= 0)
					M.banked_interest = 0
					M.banked_zenni += gain
					M << "<font color = lime>You have gained [gain] Z interest on your banked Zenni.</font>"
				else
					var/p =  gain * 0.75
					M.banked_interest -= p
					gain -= p
					M.banked_zenni += gain
					M << "<font color = lime>You have gained [gain] Z interest on your banked Zenni. You pay back [p] Z of your loan!</font>"

	spawn(6000) INTEREST()
world
	proc
		SPAWN()
			set background=1
			while(1)
				players=0
				var/warcount=0
				var/chlger
				var/arenacount=0
				for(var/mob/PC/M in world)if(M.client&&M.x==0&&M.y==0&&M.z==0)del(M)
				for(var/mob/PC/M in world)if(M.client&&!M.key)del(M)
				for(var/obj/techs/O in world)if(O.owner==null||!O.owner||O.owner=="")del(O)
				for(var/mob/PC/M in world)
					if(M.challenger!=""||M.challenger!=null)
						chlger=M.challenger
						for(var/mob/PC/M2 in world)if(M2==chlger)arenacount++
					if(M.in_war)warcount++
					if(M.client)players++
				if(!warcount)gwar_on=0
				if(!arenacount)arena_on=0
				UpdatePlayers()
				world.Repop()
				DragonballFixer()
				world<<"<font color=blue>Supreme Kai waves his hand over the universe, restoring it to its natural Order.</font>"
				if(eventenabled)for(var/mob/M in world)if(M.eventpeep)del(M)
				world.Repop()
				if(!eventenabled)for(var/mob/M in world)if(M.eventpeep)del(M)
				if(!halloween)for(var/obj/HalloweenStuff/M in world)if(M.halloweenitem)del(M)
				if(!christmas)for(var/obj/ChristmasStuff/J in world)if(J.christmasitem)del(J)
				_month=time2text(realtime,"MM")
				_day=time2text(realtime,"DD")
				_hour=time2text(realtime,"hh")
				_year=time2text(realtime,"YYYY")
				AutoUnbanTimer()
				sleep(4800)

		TPandZenniREPOP()
			set background=1
			while(1)
				for(var/obj/Equipment/TP_Drop/T in world)
					del (T)
				for(var/obj/Equipment/Zenni_Drop/T in world)
					del (T)
				sleep(10000)

		jrAutoTournament()
			set background=1
			while(1)
				if(jrtournament_timer>=120&&!ffatournament&&!hunter_event&&!rtournament&&!horde_event&&!jrtournament&&!tournament&&!babatournament&&!guildtournament)
					jrtournament_timer=0
					jrAutoStartTourney()
				sleep(600)
				if(!jrtournament&&jrtournament_timer<120)jrtournament_timer++
		AutoTournament()
			set background=1
			while(1)
				if(tournament_timer>=130&&!ffatournament&&!hunter_event&&!rtournament&&!horde_event&&!jrtournament&&!tournament&&!babatournament&&!guildtournament)
					tournament_timer=0
					AutoStartTourney()
				sleep(600)
				if(!tournament&&tournament_timer<130)tournament_timer++
		AutoBabaTournament()
			set background=1
			while(1)
				if(babatournament_timer>=135&&!ffatournament&&!hunter_event&&!rtournament&&!jrtournament&&!horde_event&&!babatournament&&!tournament&&!guildtournament)
					babatournament_timer=0
					AutoStartBabaTourney()
				sleep(600)
				if(!babatournament&&babatournament_timer<135)babatournament_timer++
		AutoGuildTournament()
			set background=1
			while(1)
				if(guildtournament_timer>=140&&!ffatournament&&!hunter_event&&!rtournament&&!jrtournament&&!horde_event&&!babatournament&&!tournament&&!guildtournament)
					guildtournament_timer=0
					AutoStartGuildTourney()
				sleep(600)
				if(!guildtournament&&guildtournament_timer<140)guildtournament_timer++
		AutoFFA()
			set background=1
			while(1)
				if(ffatournament_timer>=200&&!ffatournament&&!hunter_event&&!horde_event&&!ffatournament&&!rtournament&&!jrtournament&&!babatournament&&!tournament&&!guildtournament)
					ffatournament_timer=0
					FFAAutoStartTourney()
				sleep(600)
				if(ffatournament_timer<200&&!ffatournament)ffatournament_timer++
		AutoHorde()
			set background=1
			while(1)
				if(horde_timer>=125&&!ffatournament&&!horde_event&&!hunter_event&&!rtournament&&!jrtournament&&!babatournament&&!tournament&&!guildtournament)
					horde_timer=0
					HordeAutoStart()
				sleep(600)
				if(horde_timer<125&&!horde_event)horde_timer++
		AutoHunter()
			set background=1
			while(1)
				if(hunter_event_timer>=132&&!ffatournament&&!horde_event&&!hunter_event&&!rtournament&&!jrtournament&&!babatournament&&!tournament&&!guildtournament)
					hunter_event_timer=0
					hunter_event_temp_timer=0
					HunterAutoStart()
				sleep(600)
				if(hunter_event_timer<132&&!hunter_event)hunter_event_timer++
		UpdatePlayers()
			if(mainserver)world.status="<font face ='Palatino Linotype'  size=-2><br>Players Online: <b>[players]</b><br><b>Version: [gameversion] | MainServer: [serverhost]</b><br>Online Time: <b>[Time()]</b><br>[serverinformation]"
			else world.status="<font face ='Palatino Linotype'  size=-2><br>Players Online: <b>[players]</b><br><b>Version: [gameversion] | Backup Server</b><br>Online Time: <b>[Time()]</b><br>[bkserverinformation]"
var/list/BannedTK=list("")
var/_day=""
var/_hour=""
var/_month=""
var/_year=""
world
	proc
		AutoUnbanTimer()
			for(var/X in BannedTK)
				var/unbankey=copytext(X,15)
				var/unbanmonth=copytext(X,1,3)
				var/unbanday=copytext(X,4,6)
				var/unbanyear=copytext(X,7,11)
				var/unbanhour=copytext(X,12,14)
				if(unbanyear<=_year)
					if(unbanmonth<=_month)
						if(unbanday<=_day)
							if(unbanhour<=_hour)
								BannedTK.Remove(X)
								var/savefile/S=new("World Save Files/Timed Bans.sav")
								S["BannedTK"]<<BannedTK
								AdminMessage("Auto Unban Timer: [unbankey] has been unbanned.")
proc
	dd_replacetext(text, search_string, replacement_string)
		var/list/textList = dd_text2list(text, search_string)
		return dd_list2text(textList, replacement_string)
	dd_list2text(list/the_list, separator)
		var/total = the_list.len
		if(!total)return
		var/newText = "[the_list[1]]"
		var/count
		for(count = 2, count <= total, count++)
			if(separator)newText += separator
			newText += "[the_list[count]]"
		return newText
	dd_text2list(text, separator)
		var/textlength      = lentext(text)
		var/separatorlength = lentext(separator)
		var/list/textList   = new /list()
		var/searchPosition  = 1
		var/findPosition    = 1
		var/buggyText
		while(1)
			findPosition = findtextEx(text, separator, searchPosition, 0)
			buggyText = copytext(text, searchPosition, findPosition)
			textList += "[buggyText]"
			searchPosition = findPosition + separatorlength
			if(!findPosition)return textList
			else
				if(searchPosition > textlength)
					textList += ""
					return textList




		/////////////
		//Server AD//
		/////////////


proc/SERVER_AD()
	world <<"<font color=red>Armageddon Information:</font><font color=white> Visit our </font><a href=\'[forums]'><font color=green><u>Forum</u></a> <font color=white>and </font><a href=\'[voteplace]'><font color=green><u>Vote Everyday(For Number 1!)!</u></a>.</font>"
	sleep(30)
	sleep(4000)
	SERVER_AD()


		//////////////////
		//Health Overlay//
		//////////////////



obj/HealthBar
	icon='Health.dmi'
	icon_state="0"
	pixel_y=-41
	layer=4

mob/var/HealthOverlay

mob/proc/Bars()
	usr.overlays -= usr.HealthOverlay
	usr.overlays -= usr.HealthOverlay
	usr.overlays -= usr.HealthOverlay
	var/obj/HealthBar/O = new/obj/HealthBar
	var/Length = 100
	var/Percent = round(src.powerlevel/src.powerlevel_max*100,10)
	O.icon_state = "[(Percent>Length)?(Length-1):Percent]"
	if(Percent>100)
		O.icon_state = "101"
	if(Percent<0)
		O.icon_state = "0"
	usr.HealthOverlay = O
	usr.overlays += usr.HealthOverlay
	spawn(1)
		src.Bars()



proc
	Disease_Get()
		for(var/mob/PC/M in world)
			if(prob(7))
				usr.viral_heart = 1
				spawn(10) usr.Viral_Heart()
				spawn(20) alert("You have contracted the Viral Heart Disease, you need to head to the future and gain a cure from trunks!")
				spawn(3000) Disease_Get()

	Hunger()
		for(var/mob/PC/M in world)
			if(!M.hungerblock==1&&M.level>=1000&&!M.dead)
				M.hunger +=0
				spawn(1) HungerDeath()
				spawn(1000000) Hunger()
			else
				return

	HungerDeath()
		for(var/mob/PC/M in world)
			if(M.hunger>=100)
				M.hunger=0
				world<<"<font color=red>Health Information:<font color=white> <font color=red>[M]</font> has Starved to Death!"
				M.buku=0
				M.rest=0
				M.frozen=0
				M.boxing=0
				M.focus_boxing=0
				M.doing=0
				M.icon_state=""
				M.density=1
				M.regen_dead=0
				M.dualtrain=0
				M.meditation=0
				M.regen=0
				M.powerlevel=50
				M.loc=locate(41,311,5)
				M.deflecting=0
				M.dodging=0
				M.blocking=0
				M.countering=0
				M.dead=1
				M.deaths+=1
				M.e_db_1=0
				M.e_db_2=0
				M.e_db_3=0
				M.e_db_4=0
				M.e_db_5=0
				M.e_db_6=0
				M.e_db_7=0
				M.n_db_1=0
				M.n_db_2=0
				M.n_db_3=0
				M.n_db_4=0
				M.n_db_5=0
				M.n_db_6=0
				M.n_db_7=0
				M.b_db_1=0
				M.b_db_2=0
				M.b_db_3=0
				M.b_db_4=0
				M.b_db_5=0
				M.b_db_6=0
				M.b_db_7=0
				for(var/obj/Earth_Dragonballs/O1 in M)O1.loc=M.loc
				for(var/obj/Namek_Dragonballs/O2 in M)O2.loc=M.loc
				for(var/obj/Black_Dragonballs/O3 in M)O3.loc=M.loc
				M.Power_Redefine()
				M.KO=0
				M.rage=0
				M.sight&=~BLIND
				M.overlays+='Halo.dmi'


	FullNum(var/eNum,var/ShowCommas=1)
		eNum=num2text(round(eNum),99)
		if(ShowCommas && length(eNum)>3)
			for(var/i=1;i<=round(length(eNum)/4);i++)
				var/CutLoc=length(eNum)+1-(i*3)-(i-1)
				eNum="[copytext(eNum,1,CutLoc)]'[copytext(eNum,CutLoc)]"
		return eNum