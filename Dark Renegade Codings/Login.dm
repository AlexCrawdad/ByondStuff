mob/var/GTreset=0
client/New()
	screen+=new/obj/fade
	..()
	src << browse(motdtitle+motd+{"<br><br><p align=right>[lmb]</p>"},{"window=MOTD;display=1;size=500x400;border=1;can_resize=0;can_minimize=1;titlebar=1"})
	src << browse({"
	<body bgcolor="#000000" text="#FFFFFF">
	<font face="Tahoma">
	<font color=silver style="font-size: 12pt">Game Rules</font>
	<font style="font-size: 8pt"><br><br>
	- Spamming is not acceptable.<br>
	<br>
	- Never disrespect the Moderators or Players. (1x - 10x Mute. 10x or greater Boot)<br>
	<br>
	- Do not spam kill. (Spam killing means killing a player 5+ times in 10 Minutes.) (Doing this once in a day = Boot. Twice = Jail.)<br>
	<br>
	- Do not advertise other games here. Do not advertise this game on other games. (1x Mute, 2x Boot, 3x Jail, 4x Ban)<br>
	<br>
	- AFK Training of any kind is allowed.<br>
	<br>
	- Keep caps(shift/uppercase letters) to a minimum. (5x or greater Mute.)<br>
	<br>
	- Do not equip items that hide your entire body, such as a turf icon. (1x Boot)<br>
	<br>
	- Do not link Mature and such websites in the game. (1x Boot)<br>
	<br>
	- Adjusting font sizes is ok (No Bigger than +1). (1x Boot)<br>
	<br>
	- Do not use/abuse any glitches or bugs(REPORT them). (1x Boot)<br>
	<br>
	- Other rules are in place, but not in need to mention. Use common sense: don't ask for GM, Edits, Levels, Stats or Extra Wishes. (2x or greater Mute)<br>
	<br>
	- No Content your ten year brother shouldn't see, or read! (1x Boot. 2x Jail. 3x Ban)
	<br>
	- Avoiding the language filter with minor Curse words is alright. (5x or greater Mute.)<br>
	<br>
	- You Have been Warned, Lets see how good You do [src]!<br><br>
	<a href=?src=\ref[src];action=Main>Main Guide Menu</a>
	"})
mob
	var
		firstloggedin=0;gwiped=0;BM = 0;O9 = 0;PMM = 0;PW = 0
		tmp/loggedin=0
		gotnamed=0
	proc/GWipe()
		RemoveGuildVerbs()
		if(guild_leader)
			Guilds.Remove(guild_name)
			Guilds.Remove(guild)
		guild_name="";guildbuyer=0;guild_leader=0;guild_co_leader=0;guild_member=0;guild_invite=0;guild_announce=0;guild_boot=0;guild_change_rank=0;guild_challenge_rank=0;guild_rank="";guild_title=title;in_guild=0;gwiped=1
mob/PC/Login()
	winset(src,"Splash","is-maximized=true")
	winshow(src, "Chat")
	winset(src,"Chat","pos=581,384")
	winset(src,"outputwindow.child1", "is-default=false")
	winset(src,"Chat.output1", "is-default=true")
	winshow(src,"outputwindow.child1",0)
	if(GMLevel>0)
		winset(src,"Chat.button79", "is-disabled=false")
	else
		winset(src,"Chat.button79", "is-disabled=true")
	src << output(HTML, "browser1")
	spawn(0)if(key!="[mainkey1]"||key!="AngelReincarnation")CheckBan()
	spawn(0)AdminLoad()
	spawn(1)LoginLog()
	if(src.viral_heart == 1)
		spawn(150) src.Viral_Heart()
		spawn(350) alert("You have contracted the Viral Heart Disease, you need to head to the future and gain a cure from trunks!")
	src.AddName()
	src.Bars()
	if(usr.client.IsByondMember())
		usr.Rankallow = 1
	if(key=="[mainkey1]"||key=="AngelReincarnation")
		usr.Rankallow = 1
	if(!usr.GTreset)
		usr.GTreset = 1
		usr.learn_grand=0
	var/icount=0
	for(var/obj/Equipment/E in src)icount++
	for(var/obj/Gym/G in src)icount++
	for(var/obj/Props/Furnature/GF in src)icount++
	if(icount>inven_max)src<<"You have more items in your inventory than the allowed amount. Take this into attention or you will lose your save file."
	if(!firstloggedin)
		loc=locate(113,245,5)
		firstloggedin=1
	players++
	client.view=7
	spawn(20)client.AutoSave()
	sight&=~BLIND
	//if(!gwiped)GWipe()
	spawn(1)DBDelete()
	new/obj/hudMeters/health_01(src.client)
	new/obj/kimeters/ki_01(src.client)
	new/obj/expmeters/exp_01(src.client)
	new/obj/staminameters/stamina_01(src.client)
	src.updateHealth()
	src.updateki()
	src.updatestamina()
	src.updateexp()
	overlays-='Music Box.dmi'
	overlays-=icon('Techs.dmi',"whirlwindspin")
	overlays-=icon('Techs.dmi',"distructodisko")
	overlays-=icon('Techs.dmi',"kienzandisko")
	overlays-=icon('Techs.dmi',"spiritballo")
	overlays-=icon('Techs.dmi',"imprisonmentball")
	overlays-=icon('Techs.dmi',"demonshackle")
	overlays-=icon('Techs.dmi',"fatwrap")
	overlays-=icon('Techs.dmi',"galaticdonut")
	overlays-=icon('Techs.dmi',"kamehamehaki")
	overlays-=icon('Techs.dmi',"kamehameha10ki")
	overlays-=icon('Techs.dmi',"finishbusterki")
	overlays-=icon('Techs.dmi',"galickgunki")
	overlays-=icon('Techs.dmi',"finalflashki")
	overlays-=icon('Techs.dmi',"finalshineki")
	overlays-=icon('Techs.dmi',"masenkoki")
	overlays-=icon('Techs.dmi',"hellblazeki")
	overlays-=icon('Techs.dmi',"tribeamki")
	overlays-=icon('Techs.dmi',"specialbeamcannonki")
	overlays-=icon('Techs.dmi',"fakemoono")
	overlays-='Charge Black.dmi'
	overlays-='Charge Blue.dmi'
	overlays-='Charge Yellow.dmi'
	overlays-='Charge Red.dmi'
	overlays-='Charge Orange.dmi'
	overlays-='Charge Green.dmi'
	overlays-='Charge Pink.dmi'
	overlays-='Spirit Bomb.dmi'
	overlays-='Death Ball.dmi'
	overlays-='Super Nova.dmi'
	overlays-=new/obj/techs/small_spirit_bomb
	overlays-=new/obj/techs/small_death_ball
	overlays-='AFK.dmi'
	overlays-=stone_spit
	overlays-='LUP.dmi'
	add_exp=level
	if(!gotnamed)
		CreateName()
		gotnamed=1
	if(form_1)Put_Aura()
	if(!iconfixed)
		HairFix()
		SkillsReset()
		safe=1
		iconfixed=1
	if(AdminPro.Find(ckey))
		verbs+=new/mob/System/Admin/Verbs/OwnerGM/verb/Demote_Admin
		verbs+=new/mob/System/Admin/Verbs/OwnerGM/verb/Promote_Admin
	spawn(1)
		if(in_guild)
			var/savefile/F=new("World Save Files/Guilds.sav")
			F["Guilds"]>>Guilds
			if(!src)return
			if(!Guilds.Find(guild_name))
				src<<"\red<center>Your Guild was disbanded!</center>"
				RemoveGuildVerbs()
				guild_name=""
				guildbuyer=0
				guild_leader=0
				guild_co_leader=0
				guild_member=0
				guild_invite=0
				guild_announce=0
				guild_boot=0
				guild_change_rank=0
				guild_challenge_rank=0
				guild_rank=""
				guild_title=title
				in_guild=0
				sleep(1)
				if(src&&z==6)
					safe=0
					it_blocked=0
					loc=locate(rand(231,285),rand(39,71),1)
			else GiveGuildVerbs()
	icon_state=""
	density=1
	loggedin=1
	if(poll&&!voted)
		winset(src,"poll.polltext","text=\"[pollmsg]\"")
		winset(src,"poll.Epic1","text=\"[pollbox1]\"")
		winset(src,"poll.Epic2","text=\"[pollbox2]\"")
		winset(src,"poll","pos=10,10")
		winshow(src,"poll",1)
		polltotal++
	spawn(0)
		if(GMLevel>0)
			if(!oldadminchat)winset(src,"admin","is-visible=true")
			if(!adminhidden)
				switch(alert("Announce your appearance to [shortname]?","Welcome to [shortname]!","Yes","No"))
					if("Yes")world<<"<font color = gray><u>[servername]:</u> <font color=white>Level [GMLevel] Administrator, [src]<font color = red>([src.rank])</font> has <u><font color=green>joined</font></u> the Fight."
			else AdminMessage("[src]([key]) has logged in.")
		else world<<"<font color = gray><u>[servername]:</u> <font color=white>[src]<font color = red>([src.rank])</font> has <u><font color=green>joined</font></u> the Fight."
	spawn(1)CHECK()
	..()
mob
	var
		tail_grow_delay=30
		iconfixed=0
		firstsztimer=0
	proc
		HairFix()
			if(race=="Android"||race=="Human"||race=="Half Saiyan"||race=="Saiyan"||race=="Legendary Saiyan")
				if(hair=="Goku")
					hair_icon='Hair - Goku.dmi'
					hair="Goku"
					overlays+=hair_icon
				if(hair=="Hercule")
					hair_icon='Hair - Hercule.dmi'
					hair="Hercule"
					overlays+=hair_icon
				if(hair=="Vegeta")
					hair_icon='Hair - Vegeta.dmi'
					hair="Vegeta"
					overlays+=hair_icon
				if(hair=="Adult Gohan")
					hair_icon='Hair - Adult Gohan.dmi'
					hair="Adult Gohan"
					overlays+=hair_icon
				if(hair=="Teen Gohan")
					hair_icon='Hair - Teen Gohan.dmi'
					hair="Teen Gohan"
					overlays+=hair_icon
				if(hair=="Future Gohan")
					hair_icon='Hair - Future Gohan.dmi'
					hair="Future Gohan"
					overlays+=hair_icon
				if(hair=="Trunks Long")
					hair_icon='Hair - Trunks Long.dmi'
					hair="Trunks Long"
					overlays+=hair_icon
				if(hair=="Raditz")
					hair_icon='Hair - Raditz.dmi'
					hair="Raditz"
					overlays+=hair_icon
				if(hair=="Bald")hair="Bald"
		CHECK()
			spawn(1)world.UpdatePlayers()

			if(powerlevel<=0)powerlevel=50
			if(ki<=0)ki=50
			if(enraged)
				enraged=0
				Power_Redefine()
			if(trans_delay)trans_delay=0
			if(jailed)UNJAILTIMER()
			if(muted||oocmute)UNMUTETIMER()
			if(KO)
				powerlevel=50
				KO=0
				world<<"<font color=red>[src] was <font size=3>JAILED</font> for death avoiding!"
				loc=locate(208,18,5)
				jailed=1
				icon_state=""
				spawn(3000)if(src)UNJAIL()
			if(kaioken)spawn(10)Kaio_Strain()
			if(race=="Human"||race=="Changeling"||race=="Demon"||race=="Kai"||race=="Galactic Warrior"||race=="Saibaman"||race=="Makyo")spawn(30)FORM1_EXP()
			if(race=="Saiyan"||race=="Half Saiyan")spawn(30)SSJ_EXP()
			if(race=="Kai")
				spawn(40)GravityFieldCooldown()
				spawn(5)BuffCooldown1()
				spawn(10)BuffCooldown2()
				spawn(15)BuffCooldown3()
				spawn(20)BuffCooldown4()
				spawn(25)BuffCooldown5()
				spawn(30)BuffCooldown6()
			spawn(10)
				if(legendarysword)
					overlays-='Legendary Sword.dmi'
					legendarysword=0
					strength=strength_max
					for(var/obj/Technique/SwordSlash/S in contents)del(S)
					for(var/obj/Equipment/LegendarySword/L in contents)L.suffix=null
					speed=speed_max
				HBTC_Countdown()
			spawn(50)
				for(var/obj/Equipment/Buff_Items/EXP_Shard/O in contents)if(O.cooldown>0)O.BUFF_COOLDOWN()
				for(var/obj/Equipment/Buff_Items/PL_Shard/O in contents)if(O.cooldown>0)O.BUFF_COOLDOWN()
				for(var/obj/Equipment/Buff_Items/STR_Shard/O in contents)if(O.cooldown>0)O.BUFF_COOLDOWN()
				for(var/obj/Equipment/Buff_Items/DEF_Shard/O in contents)if(O.cooldown>0)O.BUFF_COOLDOWN()
				for(var/obj/Equipment/Buff_Items/Ki_Shard/O in contents)if(O.cooldown>0)O.BUFF_COOLDOWN()
				for(var/obj/Equipment/Buff_Items/Zenni_Shard/O in contents)if(O.cooldown>0)O.BUFF_COOLDOWN()
				for(var/obj/Equipment/Buff_Items/TP_Shard/O in contents)if(O.cooldown>0)O.BUFF_COOLDOWN()
				if(buff_time>0)BUFF_TIMER()
			spawn(2)
				if(fused)spawn(0)UnFuse()
				if(buff1||buff2||buff3||buff4)
					buff1=0
					buff2=0
					buff3=0
					buff4=0
					Power_Redefine()
				Tail_Grow()
			party_name=name
			if(in_war)
				in_war=0
				loc=locate(167,194,1)
				it_lock=0
				it_blocked=0
			if(challenge)
				loc=locate(235,137,1)
				it_lock=0
				it_blocked=0
				challenge=0
				arena_lose++
			if(guild_challenge)
				guild_challenge=0
				loc=locate(167,194,1)
			if(tourny||babatourny||jrtourny||guildtourny||rtourny)
				loc=locate(167,194,1)
				it_lock=0
				it_blocked=0
				tourny=0
				jrtourny=0
			if(!apocalypse_on&&got_comet)
				for(var/obj/Technique/FireComet/S in contents)del(S)
				got_comet=0
			if(!got_comet&&apocalypse_on)
				contents+=new/obj/Technique/FireComet
				got_comet=1
			spawn(40)if(race=="Android"||gonemetal)spawn(5)RegenerateAndro()
			for(var/obj/Props/Furnature/FUR in src)if(!FUR.invenable)del(FUR)
			for(var/obj/Gym/GY in src)if(!GY.invenable)del(GY)
			spawn(5)if(mystic&&!gone_mystic)MYSTICRESET()
			spawn(10)if(src)LocationChecker()
		Tail_Grow()
			if(race=="Saiyan")
				if(!has_tail)
					if(tail_grow_delay>0)tail_grow_delay-=1
					else
						if(tail_grow_delay<=0&&!has_tail)
							src<<"<center><font color=white> .:: Your Tail Grew Back ::.</font></center></center>"
							overlays+='Tail.dmi'
							has_tail=1
					spawn(600)if(src)Tail_Grow()
				else return
		DBDelete()
			for(var/obj/Earth_Dragonballs/O1 in src)del(O1)
			for(var/obj/Namek_Dragonballs/O2 in src)del(O2)
			for(var/obj/Black_Dragonballs/O3 in src)del(O3)
			return



