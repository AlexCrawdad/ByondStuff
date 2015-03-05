client
	proc
		LoadChar(S)
			screen=null
			if(S==1)
				var/savefile/F=new("Player Saves/[ckey]/Slot 1.sav")
				F["name"]>>mob.name
				F["mob"]>>mob
				F["x"]>>mob.x
				F["y"]>>mob.y
				F["z"]>>mob.z
				F["VP"]>>mob.VP
				F["Valiants"]>>mob.Valiants
				F["Yessub"]>>mob.Yessub
			if(S==2)
				var/savefile/F=new("Player Saves/[ckey]/Slot 2.sav")
				F["name"]>>mob.name
				F["mob"]>>mob
				F["x"]>>mob.x
				F["y"]>>mob.y
				F["z"]>>mob.z
				F["VP"]>>mob.VP
				F["Valiants"]>>mob.Valiants
				F["Yessub"]>>mob.Yessub
			if(S==3)
				var/savefile/F=new("Player Saves/[ckey]/Slot 3.sav")
				F["name"]>>mob.name
				F["mob"]>>mob
				F["x"]>>mob.x
				F["y"]>>mob.y
				F["z"]>>mob.z
				F["VP"]>>mob.VP
				F["Valiants"]>>mob.Valiants
				F["Yessub"]>>mob.Yessub
		SaveChar()
			if(!src||!mob||!mob.loggedin||cantsaveatall)return
			mob.UpdateDisplayIcon()
			if(mob.save_file_1)
				var/savefile/F=new("Player Saves/[ckey]/Slot 1.sav")
				F["name"]<<mob.name
				F["mob"]<<mob
				F["x"]<<mob.x
				F["y"]<<mob.y
				F["z"]<<mob.z
				F["PI"]<<mob.displayicon
				F["VP"]<<mob.VP
				F["Valiants"]<<mob.Valiants
				F["Yessub"]<<mob.Yessub
			if(mob.save_file_2)
				var/savefile/F=new("Player Saves/[ckey]/Slot 2.sav")
				F["name"]<<mob.name
				F["mob"]<<mob
				F["x"]<<mob.x
				F["y"]<<mob.y
				F["z"]<<mob.z
				F["PI"]<<mob.displayicon
				F["VP"]<<mob.VP
				F["Valiants"]<<mob.Valiants
				F["Yessub"]<<mob.Yessub
			if(mob.save_file_3)
				var/savefile/F=new("Player Saves/[ckey]/Slot 3.sav")
				F["name"]<<mob.name
				F["mob"]<<mob
				F["x"]<<mob.x
				F["y"]<<mob.y
				F["z"]<<mob.z
				F["PI"]<<mob.displayicon
				F["VP"]<<mob.VP
				F["Valiants"]<<mob.Valiants
				F["Yessub"]<<mob.Yessub

mob/Logout()
	..()
	del(src)
mob/PC/Logout()
	GMLevel=0
	LogOutGM()
	if(guild_war_starter==src&&guild_name==guild_war_1)
		world<<"<font color=red><u>Guild Information:</u></font><font color=white>[guild_war_2] has won against [guild_war_1]!"
		guild_war_1=null
		guild_war_2=null
		for(var/mob/PC/M in world)
			if(M.in_war)
				M.loc=locate(246,54,1)
				M.it_lock=0
				M.in_war=0
				M.it_blocked=0
				M.verbs-=new/mob/GuildVerbsWar/verb/Guild_War_Join
		guild_war_starter=null
		gwar_on=0
	if(guild_war_starter==src&&guild_name==guild_war_2)
		world<<"<font color=red><u>Guild Information:</u></font><font color=white>[guild_war_1] has won against [guild_war_2]!"
		guild_war_1=null
		guild_war_2=null
		for(var/mob/PC/M in world)
			if(M.in_war)
				M.loc=locate(246,54,1)
				M.it_lock=0
				M.in_war=0
				M.verbs-=new/mob/GuildVerbsWar/verb/Guild_War_Join
				M.it_blocked=0
		guild_war_starter=null
		gwar_on=0
	if(in_war)
		if(guild_name==guild_war_1)guildies1-=1
		if(guild_name==guild_war_2)guildies2-=1
		GuildWarCheck()
	for(var/obj/Earth_Dragonballs/O1 in src)O1.loc=loc
	for(var/obj/Namek_Dragonballs/O2 in src)O2.loc=loc
	for(var/obj/Black_Dragonballs/O3 in src)O3.loc=loc
	for(var/mob/M in world)
		if(M.dtpartner==src)
			M.dualtrain=0
			M.dtpartner=null
			M.icon_state=""
			M.doing=0
	if(tourny)Entries.Remove(src)
	if(jrtourny)jrEntries.Remove(src)
	for(var/mob/M in world)if(fused&&name==M.name&&M.fused)M.UnFuse()
	if(guild_challenger)guild_challenger:WinGuild("[name]")
	if(challenger)challenger:WinArena("[name]")
	for(var/obj/Tech/T in world)if(T.owner==src)del(T)
	verbs-=new/mob/System/Admin/Verbs/OwnerGM/verb/Demote_Admin
	verbs-=new/mob/System/Admin/Verbs/OwnerGM/verb/Promote_Admin
	src<<browse(null)
	del(src)

mob
	var
		tmp/afktime=0
	proc
		WinGuild(T)
			world<<"<font color=red><u>Guild Information:</u></font><font color=white> [T] has been defeated by [src]!"
			guild_challenge=0
			guild_challenge_rank ++
			guild_challenger=""
			guild_challenging=0
			loc=locate(167,194,1)
		WinArena(T)
			loc=locate(235,135,1)
			it_lock=0
			it_blocked=0
			challenge=0
			arena_win++
			challenger=""
			arena_on=0
			in_arena=0
			world<<"\yellow Arena Battle: \white [src] has won the challenge against [T]!"
client
	proc
		AutoSave()
			set background=1
			spawn while(1)
				if(cantsaveatall||!src)break
				src<<"<u>[servername]:</u></font> Character <font color=green>saved</font>!"
				SaveChar()
				sleep(6000)
