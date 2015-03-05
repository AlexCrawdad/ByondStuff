mob
	var
		tmp
			lasttext="";chatcount=0;chatcount2=0;captimes=0
		muted=0;mute_time=0;sugg_delay=0;bug_delay=0
var/World_Mute = 0
var/list/SIZER=list("<font","size")
var/list/PROFANITY=list("byond://","wwww.","www.",".com","http://",".net",".gov",".tv",".nl",".co.uk","dick","gay","sex","sexy","smexy","smex","fuck","cunt","shit","asshole","nigger","cock","faggot","bitch","fag","biatch","bish","a$$hole","fuk","fck","fcuk","sht","penis","effer","arse","hll","rape","shit","bitch","pussy","cunt","nigga","chink","slut","rape","r@pe","r4pe","rap3","r@p3","r4p3","r a p e","fuck","retard","dickhead","bullshit","penis","dick","b!tch","kok","cok","kock","ahole","dafuq","dafuck","Dafuq","ass","Ass","piss","whore","slut","hoe","prick","coochi","vag","vagina","vulva","boobs","tits","cum","sperm","nude","naked","panties","underwear","under wear","porn")
var/list/SPAM=list("\n")
mob/proc/Check_For_Profanity(T as text,var/list/L)
	for(var/V in L)if(findtext(T,V))return TRUE
mob/proc/Check_For_Spam(T as text,var/list/L)
	for(var/V in L)if(findtext(T,V))return TRUE
var/smiley/S=new
mob/PC/verb/OOC(T as text)
	set category="Channels"
	if(!T||T=="")return
	ChatLog(usr,"OOC: [T]")
	if(VoteMute.Find(key))
		usr<<"You are muted!"
		return
	if(channelmute!=""&&!GMLevel)
		usr<<"All chat channels have been muted."
		return
	if(muted||oocmute||mutedperm)
		usr<<"You are muted!"
		return
	for(var/mob/M in world)
		if(M!=usr)
			if(M.client)
				if(M.client.address == client.address)
					if(M.muted&&M.GMLevel<=0||M.oocmute||M.mutedperm)
						if(!GMLevel)
							usr<< "Your another character is muted, hence you cannot MUTE AVOID!"
							return
	if(World_Mute&&!GMLevel)
		usr<< "The World is muted!"
		return
	if(say_delay>=5&&!GMLevel)
		usr<<"You have Been Muted <font color=red>muted</font> for 10 seconds for \red SPAM."
		say_delay=0
		oocmute=1
		spawn(100)if(usr&&oocmute)
			oocmute=0
			usr<<"You have been automatically unmuted!</font>"
		return
	if(CapsCount(T)<0)

		usr<<"Your Message may not Contain too many \red Caps."
		T=copytext(T,1,151)
		return
	if(Check_For_Profanity(T,PROFANITY)==TRUE)

		usr<<"Your Message may not Contain \red LANGUAGE."
		T=copytext(T,1,151)
		return

	if(lentext(T)>400)

		usr<<"Your message can not exceed 400 characters."
		T=copytext(T,1,151)
		return
	if(Check_For_Spam(T,SPAM)==TRUE)
		usr<<"Please do not use linebreak characters."
		return

	for(var/mob/M in world)
		if(afk)
			world<<"<font color=white>[usr] is \green back."
			afk=0
			overlays-='AFK.dmi'
		if(M.Ignored.Find(src))
			return
		if(!GMLevel)
			if(M.ooc_on)
				if(in_guild)

					M<<{"<font color=white>{[guild_name]}{[guild_title]}{[src.rank]}<font color=[namecolor]> [usr]</font> OOC:<font color = [textcolor]> [s_smileys(T)]"}
					T=copytext(T,1,151)
				else
					if(!in_guild)

						M<<{"<font color=white>{[title]}{[src.rank]}<font color=[namecolor]> [usr]</font> OOC:</b><font color = [textcolor]> [s_smileys(T)]"}
						T=copytext(T,1,151)

		else
			if(in_guild)

				M<<{"<font color = red><font color=white>{[guild_name]}{[src.guild_title]}{[src.rank]}<font color=[namecolor]> [usr]</font> OOC:<font color = [textcolor]> [s_smileys(T)]"}
				T=copytext(T,1,151)

			else
				if(!in_guild)

					M<<{"<font color=white>{[title]}{[src.rank]}<font color=[namecolor]> [usr]</font> OOC:</b><font color = [textcolor]> [s_smileys(T)]"}
					T=copytext(T,1,151)

	say_delay+=1
	spawn(110)if(usr)say_delay-=1
mob/verb/ShowChatWindow()
	set hidden = 1
	winshow(src, "Chat")
	winset(src,"Chat","pos=581,384")
	winset(src,"outputwindow.child1", "is-default=false")
	winset(src,"Chat.output1", "is-default=true")
	winshow(src,"outputwindow.child1",0)
	if(src.GMLevel)
		winset(src,"Chat.button79", "is-disabled=false")
	else
		winset(src,"Chat.button79", "is-disabled=true")

mob/verb/HideChatWindow()
	set hidden = 1
	winshow(src, "Chat",0)
	winset(src,"outputwindow.child1", "is-default=true")
	winset(src,"Chat.output1", "is-default=false")
	winshow(src,"outputwindow.child1")





mob
	var
		namecolor="#FFFFFF"
		textcolor="#FFFFFF"



mob/PC/verb/Change_Name_Color(c as color)
			set category = "Channels"
			namecolor=c
mob/PC/verb/Change_Text_Color(c as color)
			set category = "Channels"
			textcolor=c

mob/PC/verb/Say(T as text)
	set category = "Channels"
	if(T==null||!T)return
	ChatLog(usr,"SAY: [T]")
	if(VoteMute.Find(key))
		usr<<"You have been muted!"
		return
	if(channelmute=="All")
		usr<<"All chat channels have been muted."
		return
	if(saymute)
		usr<<"You have been muted for Flood Supression"
		return
	if(muted||oocmute&&!GMLevel||mutedperm)
		usr<<"You have been muted!"
		return
	for(var/mob/M in world)
		if(M!=usr)
			if(M.client)
				if(M.client.address==client.address)
					if(M.muted&&!GMLevel||!GMLevel&&M.oocmute||M.mutedperm&&!GMLevel)
						usr<< "Your another character is muted, hence you cannot MUTE AVOID!"
						return
	if(say_delay>=3)
		saymute=1
		spawn(50)if(usr)saymute=0
		usr<<"You must wait 5 seconds before using say again."
		return
	if(Check_For_Spam(T,SPAM)==TRUE)
		usr<<"Please do not use linebreak characters."
		return
	if(lentext(T)>250)

		usr<<"Your message can not exceed 250 characters."
		T=copytext(T,1,151)
		return
	if(Check_For_Profanity(T,PROFANITY)==TRUE)

		usr<<"YOur Message may not Contain \red LANGUAGE."
		T=copytext(T,1,151)
		return
	view(8)<<"<font color=red><IMG CLASS=icon SRC=\ref[usr.icon]></font>[usr] says:<font color=white> [s_smileys(T)]"




mob/PC/verb/Save()
	set category = "Channels"
	if(spam_delay)return
	spam_delay=1
	if(cantsaveatall)
		usr<<"World shutdown enabled. Saving has been disabled for safety reasons."
		return
	if(!saving)
		usr<<"<font color=gray><u>[servername]:</u> Your data has been successfully saved to the server!</font>"
		client.SaveChar()
	spawn(50)if(usr)spam_delay=0
mob/PC/verb/Who()
	set category = "Channels"
	if(spam_delay)return
	spam_delay=1
	var/html
	var/count=0
	var/html_heading = {"<body bgcolor="#000000" text="#FFFFFF" link="#FFFFFF" vlink="#FFFFFF" alink="#FFFFFF">
<table width="650" border="0" bordercolor="#000000">
  <tr>
	<td width="35%"><strong><font color="#FFFFFF" face="Tahoma, Tahoma, Arial, sans-serif">Name and Key</font></strong></td>
	<td width="25%"><strong><font color="#FFFFFF" face="Tahoma, Tahoma, Arial, sans-serif">Race</font></strong></td>
	<td width="40%"><strong><font color="#FFFFFF" face="Tahoma, Tahoma, Arial, sans-serif">Guild</font></strong></td>
  </tr>
</table>

"}
	for(var/client/C)
		if(C.mob&&!C.mob.afk&&!C.mob.adminhidden)
			count++
			html += {"<table width="650" border="0" bordercolor="#000000"><hr />"}
			html += {"<td width="35%"><strong><font color="#FFFFFF" size=1 face="Tahoma, Tahoma, Arial, sans-serif">[C.mob.name](<i>[C.mob.key]</i>) </font></td>"}
			html += {"
    <td width="25%"><strong><font color="#FFFFFF" size=1 face="Tahoma, Tahoma, Arial, sans-serif">[C.mob.race]</font></td>
    <td width="40%"><strong><font color="#FFFFFF" size=1 face="Tahoma, Tahoma, Arial, sans-serif">[C.mob.guild_name]</font></td>
  </tr>
</table>"}
		if(C.mob&&C.mob.afk&&!C.mob.adminhidden)
			count++
			html += {"<table width="650" border="0" bordercolor="#000000"><hr />"}
			html += {"<td width="35%"><strong><font color="#FFFFFF" size=1 face="Tahoma, Tahoma, Arial, sans-serif">[C.mob.name](<i>[C.mob.key]</i>)<font color=red>(AFK)</font> </font></td>"}
			html += {"
    <td width="25%"><strong><font color="#FFFFFF" size=1 face="Tahoma, Tahoma, Arial, sans-serif">[C.mob.race]</font></td>
    <td width="40%"><strong><font color="#FFFFFF" size=1 face="Tahoma, Tahoma, Arial, sans-serif">[C.mob.guild_name]</font></td>
  </tr>
</table>"}
		var/count_html = {"<br><table width="650" border="0" bordercolor="#000000">
	  <tr>
	  	<hr />
	    <td width="35%"><font color="#FFFFFF" face="Tahoma, Tahoma, Arial, sans-serif"><b>Players Count: [count]</b></font></td>
	    <td width="25%"><font color="#FFFFFF" face="Tahoma, Tahoma, Arial, sans-serif"></font></td>
	    <td width="40%"><font color="#FFFFFF" face="Tahoma, Tahoma, Arial, sans-serif"></font></td>
	  </tr>
	</table>"}
		usr<<browse("[html_heading][html][count_html]","window=Hench;size=600x500;border=0;can_resize=0; can_minimize=0;")
		spawn(50)if(usr)spam_delay=0
mob
	var
		tradeon=1
		tmp/trading=0
	proc
		StartTrade(mob/PC/M)
			var/list/A=new/list()
			var/list/B=new/list()
			for(var/obj/Equipment/O1 in src)if(!O1.equiped)A.Add(O1)
			for(var/obj/Equipment/O2 in M)if(!O2.equiped)B.Add(O2)
			A.Add("Zenni")
			B.Add("Zenni")
			A.Add("Cancel")
			B.Add("Cancel")
			var/z1
			var/obj/W1
			var/obj/W2
			W1=input(src,"What do you want from [M]?")in B
			if(W1=="Cancel")
				M<<"[src] has cancelled the trade."
				src.trading=0
				M.trading=0
				return
			if(W1=="Zenni")
				z1=input("How much Zenni do you want from [M]?","",M.zenni)as num
				if(!z1||z1<=0||z1>M.zenni)
					src<<"Number not valid."
					src.StartTrade(M)
				switch(alert(M,"[src] wants: [z1] Zenni. Are you willing to trade?","Trade","Yes","No"))
					if("No")
						src<<"[M] does not want to trade."
						src.trading=0
						M.trading=0
						return
					else
						src<<"[M] accepted."
						goto TurnOver
			else
				if(W1.equiped||!W1)
					src<<"That item is not available anymore."
					src.StartTrade(M)
				if(W1 in M.contents)
					src<<"Requested trade item: \icon[W1.icon] - [W1.name]"
					switch(alert(M,"[src] wants: [W1]. Are you willing to trade it?","Trade","Yes","No"))
						if("No")
							src<<"[M] does not want to trade [W1]."
							src.trading=0
							M.trading=0
							return
						else
							src<<"[M] accepted."
							goto TurnOver
				else
					src<<"That item is not available anymore."
					src.StartTrade(M)
			TurnOver
			W2=input(M,"What do you want from [src]?")in A
			if(W2=="Cancel")
				src<<"[M] has cancelled the trade."
				src.trading=0
				M.trading=0
				return
			if(W2=="Zenni")
				var/z2=input(M,"How much Zenni do you want from [src]?","",src.zenni)as num
				if(!z2||z2<=0||z2>src.zenni)
					M<<"Number not valid."
					goto TurnOver
				switch(alert(src,"[M] wants: [z2] Zenni. Are you willing to trade?","Trade","Yes","No"))
					if("No")
						M<<"[src] does not want to trade."
						src.trading=0
						M.trading=0
						return
					else
						switch(alert(M,"[src] accepted. Go ahead with the trade?","Trade","Yes","No"))
							if("No")
								src<<"[M] does not want to trade."
								src.trading=0
								M.trading=0
							else
								if(W1=="Zenni")
									if(M.zenni<z1)
										src<<"[M] does not have enough zenni."
										M<<"You do not have enough zenni."
										src.trading=0
										M.trading=0
										return
									else
										M.zenni-=z1
										src.zenni+=z1
										M<<"Trade successful."
										src<<"Trade successful."
										src.trading=0
										M.trading=0
										return
								else
									if(W1.equiped||!W1)
										src<<"That item is not available anymore."
										src.trading=0
										M.trading=0
										return
									else
										if(src.zenni<z2)
											M<<"[src] does not have enough zenni."
											src<<"You do not have enough zenni."
											src.trading=0
											M.trading=0
											return
										if(W1 in M.contents)
											if(istype(W1,/obj/Equipment/Guild_Item)||istype(W1,/obj/Equipment/Guild_Item2))
												if(!src.in_guild)
													M<<"[src] must be in a guild to trade Guild Items."
													src<<"You must be in a guild to trade Guild Items."
													src.trading=0
													M.trading=0
													return
												else
													W1.guild=src.guild_name
													goto EndTrade
											EndTrade
											W1.loc=src
											W1.item_owner=src.key
											src.zenni-=z2
											M.zenni+=z2
											M<<"Trade successful."
											src<<"Trade successful."
											src.trading=0
											M.trading=0
											return
			else
				if(W2.equiped||!W2)
					M<<"That item is not available anymore."
					B.Remove(W2)
					goto TurnOver
				if(W2 in src.contents)
					M<<"Requested trade item: \icon[W2.icon] - [W2.name]"
					switch(alert(src,"[M] wants: [W2]. Are you willing to trade?","Trade","Yes","No"))
						if("No")
							M<<"[src] does not want to trade."
							src.trading=0
							M.trading=0
							return
						else
							switch(alert(M,"[src] accepted. Go ahead with the trade?","Trade","Yes","No"))
								if("No")
									src<<"[M] does not want to trade."
									src.trading=0
									M.trading=0
									return
								else
									if(W1=="Zenni")
										if(M.zenni<z1)
											src<<"[M] does not have enough zenni."
											M<<"You do not have enough zenni."
											src.trading=0
											M.trading=0
											return
										else
											if(W2.equiped||!W2)
												M<<"That item is not available anymore."
												src.trading=0
												M.trading=0
												return
											else
												if(W2 in src.contents)
													if(istype(W2,/obj/Equipment/Guild_Item)||istype(W2,/obj/Equipment/Guild_Item2))
														if(!M.in_guild)
															src<<"[M] must be in a guild to trade Guild Items."
															M<<"You must be in a guild to trade Guild Items."
															src.trading=0
															M.trading=0
															return
														else W2.guild=M.guild_name
													W2.loc=M
													W2.item_owner=M.key
													M.zenni-=z1
													src.zenni+=z1
													M<<"Trade successful."
													src<<"Trade successful."
													src.trading=0
													M.trading=0
													return
									else
										if(W1.equiped||!W1)
											src<<"That item is not available anymore."
											src.trading=0
											M.trading=0
											return
										if(W2.equiped||!W2)
											M<<"That item is not available anymore."
											src.trading=0
											M.trading=0
											return
										else
											if(W2 in src.contents)
												if(W1 in src.contents)
													if(istype(W2,/obj/Equipment/Guild_Item)||istype(W2,/obj/Equipment/Guild_Item2))
														if(!M.in_guild)
															src<<"[M] must be in a guild to trade Guild Items."
															M<<"You must be in a guild to trade Guild Items."
															src.trading=0
															M.trading=0
															return
														else W2.guild=M.guild_name
													if(istype(W1,/obj/Equipment/Guild_Item)||istype(W1,/obj/Equipment/Guild_Item2))
														if(!src.in_guild)
															M<<"[src] must be in a guild to trade Guild Items."
															src<<"You must be in a guild to trade Guild Items."
															src.trading=0
															M.trading=0
															return
														else W1.guild=src.guild_name
													W1.loc=src
													W2.loc=M
													W1.item_owner=src.key
													W2.item_owner=M.key
													M<<"Trade successful."
													src<<"Trade successful."
													src.trading=0
													M.trading=0
													return
				else
					M<<"That item is not available anymore."
					src.trading=0
					M.trading=0
					return
	PC
		verb
			Trade()
				set category = "Channels"
				set hidden=1
				if(trading)
					usr<<"You are currently trading with someone."
					return
				trading=1
				var/tmp/list/T=new/list()
				for(var/mob/A in oview(8))
					if(A.tradeon)T.Add(A)
				T.Add("Cancel")
				var/mob/M=input("Who do you want to trade with?")in T
				if(!T)
					trading=0
					return
				if(M=="Cancel")
					trading=0
					return
				if(!M)
					trading=0
					return
				if(M.trading)
					usr<<"[M] is currently trading with someone."
					trading=0
				if(!M.client)
					usr<<"[M.name] isn't a player!"
					trading=0
					return
				switch(alert("Do you wish to trade with [M]?","Trade","Yes","No"))
					if("No")
						trading=0
						return
					else
						switch(alert(M,"Do you wish to trade with [usr]?","Trade","Yes","No"))
							if("No")
								if(!usr)return
								trading=0
								return
							else
								if(!usr)return
								M.trading=1
								StartTrade(M)
mob
	PC
		verb
			Send_File(mob/PC/person in view(usr),filez as file)
				set category="Channels"
				if(!person.client)
					usr<<"[person] isn't a player!"
					return
				else
					switch(alert(person,"[usr] is trying to send you [filez].  Do you accept the file?","**File Transfer**","Yes","No"))
						if("Yes")
							if(!usr||!person)return
							alert("[person] accepted the file","File Accepted")
							person<<ftp(filez)
							return
						if("No")
							if(!usr||!person)return
							alert("[person] declined the file","File Declined")
							return
mob
	PC
		verb
			Game_Guide()
				set category = "Channels"
				winshow(usr,"Guide",1)
				spawn(1)mainfile()
			ServerInformation()
				set name = "Server Information"
				set category = "Channels"
				if(spam_delay)return
				spam_delay=1
				var/calcLag=abs(world.cpu-100)
				var/server="<br>Server Information:<br>"
				server+= {"<small>Hosted By: [mainname]<br>"}
				server+= {"<small>Hosted On: [world.system_type]<br>"}
				server+= {"<small>Efficiency: [calcLag]%<br>"}
				server+= {"<small>Address: byond://[world.address]:[world.port]<br>"}
				server+= {"<small>Time Online: [Time()]<br>"}
				usr<<server
				spawn(50)if(usr)spam_delay=0
			Scoreboard()
				set category = "Channels"
				switch(input("Which do you wish to view?","Scoreboard",)in list("Level","Power","Ki","Ki Defense","Strength","Defense","Cancel"))
					if("Level")
						Ranking(usr)
						RankingDisplay(usr)
					if("Power")
						PLRanking(usr)
						PLRankingDisplay(usr)
					if("Ki")
						KIRanking(usr)
						KIRankingDisplay(usr)
					if("Strength")
						STRRanking(usr)
						STRRankingDisplay(usr)
					if("Defense")
						DEFRanking(usr)
						DEFRankingDisplay(usr)
					if("Ki Defense")
						KIDEFRanking(usr)
						KIDEFRankingDisplay(usr)
					if("Cancel")return
/var/const/
	scoreboard={""}
	scoreboardtitle={"<STYLE>BODY {background: black;  color: white}</STYLE><head><title><font color=lime><b>Scoreboard</title></head></body>"}
/Rank_Entry/
	var{Name;Key;Level;Date;Kills;Power;KI;KIDEF;STR;DEF}
	New(mob/person)
		if(!person)return
		Name=(person.name)
		Key=(person.key)
		Level=(person.level)
		Date=(time2text(world.realtime))
		Kills=(person.kills)
		Power=(person.powerlevel_max)
		KI=(person.ki_max)
		KIDEF=(person.kidefense_max)
		STR=(person.strength_max)
		DEF=(person.defence_max)
/proc/
	RankingDisplay(var/mob/person)
		var/list/levels=new()
		var/savefile/F=new("World Save Files/System/Scoreboard/levels.sav")
		F[("stuff")]>>(levels)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=gray>Level<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!levels)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>#</th><th>Name <I>(key)</I></th><th>Level</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to levels.len)
				var{character=(levels[(number)]);Rank_Entry/player=(levels[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[num2text(round(player.Level),100)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	Ranking(var/mob/player)
		if(!player||!player.client)return
		var/savefile/F=new("World Save Files/System/Scoreboard/levels.sav")
		var/list/level=new()
		F[("stuff")]>>(level)
		if(!level)level=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=level.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(level[(character)])
			if(old.Level>=player.level)return score
			while(score>1)
				last=level[(level[(score-1)])]
				if(last.Level>=player.level)break
				level[(score)]=(level[(score-1)])
				level[(--score)]=(character)
				level[(level[(score+1)])]=(last)
			level[(character)]=(newest)
			F[("stuff")]<<(level)
			return score
		score=(level.len)
		if(score>=20)
			last=(level[(level[(score)])])
			if(last.Level>=player.level)return 21
			level[(score)]=(character)
		else score=(level.len+1),level+=(character)
		while(score>1)
			last=(level[(level[(score-1)])])
			if(last.Level>=player.level)break
			level[(score)]=(level[(score-1)])
			level[(--score)]=(character)
			level[(level[(score+1)])]=(last)
		level[(character)]=(newest)
		F[("stuff")]<<(level)
		return score
	KIDEFRankingDisplay(var/mob/person)
		var/list/kidef=new()
		var/savefile/F=new("World Save Files/System/Scoreboard/KIDEF.sav")
		F[("stuff")]>>(kidef)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=gray>Ki Defense<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!kidef)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>#</th><th>Name <I>(key)</I></th><th>Ki Defense</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to kidef.len)
				var{character=(kidef[(number)]);Rank_Entry/player=(kidef[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[num2text(round(player.KIDEF),100)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	KIDEFRanking(var/mob/player)
		if(!player||!player.client)return
		var/savefile/F=new("World Save Files/System/Scoreboard/KIDEF.sav")
		var/list/kidef=new()
		F[("stuff")]>>(kidef)
		if(!kidef)kidef=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=kidef.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(kidef[(character)])
			if(old.KIDEF>=player.kidefense_max)return score
			while(score>1)
				last=kidef[(kidef[(score-1)])]
				if(last.KIDEF>=player.kidefense_max)break
				kidef[(score)]=(kidef[(score-1)])
				kidef[(--score)]=(character)
				kidef[(kidef[(score+1)])]=(last)
			kidef[(character)]=(newest)
			F[("stuff")]<<(kidef)
			return score
		score=(kidef.len)
		if(score>=20)
			last=(kidef[(kidef[(score)])])
			if(last.KIDEF>=player.kidefense_max)return 21
			kidef[(score)]=(character)
		else score=(kidef.len+1),kidef+=(character)
		while(score>1)
			last=(kidef[(kidef[(score-1)])])
			if(last.KIDEF>=player.kidefense_max)break
			kidef[(score)]=(kidef[(score-1)])
			kidef[(--score)]=(character)
			kidef[(kidef[(score+1)])]=(last)
		kidef[(character)]=(newest)
		F[("stuff")]<<(kidef)
		return score
	PLRankingDisplay(var/mob/person)
		var/list/power=new()
		var/savefile/F=new("World Save Files/System/Scoreboard/PL.sav")
		F[("stuff")]>>(power)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=gray>Power<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!power)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>#</th><th>Name <I>(key)</I></th><th>Power</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to power.len)
				var{character=(power[(number)]);Rank_Entry/player=(power[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[num2text(round(player.Power),100)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	PLRanking(var/mob/player)
		if(!player||!player.client)return
		var/savefile/F=new("World Save Files/System/Scoreboard/PL.sav")
		var/list/power=new()
		F[("stuff")]>>(power)
		if(!power)power=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=power.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(power[(character)])
			if(old.Power>=player.powerlevel_max)return score
			while(score>1)
				last=power[(power[(score-1)])]
				if(last.Power>=player.powerlevel_max)break
				power[(score)]=(power[(score-1)])
				power[(--score)]=(character)
				power[(power[(score+1)])]=(last)
			power[(character)]=(newest)
			F[("stuff")]<<(power)
			return score
		score=(power.len)
		if(score>=20)
			last=(power[(power[(score)])])
			if(last.Power>=player.powerlevel_max)return 21
			power[(score)]=(character)
		else score=(power.len+1),power+=(character)
		while(score>1)
			last=(power[(power[(score-1)])])
			if(last.Power>=player.powerlevel_max)break
			power[(score)]=(power[(score-1)])
			power[(--score)]=(character)
			power[(power[(score+1)])]=(last)
		power[(character)]=(newest)
		F[("stuff")]<<(power)
		return score
	KIRankingDisplay(var/mob/person)
		var/list/newki=new()
		var/savefile/F=new("World Save Files/System/Scoreboard/KI.sav")
		F[("stuff")]>>(newki)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=gray>Ki<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!newki)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>#</th><th>Name <I>(key)</I></th><th>Ki</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to newki.len)
				var{character=(newki[(number)]);Rank_Entry/player=(newki[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[num2text(round(player.KI),100)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	KIRanking(var/mob/player)
		if(!player||!player.client)return
		var/savefile/F=new("World Save Files/System/Scoreboard/KI.sav")
		var/list/newki=new()
		F[("stuff")]>>(newki)
		if(!newki)newki=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=newki.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(newki[(character)])
			if(old.KI>=player.ki_max)return score
			while(score>1)
				last=newki[(newki[(score-1)])]
				if(last.KI>=player.ki_max)break
				newki[(score)]=(newki[(score-1)])
				newki[(--score)]=(character)
				newki[(newki[(score+1)])]=(last)
			newki[(character)]=(newest)
			F[("stuff")]<<(newki)
			return score
		score=(newki.len)
		if(score>=20)
			last=(newki[(newki[(score)])])
			if(last.KI>=player.ki_max)return 21
			newki[(score)]=(character)
		else score=(newki.len+1),newki+=(character)
		while(score>1)
			last=(newki[(newki[(score-1)])])
			if(last.KI>=player.ki_max)break
			newki[(score)]=(newki[(score-1)])
			newki[(--score)]=(character)
			newki[(newki[(score+1)])]=(last)
		newki[(character)]=(newest)
		F[("stuff")]<<(newki)
		return score
	STRRankingDisplay(var/mob/person)
		var/list/newstr=new()
		var/savefile/F=new("World Save Files/System/Scoreboard/STR.sav")
		F[("stuff")]>>(newstr)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=gray>Strength<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!newstr)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>#</th><th>Name <I>(key)</I></th><th>Strength</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to newstr.len)
				var{character=(newstr[(number)]);Rank_Entry/player=(newstr[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[num2text(round(player.STR),100)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	STRRanking(var/mob/player)
		if(!player||!player.client)return
		var/savefile/F=new("World Save Files/System/Scoreboard/STR.sav")
		var/list/newstr=new()
		F[("stuff")]>>(newstr)
		if(!newstr)newstr=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=newstr.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(newstr[(character)])
			if(old.STR>=player.strength_max)return score
			while(score>1)
				last=newstr[(newstr[(score-1)])]
				if(last.STR>=player.strength_max)break
				newstr[(score)]=(newstr[(score-1)])
				newstr[(--score)]=(character)
				newstr[(newstr[(score+1)])]=(last)
			newstr[(character)]=(newest)
			F[("stuff")]<<(newstr)
			return score
		score=(newstr.len)
		if(score>=20)
			last=(newstr[(newstr[(score)])])
			if(last.STR>=player.strength_max)return 21
			newstr[(score)]=(character)
		else score=(newstr.len+1),newstr+=(character)
		while(score>1)
			last=(newstr[(newstr[(score-1)])])
			if(last.STR>=player.strength_max)break
			newstr[(score)]=(newstr[(score-1)])
			newstr[(--score)]=(character)
			newstr[(newstr[(score+1)])]=(last)
		newstr[(character)]=(newest)
		F[("stuff")]<<(newstr)
		return score
	DEFRankingDisplay(var/mob/person)
		var/list/newdef=new()
		var/savefile/F=new("World Save Files/System/Scoreboard/DEF.sav")
		F[("stuff")]>>(newdef)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=gray>Defense<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!newdef)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>#</th><th>Name <I>(key)</I></th><th>Defense</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to newdef.len)
				var{character=(newdef[(number)]);Rank_Entry/player=(newdef[(character)])}
				html+="<tr><td><u>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[num2text(round(player.DEF),100)]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	DEFRanking(var/mob/player)
		if(!player||!player.client)return
		var/savefile/F=new("World Save Files/System/Scoreboard/DEF.sav")
		var/list/newdef=new()
		F[("stuff")]>>(newdef)
		if(!newdef)newdef=new()
		var{character="[(player.client.ckey)]/[(player.name)]"
			score=newdef.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(newdef[(character)])
			if(old.DEF>=player.defence_max)return score
			while(score>1)
				last=newdef[(newdef[(score-1)])]
				if(last.DEF>=player.defence_max)break
				newdef[(score)]=(newdef[(score-1)])
				newdef[(--score)]=(character)
				newdef[(newdef[(score+1)])]=(last)
			newdef[(character)]=(newest)
			F[("stuff")]<<(newdef)
			return score
		score=(newdef.len)
		if(score>=20)
			last=(newdef[(newdef[(score)])])
			if(last.DEF>=player.defence_max)return 21
			newdef[(score)]=(character)
		else score=(newdef.len+1),newdef+=(character)
		while(score>1)
			last=(newdef[(newdef[(score-1)])])
			if(last.DEF>=player.defence_max)break
			newdef[(score)]=(newdef[(score-1)])
			newdef[(--score)]=(character)
			newdef[(newdef[(score+1)])]=(last)
		newdef[(character)]=(newest)
		F[("stuff")]<<(newdef)
		return score









mob
	verb
		GameGuide2()
			set hidden = 1
			winshow(usr,"Guide",1)
			spawn(1)mainfile()