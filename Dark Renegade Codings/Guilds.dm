var/savefile/F
var/guild_war=0
var/filesizemax=80000
var/list/BannedGuildText=list("size>","td>","tr>","p>","<h","br>","<br","hr>","html>","body>","<!","table>","<table","big>","em>","strong>","sub>","sup>","ins>","del>","<a","frameset>","th>","caption>","<col","head>","ul>","il>","dl>","img>","map>","area>")
mob/proc/GuildBanText(list/L, T)
	for(var/X in L)
		if(findtext(T,X))
			return TRUE
mob/var/tmp/guild_challenger=""
mob/PC
	verb
		Create_Guild()
			set category="Guild"
			var/savefile/F=new("World Save Files/Guilds.sav")
			if(in_guild)return
			if(level<500)
				alert("You must be at least level 500.")
				return
			switch(alert("Do you want to create a Guild?","Create Guild","Yes","No"))
				if("No")return
				if("Yes")
					var/gname1=input("Type in the Guild name with 'NO' HTML(20 characters max).")as text
					gname1=html_encode(gname1)
					if(lentext(gname1) > 20)
						alert("Guild name cannot exceed 20 characters.")
						return
					if(Guilds.Find(gname1))
						alert("That Guild already exists.")
						return
					if(gname1==" "||gname1== 0||!gname1)return
					var/rc=ckey(gname1)
					if(Check_For_Spam(gname1,SPAM) == TRUE)
						src<<"Please do not use linebreak characters."
						return
					if(findtext(rc,"fontsize"))
						alert("You cannot change font size")
						return
					if(findtext(rc,"size"))
						alert("You cannot change font size")
						return
					if(findtext(rc,"fontcolor"))
						alert("You cannot change font color")
						return
					if(findtext(rc,"colorsize"))
						alert("You cannot change font color or size")
						return
					var/gname2=input("Type in the Guild name with HTML if wanted.")as text
					var/rc2=lowertext(gname2)
					rc2=dd_replacetext(rc2," ","")
					if(src.GuildBanText(BannedGuildText,rc2)==TRUE)
						alert("Only <font color> html tags allowed")
						return
					if(findtext(rc,"size"))
						alert("You cannot change font size")
						return
					if(findtext(rc2,"fontsize"))
						alert("You cannot change font size")
						return
					if(Check_For_Spam(rc2,SPAM) == TRUE)
						src<<"Please do not use linebreak characters."
						return
					if(findtext(rc2,"fontcolor"))
						if(lentext(rc2)>1250)
							alert("Guild name cannot exceed 1250 characters.")
							return
					else
						if(lentext(rc2)>1000)
							alert("Guild name cannot exceed 1000 characters.")
							return
					if(Guilds.Find(gname2))
						alert("That Guild already exists.")
						return
					if(gname2==" "||gname2==0||!gname2)return
					switch(alert("Create [gname1]?","Guild Create","Yes","No"))
						if("Yes")
							Guilds.Add(gname1)
							Guilds.Add(gname2)
							BanSave()
							guild_name=gname2
							guild=gname1
							guild_leader=1
							guild_title=title
							guild_rank="Leader"
							in_guild=1
							has_title=0
							guild_mute=0
							verbs-=new/mob/PC/verb/Create_Guild()
							F["Guilds"]<<Guilds
							GiveGuildVerbs()
							return
						if("No")return
mob/GuildLeader
	verb
		Guild_Summon()
			set category = "Guild"
			var/list/Menu=list()
			for(var/mob/M in world)
				if(!M.client)continue
				if(M.name!=name)
					if(M.in_guild)
						if(M.guild_name==guild_name)Menu.Add(M)
			var/mob/M=input("Summon Who?","Guild Summon")as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				if(tourny||M.gravity_train||M.guild_challenge||challenge||insafezone||M.insafezone||M.grav_trainer||gravity_train||grav_trainer||M.jailed||M.dead||M.tourny||M.challenge||M.in_hbtc||in_hbtc||in_war||M.in_war||KO||M.KO||dead||jailed||babatourny||M.babatourny)
					usr<<"<font color=red>[M] is hard to summon at this time..."
					return
				switch(alert("Do you want to summon [M]?","Summon [M]?","Yes","No"))
					if("Yes")
						switch(alert(M,"[usr] wishes to summon you, want to be summoned?","Summon","Accept","Refuse"))
							if("Accept")
								if(!M)return
								if(M.z!=4&&M.z!=3&&M.z!=2&&M.z!=1)
									usr<<"<font color=red>[M] is hard to summon at this time..."
									return
								if(z!=4&&z!=3&&z!=2&&z!=1)
									usr<<"<font color=red>[M] is hard to summon at this time..."
									return
								if(tourny||M.gravity_train||M.guild_challenge||challenge||insafezone||M.insafezone||M.grav_trainer||gravity_train||grav_trainer||M.jailed||M.dead||M.tourny||M.challenge||M.in_hbtc||in_hbtc||in_war||M.in_war||KO||M.KO||dead||jailed||babatourny||M.babatourny)
									usr<<"<font color=red>[M] is hard to summon at this time..."
									return
								M.x=x
								M.y=y-1
								if(y==1)M.y=y
								if(y!=1)M.y=y-1
								M.z=z
								M<<"<font color=white>[usr] has summoned you!</font>"
								spawn(3)if(M)M.LocationChecker()
							if("Refuse")
								usr<<"<font color=red>[M] doesn't want to be summoned!</font>"
								return
					if("No")return
		Guild_War()
			set category="Guild"
			if(gwar_on)
				usr<<"There is a Guild War currently taking place, try again later."
				return
			gwar_on=1
			var/list/L=new/list()
			for(var/mob/M in world)
				if(M.guild_leader)
					if(!M.in_war)
						if(M!=usr)
							if(M.guild_name!=usr.guild_name)L.Add(M)
			L.Add("Cancel")
			var/mob/A=input("Challenge who?")in L
			if(A=="Cancel")
				gwar_on=0
				return
			if(A==usr)
				gwar_on=0
				return
			if(!A||A.babatourny||A.tourny||A.challenge||A.in_war||A.dead||A.guild_challenge)
				usr<<"[A] is unable to accept the Guild War at this moment."
				gwar_on=0
				return
			switch(alert("Do you wish to challenge [A] the leader of [A.guild_name]?","","Yes","No"))
				if("No")
					gwar_on=0
					return
				if("Yes")
					if(z!=4&&z!=3&&z!=2&&z!=1)
						gwar_on=0
						usr<<"You're not in right place!"
						return
					if(A.z!=4&&A.z!=3&&A.z!=2&&A.z!=1)
						gwar_on=0
						usr<<"[A] isn't in right place!"
						return
					if(!A||A.babatourny||A.tourny||A.challenge||A.in_war||A.dead||A.guild_challenge)
						gwar_on=0
						usr<<"[A] is unable to accept the Guild War at this moment."
						return
					guild_war_starter=usr
					world<<"<font color=red><u>Guild Information:</u> \white [usr] has challenged [A] for a Guild War!"
					var/obj/GuildChallenges/C=new
					C.C1=usr
					C.C2=A
					C.ChallengeWar(A,usr)
		Guild_Mute()
			set category="Guild"
			var/list/Menu=list()
			for(var/mob/M in world)
				if(!M.client)continue
				if(M.name!=name)
					if(M.in_guild)
						if(M.guild_name==guild_name)
							if(!M.guild_leader)Menu.Add(M)
			var/mob/M=input("Mute Who?","Guild Mute")as null|anything in Menu
			if(!M)return
			if(istype(M,/mob))
				switch(alert("Would you like to Guild Mute [M]?","Guild Mute","Yes","No"))
					if("Yes")
						var/time=input("How many seconds?(300 Max)")as num
						if(time<=0)return
						if(time>0&&time<=300)
							if(!M)return
							M.guild_mute=1
							for(var/mob/PC/X in world)if(X.guild_name==M.guild_name)X<<"[usr]<font color=red> Guild Muted</font> [M]([time] seconds)"
							M.GuildMemberMute(time*10)
							return
					else return
		Guild_UnMute()
			set category="Guild"
			var/list/Menu=list()
			for(var/mob/M in world)
				if(!M.client)continue
				if(M.name!=name)
					if(M.in_guild)
						if(M.guild_name==guild_name)
							if(!M.guild_leader)Menu.Add(M)
			var/mob/M=input("UnMute Who?","Guild UnMute")as null|anything in Menu
			if(!M)return
			if(istype(M,/mob))
				switch(alert("Would you like to Guild UnMute [M]?","Guild UnMute","Yes","No"))
					if("Yes")
						if(!M)return
						M.guild_mute=0
						for(var/mob/PC/X in world)if(X.guild_name==M.guild_name)X<<"[usr]<font color=red> Guild UnMuted</font> [M]"
						return
					else return
		Guild_Invite()
			set category="Guild"
			var/list/Menu=list()
			for(var/mob/PC/M in world)
				if(!M.client)continue
				if(M==usr)continue
				if(M.in_guild)continue
				if(M.level<500||!M.pk)continue
				Menu.Add(M)
			var/mob/M=input("Invite Who?","Guild Invite")as null|anything in Menu
			if(!M)return
			if(istype(M,/mob))
				switch(alert(M,"Would you like to join [usr]'s Guild?","Guild Join","Yes","No"))
					if("Yes")
						if(!usr||!M)return
						if(M.in_guild)return
						M.guild_name=guild_name
						M.guild=guild
						M.guild_member=1
						M.guild_rank="Member"
						M.guild_title=M.title
						M.in_guild=1
						M.has_title=0
						M.guild_challenge_rank=0
						M.GiveGuildVerbs()
						M.verbs-=new/mob/PC/verb/Create_Guild()
						for(var/mob/PC/X in world)if(X.guild_name==guild_name)X<<"[guild_name]<font color=white>: [M] \green Joined \font the Guild!"
						return
					if("No")
						if(!usr)return
						usr<<"[M] doesn't want to join"
						return
		Guild_Boot()
			set category="Guild"
			var/list/Menu=list()
			for(var/mob/M in world)
				if(!M.client)continue
				if(M.name!=name)
					if(M.in_guild)
						if(M.guild_name==guild_name)Menu.Add(M)
			var/mob/M=input("Boot Who?","Guild Boot")as null|anything in Menu
			if(!M)return
			if(istype(M,/mob))
				if(M.guild_leader)
					alert("You cannot boot the leader!")
					return
				switch(alert("Would you like to boot [M] from the Guild?","Guild Boot","Yes","No"))
					if("Yes")
						if(!M)return
						M.RemoveGuildVerbs()
						for(var/mob/PC/X in world)if(X.guild_name==M.guild_name)X<<"[usr.guild_name]<font color=white>: [usr] \red has booted \font [M] from the Guild!"
						M.guild_name=""
						M.guild=""
						M.guild_leader=0
						M.guild_co_leader=0
						M.guild_member=0
						M.guild_make_item=0
						M.guild_change_rank=0
						M.guild_invite=0
						M.guild_announce=0
						M.guild_boot=0
						M.guild_change_rank=0
						M.guild_challenge_rank=0
						M.guild_title=M.title
						M.guild_rank=""
						M.in_guild=0
						M.has_title=0
						M.verbs+=new/mob/PC/verb/Create_Guild()
					if("No")return
		Guild_Change_Title()
			set category="Guild"
			var/list/Menu=list()
			for(var/mob/PC/M in world)
				if(M.in_guild)
					if(M.guild_name==guild_name)Menu.Add(M)
			var/mob/M=input("Change who's title?","Guild Change Title") as null|anything in Menu
			if(!M)return
			if(istype(M,/mob))
				switch(alert("Change [M]'s title?","Guild Change Title","Yes","No"))
					if("Yes")
						var/new_rank=input("Enter [M]'s new title","Guild Change Title") as text|null
						var/rc2=lowertext(new_rank)
						rc2=dd_replacetext(rc2," ","")
						if(GuildBanText(BannedGuildText,rc2)==TRUE)
							alert("Only <font color> html tags allowed")
							return
						if(findtext(rc2,"fontcolor"))
							if(lentext(rc2)>1000)
								alert("New title cannot exceed 1000 characters.")
								return
						else
							if(lentext(rc2)>30)
								alert("New title cannot exceed 30 characters.")
								return
						if(findtext(rc2,"fontsize"))
							alert("You cannot change font size")
							return
						if(findtext(rc2,"size"))
							alert("You cannot change font size")
							return
						if(!M)return
						M.guild_title=new_rank
						for(var/mob/PC/X in world)if(X.guild_name==guild_name)X<<"[usr.guild_name]<font color=white>: [usr] has changed [M]'s title to: [new_rank]!"
						return
					else return
		Guild_Change_Rank()
			set category="Guild"
			var/list/Menu=list()
			for(var/mob/PC/M in world)
				if(M.in_guild)
					if(M.guild_name==guild_name)Menu.Add(M)
			var/mob/M=input("Change Who's Rank?","Guild Change Rank")as null|anything in Menu
			if(!M)return
			if(istype(M,/mob))
				switch(input("What rank do you wish to give [M]?")in list("Co-Leader","Member","Custom","Cancel"))
					if("Co-Leader")
						if(!M)return
						if(M==src||M.guild_leader)return
						for(var/mob/PC/X in world)if(X.guild_name==guild_name)X<<"[guild_name]<font color=white>: [usr] has made [M] a Co-Leader!"
						M.guild_co_leader=1
						M.guild_rank="Co-Leader"
						M.GiveGuildVerbs()
					if("Member")
						if(!M||M==usr||M.guild_leader)return
						for(var/mob/PC/X in world)if(X.guild_name==guild_name)X<<"[guild_name]<font color=white>: [usr] has made [M] a Member!"
						M.guild_member=1
						M.guild_rank="Member"
						M.guild_title="<font color=white>Member</font>"
						M.guild_co_leader=0
						M.RemoveGuildVerbs()
						M.GiveGuildVerbs()
					if("Custom")
						switch(alert("Change [M]'s Custom Rank?","Change Rank","Yes","No"))
							if("Yes")
								var/new_rank=input("Enter [M]'s new rank","Guild Change Rank")as text|null
								if(lentext(new_rank)>300)
									usr<<"New rank cannot exceed 300 characters(with html included)."
									return
								if(!M)return
								var/rc2=lowertext(new_rank)
								rc2=dd_replacetext(rc2," ","")
								if(GuildBanText(BannedGuildText,rc2)==TRUE)
									alert("Only <font color> html tags allowed")
									return
								new_rank=html_encode(new_rank)
								M.guild_rank=new_rank
								var/rc=ckey(new_rank)
								if(findtext(rc,"fontsize"))
									alert("You cannot change font size")
									return
								if(findtext(rc,"colorsize"))
									alert("You cannot change font size")
									return
								if(findtext(rc,"fontcolor"))
									if(lentext(rc)>500)
										alert("New rank cannot exceed 500 characters.")
										return
								else
									if(lentext(rc)>30)
										alert("New rank cannot exceed 30 characters.")
										return
								if(!M||M==src||M.guild_leader)return
								for(var/mob/PC/X in world)if(X.guild_name==guild_name)X<<"[guild_name]<font color=white>: [usr] changed [M]'s rank to: [new_rank]!"
								if(M!=usr)
									switch(input("What permissions do you wish to give [M]?")in list("Boot","Invite","Announce","Change Rank","Change Title","Make Items","Cancel"))
										if("Boot")
											if(!M)return
											M.guild_boot=1
											M.GiveGuildVerbs()
											return
										if("Invite")
											if(!M)return
											M.guild_invite=1
											M.GiveGuildVerbs()
											return
										if("Announce")
											if(!M)return
											M.guild_announce=1
											M.GiveGuildVerbs()
											return
										if("Change Rank")
											if(!M)return
											M.guild_change_rank=1
											M.GiveGuildVerbs()
											return
										if("Change Title")
											if(!M)return
											M.guild_change_title=1
											M.GiveGuildVerbs()
											return
										if("Make Items")
											if(!M)return
											M.guild_make_item=1
											M.GiveGuildVerbs()
											return
										if("None")return
							if("No")
								if(!M||M==usr)return
								switch(input("What permissions do you wish to give [M]?")in list("Boot","Invite","Announce","Change Rank","Cancel"))
									if("Boot")
										if(!M)return
										M.guild_boot=1
										M.GiveGuildVerbs()
										return
									if("Invite")
										if(!M)return
										M.guild_invite=1
										M.GiveGuildVerbs()
										return
									if("Announce")
										if(!M)return
										M.guild_announce=1
										M.GiveGuildVerbs()
										return
									if("Change Rank")
										if(!M)return
										M.guild_change_rank=1
										M.GiveGuildVerbs()
										return
									if("Change Title")
										if(!M)return
										M.guild_change_title=1
										M.GiveGuildVerbs()
										return
									if("Make Items")
										if(!M)return
										M.guild_make_item=1
										M.GiveGuildVerbs()
										return
									if("None")return
					if("Cancel")return
		GuildAnnouncement()
			set category="Guild"
			set name="Guild Announcement"
			if(channelmute!="")
				usr<<"All chat channels have been muted."
				return
			var/T=input("What do you wish to announce?")as null|text
			var/list/L=list("font size")
			if(T==""||T==null||!T)return
			if(lentext(T)>150)
				alert("Message must be less than 150 Characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You cannot change font size")
					return
			for(var/mob/PC/X in world)if(X.guild_name==guild_name)X<<"<center>[guild_name]<font color=white> Announcement from [usr]<br>[T]<br>"
mob/GuildVerbs
	verb
		Guild_Challenge()
			set category = "Guild"
			if(guild_challenging)return
			for(var/mob/T in world)
				if(T.guild_challenging)
					usr<<"Someone is using Guild Challenge!"
					return
			guild_challenging=1
			var/list/Rivals=new/list()
			for(var/mob/PC/N in world)
				if(N.in_guild)
					if(N.guild_name==guild_name)Rivals.Add(N)
			Rivals.Add("Cancel")
			Rivals.Remove(usr)
			var/mob/M=input("Guild Challenge who?")in null|Rivals
			if(M=="Cancel"||!M||M==null||M.in_hbtc||M.tourny||in_hbtc||babatourny||M.babatourny||challenge||M.challenge||tourny||M.in_war||in_war)
				guild_challenging=0
				return
			if(z!=4&&z!=3&&z!=2&&z!=1)
				usr<<"You aren't in right place!"
				guild_challenging=0
				return
			if(M.z!=4&&M.z!=3&&M.z!=2&&M.z!=1)
				usr<<"[M] isn't in right place!"
				guild_challenging=0
				return
			if(dead)
				usr<<"You are dead."
				guild_challenging=0
				return
			if(M.FuseFollower||FuseFollower)
				guild_challenging=0
				return
			if(M.dead)
				usr<<"[M] is dead."
				guild_challenging=0
				return
			if(grav>0||M.grav>0)
				guild_challenging=0
				return
			if(!M.pk)
				usr<<"[M] is not a Combatant."
				guild_challenging=0
				return
			if(!pk)
				usr<<"You are not a Combatant."
				guild_challenging=0
				return
			if(istype(M,/mob/PC))
				guild_challenge=1
				M.guild_challenge=1
				for(var/mob/PC/X in world)if(X.arenatxt)X<<"\red <u>Guild Information:</u> \white [usr] has challenged [M]!"
				var/obj/GuildArena/C=new
				C.C1=usr
				C.C2=M
				C.ChallengeMob(M,usr)
			else
				usr<<"You can't challenge NPCs."
				guild_challenging=0
				return
		Guild_Make_Item()
			set category="Guild"
			if(makingitem)return
			makingitem=1
			if(zenni>=750000)
				var/icon/I=input("Select your Guild Item's icon:")as null|icon
				if(!length(I))
					makingitem=0
					return
				if(length(I)>filesizemax)
					usr<<"File is too large. 50kb max."
					makingitem=0
					return
				switch(alert("Make Guild Item?(750,000 zenni each)","Make Guild Item","Yes","No"))
					if("Yes")
						switch(alert("Overlay or Underlay?(Overlays show on top of your character's icon and Underlays show under your character's icon","","Overlay","Underlay","Cancel"))
							if("Overlay")
								var/obj/Equipment/Guild_Item/O=new
								var/N=input("Whats the name?","","Guild Item")as text
								if(!N)N = "Guild Item"
								if(lentext(N)>15)N=copytext(1,16)
								N=html_encode(N)
								O.name=N
								O.icon=I
								O.guild=guild_name
								zenni-=750000
								contents+=O
								inven_min+=1
								makingitem=0
								usr<<"[N] was created successfully!"
								return
							if("Underlay")
								var/obj/Equipment/Guild_Item2/O=new
								var/N=input("Whats the name?","","Guild Item")as text
								if(!N)N="Guild Item"
								if(lentext(N)>15)N=copytext(1,16)
								N=html_encode(N)
								O.name=N
								O.icon=I
								O.guild=guild_name
								zenni-=750000
								contents+=O
								inven_min+=1
								makingitem=0
								usr<<"[N] was created successfully!"
								return
							if("Cancel")
								makingitem=0
								return
					if("No")
						makingitem=0
						return
			else
				usr<<"You need 750,000 zenni."
				makingitem=0
				return
		Guild_Chat(T as text)
			set category="Guild"
			if(channelmute!="")
				usr<<"All chat channels have been muted."
				return
			var/list/L
			L=list("font size")
			if(guild_mute)
				alert("You are Guild Muted!")
				return
			if(!T||T=="")return
			if(lentext(T)>100)
				usr<<"Your message can not exceed 100 characters!"
				return
			for(var/X in L)
				if(findtext(T,X))
					usr<<"You cannot change your font size"
					return
			if(Check_For_Spam(T,SPAM)==TRUE)
				usr<<"Please do not use linebreak characters."
				return
			for(var/mob/PC/X in world)if(X.guild_name==guild_name&&X.in_guild&&X.gooc_on)X<<"<font color = yellow><font face=Tahoma>{[guild_name]}{[guild_rank]}<font color=white><font face=Tahoma>[usr]:<font color=white><font size = 1> [s_smileys(T)]"
			return
		Guild_Members()
			set category="Guild"
			if(spam_delay)return
			spam_delay=1
			spawn(30)if(usr)spam_delay=0
			var/count=0
			usr<<"---------------<br><font color=white>[guild_name] Members:"
			for(var/mob/PC/X in world)
				if(X.in_guild&&X.guild==guild)
					count+=1
					usr<<"<font color=red>[X.name]{[X.guild_rank]}"
			usr<<"<font color=white>Guild Members Online: [count]<br>---------------<br>"
			return
		Guild_Leave()
			set category="Guild"
			set background=1
			if(!guild_leader)
				switch(alert("Leave the Guild?","Guild Leave","Yes","No"))
					if("Yes")
						if(in_guild)
							in_guild=0
							RemoveGuildVerbs()
							for(var/mob/PC/X in world)if(X.guild_name==guild_name)X<<"[guild_name]<font color=white>: [usr] has left the Guild!"
							guild_name=""
							guild=""
							guild_leader=0
							guild_co_leader=0
							guild_member=0
							guild_mute=0
							guild_make_item=0
							guild_invite=0
							guild_announce=0
							guild_boot=0
							guild_change_rank=0
							guild_rank=""
							guild_title=""
							if(!GMLevel)title="Player"
							verbs+=new/mob/PC/verb/Create_Guild()
							return
					if("No")return
			else
				if(guild_leader)
					switch(alert("Leave the Guild?","Guild Leave","Yes","No"))
						if("Yes")
							RemoveGuildVerbs()
							Guilds.Remove(guild_name)
							Guilds.Remove(guild)
							world<<"<font color=red>Guild Information:</font> [usr] has disbanded [guild_name]!"
							for(var/turf/X in world)
								if(istype(X,/turf/Guild_Houses))
									if(X.guild_name==guild_name)
										if(istype(X,/turf/Guild_Houses/Guild_House1))
											for(var/obj/Flag/Flag1/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House2))
											for(var/obj/Flag/Flag2/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House3))
											for(var/obj/Flag/Flag3/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House4))
											for(var/obj/Flag/Flag4/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House5))
											for(var/obj/Flag/Flag5/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House6))
											for(var/obj/Flag/Flag6/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House7))
											for(var/obj/Flag/Flag7/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House8))
											for(var/obj/Flag/Flag8/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House9))
											for(var/obj/Flag/Flag9/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House10))
											for(var/obj/Flag/Flag10/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House11))
											for(var/obj/Flag/Flag11/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House12))
											for(var/obj/Flag/Flag12/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House13))
											for(var/obj/Flag/Flag13/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House14))
											for(var/obj/Flag/Flag14/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House15))
											for(var/obj/Flag/Flag15/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										if(istype(X,/turf/Guild_Houses/Guild_House16))
											for(var/obj/Flag/Flag16/F in world)
												MapObj.Remove(F)
												var/savefile/M=new("World Save Files/Map.sav")
												M["MapObj"]<<MapObj
												del(F)
										X.guild_name=""
										GuildHouse.Remove(X)
										var/savefile/S=new("World Save Files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
							for(var/mob/PC/C in world)
								if(!C.client)continue
								if(C.guild==guild)
									C.guild_leader=0
									C.guild_co_leader=0
									C.guild_member=0
									C.guild_mute=0
									C.guild_make_item=0
									C.guild_change_title=0
									C.guild_invite=0
									C.guild_announce=0
									C.guild_boot=0
									C.guild_change_rank=0
									C.guild_rank=""
									C.guild_name=""
									C.guild=""
									C.guild_title=""
									if(!C.GMLevel)C.title="Player"
									C.in_guild=0
									C.verbs+=new/mob/PC/verb/Create_Guild()
							guild_leader=0
							guild_co_leader=0
							guild_member=0
							guild_mute=0
							guild_make_item=0
							guild_change_title=0
							guild_invite=0
							guild_announce=0
							guild_boot=0
							guild_change_rank=0
							guild_rank=""
							guild_name=""
							guild=""
							guild_title=""
							guildbuyer=0
							if(!GMLevel)title="Player"
							in_guild=0
							verbs+=new/mob/PC/verb/Create_Guild()
							spawn(1)BanSave()
						if("No")return
mob
	proc
		GiveGuildVerbs()
			verbs-=typesof(/mob/GuildLeader/verb)
			verbs-=typesof(/mob/GuildVerbs/verb)
			if(guild_leader)
				verbs+=typesof(/mob/GuildLeader/verb)
				verbs+=typesof(/mob/GuildVerbs/verb)
			if(guild_co_leader)
				verbs+=typesof(/mob/GuildLeader/verb)
				verbs+=typesof(/mob/GuildVerbs/verb)
			if(guild_member)verbs+=typesof(/mob/GuildVerbs/verb)
			if(guild_invite)verbs+=new/mob/GuildLeader/verb/Guild_Invite()
			if(guild_boot)verbs+=new/mob/GuildLeader/verb/Guild_Boot()
			if(guild_announce)verbs+=new/mob/GuildLeader/verb/GuildAnnouncement()
			if(guild_change_rank)verbs+=new/mob/GuildLeader/verb/Guild_Change_Rank()
			if(guild_change_title)verbs+=new/mob/GuildLeader/verb/Guild_Change_Title()
			return
		RemoveGuildVerbs()
			verbs-=typesof(/mob/GuildLeader/verb)
			verbs-=typesof(/mob/GuildVerbs/verb)
			return
		CheckGuildVerbs()
			if(in_guild)
				if(Guilds.Find(guild_name))
					if(guild_leader)
						verbs+=typesof(/mob/GuildLeader/verb)
						verbs+=typesof(/mob/GuildVerbs/verb)
					if(guild_co_leader)
						verbs+=typesof(/mob/GuildLeader/verb)
						verbs+=typesof(/mob/GuildVerbs/verb)
					if(guild_member)verbs+=typesof(/mob/GuildVerbs/verb)
					if(guild_invite)verbs+=new/mob/GuildLeader/verb/Guild_Invite()
					if(guild_boot)verbs+=new/mob/GuildLeader/verb/Guild_Boot()
					if(guild_announce)verbs+=new/mob/GuildLeader/verb/GuildAnnouncement()
					if(guild_change_rank)verbs+=new/mob/GuildLeader/verb/Guild_Change_Rank()
					if(guild_change_title)verbs+=new/mob/GuildLeader/verb/Guild_Change_Title()
					verbs-=new/mob/PC/verb/Create_Guild()
					return
				else
					src<<"\white <center>The leader of [guild_name] disbanded the guild!"
					guild_name=""
					guild_name=""
					guildbuyer=0
					guild_leader=0
					guild_co_leader=0
					guild_member=0
					guild_mute=0
					guild_make_item=0
					guild_change_title=0
					guild_invite=0
					guild_announce=0
					guild_boot=0
					guild_change_rank=0
					guild_change_title=0
					guild_challenge_rank=0
					guild_title=title
					guild_rank=""
					in_guild=0
					has_title=0
					RemoveGuildVerbs()
					verbs+=new/mob/PC/verb/Create_Guild()
					return
			else
				RemoveGuildVerbs()
				return
		GuildMemberMute(T)
			sleep(T)
			if(!src||!guild_mute)return
			for(var/mob/PC/M in world)if(M.guild_name==guild_name)M<<"[src] has been<font color = green> Guild UnMuted</font>!"
			guild_mute=0
			return