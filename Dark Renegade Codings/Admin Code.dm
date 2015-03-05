#define LP(str) list2params(list(str))

var/const/HTML = {"
<html>
<head>
<script type="text/javascript">
function replace(v) { document.getElementById('foo').innerHTML = v; }
</script>
</head>
<body>
<font color="red"><b><marquee width="800" height="15" bgcolor="#000000" scrolldelay="100"> <div id="foo">Welcome to NTBB!</di1v022022220></marquee></b></font>
</body>
"}

var/tmp/GM_WorldShutDownProc=0
mob/var
	Rankallow = 0
	gmmutedby = 0
var
	c_user;c_last
var
	voteson=0
	list
		CreationSpam=list();GuildHouse=list();GuildCustom=list();MapObj=list();BannedK=list();BannedA=list();BannedSK=list();BannedSA=list();BannedIP=list();TrialEnf=list();LowEnf=list();MediumEnf=list();HighEnf=list();MasterEnf=list();StaffEnf=list();AdminPro=list();BudoMaster=list();Bounty=list()
mob/var/tmp/ranking=0
mob/proc/EditLog(mob/usr,Info)
	var/ISF=file("World Save Files/Edit Use/[ckey].txt")
	ISF<<"[Info]"
mob/proc/ComplaintLog(mob/usr,Info)
	var/ISF=file("World Save Files/Complaint Log/[ckey].txt")
	ISF<<"[Info]"
mob/proc/ChatLog(mob/usr,Info)
	var/ISF=file("World Save Files/Chat Log/[ckey].txt")
	ISF<<"[Info]"
mob/proc/LoginLog()
	var/ISF=file("World Save Files/Login Log/[_month]-[_day]-[_year].txt")
	ISF<<"{[world.realtime]} [src] ([key]) ([client.address])"
var/AdminLog=file("World Save Files/System/Admin Verb Use/Admin Log.txt")
//**************************//
//***Spuzzum's Time Procs***//
//**************************//
proc/ReportDate(time)
	var/format = "hh:mm:ss MM/DD/YYYY"
	return time2text(time, format)

proc
	BanSave()
		var/savefile/X=new("World Save Files/GM.sav")
		var/savefile/Y=new("World Save Files/Guilds.sav")
		var/savefile/B=new("World Save Files/Tourney.sav")
		var/savefile/C=new("World Save Files/Player Names.sav")
		B["BudoMaster"]<<BudoMaster
		Y["Guilds"]<<Guilds
		X["TrialEnf"]<<TrialEnf
		X["LowEnf"]<<LowEnf
		X["MediumEnf"]<<MediumEnf
		X["HighEnf"]<<HighEnf
		X["MasterEnf"]<<MasterEnf
		X["StaffEnf"]<<StaffEnf
		X["AdminPro"]<<AdminPro
		C["NameList"]<<NameList
world
	New()
		..()
		ALog("World Opened. [ReportDate(world.realtime)] Host Address: [world.address].")
		var/savefile/X=new("World Save Files/GM.sav")
		var/savefile/Z=new("World Save Files/Bans.sav")
		var/savefile/Y=new("World Save Files/Guilds.sav")
		var/savefile/F=new("World Save Files/Map.sav")
		var/savefile/H=new("World Save Files/GuildHouse.sav")
		var/savefile/B=new("World Save Files/Tourney.sav")
		var/savefile/C=new("World Save Files/Player Names.sav")
		var/savefile/A=new("World Save Files/Bounty.sav")
		var/savefile/T=new("World Save Files/Timed Bans.sav")
		var/savefile/LR=new("World Save Files/Allowed People.sav")
		var/savefile/IP=new("World Save Files/BannedIP.sav")
		LR["LR"]>>LRAllow
		IP["BannedIP"]>>BannedIP
		T["BannedTK"]>>BannedTK
		A["Bounty"]>>Bounty
		B["BudoMaster"]>>BudoMaster
		F["MapObj"]>>MapObj
		H["GuildHouse"]>>GuildHouse
		H["GuildCustom"]>>GuildCustom
		Z["BannedK"]>>BannedK
		Z["BannedA"]>>BannedA
		Y["Guilds"]>>Guilds
		X["TrialEnf"]>>TrialEnf
		X["LowEnf"]>>LowEnf
		X["MediumEnf"]>>MediumEnf
		X["HighEnf"]>>HighEnf
		X["MasterEnf"]>>MasterEnf
		X["StaffEnf"]>>StaffEnf
		X["AdminPro"]>>AdminPro
		X["CreationSpam"]>>CreationSpam
		C["NameList"]>>NameList
		if(isnull(LRAllow))LRAllow=new/list
		if(isnull(BannedIP))BannedIP=new/list
		if(isnull(Bounty))Bounty=new /list
		if(isnull(BannedTK))BannedTK=new /list
		if(isnull(BudoMaster))BudoMaster=new /list
		if(isnull(MapObj))MapObj=new /list
		if(isnull(GuildHouse))GuildHouse=new /list
		if(isnull(BannedK))BannedK=new /list
		if(isnull(BannedA))BannedA=new /list
		if(isnull(Guilds))Guilds=new /list
		if(isnull(CreationSpam))CreationSpam=new /list
		if(isnull(TrialEnf))TrialEnf=new /list
		if(isnull(LowEnf))LowEnf=new /list
		if(isnull(MediumEnf))MediumEnf=new /list
		if(isnull(HighEnf))HighEnf=new /list
		if(isnull(MasterEnf))MasterEnf=new /list
		if(isnull(StaffEnf))StaffEnf=new /list
		if(isnull(AdminPro))AdminPro=new /list
		if(isnull(NameList))NameList=new /list
		if(isnull(HouseCustom))HouseCustom=new /list
		else for(var/obj/O in HouseCustom)O.loc=locate(O.lastx,O.lasty,O.lastz)
		if(isnull(GuildCustom))GuildCustom=new /list
		else for(var/obj/O in GuildCustom)O.loc=locate(O.lastx,O.lasty,O.lastz)
	Del()
		BanSave()
		..()
mob
	proc
		CheckBan()
			if(!mainserver&&!cangeton&&key!=mainkey1)
				winshow(src,"serverinfo",1)
				winset(src,"serverinfo1","text='This server is closed!'")
				sleep(20)
				del(client)
			if(GM_WorldShutDownProc)
				winshow(src,"serverinfo",1)
				winset(src,"serverinfo1","text='This server is closing.'")
				sleep(20)
				del(client)
			if(VoteBoot.Find(key))
				winshow(src,"serverinfo",1)
				winset(src,"serverinfo1","text='You were kicked out! Please retry in 5 minutes.'")
				sleep(20)
				del(client)
			for(var/X in BannedTK)
				var/XX=copytext(X,15)
				if(ckey==XX)
					AdminMessage("[key] tried logging in. [key] is banned atm. IP: [client.address] CID: [client.computer_id]")
					src<<baninfo
					sleep(20)
					del(client)
			if(BannedK.Find(ckey)||BannedSK.Find(ckey))
				if(!BannedIP.Find(client.computer_id))BannedIP.Add(client.computer_id)
				if(!BannedA.Find(client.address))BannedA.Add(client.address)
				AdminMessage("[key] tried logging in. [key] is banned atm. IP: [client.address] CID: [client.computer_id]")
				src<<baninfo
				sleep(20)
				del(client)
			if(BannedA.Find(client.address)||BannedSA.Find(client.address))
				if(!BannedIP.Find(client.computer_id))BannedIP.Add(client.computer_id)
				if(!BannedK.Find(ckey))BannedK.Add(ckey)
				AdminMessage("[key] tried logging in. [key] is banned atm. IP: [client.address] CID: [client.computer_id]")
				src<<baninfo
				sleep(20)
				del(client)
			if(BannedIP.Find(client.computer_id))
				if(!BannedK.Find(ckey))BannedK.Add(ckey)
				if(!BannedA.Find(client.address))BannedA.Add(client.address)
				AdminMessage("[key] tried logging in. [key] is banned atm. IP: [client.address] CID: [client.computer_id]")
				src<<baninfo
				sleep(20)
				del(client)
mob/proc/AdminLoad()
	GMLevel=0
	if(BudoMaster.Find(ckey))for(var/X in typesof(/mob/TourneyMaster/verb))verbs+=X
	if(key=="[mainkey1]"||key==""||key=="")
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/HighGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MasterGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/OwnerGM/verb))src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/UpdaterGM/verb))src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/HostGM/verb))src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/BanGM/verb))src.verbs+=X
		GMLevel=10
		return
	if(key==""||key=="AngelSeraphim"||key=="Devil21")
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/HighGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MasterGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/OwnerGM/verb))src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/UpdaterGM/verb))src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/HostGM/verb))src.verbs+=X
		GMLevel=10
		return
	if(key=="Super Kai Nik"||key=="YugiMotou111"||key=="Sempaialexeo"||key==""||key=="HoHW")
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/HighGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MasterGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/OwnerGM/verb))src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/HostGM/verb))src.verbs+=X
		GMLevel=9
		return
	if(key=="Gogeta2222"||key==""||key=="XamoAkuma"||key==""||key=="")
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/HighGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MasterGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/OwnerGM/verb))src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/HostGM/verb))src.verbs+=X
		GMLevel=0
		return
	if(key==""||key==""||key==""||key==""||key=="")
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/HighGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MasterGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/OwnerGM/verb))src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/HostGM/verb))src.verbs+=X
		GMLevel=1
		return
	if(key==""||key=="PkmShadowkoko"||key==""||key==""||key=="")
		GMLevel=0
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))verbs+=X
		return
	if(key==""||key=="Tomo334"||key==""||key=="")
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/HighGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MasterGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/OwnerGM/verb))src.verbs+=X
		GMLevel=8
		return
	if(key=="Toopher1"||key==""||key=="")
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/HighGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MasterGM/verb))verbs+=X
		GMLevel=7
		return
	if(key==""||key==""||key=="")
		for(var/X in typesof(/mob/System/Admin/Verbs/HostGM/verb))src.verbs+=X
		GMLevel=5
		return
	if(HighEnf.Find(ckey))
		GMLevel=4
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/HighGM/verb))verbs+=X
		return
	if(MediumEnf.Find(ckey))
		GMLevel=3
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))verbs+=X
		return
	if(LowEnf.Find(ckey))
		GMLevel=2
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))verbs+=X
		return
	if(TrialEnf.Find(ckey))
		GMLevel=1
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))verbs+=X
		return
mob/proc/GMLockCheck()
	if(GMLock)return 1
	return 0
proc/ALog(Text)
	AdminLog<<"[Text]"
proc/AdminMessage(MSG)
	for(var/mob/X in world)
		if(X.GMLevel>=1)
			if(X.oldadminchat)X<<"<b><font color=#FFCC00><font color=red>Admin Message:</font> [MSG]"
			if(!X.oldadminchat)
				X<<output("<b><font color=#FFCC00><font color=red>Admin Message:</font> [MSG]","admin_chat")
				X<<"Admin Message!</font>"
proc/AdminChat(MSG)
	for(var/mob/X in world)
		if(X.GMLevel>=1)
			if(X.oldadminchat)X<<"<b><font color=#FFCC00><font color=red>Admin Chat: <font color=#FFFFFF>[usr]:</font></font> [MSG]"
			if(!X.oldadminchat)
				X<<output("<b><font color=#FFCC00><font color=red>Admin Chat: <font color=#FFFFFF>[usr]:</font></font> [MSG]","admin_chat")
				X<<"Admin Chat!</font>"
mob/System/Admin/Verbs
	TrialGM/verb
		GM_Room()
			set category = "Admin"
			src.loc = locate(330,229,5)
		Admin_Box()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(input("What do you want to do with Admin Box?")in list("Show","Hide"))
				if("Show")winset(usr,"admin","is-visible=true")
				else winset(usr,"admin","is-visible=false")
		Admin_Options()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(input("What do you want to do?")in list("Change Admin Chat","Cancel"))
				if("Cancel")return
				if("Change Admin Chat")switch(input("Switch to what mode?")in list("Old","New"))
					if("Old")
						oldadminchat=1
						winset(usr,"admin","is-visible=false")
					if("New")
						oldadminchat=0
						winset(usr,"admin","is-visible=true")
		Admins_Online()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			usr<<"<font color=red>:::Admins Online:::</font>"
			for(var/mob/PC/A in world)
				if(A.afk&&A.GMLevel)usr<<"[A]([A.key])-----[A.GMLevel] \red (AFK)"
				if(A.GMLevel&&!A.afk)usr<<"[A]([A.key])-----[A.GMLevel]"
		Admin_Chat(T as text)
			set category="Admin"
			if(!T||T==null)return
			AdminChat(T)
			return
		Observe(mob/PC/M in world)
			set category="Admin"
			set name="Admin TV"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			client.eye=M
			client.perspective = EYE_PERSPECTIVE
			gmwatching=1
			return
		Unobserve()
			set category="Admin"
			set name="Admin TV off"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			client.eye=usr
			client.perspective = EYE_PERSPECTIVE
			gmwatching=0
			return
		Repop()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(alert("Repop the world?","Repop","Yes","No"))
				if("Yes")
					world.Repop()
					AdminMessage("[usr] has repopped the world.")
					world<<"<font color=green>World Repop."
					EditLog(usr,"Repopped the world.")
					return
		Create_Item()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			if(makingitem)return
			makingitem=1
			if(zenni>0)
				var/icon/I=input("Select your item's icon:")as null|icon
				if(!length(I))
					makingitem=0
					return
				if(length(I)>filesizemax)
					usr<<"File is too large. 80kb max."
					makingitem=0
					return
				switch(alert("Make item?(1 zenni each)","Make Item","Yes","No"))
					if("Yes")
						switch(alert(src,"Overlay?","","Overlay","Cancel"))
							if("Overlay")
								var/obj/Equipment/Admin_Item/O=new
								var/N=input("Whats the name?","","Guild Item")as text
								if(!N)N="Guild Item"
								if(lentext(N)>15)N=copytext(1,16)
								N=html_encode(N)
								O.name=N
								O.icon=I
								zenni-=0
								contents+=O
								inven_min+=1
								makingitem=0
								usr<<"[N] was created successfully!"
								EditLog(usr,"Created an item.")
								return
							if("Cancel")
								makingitem=0
								return
					if("No")
						makingitem=0
						return
			else
				usr<<"\red You need 1 zenni!"
				makingitem=0
				return
		Boot(mob/M in world)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			if(!M)return
			switch(alert("Are you sure you want to boot [M]?","Boot [M]","Yes","No"))
				if("Yes")
					if(!M)return
					if(M.GMLevel>=GMLevel)
						AdminMessage("[usr] tried booting [M].")
						return
					else
						var/Reason=input("Input a reason if wanted.")as null|text
						if(!M||M==null)return
						if(Reason)
							world<<"<b>[M] has been <font color=red>booted</font> by [usr].([Reason])"
							EditLog(usr,"Booted [M] by [usr]. ([Reason]).")
							if(M.client)M.client.SaveChar()
							del(M)
							return
						else
							world<<"<b>[M] has been <font color=red>booted</font> by [usr]."
							EditLog(usr,"Booted [M].")
							if(M.client)M.client.SaveChar()
							del(M)
							return
					if("No")return
		Guild_Unmute(mob/PC/M in world)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			if(!M.guild_mute)
				usr<<"<font color=red>[M] isn't guild ud!"
				return
			else
				world<<"<b>[M] has been <font color=red>guild unmuted</font> by [usr]!"
				EditLog(usr,"Guild unmuted [M].")
				M.guild_mute=0
				return
		Mute(mob/PC/M in world)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			if(M.muted)
				usr<<"<font color=red>[M] is already muted!"
				return
			switch(alert("Are you sure you want to mute [M]?","Mute [M]","Yes","No"))
				if("Yes")
					if(M.GMLevel>=GMLevel)
						AdminMessage("[usr] tried muting [M]")
						return
					else
						var/Reason=input("Input a reason if wanted.")as null|text
						var/Time=input({"For How Long? (In Seconds)
		(Max of 600 Seconds (10 Minutes))
		(Input 0 or below 0 for target to remain muted until
		unmuted. Any time past 10 minutes will be lowered
		to 10 minutes.)"})as num
						if(!M)return
						if(M.muted||M.mutedperm)return
						if(Time>=600)Time=600
						if(Time>=1)Time*=10
						if(Time<1)M.mutedperm=1
						if(Reason)
							if(Time)
								world<<"<b>[M] has been <font color=red>muted</font> by [usr]. ([Reason])([Time/10] Seconds)"
								AdminMessage("<b>[M] has been <font color=red>muted</font> by [usr]. ([Reason])([Time/10] Seconds)")
								M.gmmutedby = GMLevel
							else
								world<<"<b>[M] has been <font color=red>muted</font> by [usr]. ([Reason])"
								AdminMessage("<b>[M] has been <font color=red>muted</font> by [usr]. ([Reason])")
								M.gmmutedby = GMLevel
							EditLog(usr,"Muted [M].")
						else
							if(Time)world<<"<b>[M] has been <font color=red>muted</font> by [usr]. ([Time/10] Seconds)"
							else world<<"<b>[M] has been <font color=red>muted</font> by [usr]."
							M.gmmutedby = GMLevel
							EditLog(usr,"Muted [M].")
						if(Time<=0)return
						if(!M)return
						M.muted = 1
						M.UnmuteTimer(Time)
				if("No")return
		Unmute(mob/PC/M in world)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			if(!M)return
			switch(alert("Are you sure you want to unmute [M]?","UnMute [M]","Yes","No"))
				if("Yes")
					if(!M)return
					if(M.gmmutedby > GMLevel)
						usr<<"<font color=red>A higher GM was the one who muted this player"
					else
						world<<"<b>[M] has been <font color=red>unmuted</font> by [usr]."
						M.oocmute = 0
						M.saymute = 0
						M.spam_delay = 0
						M.muted = 0
						M.mutedperm=0
						EditLog(usr,"Unmuted [M].")
						return
				if("No")return
		Warn(mob/PC/M in world)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			if(!M)return
			switch(alert("Are you sure you want to warn [M]?","Warn [M]","Yes","No"))
				if("Yes")
					var/Warn=input("Include What In The Warning? (Admin Warning: \[Warning\])")as null|text
					if(!M||!Warn)return
					M<<"<font color =#105090><font color=red>Admin Warning: </font>[Warn] ~ [usr]"
					AdminMessage("[usr] Warned [M]: [Warn].")
					EditLog(usr,"Warned [M]: [Warn].")
					return
				if("No")return
		View_Player_Stats(mob/M in world)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			usr<< "---------------------"
			usr<< "<font size = 4>[M]</size>"
			usr<< "<font size = 2>Key: [M.key]</size>"
			usr<< "Level: [applycommas(M.level)]"
			usr<< "Powerlevel: [applycommas(M.powerlevel)] / [applycommas(M.powerlevel_max)]"
			usr<< "Ki: [applycommas(M.ki)] / [applycommas(M.ki_max)]"
			usr<< "Ki Def: [applycommas(M.kidefense)] / [applycommas(M.kidefense_max)]"
			usr<< "Strength: [applycommas(M.strength)] / [applycommas(M.strength_max)]"
			usr<< "Defense: [applycommas(M.defence)] / [applycommas(M.defence_max)]"
			usr<< ""
			usr<< "TP: [M.tp]"
			usr<< "CP: [M.custom_points]"
			usr<< "SP: [M.skill_points]"
			usr<< ""
			usr<< "Block Skill: [M.block] %"
			usr<< "Counter Skill: [M.counter] %"
			usr<< "Reflect Skill: [M.reflect] %"
			usr<< "Dodge Skill: [M.dodge] %"
			usr<< "Critical Skill: [M.critical] %"
			usr<< ""
			usr<< "Karma: [M.karma]"
			usr<< "Karma%: [M.karma_rating]"
			usr<< "Race: [M.race]"
			usr<< "Energy Code: [num2text(M.energy_code,1000000)]"
			usr<< "---------------------"
			return
	LowGM/verb
		Summon(mob/PC/M in world)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(alert("Summon [M]?","Summon","Yes","No"))
				if("Yes")
					if(!usr||!M)return
					AdminMessage("[usr]([key]) has summoned [M]!")
					EditLog(usr,"Summoned [M].")
					M.loc=locate(x,y-1,z)
					spawn(3)if(M)M.LocationChecker()
					return
		Teleport()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			var/mob/WH
			var/YN
			var/XT=alert("Teleport Someone Else or Yourself","Teleport","Self","Other")
			var/mob/Targ
			if(XT=="Other")
				WH=input("Whom do you wish to teleport?")as mob in world
				Targ=input("Whom do you wish to teleport [WH] to?")as mob in world
				YN=alert({"Is this correct?
 Teleport: [WH]
 Target: [Targ]"},"Correct?","Yes","No")
			if(XT=="Self")
				Targ=input("Whom do you wish to teleport to?")as mob in world
				WH=usr
				YN=alert({"Is this correct?
 Teleport: [XT]
 Target [Targ]"},"Correct?","Yes","No","Cancel")
			if(YN=="Cancel"||YN=="No"||!Targ)return
			AdminMessage("[usr]([key]) has teleported: [WH] to [Targ]")
			EditLog(usr,"Teleported [WH] to [Targ].")
			if(Targ)WH.loc=Targ.loc
			if(WH==usr)view(8)<<"[usr] has teleported to [Targ]!"
			spawn(3)if(WH)WH.LocationChecker()
			return

		Guild_Title(mob/PC/M in world, ID as text)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			if(!M)return
			M.guild_title = ID
			usr<<"You <font color = green>changed</font> [M]'s title."
			EditLog(usr,"Changed [M]'s title.")
			return
		Save_Server()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(alert("Are you sure you want to save the entire server?","","Yes","No"))
				if("Yes")
					for(var/mob/PC/M in world)
						if(!M.client)continue
						M.client.SaveChar()
						sleep(1)
					world<<"<font color = gray><u>[servername]:</u> <font color=white>[usr] has saved the entire server!"
					EditLog(usr,"Saved the entire server.")
		Fix_Arena()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(alert("Are you sure you want to fix the arena?","","Yes","No"))
				if("Yes")
					for(var/mob/PC/M in world)if(M.challenge)M.loc=locate(235,135,1)
					challenge=0
					challenge_on=0
					challenger=0
					arena_on=0
					AdminMessage("[usr]([key]) has fixed the Arena.")
					EditLog(usr,"Fixed the Arena.")
		SpeedGearCheck()
			set hidden =1
			set category = "Admin"
			set name = "SpeedGear Check"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			alert("** This doesn't determine if the person does have SpeedGear on, but it checks to see if he/she is gaining more stats than usual. \
			This is how it works. The target must be either self training or lifting weights/punching machines. \
			You will get time shown while the target is under check. All you have to do is subtract two times and compare them \
			with these average delay times: Self Train - 1.1 seconds; Weight Lift 2.7 seconds; Machine Punch: 2.7 seconds. *This \
			is not 100% acurate, specially if there is alot of lag. Always double check before making a decision.*")
			for(var/mob/M in world)
				M.undercheck=0
				M.checker=""
			var/mob/SGC = input("Who do you want to check?")as mob in world
			switch(alert("Check or Stop checking [SGC]?","","Check","Stop"))
				if("Check")
					usr<<" In 10 seconds [SGC] will automatically be stopped checking."
					spawn(100)if(SGC)
						SGC.undercheck=0
						SGC.checker=""
					SGC.undercheck=1
					SGC.checker=src
				else
					SGC.undercheck=0
					SGC.checker=""
					return
		HTMLAnnounce()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			var/msg=input("HTML Announce")as null|message
			if(!msg)return
			EditLog(usr,"Announced '[msg]'.")
			world<<"<HTML>[usr] would like to announce:<br></p><hr align=center><div align=center><font color=red>[msg]<br></div><hr align=center></HTML>"
			return
		Announce()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			var/msg=input("Announce")as null|message
			if(!msg)return
			EditLog(usr,"Announced '[msg]'.")
			world<<"<p align=center><font color=red>[usr] would like to announce:<br></p><hr align=center><div align=center><font color=red>[msg]<br></div><hr align=center>"
			return
		Simulation_Difficulty()
			set category = "Admin"
			switch(input({"What Difficulty do you wish to set the Simulations to?
Easy(50%)
Medium(100%)
Hard(200%)
Extreme(500%)"}) in list ("Easy","Medium","Hard","Extreme","Cancel"))
				if("Easy")
					Simulation_difficulty = "Easy"
					world<<"\red Simulation difficulty has been set to: [Simulation_difficulty]"
					EditLog(usr,"Changed Simulation difficulty to: [Simulation_difficulty].")
					spawn(1)Simulation_DIFFICULTY()
					return
				if("Medium")
					Simulation_difficulty = "Medium"
					world<<"\red Simulation difficulty has been set to: [Simulation_difficulty]"
					EditLog(usr,"Changed Simulation difficulty to: [Simulation_difficulty].")
					spawn(1)Simulation_DIFFICULTY()
					return
				if("Hard")
					Simulation_difficulty = "Hard"
					world<<"\red Simulation difficulty has been set to: [Simulation_difficulty]"
					EditLog(usr,"Changed Simulation difficulty to: [Simulation_difficulty].")
					spawn(1)Simulation_DIFFICULTY()
					return
				if("Extreme")
					Simulation_difficulty = "Extreme"
					world<<"\red Simulation difficulty has been set to: [Simulation_difficulty]"
					EditLog(usr,"Changed Simulation difficulty to: [Simulation_difficulty].")
					spawn(1)Simulation_DIFFICULTY()
					return
				if("Cancel")return
		BanList()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(input("Select List: KeyBan. IPBan.") in list("Key Ban","IP Ban","Timer Ban","Cancel"))
				if("Key Ban")
					input("Banned List:","Banned List(Key)")as null|anything in BannedK
					input("Banned List:","Banned List(Key Spider)")as null|anything in BannedSK
					return
				if("IP Ban")
					input("Banned List:","Banned List(IP)")as null|anything in BannedA
					input("Banned List:","Banned List(IP Spider)")as null|anything in BannedSA
					return
				if("Timer Ban")
					input("Banned List:","Banned List(Timer)")as null|anything in BannedTK
					return
				if("Cancel")return
		Vote_Boost(mob/PC/M in world)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			if(M.vote_boosted)
				usr<<"\red[M] already received their vote boost!"
				return
			if(!M.client)
				usr<<"This mob isn't client!"
				return
			if(vote_boosting)
				usr<<"You're already using vote boost!"
				return
			vote_boosting=1
			switch(input("Give vote Boost?") in list("Yes","Cancel"))
				if("Yes")
					if(!M)
						vote_boosting=0
						return
					vote_boosting=0
					usr<<"\red You gave [M] their vote boost!"
					world<<"\red[M] received their vote boost!"
					M.vote_boosted=1
					M.tp += 1000
					var/amount=250
					while(amount>0)
						if(!M)return
						M.exp = M.tnl
						M.Level_Up()
						amount -= 1
						sleep(0.25)
					EditLog(usr,"Gave vote boost to [M]")
				if("Cancel")
					vote_boosting=0
					return
		Rank_Boost(mob/PC/M in world)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			if(M.rank_boosted)
				usr<<"\red[M] already received their rank boost!"
				return
			if(!M.client)
				usr<<"This mob isn't client!"
				return
			if(!M.client.IsByondMember())
				usr<<"\red[M] isn't a byond member!"
				return
			if(ranking)
				usr<<"You're already using rank boost!"
				return
			ranking=1
			switch(input("Give Rank Boost?") in list("Yes","Cancel"))
				if("Yes")
					if(!M)
						ranking=0
						return
					ranking=0
					usr<<"\red You gave [M] their rank boost!"
					world<<"\red[M] received their rank boost!"
					M.rank_boosted=1
					M.tp += 5000
					var/amount=1000
					while(amount>0)
						if(!M)return
						M.exp = M.tnl
						M.Level_Up()
						amount -= 1
						sleep(0.25)
					EditLog(usr,"Gave rank boost to [M]")
				if("Cancel")
					ranking=0
					return
		Dragonball_Manage()
			set category = "Admin"
			set name = "Dragonball Management"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(input("Revive, Destroy or Summon?")in list("Fix","Revive","Destroy","Summon","Cancel"))
				if("Fix")
					switch(input("Are you sure you want to fix dragonballs?")in list("Yes","No"))
						if("No")return
						if("Yes")
							DragonballFixer()
							usr<<"Fixed!"
							AdminMessage("[usr] Fixed the Dragonballs")
							EditLog(usr,"Fixed the dragonballs.")
				if("Destroy")
					switch(alert("Destroy the Dragonballs?","","Yes","No"))
						if("Yes")
							switch(input("Destroy which?")in list("Cancel","Earth","Namek","Black Star"))
								if("Earth")
									world<<"\red <center>[usr] destroyed the Earth Dragonballs!</center>"
									EditLog(usr,"Destroyed the Earth Dragonballs.")
									AdminMessage("[usr] has Destroyed the Earth Dragonballs.")
									for(var/obj/Earth_Dragonballs/O in world)del(O)
									return
								if("Namek")
									world<<"\red <center>[usr] destroyed the Namek Dragonballs!</center>"
									EditLog(usr,"Destroyed the Namek Dragonballs.")
									AdminMessage("[usr] has Destroyed the Namek Dragonballs.")
									for(var/obj/Namek_Dragonballs/O in world)del(O)
									return
								if("Black Star")
									world<<"\red <center>[usr] destroyed the Black Dragonballs!</center>"
									EditLog(usr,"Destroyed the Black Dragonballs.")
									AdminMessage("[usr] has Destroyed the Black Star Dragonballs.")
									for(var/obj/Black_Dragonballs/O in world)del(O)
									return
								if("Cancel")return
				if("Revive")
					alert("The games has an implanted Auto Dragonball Spawner. You might create a chain dragonball spawn. Don't use this verb unless you know what you're doing.")
					switch(alert("Revive the Dragonballs?","","Yes","No"))
						if("Yes")
							switch(input("Revive which?")in list("Cancel","Earth","Namek","Black Star"))
								if("Earth")
									var/lastdb
									if(!lastdbe)lastdb="Not performed yet."
									else lastdb="[round(((world.time/10)/60)-((lastdbe/10)/60))] minutes ago"
									if(alert("Last Earth Dragonball Revive was: [lastdb]. Revive Dragonballs?","","Yes","No")=="Yes")
										lastdbe=world.time
										EditLog(usr,"Revived the Earth Dragonballs.")
										AdminMessage("[usr] has Revived the Earth Dragonballs.")
										world.Earth_Dragonball_Spawn(1)
								if("Namek")
									var/lastdb
									if(!lastdbn)lastdb="Not performed yet."
									else lastdb="[round(((world.time/10)/60)-((lastdbe/10)/60))] minutes ago"
									if(alert("Last Namekian Dragonball Revive was: [lastdb]. Revive Dragonballs?","","Yes","No")=="Yes")
										lastdbn=world.time
										EditLog(usr,"Revived the Namek Dragonballs.")
										AdminMessage("[usr] has Revived the Namek Dragonballs.")
										world.Namek_Dragonball_Spawn(1)
								if("Black Star")
									var/lastdb
									if(!lastdbb)lastdb="Not performed yet."
									else lastdb="[round(((world.time/10)/60)-((lastdbe/10)/60))] minutes ago"
									if(alert("Last Black Dragonball Revive was: [lastdb]. Revive Dragonballs?","","Yes","No")=="Yes")
										lastdbb=world.time
										EditLog(usr,"Revived the Black Dragonballs.")
										AdminMessage("[usr] has Revived the Blackstar Dragonballs.")
										world.Black_Dragonball_Spawn(1)
								if("Cancel")return
				if("Summon")
					switch(alert("Summon the Dragonballs?","","Yes","No"))
						if("Yes")
							switch(input("Summon which?")in list("Cancel","Earth","Namek","Black Star"))
								if("Earth")
									for(var/obj/Earth_Dragonballs/O in world)O.loc=locate(x,y,z)
									EditLog(usr,"Summoned the Earth Dragonballs.")
									AdminMessage("[usr] has Summoned the Earth Dragonballs.")
									return
								if("Namek")
									for(var/obj/Namek_Dragonballs/O in world)O.loc=locate(x,y,z)
									EditLog(usr,"Summoned the Namek Dragonballs.")
									AdminMessage("[usr] has Summoned the Namek Dragonballs.")
									return
								if("Black Star")
									for(var/obj/Black_Dragonballs/O in world)O.loc=locate(x,y,z)
									EditLog(usr,"Summoned the Black Dragonballs.")
									AdminMessage("[usr] has Summoned the Black Star Dragonballs.")
									return
								if("Cancel")return
		Multi_Key()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(input("What do you want to do?","Multy key")in list("MuliKey Check","CID Check","Toggle MultiKey","Give Permission","Cancel"))
				if("Give Permission")
					var/mob/who=input("Allow who to MultiKey?")as mob in world
					if(who.client)
						switch(alert("Allow [who] to MK or disallow","","Allow","Disallow","Cancel"))
							if("Allow")
								if(!who)return
								who.canMK=1
								AdminMessage("[usr] allowed [who] to MultiKey.")
								EditLog(usr,"Allowed [who]([who.key]) to Multikey.")
								return
							if("Disallow")
								if(!who)return
								who.canMK=0
								AdminMessage("[usr] disallowed [who] to MultiKey.")
								EditLog(usr,"Disallowed [who]([who.key]) to Multikey.")
								return
							if("Cancel")return
				if("CID Check")
					var/Found[0]
					for(var/mob/PC/M in world)
						if(Found.Find(M))continue
						if(M.client)
							for(var/mob/M2 in world)
								if(!M2.client||!M2||M==M2)continue
								if(M.client.computer_id==M2.client.computer_id)
									Found+=M
									Found+=M2
									usr<<"<b>\red Match Found!"
									usr<<"<B><font color = #999999>Name:</font> [M.name] <B><font color = #999999>- Key:</font> [M.key] <B><font color = #999999>- CID:</font> [M.client.computer_id]."
									usr<<"<B><font color = #999999>Name:</font> [M2.name] <B><font color = #999999>- Key:</font> [M2.key] <B><font color = #999999>- CID:</font> [M.client.computer_id]."
				if("MuliKey Check")
					var/Found[0]
					for(var/mob/PC/M in world)
						if(Found.Find(M))continue
						if(M.client)
							for(var/mob/M2 in world)
								if(!M2.client||!M2||M==M2)continue
								if(M.client.address==M2.client.address)
									Found+=M
									Found+=M2
									usr<<"<B>\red Match Found!"
									usr<<"<B><font color = #999999>Name:</font> [M.name] <B><font color = #999999>- Key:</font> [M.key] <B><font color = #999999>- Address:</font> [M.client.address]."
									usr<<"<B><font color = #999999>Name:</font> [M2.name] <B><font color = #999999>- Key:</font> [M2.key] <B><font color = #999999>- Address:</font> [M2.client.address]."
				if("Toggle MultiKey")
					if(!MK)
						MK=1
						AdminMessage("[usr] turned MultiKey <font color = green>on</font>.")
						EditLog(usr,"Turned Multikey on.")
						return
					if(MK)
						MK=0
						AdminMessage("[usr] turned MultiKey <font color=red>off</font>.")
						EditLog(usr,"Turned Multikey off.")
						return
				if("Cancel")return
		Rename(mob/PC/M as mob in world,ID as text)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color='#4d503b'>Your admin powers are locked."
				return
			if(!ID||!M)return
			for(var/mob/N in world)
				if(N.name==""||N.name==null||N.name==0)
					N.name="NameLess"
					usr<<"<font color='#4d503b'>Found Nameless. Renamed to NameLess. Key: [N.key]"
			var/namecheck=ID
			EditLog(usr,"Renamed [M] to [ID].")
			AdminMessage("[usr]([key]) has renamed [M] to [ID].")
			var/savefile/S=new("World Save Files/Player Names.sav")
			NameList.Remove(M.name)
			M.name=ID
			M.AddName()
			NameList.Add(namecheck)
			S["NameList"]<<NameList
			M.CreateName()
			usr<<"You <font color = blue>changed</font> [M]'s name."
			return
	BanGM/verb
		Ban()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			var/list/BP=new/list()
			for(var/mob/PC/C in world)BP.Add(C)
			BP.Add("Cancel")
			var/mob/M=input("Who do you wish to Ban?")in BP
			if(M=="Cancel")return
			if(M==usr)
				usr<<"You cannot ban yourself!"
				return
			if(!M)return
			var/bankey=M.ckey
			var/banip=M.client.address
			var/bancip=M.client.computer_id
			switch(alert("Are you sure you want to ban [M]([bankey])?","Ban [M]","Yes","No"))
				if("Yes")
					if(!M||!usr)return
					if(M.GMLevel>=GMLevel)
						AdminMessage("[usr] tried banning [bankey].")
						return
					else
						var/Reason=input("Input a reason.")as text
						var/Type=input("Ban Key or Address?")in list("Key","Address","Both")
						var/timer=input("Do you want to include an auto unban timer?")in list("No","Yes")
						var/spider="Normal Ban"
						if(!M)return
						if(Type=="Key")
							if(timer=="Yes")
								var/list/banyy=list("2011","2012")
								var/list/banmm=list("01","02","03","04","05","06","07","08","09","10","11","12")
								var/list/bandd=list("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31")
								var/list/banhh=list("00","01","02","02","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23")
								var/monthban=input("Select the month of the unban:")in banmm
								var/dayban=input("Select the day of the unban:")in bandd
								var/yearban=input("Select the year of the unban:")in banyy
								var/hourban=input("Select the hour of the unban:")in banhh
								var/bantime="[monthban]/[dayban]/[yearban]:[hourban]"
								BannedTK.Add("[bantime] [bankey]")
								var/savefile/Z = new("World Save Files/Timed Bans.sav")
								Z["BannedTK"]<<BannedTK
								var/savefile/IP=new("World Save Files/BannedIP.sav")
								IP["BannedIP"]<<BannedIP
							else
								if(spider=="Normal Ban")
									BannedK.Add(bankey)
									var/savefile/Z = new("World Save Files/Bans.sav")
									Z["BannedK"]<<BannedK
									BannedIP.Add(bancip)
									var/savefile/IP=new("World Save Files/BannedIP.sav")
									IP["BannedIP"]<<BannedIP
						if(Type=="Address")
							if(timer=="Yes")
								var/list/banyy=list("2011","2012")
								var/list/banmm=list("01","02","03","04","05","06","07","08","09","10","11","12")
								var/list/bandd=list("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31")
								var/list/banhh=list("00","01","02","02","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23")
								var/monthban=input("Select the month of the unban:")in banmm
								var/dayban=input("Select the day of the unban:")in bandd
								var/yearban=input("Select the day of the unban:")in banyy
								var/hourban=input("Select the hour of the unban:")in banhh
								var/bantime="[monthban]/[dayban]/[yearban]:[hourban]"
								BannedTK.Add("[bantime] [banip]")
								var/savefile/Z = new("World Save Files/Timed Bans.sav")
								Z["BannedTK"]<<BannedTK
								BannedIP.Add(bancip)
								var/savefile/IP=new("World Save Files/BannedIP.sav")
								IP["BannedIP"]<<BannedIP
							if(timer=="No")
								if(spider=="Normal Ban")
									BannedA.Add(banip)
									var/savefile/Z = new("World Save Files/Bans.sav")
									Z["BannedA"]<<BannedA
									BannedIP.Add(bancip)
									var/savefile/IP=new("World Save Files/BannedIP.sav")
									IP["BannedIP"]<<BannedIP
						if(Type=="Both")
							if(timer=="Yes")
								var/list/banyy=list("2011","2012")
								var/list/banmm=list("01","02","03","04","05","06","07","08","09","10","11","12")
								var/list/bandd=list("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31")
								var/list/banhh=list("00","01","02","02","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23")
								var/monthban=input("Select the month of the unban:")in banmm
								var/dayban=input("Select the day of the unban:")in bandd
								var/yearban=input("Select the day of the unban:")in banyy
								var/hourban=input("Select the hour of the unban:")in banhh
								var/bantime="[monthban]/[dayban]/[yearban]/[hourban]"
								BannedTK.Add("[bantime] [bankey]")
								BannedTK.Add("[bantime] [banip]")
								var/savefile/Z = new("World Save Files/Timed Bans.sav")
								Z["BannedTK"]<<BannedTK
								BannedIP.Add(bancip)
								var/savefile/IP=new("World Save Files/BannedIP.sav")
								IP["BannedIP"]<<BannedIP
							if(timer=="No")
								if(spider=="Normal Ban")
									BannedK.Add(bankey)
									BannedA.Add(banip)
									var/savefile/Z = new("World Save Files/Bans.sav")
									Z["BannedA"]<<BannedA
									Z["BannedK"]<<BannedK
									BannedIP.Add(bancip)
									var/savefile/IP=new("World Save Files/BannedIP.sav")
									IP["BannedIP"]<<BannedIP
						if(M)
							world<<"<b>[M]([M.key]) has been <font color=red>banned</font> by [src]. ([Type])([Reason])"
							EditLog(usr,"Banned [M]([M.key]).")
							del(M)
						return
				if("No")return
	LowGM/verb
		Player_Check()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			usr<<"<font color=#105090>Player Information:"
			var/Found[0]
			for(var/mob/PC/M in world)
				if(Found[M])continue
				if(M.client)
					Found+=M
					usr<<"<font color=#105090>  Name: [M]. Key: [M.key]. Address: [M.client.address]."
		Delete(M as obj|turf)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(alert("Delete?","","Yes","No"))
				if("Yes")
					EditLog(usr,"Deleted [M].")
					del(M)
					return
				else return
		Fix_Layers(mob/PC/M in world)
			set category="Admin"
			switch(alert("Fix Overlays or Underlays?","","Overlays","Underlays","Cancel"))
				if("Cancel")return
				if("Overlays")
					M.overlays-=M.overlays
					for(var/obj/Equipment/O in M.contents)
						if(O.eq)O.eq=0
						M.head="EMPTY"
						M.back="EMPTY"
						M.chest="EMPTY"
						M.legs="EMPTY"
						M.feet="EMPTY"
						M.arms="EMPTY"
						M.hands="EMPTY"
						M.waist="EMPTY"
						M.underclothes="EMPTY"
						M.clothes="EMPTY"
						M.clothes_eq=0
						M.scouter=0
						M.scouter_eq=0
						M.armor=0
						M.armor_eq=0
						M.under=0
						M.under_eq=0
						M.helmet=0
						M.helmet_eq=0
						M.gloves=0
						M.gloves_eq=0
						M.z_sword=0
						M.radar=0
						M.hench_equiped=0
						M.saiyan_equiped=0
						M.sellable_items=0
						M.weightgi=0
						M.weightcape=0
						M.weightarmor=0
						M.weightarm=0
						M.weightleg=0
						M.weightankle=0
						M.weightwrist=0
						M.weighthead=0
						M.f_armor=0
						O.suffix=null
						O.equiped=0
						M.gitems=0
					EditLog(usr,"Fixed [M]'s overlays.")
					return
				if("Underlays")
					M.underlays-=M.underlays
					for(var/obj/Equipment/O in M.contents)
						if(O.eq)O.eq=0
						M.head="EMPTY"
						M.back="EMPTY"
						M.chest="EMPTY"
						M.legs="EMPTY"
						M.feet="EMPTY"
						M.arms="EMPTY"
						M.hands="EMPTY"
						M.waist="EMPTY"
						M.underclothes="EMPTY"
						M.clothes="EMPTY"
						M.clothes_eq=0
						M.scouter=0
						M.scouter_eq=0
						M.armor=0
						M.armor_eq=0
						M.under=0
						M.under_eq=0
						M.helmet=0
						M.helmet_eq=0
						M.gloves=0
						M.gloves_eq=0
						M.z_sword=0
						M.radar=0
						M.hench_equiped=0
						M.saiyan_equiped=0
						M.sellable_items=0
						M.weightgi=0
						M.weightcape=0
						M.weightarmor=0
						M.weightarm=0
						M.weightleg=0
						M.weightankle=0
						M.weightwrist=0
						M.weighthead=0
						M.f_armor=0
						O.suffix=null
						O.equiped=0
						M.gitems=0
					if(M.aura_on)M.aura_on=0
					M.CreateName()
					EditLog(usr,"Fixed [M]'s underlays.")
					return
	MedGM/verb
		WorldReboot()
			set category="Admin"
			set name="World Reboot"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(alert("Are you sure you want to reboot the world?","Reboot World","Yes","No"))
				if("Yes")
					if(GM_WorldShutDownProc)
						usr<<"World is already in shutdown mode!"
						return
					var/TTime=input("Enter a number 5-15.")as num
					if(TTime<5||TTime>15)return
					AdminMessage("[usr] has innitiated the world reboot.")
					GM_WorldShutDownProc=1
					world<<"<font color=red>Server Reboot enabled. Saving characters."
					for(var/mob/PC/C in world)
						if(!C.client)continue
						C.client.SaveChar()
						sleep(1)
					world<<"<font color=red>Characters saved!"
					while(TTime>=1)
						if(TTime<=5)cantsaveatall=1
						if(!GM_WorldShutDownProc)
							cantsaveatall=0
							world<<"<center><font color=red>World shutdown disabled.</font></center>"
							return
						world<<"<center>Server Reboot in [TTime] seconds."
						TTime-=1
						sleep(10)
					world<<"Rebooting... safely logging out players."
					for(var/mob/M in world)
						if(!M.client||M==usr)continue
						del(M)
					world.Reboot()
				if("No")return
		UnBan()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			var/ListB=input("Unban what?")in list("Key","IP","CIP","Cancel")
			if(ListB=="Cancel")return
			var/Utype=input("Unban from a list or type it in?")in list("List Unban","Specific Unban","Timer Ban List")
			if(ListB=="CIP")
				if(Utype=="List Unban")
					var/selected=input("Which IP do you wish to unban?")as null|anything in BannedIP
					if(!selected)return
					switch(alert("Do you wish to unban: [selected] ?","","Yes","No"))
						if("No")return
						else
							if(BannedIP.Find(selected))
								BannedIP.Remove(selected)
								AdminMessage("[usr] unbanned: [selected]")
								var/savefile/IP=new("World Save Files/BannedIP.sav")
								IP["BannedIP"]<<BannedIP
							else
								usr<<"IP not found."
								return
			if(ListB=="IP")
				if(Utype=="Specific Unban")
					var/ipunban=input("Unban which IP?")as null|text
					if(!ipunban)return
					if(BannedA.Find(ipunban))
						BannedA.Remove(ipunban)
						var/savefile/Z = new("World Save Files/Bans.sav")
						Z["BannedA"]<<BannedA
						AdminMessage("[usr] unbanned: [ipunban]")
					else usr<<"IP not found."
					if(BannedSA.Find(ipunban))
						BannedSA.Remove(ipunban)
						var/savefile/Z = new("World Save Files/Bans.sav")
						Z["BannedSA"]<<BannedSA
						AdminMessage("[usr] unbanned: [ipunban]")
					else usr<<"IP not found."
				if(Utype=="List Unban")
					var/selected=input("Which IP do you wish to unban?")as null|anything in BannedA
					if(!selected)return
					switch(alert("Do you wish to unban: [selected] ?","","Yes","No"))
						if("No")return
						else
							if(BannedA.Find(selected))
								BannedA.Remove(selected)
								AdminMessage("[usr] unbanned: [selected]")
								var/savefile/Z = new("World Save Files/Bans.sav")
								Z["BannedA"]<<BannedA
				if(Utype=="Timer Ban List")
					var/selected=input("Who do you wish to unban?")as null|anything in BannedTK
					if(!selected)return
					switch(alert("Do you wish to unban: [selected] ?","","Yes","No"))
						if("No")return
						else
							if(BannedTK.Find(selected))
								BannedTK.Remove(selected)
								AdminMessage("[usr] unbanned: [selected]")
								var/savefile/Z = new("World Save Files/Timer Bans.sav")
								Z["BannedTK"]<<BannedTK
			else
				if(Utype=="Timer Ban List")
					var/selected=input("Who do you wish to unban?")as null|anything in BannedTK
					if(!selected)return
					switch(alert("Do you wish to unban: [selected] ?","","Yes","No"))
						if("No")return
						else
							if(BannedTK.Find(selected))
								BannedTK.Remove(selected)
								AdminMessage("[usr] unbanned: [selected]")
								var/savefile/Z = new("World Save Files/Timer Bans.sav")
								Z["BannedTK"]<<BannedTK
				if(Utype=="Specific Unban")
					var/keyunban=input("Unban which key?")as null|text
					if(!keyunban)return
					var/ckeyunban=ckey(keyunban)
					for(var/X in BannedTK)
						var/XX=copytext(X,15)
						if(XX==keyunban)
							BannedTK.Remove(X)
							AdminMessage("[usr] unbanned: [ckeyunban]")
							var/savefile/Z = new("World Save Files/Timer Bans.sav")
							Z["BannedTK"]<<BannedTK
					if(BannedK.Find(ckeyunban))
						BannedK.Remove(ckeyunban)
						AdminMessage("[usr] unbanned: [ckeyunban]")
					else usr<<"Key not found."
					if(BannedSK.Find(ckeyunban))
						BannedSK.Remove(ckeyunban)
						AdminMessage("[usr] unbanned: [ckeyunban]")
					else usr<<"Key not found."
					if(CreationSpam.Find("1[ckeyunban]"))CreationSpam.Remove("1[ckeyunban]")
					if(CreationSpam.Find("2[ckeyunban]"))CreationSpam.Remove("2[ckeyunban]")
					if(CreationSpam.Find("3[ckeyunban]"))CreationSpam.Remove("3[ckeyunban]")
					var/savefile/Z = new("World Save Files/Bans.sav")
					Z["BannedK"]<<BannedK
					Z["BannedSK"]<<BannedSK
					var/savefile/S = new("World Save Files/GM.sav")
					S["CreationSpam"]<<CreationSpam
					return
				if(Utype=="List Unban")
					var/selected=input("Which key do you wish to unban?")as null|anything in BannedK
					if(!selected)return
					switch(alert("Do you wish to unban: [selected] ?","","Yes","No"))
						if("No")return
						else
							for(var/X in BannedTK)
								var/XX=copytext(X,15)
								if(XX==selected)
									BannedTK.Remove(X)
									var/savefile/Z = new("World Save Files/Timer Bans.sav")
									Z["BannedTK"]<<BannedTK
							if(BannedK.Find(selected))
								BannedK.Remove(selected)
								AdminMessage("[usr] unbanned: [selected]")
								if(CreationSpam.Find("1[selected]"))CreationSpam.Remove("1[selected]")
								if(CreationSpam.Find("2[selected]"))CreationSpam.Remove("2[selected]")
								if(CreationSpam.Find("3[selected]"))CreationSpam.Remove("3[selected]")
								var/savefile/Z = new("World Save Files/Bans.sav")
								Z["BannedK"]<<BannedK
								var/savefile/S = new("World Save Files/GM.sav")
								S["CreationSpam"]<<CreationSpam
								return
			world.AutoUnbanTimer()

		Votes_Toggle()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(alert("Enable or Disable player's votes? Only enable if there are no GMs on to enforce.","","Enable","Disable"))
				if("Disable")
					voteson=0
					EditLog(usr,"Disabled Player Votes.")
					AdminMessage("[usr]([key]) has <u><font color=red>disabled</font></u> Player Votes.")
				else
					voteson=1
					EditLog(usr,"Enabled Player Votes.")
					AdminMessage("[usr]([key]) has <u><font color=green>enabled</font></u> Player Votes.")
		Ban_Manually()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			var/ipkey=input("Ban a Key or IP?")in list("Key","IP","Cancel")
			if(ipkey=="Cancel")return
			var/k=input("Type in the key or IP you wish to Ban:")as text
			if(k==ckey)
				usr<<"You sure you want to ban yourself? N00b!"
				return
			if(k==client.address)
				usr<<"You sure you want to ban yourself? N00b!"
				return
			if(!k)return
			if(StaffEnf.Find(k)&&GMLevel<7)
				usr<<"You can only ban people with lower GM level than you."
				return
			if(MasterEnf.Find(k)&&GMLevel<6)
				usr<<"You can only ban people with lower GM level than you."
				return
			if(HighEnf.Find(k)&&GMLevel<5)
				usr<<"You can only ban people with lower GM level than you."
				return
			if(MediumEnf.Find(k)&&GMLevel<4)
				usr<<"You can only ban people with lower GM level than you."
				return
			if(LowEnf.Find(k)&&GMLevel<3)
				usr<<"You can only ban people with lower GM level than you."
				return
			if(TrialEnf.Find(k)&&GMLevel<2)
				usr<<"You can only ban people with lower GM level than you."
				return
			if(k=="[mainkey1]"||k=="AngelReincarnation")
				switch(alert("Are you 100% sure you want to ban [k]?","","Ban","Cancel"))
					if("Ban")
						if(ckey!="[mainkey1]"||ckey!="AngelReincarnation")
							usr<<"Error: You cannot ban the owner!"
							return
			if(k!="[mainkey1]"||k!="AngelReincarnation")
				switch(alert("Spider or Timer?","","Spider","Timer","Cancel"))
					if("Cancel")return
					if("Spider")
						if(ipkey=="Key")
							var/ck=ckey(k)
							BannedSK.Add(ck)
						if(ipkey=="IP")BannedSA.Add(k)
						BanSave()
					if("Timer")
						var/list/banyy=list("2011","2012")
						var/list/banmm=list("01","02","03","04","05","06","07","08","09","10","11","12")
						var/list/bandd=list("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31")
						var/list/banhh=list("00","01","02","02","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23")
						var/monthban=input("Select the month of the unban:")in banmm
						var/dayban=input("Select the day of the unban:")in bandd
						var/yearban=input("Select the year of the unban:")in banyy
						var/hourban=input("Select the hour of the unban:")in banhh
						var/bantime="[monthban]/[dayban]/[yearban]:[hourban]"
						if(ipkey=="Key")
							var/ck=ckey(k)
							BannedTK.Add("[bantime] [ck]")
						if(ipkey=="IP")BannedTK.Add("[bantime] [k]")
						var/savefile/Z = new("World Save Files/Timed Bans.sav")
						Z["BannedTK"]<<BannedTK
				AdminMessage("[usr]([key]) has \red banned</font> [k]")
				return
		Invisibility()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			if(!invisibility)
				invisibility=7
				density=0
				return
			invisibility=0
			density=1
			return
		Simulations_Management()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(alert("Start or stop Simulations?","","Start","Stop","Cancel"))
				if("Start")
					switch(alert("Good or Evil Simulations?","","Good","Evil","Cancel"))
						if("Cancel")return
						if("Evil")
							for(var/mob/Simulation/M in world)del(M)
							Simulations_on=1
							Simulations_evil=1
							Simulations_good=0
							Simulation="Not On"
							part="Not On"
							Simulation_difficulty="Easy"
							Simulation_episode=0
							Simulation_spawned=0
							EditLog(usr,"Started 'Evil' Simulations.")
							spawn(10)world.Simulation_CHECK()
							return
						if("Good")
							for(var/mob/Simulation/M in world)del(M)
							Simulations_on=1
							Simulations_evil=0
							Simulations_good=1
							Simulation="Saiyan"
							part="Piccolo and Goku"
							Simulation_difficulty="Easy"
							Simulation_episode=0
							EditLog(usr,"Started 'Good' Simulations.")
							spawn(10)world.Simulation_CHECK()
							return
				if("Stop")
					world<<"<font color = green><u>Simulation Information:</u></font> Simulations has been de-activated!"
					Simulations_on=0
					Simulations_evil=0
					Simulations_good=0
					Simulation_spawned=0
					Simulation="Not On"
					part="Not On"
					Simulation_difficulty="Easy"
					Simulation_episode=0
					EditLog(usr,"Stopped Simulations.")
					for(var/mob/Simulation/M in world)del(M)
					return
				if("Cancel")return
		Fix_Tournament()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(alert("Are you sure you want to cancel the tournament?","","Yes","No"))
				if("Yes")
					KILLTOURNY()
					BabaKILLTOURNY()
					jrKILLTOURNY()
					GuildKILLTOURNY()
					RKILLTOURNY()
					AdminMessage("[usr]([key]) has fixed the tournament.")
					EditLog(usr,"Fixed the tournament.")
		Fix_Guild_War()
			set category="Admin"
			switch(alert("Are you sure you want to cancel the Guild War?","","Yes","No"))
				if("Yes")
					AdminMessage("[usr]([key]) has fixed the Guild War.")
					EditLog(usr,"Fixed the Guild War.")
					guild_war_1=null
					guild_war_2=null
					gwar_on=0
					gwar_blocked=0
					for(var/mob/PC/M in world)
						if(M.in_war)
							M.loc=locate(246,54,1)
							M.it_lock=0
							M.it_blocked=0
							M.in_war=0
		Begin_Guild()
			set category="Admin"
			set name="Start Auto Guild Tournament"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(alert("Are you sure you wish to start an automatic guild tournament?","Confirm","Yes","No"))
				if("No")return
				if("Yes")
					if(rtournament)
						usr<<"There's already a race tournament going on!"
						return
					if(jrtournament)
						usr<<"There's already a junior tournament going on!"
						return
					if(babatournament)
						usr<<"There's already a baba tournament going on!"
						return
					if(tournament)
						usr<<"There's already a world tournament going on!"
						return
					if(guildtournament)
						usr<<"There's already a guild tournament going on!"
						return
					GuildKILLTOURNY()
					GuildEntries=list()
					GuildWinners=list()
					GuildLosers=list()
					guildtournament=1
					for(var/mob/PC/M in world)
						M.verbs+=new/mob/GuildTournament/verb/Enter_Tournament()
						M.verbs+=new/mob/GuildTournament/verb/Leave_Tournament()
					spawn(25)AutoRevive()
					EditLog(usr,"Started an automatic Guild Tournament.")
					world<<"<center><font size=3><font color = gray><b><center>[usr] has started an automatic Guild Tournament!<br><font size=1>To join, please go to Channels tab and select Enter Guild Tournament."
		Stop_Guild_Tourny_Entance()
			set category="Admin"
			set name="Stop Auto Guild Tournament"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			if(guildtournament)
				EditLog(usr,"Ended an automatic Guild Tournament.")
				world<<"<center><font size=3><font color=red><b><center>The Guild Tournament entry has now ended."
				world<<"<font size=1><font color=red><b>The following people are in the Guild Tournament:"
				world<<"<font size=1><font color=red><b>[firstguild]:"
				for(var/mob/M in GuildTeamOne)world<<"[M]"
				world<<"<font size=1><font color=blue><b>[secondguild]:"
				for(var/mob/M in GuildTeamTwo)world<<"[M]"
				for(var/mob/M in world)
					M.verbs-=new/mob/GuildTournament/verb/Enter_Tournament()
					M.verbs-=new/mob/GuildTournament/verb/Leave_Tournament()
				if(GuildOneTeam<2||GuildTwoTeam<2)
					guildstarted=0
					world<<"<center><font size=3>Not enough players, Guild Tournament cancelled."
					for(var/mob/PC/M in world)
						M.verbs-=new/mob/GuildTournament/verb/Enter_Tournament()
						M.verbs-=new/mob/GuildTournament/verb/Leave_Tournament()
					guildtournament=0
					GuildKILLTOURNY()
					return
				Guild_Tournament_AI()
		FFAStart()
			set category="Admin"
			set name="Start Auto FFA Tournament"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked.</font>"
				return
			switch(alert("Are you sure you wish to start an automatic FFA tournament?","Confirm","Yes","No"))
				if("No")return
				if("Yes")
					if(hunter_event)
						usr<<"There's already a Hunter Event going on!"
						return
					if(rtournament)
						usr<<"There's already a race tournament going on!"
						return
					if(jrtournament)
						usr<<"There's already a junior tournament going on!"
						return
					if(tournament)
						usr<<"There's already a world tournament going on!"
						return
					if(babatournament)
						usr<<"There's already a baba tournament going on!"
						return
					if(guildtournament)
						usr<<"There's already a guild tournament going on!"
						return
					if(ffatournament)
						usr<<"There's already a FFA tournament going on!"
						return
					FFAEntries=list()
					FFAWinners=list()
					FFALosers=list()
					ffatournament=1
					for(var/mob/PC/M in world)
						M.verbs+=new/mob/Tournament/verb/FFAEnter_Tournament()
						M.verbs+=new/mob/Tournament/verb/FFALeave_Tournament()
					spawn(25)AutoRevive()
					EditLog(usr,"Started an automatic FFA Tournament.")
					world<<"<center><font size=3 color=red><b>[usr] has started an automatic FFA Tournament!</b></font><br><font size=1>To join, please go to Channels tab and select Enter Tournament.</font></center>"
		FFAStop()
			set category="Admin"
			set name="Stop Auto FFA Tournament"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked.</font>"
				return
			if(ffatournament&&!ffatournament_started)
				EditLog(usr,"Ended an automatic FFA Tournament.")
				ffastarted=1
				world<<"<center><font size=3 color=red><b>The tournament entry has now ended.</b></font></center>"
				world<<"<font size=1 color=red><b>The following people are in the tournament:</b></font>"
				for(var/mob/PC/M in world)if(M.ffatourny)world<<"[M]"
				if(FFAEntries.len<=1&&FFAWinners.len<1)
					ffastarted=0
					world<<"<center><font size=3 color=#5f9ea0>Not enough players, tournament cancelled.</font></center>"
					ffatournament=0
					for(var/mob/PC/C in world)
						if(FFAEntries.Find(C))
							var/amount=75
							amount=75
							C<<"<font color=gray>Loser reward: You've been granted 75 levels for just participating in the FFA Tournament, [C]!</font>"
							FFAEntries.Remove(C)
							spawn(70)if(C)
								while(amount>0)
									if(!C)return
									C.exp=C.tnl
									C.Level_Up()
									amount--
									sleep(0.155)
					FFAKILLTOURNY()
				else FFATournament_AI()
		Begin_Baba()
			set category="Admin"
			set name="Start Auto Baba Tournament"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(alert("Are you sure you wish to start an automatic baba tournament?","Confirm","Yes","No"))
				if("No")return
				if("Yes")
					if(rtournament)
						usr<<"There's already a race tournament going on!"
						return
					if(jrtournament)
						usr<<"There's already a junior tournament going on!"
						return
					if(babatournament)
						usr<<"There's already a baba tournament going on!"
						return
					if(tournament)
						usr<<"There's already a world tournament going on!"
						return
					if(guildtournament)
						usr<<"There's already a guild tournament going on!"
						return
					BabaKILLTOURNY()
					BabaEntries=list()
					BabaWinners=list()
					BabaLosers=list()
					babatournament=1
					for(var/mob/PC/M in world)
						M.verbs+=new/mob/BabaTournament/verb/Enter_Tournament()
						M.verbs+=new/mob/BabaTournament/verb/Leave_Tournament()
					spawn(25)AutoRevive()
					EditLog(usr,"Started an automatic Baba Tournament.")
					world<<"<center><font size=3><font color = gray><b><center>[usr] has started an automatic Baba Tournament!<br><font size=1>To join, please go to Channels tab and select Enter Baba Tournament."
		Stop_Baba_Tourny_Entance()
			set category="Admin"
			set name="Stop Auto Baba Tournament"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			if(babatournament)
				EditLog(usr,"Ended an automatic Baba Tournament.")
				world<<"<center><font size=3><font color=red><b><center>The Baba Tournament entry has now ended."
				world<<"<font size=1><font color=red><b>The following people are in the Baba Tournament:"
				world<<"<font size=1><font color=red><b>The Red Team:"
				for(var/mob/M in BabaTeamOne)world<<"[M]"
				world<<"<font size=1><font color=blue><b>The Blue Team:"
				for(var/mob/M in BabaTeamTwo)world<<"[M]"
				for(var/mob/M in world)
					M.verbs-=new/mob/BabaTournament/verb/Enter_Tournament()
					M.verbs-=new/mob/BabaTournament/verb/Leave_Tournament()
				if(BabaOneTeam<2||BabaTwoTeam<2)
					babastarted=0
					world<<"<center><font size=3>Not enough players, Baba Tournament cancelled."
					for(var/mob/PC/M in world)
						M.verbs-=new/mob/BabaTournament/verb/Enter_Tournament()
						M.verbs-=new/mob/BabaTournament/verb/Leave_Tournament()
					babatournament=0
					BabaKILLTOURNY()
					return
				Baba_Tournament_AI()
		RStart()
			set category="Admin"
			set name="Start Auto Race Tournament"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(alert("Are you sure you wish to start an automatic race tournament?","Confirm","Yes","No"))
				if("No")return
				if("Yes")
					EditLog(usr,"Started an automatic Race Tournament.")
					if(rtournament)
						usr<<"There's already a race tournament going on!"
						return
					if(jrtournament)
						usr<<"There's already a junior tournament going on!"
						return
					if(tournament)
						usr<<"There's already a world tournament going on!"
						return
					if(babatournament)
						usr<<"There's already a baba tournament going on!"
						return
					if(guildtournament)
						usr<<"There's already a guild tournament going on!"
						return
					spawn(1400)
						rtournament_racenum++
						if(rtournament_racenum>18)rtournament_racenum=1
						switch(rtournament_racenum)
							if(1)rtournament_race="Android"
							if(2)rtournament_race="Bio-Android"
							if(3)rtournament_race="Bio-Warrior"
							if(4)rtournament_race="Changeling"
							if(5)rtournament_race="Demon"
							if(6)rtournament_race="Dragon"
							if(7)rtournament_race="Galatic Warrior"
							if(8)rtournament_race="Half Saiyan"
							if(9)rtournament_race="Human"
							if(10)rtournament_race="Kai"
							if(11)rtournament_race="Konat"
							if(12)rtournament_race="Majin"
							if(13)rtournament_race="Makyo"
							if(14)rtournament_race="Namekian"
							if(15)rtournament_race="Saibaman"
							if(16)rtournament_race="Saiyan"
							if(17)rtournament_race="Tuffle"
							if(18)rtournament_race="Ultimate Hybrid"
					REntries=list()
					RWinners=list()
					RLosers=list()
					rtournament=1
					for(var/mob/PC/M in world)
						M.verbs+=new/mob/Tournament/verb/REnter_Tournament()
						M.verbs+=new/mob/Tournament/verb/RLeave_Tournament()
					spawn(25)AutoRevive()
					world<<"<center><font size=3><font color=red><b><center>[usr] has started an automatic Race Tournament, the prize is your choice!<br><font size = 1>To join, please go to Channels tab and select Enter Tournament."
		RStop()
			set category="Admin"
			set name="Stop Auto Race Tournament"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			if(rtournament&&!rstarted&&!rmatch)
				EditLog(usr,"Ended an automatic Race Tournament.")
				rstarted=1
				world<<"<center><font size=3><font color=red><b><center>The tournament entry has now ended."
				world<<"<font size=1><font color=red><b>The following people are in the tournament"
				for(var/mob/PC/M in world)if(M.rtourny)world<<"[M]"
				if(REntries.len<=1&&RWinners.len<1)
					rstarted=0
					world<<"<center><font size=3><font color=#5f9ea0>Not enough players, tournament cancelled."
					rtournament=0
					RKILLTOURNY()
				else RTournament_AI()
		JrStart()
			set category="Admin"
			set name="Start Auto Junior Tournament"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(alert("Are you sure you wish to start an automatic junior tournament?","Confirm","Yes","No"))
				if("No")return
				if("Yes")
					EditLog(usr,"Started an automatic Junior Tournament.")
					if(rtournament)
						usr<<"There's already a race tournament going on!"
						return
					if(jrtournament)
						usr<<"There's already a junior tournament going on!"
						return
					if(tournament)
						usr<<"There's already a world tournament going on!"
						return
					if(babatournament)
						usr<<"There's already a baba tournament going on!"
						return
					if(guildtournament)
						usr<<"There's already a guild tournament going on!"
						return
					jrEntries=list()
					jrWinners=list()
					jrLosers=list()
					jrtournament=1
					for(var/mob/PC/M in world)
						M.verbs+=new/mob/Tournament/verb/JREnter_Tournament()
						M.verbs+=new/mob/Tournament/verb/JRLeave_Tournament()
					spawn(25)AutoRevive()
					world<<"<center><font size=3><font color=red><b><center>[usr] has started an automatic Junior Tournament, the prize is your choice!<br><font size = 1>To join, please go to Channels tab and select Enter Tournament."
		jrStop()
			set category="Admin"
			set name="Stop Auto Junior Tournament"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			if(jrtournament&&!started&&!match)
				EditLog(usr,"Ended an automatic Junior Tournament.")
				jrstarted=1
				world<<"<center><font size=3><font color=red><b><center>The tournament entry has now ended."
				world<<"<font size=1><font color=red><b>The following people are in the tournament"
				for(var/mob/PC/M in world)if(M.jrtourny)world<<"[M]"
				if(jrEntries.len<=1&&jrWinners.len<1)
					jrstarted=0
					world<<"<center><font size=3><font color=#5f9ea0>Not enough players, tournament cancelled."
					jrtournament=0
					jrKILLTOURNY()
				else jrTournament_AI()
		Begin()
			set category="Admin"
			set name="Start Auto World Tournament"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(alert("Are you sure you wish to start an automatic world tournament?","Confirm","Yes","No"))
				if("No")return
				if("Yes")
					EditLog(usr,"Started an automatic World Tournament.")
					if(rtournament)
						usr<<"There's already a race tournament going on!"
						return
					if(jrtournament)
						usr<<"There's already a junior tournament going on!"
						return
					if(tournament)
						usr<<"There's already a world tournament going on!"
						return
					if(babatournament)
						usr<<"There's already a baba tournament going on!"
						return
					if(guildtournament)
						usr<<"There's already a guild tournament going on!"
						return
					Entries=list()
					Winners=list()
					Losers=list()
					tournament=1
					for(var/mob/PC/M in world)
						M.verbs+=new/mob/Tournament/verb/Enter_Tournament()
						M.verbs+=new/mob/Tournament/verb/Leave_Tournament()
					spawn(25)AutoRevive()
					world<<"<center><font size=3><font color=red><b><center>[usr] has started an automatic World Tournament, the prize is your choice!<br><font size = 1>To join, please go to Channels tab and select Enter Tournament."
		Stop_Tourny_Entance()
			set category="Admin"
			set name="Stop Auto World Tournament"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			if(tournament&&!started&&!match)
				EditLog(usr,"Ended an automatic World Tournament.")
				started=1
				world<<"<center><font size=3><font color=red><b><center>The tournament entry has now ended."
				world<<"<font size=1><font color=red><b>The following people are in the tournament"
				for(var/mob/PC/M in world)if(M.tourny)world<<"[M]"
				if(Entries.len<=1&&Winners.len<1)
					started=0
					world<<"<center><font size=3><font color=#5f9ea0>Not enough players, tournament cancelled."
					tournament=0
					KILLTOURNY()
				else Tournament_AI()
	HighGM/verb
		LAnnounce(txt as text) // L for local...
			set name = "LAnnounce"
			set category = "Admin"
			world << "[txt]"
		MusicPlay(S as sound)
			set name = "Music Play"
			set category = "Admin"
			view(src) << sound(S,0)
			view(src) << "[src.name] plays [S] for us!"
		MusicStop()
			set name = "Music Stop"
			set category = "Admin"
			view(src) << sound(null)
			view(src) << "[src.name] has stopped the music!"
		AIAnnounce(txt as text) // L for local...
			set name = "AI Announce"
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			world << "<b><font size=-1><font color=green>Dragon AI: </font>[txt]"
		Environmental_Damage()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(alert("Turn Environmental Damage On or Off?","","On","Off"))
				if("On")
					AdminMessage("[usr]([key]) turned Environmental Damage On")
					EditLog(usr,"Turned Environmental Damage on.")
					grass_damage=1
					return
				if("Off")
					AdminMessage("[usr]([key]) turned Environmental Damage Off")
					EditLog(usr,"Turned Environmental Damage off.")
					grass_damage=0
					return
		Mute_Channels()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(alert("What do you want to do?","","Mute Channels","UnMute Channels","Cancel"))
				if("Cancel")return
				if("UnMute Channels")
					channelmute=""
					world<<"\red [usr] has unmuted all chat channels!"
					EditLog(usr,"Unmuted all chat channels.")
					return
				if("Mute Channels")
					switch(alert("Do you want to include the say channel?","Yes","No"))
						if("No")
							channelmute="On"
							EditLog(usr,"Muted all chat channels(say is available).")
							world<<"\red [usr] has muted all chat channels(say is available)!"
							return
						if("Yes")
							channelmute="All"
							EditLog(usr,"Muted all chat channels.")
							world<<"\red [usr] has muted all chat channels!"
							return
		World_mute()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(alert("Do you want to mute or unmute the world?","","Mute","UnMute","Cancel"))
				if("Cancel")return
				if("Mute")
					World_Mute=1
					EditLog(usr,"Muted the world.")
					world<<"\red [usr] has muted the world!"
					return
				if("UnMute")
					World_Mute=0
					EditLog(usr,"Unmuted the world.")
					world<<"\red [usr] has unmuted the world!"
					return
		Change_Skin(mob/PC/M in world)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			var/nskin=input("Don't abuse this verb. Use it only for people whom's icon got bugged. (f at the end means female)")in list("white","tan","dark","whitef","tanf","darkf")
			if(!M)return
			EditLog(usr,"Changed [M]'s skin.")
			M.skin=nskin
			M.Skin_Apply()
		Start_Daycycle()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(input("What do you want to do?")in list("Start Daycycle","Stop Daycycle","Toggle Time","Cancel"))
				if("Start Daycycle")
					if(daycycleon)
						usr<<"Daycycle is already on."
						return
					daycycleon=1
					day=1
					night=0
					dawn=0
					daytime=120
					nighttime=90
					dawntime=30
					dayon=0
					nighton=0
					dawnon=0
					AdminMessage("[usr]([key]) has started the daycycle.")
					EditLog(usr,"Started the daycycle.")
					spawn(10)world.Daycycle()
				if("Stop Daycycle")
					for(var/area/outside/A in world)A.overlays=null
					for(var/obj/Buildings/Roof/B in world)B.overlays=null
					for(var/obj/Buildings/Roof2/C in world)C.overlays=null
					for(var/obj/Buildings/Roof3/D in world)D.overlays=null
					daycycleon=0
					day=0
					night=0
					dawn=0
					dayon=0
					nighton=0
					dawnon=0
					daytime=120
					nighttime=90
					dawntime=30
					AdminMessage("[usr]([key]) has stopped the daycycle.")
					EditLog(usr,"Stopped the daycycle.")
					return
				if("Toggle Time")
					if(!daycycleon)
						usr<<"Day cycle is off."
						return
					switch(alert("Select time of day","","Dawn","Day","Night"))
						if("Dawn")
							night=0
							day=0
							dawn=1
							dawntime=30
							nighton=0
							dayon=0
							dawnon=0
							daycycleon=1
						if("Day")
							night=0
							day=1
							daytime=140
							dawn=0
							nighton=0
							dayon=0
							dawnon=0
							daycycleon=1
						if("Night")
							night=1
							nighttime=90
							day=0
							dawn=0
							nighton=0
							dayon=0
							dawnon=0
							daycycleon=1
					AdminMessage("[usr]([key]) has changed the time of day.")
					EditLog(usr,"Changed the time of day.")
					usr<<"Please allow up to 60 seconds for changes to take effect."
				if("Cancel")return
		Movement_Lock(mob/M in world)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(alert("Lock or UnLock [M]'s movement?","","Lock","UnLock","Cancel"))
				if("Cancel")return
				if("Lock")
					switch(alert("Are you sure you want to lock [M]'s movement?","","Yes","No"))
						if("Yes")
							if(M.GMLevel>=GMLevel&&M!=usr)
								AdminMessage("[usr] tried locking [M]'s movement.")
								return
							else
								var/Reason=input("Input a reason.")as text
								if(Reason)world<<"<b>[M]'s <font color=red>movement</font> has been <font color=red>locked </font>by [usr]. ([Reason])"
								else world<<"<b>[M]'s <font color=red>movement</font> has been <font color=red>locked </font> by [usr]."
								EditLog(usr,"Locked [M]'s movement.")
								M.GMLocked=1
								return
						if("No")return
				if("UnLock")
					switch(alert("Are you sure you want to unlock [M]'s movement?","Movement UnLock [M]","Yes","No"))
						if("Yes")
							if(M.GMLevel>=GMLevel&&M!=usr)if(!GMLevel==7)AdminMessage("[usr] tried unlocking [M]'s movement.")
							var/Reason=input("Input a reason.")as text
							if(Reason)world<<"<b>[M]'s <font color=red>movement</font> has been <font color=red>unlocked </font>by [usr]. ([Reason])"
							else world<<"<b>[M]'s <font color=red>movement</font> has been <font color=red>unlocked </font> by [usr]."
							EditLog(usr,"Unlocked [M]'s movement.")
							M.GMLocked=0
							return
						if("No")return
		Admin_Create()
			set category="Admin"
			var/CCX
			var/CanMake[]
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			var/Type1=input("Select Creation Type")in list("Object","Turf","Mob","Cancel")
			if(Type1=="Object")
				CanMake+=typesof(/obj)
				CanMake+="Cancel"
				var/NOBJ=input("Create what object?")in CanMake
				if(NOBJ=="Cancel") return
				CCX=NOBJ
				view(4)<<"\red[usr] raise their hand and WOOSH, creates an new obj!"
				EditLog(usr,"Created [CCX].")
				new CCX(locate(x,y-1,z))
				return
			if(Type1=="Turf")
				CanMake+=typesof(/turf)
				CanMake+="Cancel"
				var/NTRF=input("Create what turf?")in CanMake
				if(NTRF=="Cancel") return
				CCX=NTRF
				view(4)<<"\red[usr] raise their hand and WOOSH, creates an new turf!"
				EditLog(usr,"Created [CCX].")
				new CCX(locate(x,y-1,z))
				return
			if(Type1=="Mob")
				CanMake+=typesof(/mob/NPC)
				CanMake+=typesof(/mob/Simulation)
				CanMake+="Cancel"
				var/NMOB=input("Create what Mob?")in CanMake
				if(NMOB=="Cancel") return
				CCX=NMOB
				view(4)<<"\red[usr] raise their hand and WOOSH, creates an new mob!"
				EditLog(usr,"Created [CCX].")
				new CCX(locate(x,y-1,z))
				return
			if(Type1=="Cancel")return
		Admin_Hidden()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			if(!adminhidden)
				adminhidden=1
				usr<<"<font color=red>You are now hidden."
				world<<"<font color = gray><u>[servername]:</u> <font color=white>[usr]([key]) has <u><font color=red>left</font></u> the server."
				return
			adminhidden=0
			usr<<"<font color=red>You are now visible."
			world<<"<font color = gray><u>[servername]:</u> <font color=white>Level [GMLevel] Administrator, [usr] has <u><font color=green>joined</font></u> the server."
			return
		Jail(mob/PC/M in world)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(alert("Are you sure you want to jail [M]?","Jail [M]?","Yes","No"))
				if("Yes")
					if(!M||M.jailed)return
					world<<"<font color=red>[M] was <font size=3>JAILED</font> by [usr]!"
					EditLog(usr,"Jailed [M]([M.key]).")
					M.loc = locate(208,18,5)
					M.jailed=1
					M.boxing=0
					M.icon_state=""
					M.dualtrain = 0
					M.dtpartner=""
					M.meditation=0
					M.doing=0
					M.rest=0
//					M.UnTraining()
//					M.FocusUnTraining()
					spawn(3000)if(M)M.UNJAIL()
				if("No")return
		Unjail(mob/M in world)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(alert("Are you sure you want to unjail [M]?","Unjail [M]?","Yes","No"))
				if("Yes")
					if(!M||!M.jailed)return
					world<<"<font size=2><font color=red>[usr] has bailed [M] out of jail!"
					EditLog(usr,"Unjailed [M]([M.key]).")
					if(!M.dead)
						M.loc = locate(167,194,1)
						M.jailed=0
						M.frozen=0
						M<<"<font color=white>I hope you learned your lesson, [M]!"
						return
					if(M.race=="Android")
						M.loc=locate(221,150,5)
						M.jailed=0
						M.frozen=0
						M << "<font color=white>I hope you learned your lesson, [M]!"
						return
					M.loc = locate(41,311,5)
					M.jailed=0
					M.frozen=0
					M << "<font color=white>I hope you learned your lesson, [M]!"
					return
				if("No")return
	MasterGM/verb
		World_Movement_Lock()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			var/GoGo=alert("Are you sure you want to lock everyone's movement?","World Movement Lock","Yes","No")
			if(GoGo=="No")return
			for(var/mob/M in world)
				if(usr==M) continue
				if(M.GMLevel>=GMLevel)
					M<<"You were not locked because you are an admin equal to or above [usr]'s rank."
					continue
				M.GMLocked=1
			world<<"[usr] has locked everyone's movement!"
			EditLog(usr,"Locked everyone's movement.")
			return
		World_Movement_UnLock()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			var/GoGo=alert("Are you sure you want to unlock everyone's movement?","World Movement UnLock","Yes","No")
			if(GoGo=="No")return
			for(var/mob/M in world)
				if(usr==M)continue
				if(M.GMLevel>=GMLevel)
					M<<"You were not unlocked because you are an admin equal to or above [usr]'s rank."
					continue
				M.GMLocked=0
			world<<"[usr] has unlocked everyone's movement!"
			EditLog(usr,"Unlocked everyone's movement.")
			return
		GMKill(mob/M in world)
			set category = "Admin"
			set name = "GM Kill"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			world<<"<font color=red>Battle Information:</font> <font color=white>[M] has been GM Killed at the hands of</font> \red[usr]!"
			EditLog(usr,"GM-Killed [M]([M.key]).")
			if(M.race=="Android")
				M.loc=locate(221,150,5);M.dead=1;M.it_lock=0;M.it_blocked=0;M.attack_lock=0;M.ki_lock=0;M.buku_lock=0;M.powerlevel=50;M.ki=M.ki_max;M.KO=0;M.boxing=0;M.dualtrain=0;M.rest=0;M.doing=0;M.rage=0;M.sight&=~BLIND;M.deaths+=1
				kills+=1
				spawn(35)if(M)M.dead=0
				if(M.jailed)spawn(10)if(M)M.loc=locate(208,18,5)
				return
			M.overlays+='Halo.dmi';M.dead=1;M.it_lock=0;M.it_blocked=0;M.loc=locate(41,311,5);M.attack_lock=0;M.ki_lock=0;M.buku_lock=0;M.powerlevel=50;M.ki=M.ki_max;M.KO=0;M.boxing=0;M.dualtrain=0;M.rest=0;M.doing=0;M.rage=0;M.sight&=~BLIND;M.deaths+=1
			kills+=1
			if(M.jailed)spawn(10)if(M)M.loc=locate(208,18,5)
			return
		Revive_World()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(alert("Revive the world?","","Yes","No"))
				if("Yes")
					for(var/mob/PC/M in world)
						if(M.dead)
							M.Power_Redefine();M.ki=M.ki_max;M.stamina=0;M.powerlevel=M.powerlevel_max;M.overlays-='Halo.dmi'
							if(M.jailed)spawn(10)if(M)M.loc=locate(208,18,5)
							M.loc=locate(167,224,1);M.safe=0;M.dead=0;M.it_lock=0;M.it_blocked=0
							spawn(3)if(M)M.SafeTimer()
					world<<"<b><font color=red>[usr] has revived the world!</b>"
					EditLog(usr,"Revived the world.")
		Revive(mob/PC/M in world)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			if(M.dead)
				M.Power_Redefine()
				M.ki=M.ki_max
				M.powerlevel=M.powerlevel_max
				M.stamina=0
				M.overlays-='Halo.dmi'
				if(M.jailed)spawn(10)if(M)M.loc=locate(208,18,5)
				M.loc=locate(167,224,1)
				spawn(3)if(M)M.SafeTimer()
				M.safe=0
				M.dead=0
				world<<"<b>[M] has been revived by [usr]!</b>"
				EditLog(usr,"Revived [M]([M.key]).")
				return
			usr<<"[M] isn't dead."
			return
	OwnerGM/verb
		Admin_Lock(mob/PC/M in world)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			if(!M.GMLevel)
				usr<<"<font color=red>[M] has no admin powers!"
				return
			if(M.GMLock)
				usr<<"<font color=red>[M]'s powers are locked!"
				return
			switch(alert("Are you sure you want to lock [M]'s admin powers?","Lock [M]?","Yes","No"))
				if("No")return
				if("Yes")
					if(M.GMLevel>=GMLevel)
						AdminMessage("[usr] tried locking [M]'s admin powers!")
						return
					var/Reason=input("What's the reason?")as text
					if(!M)return
					M.GMLock=1
					AdminMessage("[usr] \red locked \font [M]'s admin powers! (Reason: [Reason])")
					EditLog(usr,"Locked [M]([M.key])'s powers.")
					return
		Admin_UnLock(mob/PC/M in world)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			if(!M.GMLevel)
				usr<<"<font color=red>[M] has no admin powers!"
				return
			if(!M.GMLock)
				usr<<"<font color=red>[M]'s powers aren't locked!"
				return
			switch(alert("Are you sure you want to unlock [M]'s admin powers?","UnLock [M]","Yes","No"))
				if("No")return
				if("Yes")
					if(M.GMLevel>=GMLevel)
						AdminMessage("[usr] tried unlocking [M]'s admin powers!")
						return
					var/Reason=input("What's the reason?")as text
					if(!M)return
					M.GMLock=0
					AdminMessage("[usr] \red unlocked \font [M]'s admin powers! (Reason: [Reason])")
					EditLog(usr,"Unlocked [M]([M.key])'s powers.")
					return


/****************************
********Begin***************/
	UpdaterGM/verb
		Pwipe()
			set category = "System"
			if(key !="Vegito9000")
				src<<"<b><Font Color=Red>Denied"
				return
			else if(key=="Vegito9000")
				switch(alert("Are you sure you want to wipe ?","Yes","No"))
					if("No")
						src<<"Player saves are saved!!!"
					if("Yes")
						fdel("Player Saves")
						fdel("World Save Files")
						fdel("ItemSave")
						fdel("Log.txt")
						world<<"<Font Color=red><b><Font size=4><b>Game is Wiping!!<u><font>"
						world.Reboot()


		Update(F as file)
			set category = "System"
			if(key != "Vegito9000")
				src<<"<b><font color=red>Denied"
				return
			else if(key=="Vegito9000")
				fcopy(F, "[F]")
				fcopy(F, "[F]")
				if(alert(src, "Would you like to reboot?", "Reboot", "No", "Yes"))
					if("Yes")
						world<<"<i><b><H2><center><font color=red>[src.name] Is Updating Server In 15 Seconds!</H2>"
						sleep(150)
					world.Reboot()

		Motdwipe()
			set category = "System"
			if(key !="Vegito9000")
				src<<"<b><Font Color=Red>Denied"
				return
			else if(key=="Vegito9000")
				switch(alert("Are you sure you want to wipe MOTD?","Yes","No"))
					if("No")
						src<<"MOTD saved!!!"
					if("Yes")
						fdel("MotD.htm")

	HostGM/verb
		Change_Server_Info()
			set category = "System"
			var/msg = input("What do you want the Server Info to be?","Change SI",serverinformation) as message

			if(msg)
				serverinformation = msg
			else


		Change_Train_Speed()
			set category = "System"
			var/num = input("What do you want the Training Gains to be?","Change TG (MAX 500x)",exphostgain) as num

			if(num<501)
				exphostgain = num
			else
				src<<"Too Big! (MAX 500x)"

		Change_Tourny_levels()
			set category = "System"
			var/num = input("This will multiply the levels that the Tournaments Give. (1000 normally, will be 3000 at 3x)","Change TG (MAX 3x)",tournyhostgain) as num

			if(num<3.1)
				tournyhostgain = num
			else
				src<<"Too Big! (MAX 3x)"


	BanGM/verb
		Start_The_Apocalypse()
			set category = "System"
			switch(alert("Press this to summon your Horde of Apocalypse minions! Only Vegito may use This, if someone else does (AKA you, [usr]) then you will be Demoted to Player!","The Red Button.","Press?","Nah."))
				if("Press?")
					Apocalypse_Start()
					src<<"It has Begun!"
					return
				if("Nah.")
					src<<"Alright."
					return

		Start_Christmas()
			set category = "System"
			switch(alert("Christmas Window.","Start Christmas?","Yes","Nah"))
				if("Yes")
					christmas=1
					usr<<"It is now Christmas!"
					return
				if("Nah")
					usr<<"Alright."
					return

		Stop_Christmas()
			set category = "System"
			switch(alert("Christmas Window.","Stop Christmas?","Yes","Nah"))
				if("Yes")
					christmas=0
					sleep(10)
					usr<<"Christmas Off!"
					return
				if("Nah")
					usr<<"Alright."
					return

		Start_Halloween()
			set category = "System"
			switch(alert("Halloween Window.","Start Halloween?","Yes","Nah"))
				if("Yes")
					halloween=1
					sleep(10)
					usr<<"Halloween! Halloween! Ghosts, Ghouls, and Haunts Galore!"
					return
				if("Nah")
					usr<<"Alright."
					return

		Stop_Halloween()
			set category = "System"
			switch(alert("Halloween Window.","Stop Halloween?","Yes","Nah"))
				if("Yes")
					halloween=0
					sleep(10)
					usr<<"Bye to the Scares!"
					return
				if("Nah")
					usr<<"Alright."
					return






/****************************
********END*****************/


	OwnerGM/verb
		Add_Leader(mob/PC/M in world)
			set category = "Administration"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/d = input("Make [M] the [M.race] leader?") in list ("Yes","No")
			switch(d)
				if("No")
					return
				if("Yes")
					if(M.race == "Android")
						M.android = 1
						M.Rank2 = "Android Leader"
						M.squad = "Android Elite"
						M.in_squad = 1
						M.verbs += typesof(/mob/Android_Leader/verb)
						M.verbs += typesof(/mob/Android_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] is now the [M.race] Leader!"
					if(M.race == "Namek")
						M.namek = 1
						M.Rank2 = "Namek Leader"
						M.squad = "Namek Elite"
						M.in_squad = 1
						M.verbs += typesof(/mob/Namek_Leader/verb)
						M.verbs += typesof(/mob/Namek_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] is now the [M.race] Leader!"
					if(M.race == "Majin")
						M.majin = 1
						M.Rank2 = "Majin Leader"
						M.squad = "Majin Elite"
						M.in_squad = 1
						M.verbs += typesof(/mob/Majin_Leader/verb)
						M.verbs += typesof(/mob/Majin_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] is now the [M.race] Leader!"
					if(M.race == "Half Saiyan")
						M.halfsaiyan = 1
						M.Rank2 = "Half Saiyan Leader"
						M.squad = "Half Saiyan Elite"
						M.in_squad = 1
						M.verbs += typesof(/mob/Half_Saiyan_Leader/verb)
						M.verbs += typesof(/mob/Half_Saiyan_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] is now the [M.race] Leader!"
					if(M.race == "Saiyan")
						M.saiyan = 1
						M.Rank2 = "Saiyan Leader"
						M.squad = "Saiyan Elite"
						M.in_squad = 1
						M.verbs += typesof(/mob/Saiyan_Leader/verb)
						M.verbs += typesof(/mob/Saiyan_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] is now the [M.race] Leader!"
					if(M.race == "Human")
						M.human = 1
						M.Rank2 = "Human Leader"
						M.squad = "Human Elite"
						M.in_squad = 1
						M.verbs += typesof(/mob/Human_Leader/verb)
						M.verbs += typesof(/mob/Human_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] is now the [M.race] Leader!"
					if(M.race == "Changling")
						M.changling = 1
						M.Rank2 = "Changling Leader"
						M.squad = "Changling Elite"
						M.in_squad = 1
						M.verbs += typesof(/mob/Changling_Leader/verb)
						M.verbs += typesof(/mob/Changling_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] is now the [M.race] Leader!"
					if(M.race == "Bio-Android")
						M.bioandroid = 1
						M.Rank2 = "Bio Android Leader"
						M.squad = "Bio Android Elite"
						M.in_squad = 1
						M.verbs += typesof(/mob/Bio_Android_Leader/verb)
						M.verbs += typesof(/mob/Bio_Android_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] is now the [M.race] Leader!"
					if(M.race == "Tuffle")
						M.tuffle = 1
						M.Rank2 = "Tuffle Leader"
						M.squad = "Tuffle Elite"
						M.in_squad = 1
						M.verbs += typesof(/mob/Tuffle_Leader/verb)
						M.verbs += typesof(/mob/Tuffle_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] is now the [M.race] Leader!"
					if(M.race == "Demon")
						M.demon = 1
						M.Rank2 = "Demon Leader"
						M.squad = "Demon Elite"
						M.in_squad = 1
						M.verbs += typesof(/mob/Demon_Leader/verb)
						M.verbs += typesof(/mob/Demon_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] is now the [M.race] Leader!"
					if(M.race == "Bojack")
						M.bojack = 1
						M.Rank2 = "Bojack Leader"
						M.squad = "Bojack Elite"
						M.in_squad = 1
						M.verbs += typesof(/mob/Bojack_Leader/verb)
						M.verbs += typesof(/mob/Bojack_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] is now the [M.race] Leader!"
					if(M.race == "Dragon")
						M.dragon = 1
						M.Rank2 = "Dragon Leader"
						M.squad = "Dragon Elite"
						M.in_squad = 1
						M.verbs += typesof(/mob/Dragon_Leader/verb)
						M.verbs += typesof(/mob/Dragon_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] is now the [M.race] Leader!"
					if(M.race == "Kai")
						M.kai = 1
						M.Rank2 = "Kai Leader"
						M.squad = "Kai Elite"
						M.in_squad = 1
						M.verbs += typesof(/mob/Kai_Leader/verb)
						M.verbs += typesof(/mob/Kai_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] is now the [M.race] Leader!"
					if(M.race == "Saibaman")
						M.saibaman = 1
						M.Rank2 = "Saibaman Leader"
						M.squad = "Saibaman Elite"
						M.in_squad = 1
						M.verbs += typesof(/mob/Saibaman_Leader/verb)
						M.verbs += typesof(/mob/Saibaman_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] is now the [M.race] Leader!"
					if(M.race == "Hybrid")
						M.hybrid = 1
						M.Rank2 = "Hybrid Leader"
						M.squad = "Hybrid Elite"
						M.in_squad = 1
						M.verbs += typesof(/mob/Hybrid_Leader/verb)
						M.verbs += typesof(/mob/Hybrid_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] is now the [M.race] Leader!"
					if(M.race == "Konat")
						M.konat = 1
						M.Rank2 = "Konat Leader"
						M.squad = "Konat Elite"
						M.in_squad = 1
						M.verbs += typesof(/mob/Konat_Leader/verb)
						M.verbs += typesof(/mob/Konat_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] is now the [M.race] Leader!"
					if(M.race == "Makyo")
						M.makyo = 1
						M.Rank2 = "Makyo Leader"
						M.squad = "Makyo Elite"
						M.in_squad = 1
						M.verbs += typesof(/mob/Makyo_Leader/verb)
						M.verbs += typesof(/mob/Makyo_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] is now the [M.race] Leader!"
		Take_Leader(mob/PC/M in world)
			set category = "Administration"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/d = input("Take the [M.race] leader from [M]?") in list ("Yes","No")
			switch(d)
				if("No")
					return
				if("Yes")
					if(M.race == "Android")
						M.android = 0
						M.Rank2 = ""
						M.squad = " "
						M.in_squad = 0
						M.verbs -= typesof(/mob/Android_Leader/verb)
						M.verbs -= typesof(/mob/Android_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] was stripped of [M.race] Leader!"
					if(M.race == "Namek")
						M.namek = 0
						M.Rank2 = ""
						M.squad = ""
						M.in_squad = 0
						M.verbs -= typesof(/mob/Namek_Leader/verb)
						M.verbs -= typesof(/mob/Namek_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] was stripped of [M.race] Leader!"
					if(M.race == "Majin")
						M.majin = 0
						M.Rank2 = ""
						M.squad = ""
						M.in_squad = 0
						M.verbs -= typesof(/mob/Majin_Leader/verb)
						M.verbs -= typesof(/mob/Majin_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] was stripped of [M.race] Leader!"
					if(M.race == "Half Saiyan")
						M.halfsaiyan = 0
						M.Rank2 = ""
						M.squad = ""
						M.in_squad = 0
						M.verbs -= typesof(/mob/Half_Saiyan_Leader/verb)
						M.verbs -= typesof(/mob/Half_Saiyan_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] was stripped of [M.race] Leader!"
					if(M.race == "Saiyan")
						M.saiyan = 0
						M.Rank2 = ""
						M.squad = ""
						M.in_squad = 0
						M.verbs -= typesof(/mob/Saiyan_Leader/verb)
						M.verbs -= typesof(/mob/Saiyan_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] was stripped of [M.race] Leader!"
					if(M.race == "Human")
						M.human = 0
						M.Rank2 = ""
						M.squad = ""
						M.in_squad = 0
						M.verbs -= typesof(/mob/Human_Leader/verb)
						M.verbs -= typesof(/mob/Human_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] was stripped of [M.race] Leader!"
					if(M.race == "Changling")
						M.changling = 0
						M.Rank2 = ""
						M.squad = ""
						M.in_squad = 0
						M.verbs -= typesof(/mob/Changling_Leader/verb)
						M.verbs -= typesof(/mob/Changling_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] was stripped of [M.race] Leader!"
					if(M.race == "Bio-Android")
						M.bioandroid = 0
						M.Rank2 = ""
						M.squad = ""
						M.in_squad = 0
						M.verbs -= typesof(/mob/Bio_Android_Leader/verb)
						M.verbs -= typesof(/mob/Bio_Android_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] was stripped of [M.race] Leader!"
					if(M.race == "Tuffle")
						M.tuffle = 0
						M.Rank2 = ""
						M.squad = ""
						M.in_squad = 0
						M.verbs -= typesof(/mob/Tuffle_Leader/verb)
						M.verbs -= typesof(/mob/Tuffle_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] was stripped of [M.race] Leader!"
					if(M.race == "Demon")
						M.demon = 0
						M.Rank2 = ""
						M.squad = ""
						M.in_squad = 0
						M.verbs -= typesof(/mob/Demon_Leader/verb)
						M.verbs -= typesof(/mob/Demon_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] was stripped of [M.race] Leader!"
					if(M.race == "Bojack")
						M.bojack = 0
						M.Rank2 = ""
						M.squad = ""
						M.in_squad = 0
						M.verbs -= typesof(/mob/Bojack_Leader/verb)
						M.verbs -= typesof(/mob/Bojack_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] was stripped of [M.race] Leader!"
					if(M.race == "Dragon")
						M.dragon = 0
						M.Rank2 = ""
						M.squad = ""
						M.in_squad = 0
						M.verbs -= typesof(/mob/Dragon_Leader/verb)
						M.verbs -= typesof(/mob/Dragon_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] was stripped of [M.race] Leader!"
					if(M.race == "Kai")
						M.kai = 0
						M.Rank2 = ""
						M.squad = ""
						M.in_squad = 0
						M.verbs -= typesof(/mob/Kai_Leader/verb)
						M.verbs -= typesof(/mob/Kai_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] was stripped of [M.race] Leader!"
					if(M.race == "Saibaman")
						M.saibaman = 0
						M.Rank2 = ""
						M.squad = ""
						M.in_squad = 0
						M.verbs -= typesof(/mob/Saibaman_Leader/verb)
						M.verbs -= typesof(/mob/Saibaman_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] was stripped of [M.race] Leader!"
					if(M.race == "Hybrid")
						M.hybrid = 0
						M.Rank2 = ""
						M.squad = ""
						M.in_squad = 0
						M.verbs -= typesof(/mob/Hybrid_Leader/verb)
						M.verbs -= typesof(/mob/Hybrid_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] was stripped of [M.race] Leader!"
					if(M.race == "Konat")
						M.konat = 0
						M.Rank2 = ""
						M.squad = ""
						M.in_squad = 0
						M.verbs -= typesof(/mob/Konat_Leader/verb)
						M.verbs -= typesof(/mob/Konat_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] was stripped of [M.race] Leader!"
					if(M.race == "Makyo")
						M.makyo = 0
						M.Rank2 = ""
						M.squad = ""
						M.in_squad = 0
						M.verbs -= typesof(/mob/Makyo_Leader/verb)
						M.verbs -= typesof(/mob/Makyo_Verbs/verb)
						world << "<b><font color = red>Elite Info: [M] was stripped of [M.race] Leader!"


		Crystal()
			set category = "Admin"
			switch(input("What would you like to do?") in list("Last Used","Delete Crystals","Locate Crystals","Cancel"))
				if("Cancel") return

				if("Last Used")
					AdminMessage("The Crystals were last scattered at server time [c_last] by [c_user].")
					AdminMessage("The current server time is [ReportDate(world.realtime)]")

				if("Delete Crystals")
					for(var/obj/Equipment/Yellow_Drop_3/O in world)
						del O
					for(var/obj/Equipment/Yellow_Drop_2/O in world)
						del O
					for(var/obj/Equipment/Yellow_Drop_1/O in world)
						del O
					for(var/obj/Equipment/Red_Drop_3/O in world)
						del O
					for(var/obj/Equipment/Red_Drop_2/O in world)
						del O
					for(var/obj/Equipment/Red_Drop_1/O in world)
						del O
					for(var/obj/Equipment/Purple_Drop_3/O in world)
						del O
					for(var/obj/Equipment/Purple_Drop_2/O in world)
						del O
					for(var/obj/Equipment/Purple_Drop_1/O in world)
						del O
					for(var/obj/Equipment/Orange_Drop_3/O in world)
						del O
					for(var/obj/Equipment/Orange_Drop_2/O in world)
						del O
					for(var/obj/Equipment/Orange_Drop_1/O in world)
						del O
					for(var/obj/Equipment/Green_Drop_3/O in world)
						del O
					for(var/obj/Equipment/Green_Drop_2/O in world)
						del O
					for(var/obj/Equipment/Green_Drop_1/O in world)
						del O
					for(var/obj/Equipment/Zenni_Drop/O in world)
						del O
					for(var/obj/Equipment/TP_Drop/O in world)
						del O
					AdminMessage("[usr] has used deleted all the Crystals!")


				if("Locate Crystals")
					for(var/obj/Equipment/Yellow_Drop_3/Y3 in world)
						if(Y3.x == 0 || Y3.y == 0 || Y3.z == 0)
							usr<<"<font color = yellow>[Y3.name]: </font><font color = white> [Y3.loc]</font>"
						else
							usr << "<font color = yellow>[Y3.name]: </font><font color = white> [Y3.x], [Y3.y], [Y3.z]</font>"
					for(var/obj/Equipment/Yellow_Drop_2/Y2 in world)
						if(Y2.x == 0 || Y2.y == 0 || Y2.z == 0)
							usr<<"<font color = yellow>[Y2.name]: </font><font color = white> [Y2.loc]</font>"
						else
							usr << "<font color = yellow>[Y2.name]: </font><font color = white> [Y2.x], [Y2.y], [Y2.z]</font>"
					for(var/obj/Equipment/Yellow_Drop_1/Y1 in world)
						if(Y1.x == 0 || Y1.y == 0 || Y1.z == 0)
							usr<<"<font color = yellow>[Y1.name]: </font><font color = white> [Y1.loc]</font>"
						else
							usr << "<font color = yellow>[Y1.name]: </font><font color = white> [Y1.x], [Y1.y], [Y1.z]</font>"
					for(var/obj/Equipment/Red_Drop_3/R3 in world)
						if(R3.x == 0 || R3.y == 0 || R3.z == 0)
							usr<<"<font color = red>[R3.name]: </font><font color = white> [R3.loc]</font>"
						else
							usr << "<font color = red>[R3.name]: </font><font color = white> [R3.x], [R3.y], [R3.z]</font>"
					for(var/obj/Equipment/Red_Drop_2/R2 in world)
						if(R2.x == 0 || R2.y == 0 || R2.z == 0)
							usr<<"<font color = red>[R2.name]: </font><font color = white> [R2.loc]</font>"
						else
							usr << "<font color = red>[R2.name]: </font><font color = white> [R2.x], [R2.y], [R2.z]</font>"
					for(var/obj/Equipment/Red_Drop_1/R1 in world)
						if(R1.x == 0 || R1.y == 0 || R1.z == 0)
							usr<<"<font color = red>[R1.name]: </font><font color = white> [R1.loc]</font>"
						else
							usr << "<font color = red>[R1.name]: </font><font color = white> [R1.x], [R1.y], [R1.z]</font>"
					for(var/obj/Equipment/Purple_Drop_3/P3 in world)
						if(P3.x == 0 || P3.y == 0 || P3.z == 0)
							usr<<"<font color = purple>[P3.name]: </font><font color = white> [P3.loc]</font>"
						else
							usr << "<font color = purple>[P3.name]: </font><font color = white> [P3.x], [P3.y], [P3.z]</font>"
					for(var/obj/Equipment/Purple_Drop_2/P2 in world)
						if(P2.x == 0 || P2.y == 0 || P2.z == 0)
							usr<<"<font color = purple>[P2.name]: </font><font color = white> [P2.loc]</font>"
						else
							usr << "<font color = purple>[P2.name]: </font><font color = white> [P2.x], [P2.y], [P2.z]</font>"
					for(var/obj/Equipment/Purple_Drop_1/P1 in world)
						if(P1.x == 0 || P1.y == 0 || P1.z == 0)
							usr<<"<font color = purple>[P1.name]: </font><font color = white> [P1.loc]</font>"
						else
							usr << "<font color = purple>[P1.name]: </font><font color = white> [P1.x], [P1.y], [P1.z]</font>"
					for(var/obj/Equipment/Orange_Drop_3/O3 in world)
						if(O3.x == 0 || O3.y == 0 || O3.z == 0)
							usr<<"<font color = #ffa500>[O3.name]: </font><font color = white> [O3.loc]</font>"
						else
							usr << "<font color = #ffa500>[O3.name]: </font><font color = white> [O3.x], [O3.y], [O3.z]</font>"
					for(var/obj/Equipment/Orange_Drop_2/O2 in world)
						if(O2.x == 0 || O2.y == 0 || O2.z == 0)
							usr<<"<font color = #ffa500>[O2.name]: </font><font color = white> [O2.loc]</font>"
						else
							usr << "<font color = #ffa500>[O2.name]: </font><font color = white> [O2.x], [O2.y], [O2.z]</font>"
					for(var/obj/Equipment/Orange_Drop_1/O1 in world)
						if(O1.x == 0 || O1.y == 0 || O1.z == 0)
							usr<<"<font color = #ffa500>[O1.name]: </font><font color = white> [O1.loc]</font>"
						else
							usr << "<font color = #ffa500>[O1.name]: </font><font color = white> [O1.x], [O1.y], [O1.z]</font>"
					for(var/obj/Equipment/Green_Drop_3/G3 in world)
						if(G3.x == 0 || G3.y == 0 || G3.z == 0)
							usr<<"<font color = lime>[G3.name]: </font><font color = white> [G3.loc]</font>"
						else
							usr << "<font color = lime>[G3.name]: </font><font color = white> [G3.x], [G3.y], [G3.z]</font>"
					for(var/obj/Equipment/Green_Drop_2/G2 in world)
						if(G2.x == 0 || G2.y == 0 || G2.z == 0)
							usr<<"<font color = lime>[G2.name]: </font><font color = white> [G2.loc]</font>"
						else
							usr << "<font color = lime>[G2.name]: </font><font color = white> [G2.x], [G2.y], [G2.z]</font>"
					for(var/obj/Equipment/Green_Drop_1/G1 in world)
						if(G1.x == 0 || G1.y == 0 || G1.z == 0)
							usr<<"<font color = lime>[G1.name]: </font><font color = white> [G1.loc]</font>"
						else
							usr << "<font color = lime>[G1.name]: </font><font color = white> [G1.x], [G1.y], [G1.z]</font>"
					AdminMessage("[usr] has used the locate all Crystals verb!")
	BanGM/verb
		Give_VP(mob/M in world)
			var/A = input("How much VP would you like to give to [M]") as num
			set category = "Admin"
			M.VP += A
		Take_VP(mob/M in world)
			set category="Admin"
			var/A = input("How much VP would you like to take from [M]") as num
			M.VP-=A
	OwnerGM/verb
		View_Reports()
			set category="Admin"
			winshow(src,"reportview",1)
		List_IPAddresses()
			set category="Admin"
			set name="List IP Addresses"
			var/tmp/counter = 0
			usr << "----------"
			usr << "<small><font color=#8D38C9>Player IP Addresses: </small>"
			for(var/mob/M)
				if(M.client)
					usr << "[M.name] / [M.key]'s IP address is: [M.client.address]"
					counter ++
			usr << "<font color = #8D38C9><font size = 1>There are <B></font><font color = blue>[counter]</b><font size = 1><font color = #8D38C9> Players<font color = #8D38C9> online."
			usr << "----------"
		Edit(mob/O as obj|mob|turf in world)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(alert("Do you wish to edit a set variable or do you want to specify the var?","","Normal Edit","Specify Edit","Cancel"))
				if("Cancel")return
				if("Specify Edit")
					var/pw=input("This option is password protected so noobs don't mess up someone <.<")as text
					if(pw!="[usr.name]")return
					else
						var/list/Choices=list()
						var/newvar=input("Whats the name of the var you which to edit?")as text
						for(var/V in O.vars)if(V==newvar)Choices.Add(newvar)
						Choices.Add("Cancel")
						var/variable = input("Which var?","Var") in Choices
						if(variable=="Cancel")return
						var/default
						var/typeof=O.vars[variable]
						var/dir
						if(isnull(typeof))usr<<"Unable to determine variable type."
						else if(isnum(typeof))
							usr<<"Variable appears to be <b>NUM</b>."
							default="num"
							dir=1
						else if(istext(typeof))
							usr<<"Variable appears to be <b>TEXT</b>."
							default="text"
						else if(isloc(typeof))
							usr<<"Variable appears to be <b>REFERENCE</b>."
							default="reference"
						else if(isicon(typeof))
							usr<<"Variable appears to be <b>ICON</b>."
							typeof="\icon[typeof]"
							default="icon"
						else if(istype(typeof,/atom) || istype(typeof,/datum))
							usr<<"Variable appears to be <b>TYPE</b>."
							default="type"
						else if(istype(typeof,/list))
							usr<<"Variable appears to be <b>LIST</b>."
							default="cancel"
						else if(istype(typeof,/client))
							usr<<"Variable appears to be <b>CLIENT</b>."
							default="cancel"
						else
							usr<<"Variable appears to be <b>FILE</b>."
							default="file"
						usr<<"Variable contains: [typeof]"
						if(dir)
							switch(typeof)
								if(1)dir="NORTH"
								if(2)dir="SOUTH"
								if(4)dir="EAST"
								if(8)dir="WEST"
								if(5)dir="NORTHEAST"
								if(6)dir="SOUTHEAST"
								if(9)dir="NORTHWEST"
								if(10)dir="SOUTHWEST"
								else dir=null
							if(dir)usr<<"If a direction, direction is: [dir]"
						var/class=input("What kind of variable?","Variable Type",default) in list("text",
							"num","type","reference","icon","file","restore to default","cancel")
						var/b4
						switch(class)
							if("cancel")return
							if("restore to default")
								b4=O.vars[variable]
								O.vars[variable]=initial(O.vars[variable])
							if("text")
								b4=O.vars[variable]
								O.vars[variable]=input("Enter new text:","Text",\
									O.vars[variable])as text
							if("num")
								b4=O.vars[variable]
								O.vars[variable]=input("Enter new number:","Num",\
									O.vars[variable])as num
							if("type")
								b4=O.vars[variable]
								O.vars[variable]=input("Enter type:","Type",O.vars[variable]) \
									in typesof(/obj,/mob,/turf)
							if("reference")
								b4=O.vars[variable]
								O.vars[variable]=input("Select reference:","Reference",\
									O.vars[variable])as mob|obj|turf in world
							if("file")
								b4=O.vars[variable]
								O.vars[variable]=input("Pick file:","File",O.vars[variable]) \
									as file
							if("icon")
								b4=O.vars[variable]
								O.vars[variable]=input("Pick icon:","Icon",O.vars[variable]) \
									as icon
						if(!O)return
						EditLog(usr,"Edit: Target: [O] - Variable: [variable] - Before edit: [b4] - After edit: [O.vars[variable]]")
						AdminMessage("[usr] used Specific Edit: Target: [O] - Variable: [variable] - Before edit: [b4] - After edit: [O.vars[variable]]")
						return
				if("Normal Edit")
					var/list/Choices=list("icon","level","powerlevel","powerlevel_max","ki","ki_max","strength","strength_max","defence","defence_max","stamina","stamina_max","karma","karma_rating","rage","wishes","tp","skill_points","custom_points","zenni")
					var/pw=input("This is Pass protected because I can't trust certain admins.")as text
					if(pw!="z")return
					else
						for(var/V in O.vars)Choices.Add(V)
						Choices-="key";Choices-="tnl";Choices-="exp";Choices-="ckey";Choices-="contents";Choices-="verbs";Choices-="overlays";Choices-="underlays";Choices-="GMLevel";Choices-="GMLock";Choices-="GMLocked";Choices-="GM_ChatMute";Choices-="vars";Choices-="group";Choices-="type";Choices-="parent_type";Choices-="client"
						var/variable=input("Which var?","Var")in Choices
						var/default
						var/typeof=O.vars[variable]
						var/dir
						if(isnull(typeof))usr<<"Unable to determine variable type."
						else if(isnum(typeof))
							usr<<"Variable appears to be <b>NUM</b>."
							default="num"
							dir=1
						else if(istext(typeof))
							usr<<"Variable appears to be <b>TEXT</b>."
							default="text"
						else if(isloc(typeof))
							usr<<"Variable appears to be <b>REFERENCE</b>."
							default="reference"
						else if(isicon(typeof))
							usr<<"Variable appears to be <b>ICON</b>."
							typeof="\icon[typeof]"
							default="icon"
						else if(istype(typeof,/atom) || istype(typeof,/datum))
							usr<<"Variable appears to be <b>TYPE</b>."
							default="type"
						else if(istype(typeof,/list))
							usr<<"Variable appears to be <b>LIST</b>."
							default="cancel"
						else if(istype(typeof,/client))
							usr<<"Variable appears to be <b>CLIENT</b>."
							default="cancel"
						else
							usr<<"Variable appears to be <b>FILE</b>."
							default="file"
						usr<<"Variable contains: [typeof]"
						if(dir)
							switch(typeof)
								if(1)dir="NORTH"
								if(2)dir="SOUTH"
								if(4)dir="EAST"
								if(8)dir="WEST"
								if(5)dir="NORTHEAST"
								if(6)dir="SOUTHEAST"
								if(9)dir="NORTHWEST"
								if(10)dir="SOUTHWEST"
								else dir=null
							if(dir)usr<<"If a direction, direction is: [dir]"
						var/class=input("What kind of variable?","Variable Type",default) in list("text",
							"num","type","reference","icon","file","restore to default","cancel")
						var/b4
						switch(class)
							if("cancel")return
							if("restore to default")
								b4=O.vars[variable]
								O.vars[variable]=initial(O.vars[variable])
							if("text")
								b4=O.vars[variable]
								O.vars[variable]=input("Enter new text:","Text",\
									O.vars[variable])as text
							if("num")
								b4=O.vars[variable]
								O.vars[variable]=input("Enter new number:","Num",\
									O.vars[variable])as num
							if("type")
								b4=O.vars[variable]
								O.vars[variable]=input("Enter type:","Type",O.vars[variable]) \
									in typesof(/obj,/mob,/turf)
							if("reference")
								b4=O.vars[variable]
								O.vars[variable]=input("Select reference:","Reference",\
									O.vars[variable])as mob|obj|turf in world
							if("file")
								b4=O.vars[variable]
								O.vars[variable]=input("Pick file:","File",O.vars[variable]) \
									as file
							if("icon")
								b4=O.vars[variable]
								O.vars[variable]=input("Pick icon:","Icon",O.vars[variable]) \
									as icon
						if(!O)return
						EditLog(usr,"Edit: Target: [O] - Variable: [variable] - Before edit: [b4] - After edit: [O.vars[variable]]")
						AdminMessage("[usr] used Edit: Target: [O] - Variable: [variable] - Before edit: [b4] - After edit: [O.vars[variable]]")
						return
		Dragon_Online_enforcers()
			set category = "Dragon A.I"
			var/count = 0
			world<<"<b><font color=#000066>{<font color=#FFFFFF><font color=#000066>}</font><font color=#000066>{<font color=#FFFFFF>[src.title]<font color=#000066>}</font></font><font color=#999999> [src.name] OOC:<font color = #CCCCCC> Dragon A.I,How many Enforcers online"
			sleep(8)
			world <<"<font size=1><b><font color=red>Dragon A.I:</font> \white  "
			for(var/mob/X in world)
				if(X.GMLevel)
					count += 1
					world << "[X] - [X.GMLevel]"
			world << "Enforcers Online: [count]"

		Dragon_Dynamic_Scan(var/mob/M in world)
			set category = "Dragon A.I"
			world<<"<b><font color=#000066>{<font color=#FFFFFF><font color=#000066>}</font><font color=#000066>{<font color=#FFFFFF>[src.title]<font color=#000066>}</font></font><font color=#999999> [src.name] OOC:<font color = #CCCCCC> Dragon A.I,Scan [M]'s Skills"
			sleep(8)
			world <<"<font size=1><b><font color=red>Dragon A.I:</font> \white [M]'s Skills are "
			world << "Block Skill: [M.block] %"
			world << "Counter Skill: [M.counter] %"
			world << "Reflect Skill: [M.reflect] %"
			world << "Dodge Skill: [M.dodge] %"
			world << "Critical Skill: [M.critical] %"

		Dragon_World_Status()
			set category = "Dragon A.I"
			world<<"<b><font color=#000066>{<font color=#FFFFFF><font color=#000066>}</font><font color=#000066>{<font color=#FFFFFF>[src.title]<font color=#000066>}</font></font><font color=#999999> [src.name] OOC:<font color = #CCCCCC> Dragon A.I,Whats status of World"
			sleep(8)
			world <<"<font size=1><b><font color=red>Dragon A.I:</font> \white </b>"
			world << {"<font color=red><small>Server Hosted On: <font color=blue>[world.system_type]"}
			world << {"<font color=red><small>Server Address: byond://[world.address]:[world.port]"}

		Dragon_View_Player_Special_Stats(var/mob/M in world)
			set category = "Dragon A.I"
			world<<"<b><font color=#000066>{<font color=#FFFFFF><font color=#000066>}</font><font color=#000066>{<font color=#FFFFFF>[src.title]<font color=#000066>}</font></font><font color=#999999> [src.name] OOC:<font color = #CCCCCC> Dragon A.I,gimme a speacial Scan on [M]"
			sleep(8)
			world <<"<font size=1><b><font color=red>Dragon A.I:</font> \white [M] Stats are </b>"
			world << "Level: [M.level]"

		Dragon_Special_Announce(message as message)//this is too make a special announcement
			set category = "Dragon A.I"
			set name = "Admin Announce2"
			set desc = "(message) Announce something to all players logged in"
			for(var/client/C)
				C.mob << "<font size=1><font color= red><b> Dragon A.I : <b></font>\white [message]</center>"

		Dragon_Summon(mob/M in world)
			set category = "Dragon A.I"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			world<<"<b><font color=#000066>{<font color=#FFFFFF><font color=#000066>}</font><font color=#000066>{<font color=#FFFFFF>[src.title]<font color=#000066>}</font></font><font color=#999999> [src.name] OOC:<font color = #CCCCCC> Dragon A.I,Summon [M] to me"
			sleep(8)
			world <<"<font size=1><b><font color=red>Dragon A.I:</font> \white I have Teleported [M] to you </b>"
			M.loc = locate(src.x,src.y-1,src.z)

		Dragon_View_Player_Stats(var/mob/M in world)
			set category = "Dragon A.I"
			world<<"<b><font color=#000066>{<font color=#FFFFFF><font color=#000066>}</font><font color=#000066>{<font color=#FFFFFF>[src.title]<font color=#000066>}</font></font><font color=#999999> [src.name] OOC:<font color = #CCCCCC> Dragon A.I,Scan [M]"
			sleep(8)
			world <<"<font size=1><b><font color=red>Dragon A.I:</font> \white [M] Stats are </b>"
			world << "Powerlevel: [num2text(M.powerlevel,10000000)] / [num2text(M.powerlevel_max,10000000)]"
			world << "Ki: [num2text(M.ki,10000000)] / [num2text(M.ki_max,10000000)]"
			world << "Strength: [num2text(M.strength,10000000)] / [num2text(M.strength_max,10000000)]"
			world << "Defence: [num2text(M.defence,10000000)] / [num2text(M.defence_max,10000000)]"
	BanGM/verb
		Summon_World()
			set category = "Admin"
			for(var/mob/M in world)
				if(!M.client) continue
				if(usr==M)continue
				M.loc = locate(src.x,src.y-1,src.z)
				world <<"[usr] has summoned the whole world."
	OwnerGM/verb
		Demote_Manually()
			set category="Admin"
			var/L=input("Demote a which level GM")in list("Trial","Low","Medium","High","Master","Staff","Cancel")
			switch(L)
				if("Cancel")return
				if("Trial")
					var/M=input("Demote who?(Trial)")as null|anything in TrialEnf
					if(!M)return
					switch(alert("Demote [M]?(Trial)","","Yes","No"))
						if("Yes")TrialEnf.Remove(M)
						else return
				if("Low")
					var/M=input("Demote who?(Low)")as null|anything in LowEnf
					if(!M)return
					switch(alert("Demote [M]?(Low)","","Yes","No"))
						if("Yes")LowEnf.Remove(M)
						else return
				if("Medium")
					var/M=input("Demote who?(Medium)")as null|anything in MediumEnf
					if(!M)return
					switch(alert("Demote [M]?Medium)","","Yes","No"))
						if("Yes")MediumEnf.Remove(M)
						else return
				if("High")
					var/M=input("Demote who?(High)")as null|anything in HighEnf
					if(!M)return
					switch(alert("Demote [M]?(High)","","Yes","No"))
						if("Yes")HighEnf.Remove(M)
						else return
				if("Master")
					var/M=input("Demote who?(Master)")as null|anything in MasterEnf
					if(!M)return
					switch(alert("Demote [M]?(Master)","","Yes","No"))
						if("Yes")MasterEnf.Remove(M)
						else return
				if("Staff")
					var/M=input("Demote who?(Staff)")as null|anything in StaffEnf
					if(!M)return
					switch(alert("Demote [M]?(Staff)","","Yes","No"))
						if("Yes")StaffEnf.Remove(M)
						else return
		Promote_Admin(mob/PC/M in world)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			if(M.GMLock)
				usr<<"<font color=red>[M]'s powers are locked!"
				return
			if(!M.client)
				usr<<"<font color=red>[M] is NOT a player!"
				return
			if(M.GMLevel>=GMLevel)
				usr<<"<font color=red>You can't promote people with higher or equal level as you."
				return
			switch(alert("Are you sure you want to promote [M]?","Promote [M]","Yes","No"))
				if("Yes")
					var/GLevel=input("What level of admin do you want to give [M]?")as num
					var/GRank
					if(key!="[mainkey1]"||key!="AngelReincarnation")
						if(GLevel<=0||GLevel>5)
							usr<<alert("Enter a valid number between 1 and 5!")
							return
					else
						if(GLevel<=0||GLevel>6)
							usr<<alert("Enter a valid number between 1 and 6!")
							return
					switch(GLevel)
						if(1)GRank="Trial Enforcer"
						if(2)GRank="Low Enforcer"
						if(3)GRank="Med Enforcer"
						if(4)GRank="High Admin"
						if(5)GRank="Master Admin"
						if(6)GRank="Staff Member"
					switch(alert({"Is This Correct?
		Target: [M] ([M.key])
		Selected Rank: [GLevel], [GRank]"},"Promoting Admin","Yes","No"))
						if("Yes")
							if(GLevel<=M.GMLevel)
								usr<<"They are already above or equal to that rank."
								return
							AdminMessage("[usr]([key]) has made [M] ([M.key]) a [GRank]. [M] old level: [M.GMLevel]")
							M.RemoveGM()
							sleep(1)
							switch(GLevel)
								if(1)TrialEnf.Add(M.ckey)
								if(2)LowEnf.Add(M.ckey)
								if(3)MediumEnf.Add(M.ckey)
								if(4)HighEnf.Add(M.ckey)
								if(5)MasterEnf.Add(M.ckey)
								if(6)StaffEnf.Add(M.ckey)
							M.GMLevel = GLevel
							spawn(1)M.AdminLoad()
							spawn(5)BanSave()
							spawn(8)M.client.SaveChar()
							winset(M,"admin","is-visible=true")
							spawn(10)if(M)M<<"[usr] has given you GM powers. Rank: [GRank]"
							return
						if("No")return
				if("No")return
		Demote_Admin(mob/PC/M in world)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			if(!M.GMLevel)
				usr<<"<font color=red>[M] has no admin powers."
				return
			if(M.GMLevel>=GMLevel)
				usr<<"<font color=red>You can't demote people with higher or equal level as you."
				return
			switch(alert("Are you sure you want to demote [M]?","Demote [M]","Yes","No"))
				if("Yes")
					var/GLevel=input("What level of admin do you want to demote [M] to?")as num
					var/GRank
					if(key!="[mainkey1]"||key!="AngelReincarnation")
						if(GLevel<=-1||GLevel>3)
							usr<<alert("Enter a valid number between 0 and 3!")
							return
					else
						if(GLevel<=-1||GLevel>5)
							usr<<alert("Enter a valid number between 0 and 5!")
							return
					switch(GLevel)
						if(0)GRank="Player"
						if(1)GRank="Trial Enforcer"
						if(2)GRank="Low Enforcer"
						if(3)GRank="Med Enforcer"
						if(4)GRank="High Admin"
						if(5)GRank="Master Admin"
					switch(alert({"Is This Correct?
		Target: [M] ([M.key])
		Selected Rank: [GLevel], [GRank]"},"Demoting Admin","Yes","No"))
						if("Yes")
							if(M.key=="[mainkey1]"||M.key == "AngelReincarnation")
								alert("You can't demote teh uberness.")
								return
							if(GLevel>=M.GMLevel)
								usr<<"They are already below or equal to that rank."
								return
							AdminMessage("[usr]([key]) has demoted [M] ([M.key]) to [GRank]. [M] old level: [M.GMLevel]")
							M.RemoveGM()
							sleep(1)
							switch(GLevel)
								if(1)TrialEnf.Add(M.ckey)
								if(2)LowEnf.Add(M.ckey)
								if(3)MediumEnf.Add(M.ckey)
								if(4)HighEnf.Add(M.ckey)
								if(5)MasterEnf.Add(M.ckey)
								if(6)StaffEnf.Add(M.ckey)
							M.GMLevel = GLevel
							spawn(1)M.AdminLoad()
							spawn(5)BanSave()
							spawn(8)M.client.SaveChar()
							if(M.GMLevel<1)winset(M,"admin","is-visible=false")
							return
						if("No")return
				if("No")return
		Server()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			switch(input("What would you like to do?")in list("Server Status","Update Players","Cancel"))
				if("Server Status")
					switch(input("Is this server main or backup?") in list("Main Server","Backup Server","Cancel"))
						if("Cancel")return
						if("Main Server")
							mainserver=1
							world.UpdatePlayers()
						if("Backup Server")
							switch(input("Is this server accessible right now?")in list("Yes","No"))
								if("Yes")
									mainserver=0
									cangeton=1
									world.UpdatePlayers()
								if("No")
									mainserver=0
									cangeton=0
									world.UpdatePlayers()
				if("Update Players")
					players=0
					for(var/mob/PC/C)if(C.client)players+=1
					usr<<"Players Online: [players]"
					world.UpdatePlayers()
				if("Cancel")return
	BanGM/verb
		Give_Levels(mob/PC/M in world)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			if(!istype(M,/mob/PC))return
			switch(input("Are you sure you want to give [M] levels?")in list("Yes","No"))
				if("Yes")
					var/amount=input({"Gives a player amount of levels.(Do not abuse this power! You have been warned!)"})as null|num
					if(amount==null||!amount||!M||!usr)return
					M<<"<font color=white>You have been given [amount] levels by [usr]!"
					usr<<"<font color=white>You gave [amount] of levels to [M]!"
					EditLog(usr,"Gave [amount] of levels to [M]")
					while(amount>0)
						if(!M)return
						M.exp=M.tnl
						M.Level_Up()
						amount-=1
						sleep(0.155)
				if("No")return
		Give_TPS(mob/PC/M in world)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			if(!istype(M,/mob/PC))return
			switch(input("Are you sure you want to give [M] training points?")in list("Yes","No"))
				if("Yes")
					var/amount=input({"Gives a player amount of training points.(Do not abuse this power! You have been warned!)"})as null|num
					if(amount==null||!amount||!M||!usr)return
					M << "<font color=white>You have been given [amount] tps by [usr]!"
					usr<<"<font color=white>You gave [amount] of tps to [M]!"
					EditLog(usr,"Gave [amount] of training points to [M]")
					M.tp += amount
				if("No")return
	OwnerGM/verb
		Start_Poll(msg as text)
			set category="Admin"
			if(poll)
				usr<<"There is already a world poll, end the current poll before starting a new one."
				return
			else
				poll=1
				pollmsg=msg
				var/test1=input("Please input a text for first button.")as text|null
				if(!test1)return
				pollbox1=test1
				var/test2=input("Please input a text for second button.")as text|null
				if(!test2)return
				pollbox2=test2
				world<<"[usr] has started a world poll, you can chose to vote [pollbox1], [pollbox2], or just simply ignore it."
				EditLog(usr,"Started the world poll with '[msg]'")
				for(var/mob/M in world)
					if(M.client)
						winset(M,"poll.Epic1","text=\"[pollbox1]\"")
						winset(M,"poll.Epic2","text=\"[pollbox2]\"")
						winset(M,"poll.polltext","text=\"[msg]\"")
						winset(M,"poll","pos=10,10")
						winshow(M,"poll",1)
						M.voted=0
						polltotal++
		End_Poll()
			set category="Admin"
			if(poll)
				world<<"<font color=red><u>Poll ended!</u></font>"
				world<<"<font color=red>Topic:</font><font color=yellow> [pollmsg]</font>"
				world<<"<font color=red>Total people in the poll:</font><font color=yellow> [polltotal]</font>"
				var/pollvoted=pollyes+pollno
				var/pollvotedpercent=pollvoted/polltotal*100
				world<<"<font color=red>Total people who voted:</font><font color=yellow> [pollvoted] ([pollvotedpercent]%)</font>"
				var/pollyespercent=pollyes/pollvoted*100
				world<<"<font color=red>People who voted [pollbox1]:</font><font color=yellow> [pollyes] ([pollyespercent]%)</font>"
				var/pollnopercent=pollno/pollvoted*100
				world<<"<font color=red>People who voted [pollbox2]:</font><font color=yellow> [pollno] ([pollnopercent]%)</font>"
				polltotal=0
				pollyes=0
				pollno=0
				poll=0
				pollmsg=""
				pollbox1=""
				pollbox2=""
				EditLog(usr,"Ended the world poll.")
				return
			else
				usr<<"There is no world poll at the moment."
				return
		Make_Admin_Promoter(mob/PC/M in world)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			if(M.GMLevel<1)
				usr<<"[M] isn't an admin!"
				return
			var/YN=alert("Make [M] as an admin promoter?","Admin Promoter","No","Yes","Nevermind")
			if(YN=="No")
				if(!M||!AdminPro.Find(M.ckey))return
				AdminPro.Remove(M.ckey)
				M.verbs-=new/mob/System/Admin/Verbs/OwnerGM/verb/Demote_Admin
				M.verbs-=new/mob/System/Admin/Verbs/OwnerGM/verb/Promote_Admin
				M<<"You have been stripped down the rank of Admin Promoter and Demoter by [usr]!"
				return
			if(YN=="Yes")
				if(!M||AdminPro.Find(M.ckey))return
				AdminPro.Add(M.ckey)
				M.verbs+=new/mob/System/Admin/Verbs/OwnerGM/verb/Demote_Admin
				M.verbs+=new/mob/System/Admin/Verbs/OwnerGM/verb/Promote_Admin
				M<<"You have been granted the rank of Admin Promoter and Demoter by [usr]!"
				return
			if(YN=="Nevermind")return
		World_ShutDown()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your admin powers are locked."
				return
			var/YN=alert("Shutdown the world?","World shutdown","No","Yes","Disable world shutdown")
			if(YN=="No")return
			if(YN=="Disable world shutdown")
				var/Stop=alert("Stop world shutdown?","Stop world shutdown.","Yes","No")
				if(Stop=="Yes")
					GM_WorldShutDownProc=0
					cantsaveatall=0
					AdminMessage("[usr] has stopped the world shutdown.")
					return
				else return
			if(YN=="Yes")
				if(GM_WorldShutDownProc)
					usr<<"World is already in shutdown mode!"
					return
				GM_WorldShutDownProc=1
				world<<"<center><font color=red>World shutdown enabled. Saving characters.</font></center>"
				for(var/mob/PC/M in world)
					if(!M.client)continue
					M.client.SaveChar()
					sleep(1)
				world<<"<center><font color=red>Characters saved! World shutdown in 30 seconds.</font></center>"
				AdminMessage("[usr] has innitiated the world shutdown.")
				sleep(100)
				if(!GM_WorldShutDownProc)
					world<<"<center><font color=red>World shutdown disabled.</font></center>"
					return
				world<<"<center><font color=red>World shutdown in 20 seconds.</font></center>"
				sleep(100)
				if(!GM_WorldShutDownProc)
					world<<"<center><font color=red>World shutdown disabled.</font></center>"
					return
				world<<"<center><font color=red>World shutdown in 10 seconds.</font></center>"
				cantsaveatall=1
				sleep(100)
				if(!GM_WorldShutDownProc)
					world<<"<center><font color=red>World shutdown disabled.</font></center>"
					return
				world<<"<center><font color=red>Shutdown.</font></center>"
				del(world)
mob/proc/RemoveGM()
	GMLevel=0
	TrialEnf.Remove(ckey)
	LowEnf.Remove(ckey)
	MediumEnf.Remove(ckey)
	HighEnf.Remove(ckey)
	MasterEnf.Remove(ckey)
	StaffEnf.Remove(ckey)
	for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/HighGM/verb))verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/MasterGM/verb))verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/OwnerGM/verb))verbs-=X
mob/proc/LogOutGM()
	GMLevel=0
	for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/HighGM/verb))verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/MasterGM/verb))verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/OwnerGM/verb))verbs-=X
mob/proc/BudokaiMasterCheck()
	if(BudoMaster.Find(ckey))
		src<<"<center>\red You are a Budokai Master."
		for(var/vx in typesof(/mob/TourneyMaster/verb))verbs+=vx
mob/var/GMLevel=0
mob/var/GMLock=0
mob/var/GM_ChatMute=0
mob/var/tmp/afkchk=0
var/lastafk=0
var/lastdbe=0
var/lastdbn=0
var/lastdbb=0
mob
	proc
		UNJAILTIMER()
			src<<"<font color=red>[src], you tried to get out the jail eh? Well, we're resetting the unjail timer!"
			spawn(3000)if(src)UNJAIL()
			return
		UNJAIL()
			if(jailed)
				if(!dead)
					loc=locate(167,194,1)
					jailed=0
					frozen=0
					src<<"<font color=white>I hope you learned your lesson, [src]!"
					return
				else
					if(race=="Android")
						loc=locate(221,150,5)
						jailed=0
						frozen=0
						src<<"<font color=white>I hope you learned your lesson, [src]!"
						return
					else
						loc=locate(41,311,5)
						jailed=0
						frozen=0
						src<<"<font color=white>I hope you learned your lesson, [src]!"
						return
		UnmuteTimer(T)
			muted=1
			sleep(T)
			if(!src||!muted)return
			world<<"<font color=green>Dragon AI:</font> <font color=red>[src] has been automatically unmuted!</font>"
			muted = 0
			return
		UNMUTETIMER()
			src<<"\red[src], you tried to mute avoid eh? Well, we're resetting the unmute timer."
			spawn(300)if(src)
				muted=0
				oocmute=0
				world<<"<font color=green>Dragon AI:</font> <font color=red>[src] has been automatically unmuted!</font>"
			return
		MYSTICRESET()
			src<<"\red[src], it looks like you left during the mystic training, continue from where you left?"
			switch(alert("Continue Mystic Training?","Mystic Training","Yes","No"))
				if("Yes")
					if(mystictime==1)
						training=1
						frozen=1
						doing=1
						safe=1
						icon_state="rest"
						src<<"\white You feel some of your true power begin to flow through you..."
						sleep(3000)
						if(!src)return
						mystictime=2
						src<<"\white You feel some of your true power begin to flow through you..."
						sleep(3000)
						if(!src)return
						mystictime=3
						src<<"\white The ground shakes as your true power is finally unleashed..."
						powerlevel_max*=1.5
						ki_max*=1.5
						kidefense_max*=1.5
						strength_max*=1.5
						defence_max*=1.5
						Explode(new/Effect/BasicBoom(loc,1,4))
						frozen=0
						safe=0
						speed_max-=2000
						if(speed_max<1000)speed_max=1000
						powerlevel=powerlevel_max
						ki=ki_max
						strength=strength_max
						defence=defence_max
						critical=critical_max
						dodge=dodge_max
						reflect=reflect_max
						block=block_max
						src<<"<font color=white>Elder Kai:</font> Your training is now complete!"
						doing=0
						frozen=0
						safe=0
						form_1=1
						form_2=1
						form_3=1
						form_4=1
						form_5=1
						training=0
						gone_mystic=1
						spawn(1)client.SaveChar()
						spawn(2)HalfSaiyanTrans()
						sleep(20)
						src<<"<font color=white>Elder Kai:</font> My job here is done. Good luck [src]."
						return
					if(mystictime==2)
						if(!src)return
						training=1
						frozen=1
						src<<"\white You feel some of your true power begin to flow through you..."
						sleep(3000)
						if(!src)return
						mystictime=3
						src<<"\white The ground shakes as your true power is finally unleashed..."
						powerlevel_max*=1.5
						ki_max*=1.5
						kidefense_max*=1.5
						strength_max*=1.5
						defence_max*=1.5
						Explode(new/Effect/BasicBoom(src.loc,1,4))
						frozen=0
						safe=0
						speed_max-=2000
						if(speed_max<1000)speed_max=1000
						powerlevel=powerlevel_max
						ki=ki_max
						strength=strength_max
						defence=defence_max
						critical=critical_max
						dodge=dodge_max
						reflect=reflect_max
						block=block_max
						src<<"<font color=white>Elder Kai:</font> Your training is now complete!"
						doing=0
						frozen=0
						safe=0
						form_1=1
						form_2=1
						form_3=1
						form_4=1
						form_5=1
						training=0
						gone_mystic=1
						spawn(1)client.SaveChar()
						spawn(2)HalfSaiyanTrans()
						sleep(20)
						src<<"<font color=white>Elder Kai:</font> My job here is done. Good luck, [src]."
						return
				if("No")
					if(!src)return
					src<<"\white You feel some of your true power begin to flow through you..."
					mystictime = 3
					src<<"\white The ground shakes as your true power is finally unleashed..."
					powerlevel_max*=1.5
					ki_max*=1.5
					kidefense_max*=1.5
					strength_max*=1.5
					defence_max*=1.5
					Explode(new/Effect/BasicBoom(loc,1,4))
					frozen=0
					safe=0
					speed_max-=2000
					if(speed_max<1000)speed_max=1000
					powerlevel=powerlevel_max
					ki=ki_max
					strength=strength_max
					defence=defence_max
					critical=critical_max
					dodge=dodge_max
					reflect=reflect_max
					block=block_max
					src<<"<font color=white>Elder Kai:</font> Your training is now complete!"
					doing=0
					frozen=0
					safe=0
					form_1=1
					form_2=1
					form_3=1
					form_4=1
					form_5=1
					training=0
					gone_mystic=1
					spawn(1)client.SaveChar()
					spawn(2)HalfSaiyanTrans()
					sleep(20)
					src<<"<font color=white>Elder Kai:</font> My job here is done. Good luck, [src]."
					return
world
	proc
		AFKCHECKSTART()
			lastafk=world.time
			for(var/mob/PC/M in world)
				if(M.GMLevel||!M.loggedin)continue
				spawn(1)M.AFKPOP()
			world<<"<font color = #00B211>Dragon AI:</font> \white AFK checker has been <font color=green>initiated</font>."
			sleep(10)
			world<<"\white <center>AFK Boot In: 20 seconds"
			sleep(100)
			world<<"\white <center>AFK Boot In: 10 seconds"
			sleep(50)
			world<<"\white <center>AFK Boot In: 5 seconds"
			sleep(10)
			world<<"\white <center>AFK Boot In: 4 seconds"
			sleep(10)
			world<<"\white <center>AFK Boot In: 3 seconds"
			sleep(10)
			world<<"\white <center>AFK Boot In: 2 seconds"
			sleep(10)
			world<<"\white <center>AFK Boot In: 1 seconds"
			sleep(10)
			world<<"<font color = #00B211>Dragon AI:</font> \white AFK checker has <font color=red>ended</font>."
			world.AFKBOOT()
mob/proc/AFKPOP()
	afkchk=1
	var/afkt1=pick("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z")
	var/afkt2=pick("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z")
	afkt1=uppertext(afkt1)
	afkt2=uppertext(afkt2)
	var/warn=input(src,"Type in the following box: [afkt1][afkt2]","AFK Check")as text
	if(!warn||warn==""||warn==null||uppertext(warn)!="[afkt1][afkt2]")
		var/warn2=input(src,"Type in the following box: [afkt1][afkt2]","AFK Check")as text
		if(!warn2||warn2==""||warn2==null||uppertext(warn2)!="[afkt1][afkt2]")
			world<<"<font color=#00B211>Dragon AI:</font> \white [src] has been booted for being idle."
			del(client)
		else afkchk=0
	else afkchk=0
mob/proc/AFKPOPSPECIF(X)
	afkchk=1
	var/afkt1
	var/afkt2
	if(!X)
		afkt1=pick("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z")
		afkt2=pick("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z")
	else
		afkt1=X
		afkt2=""
	afkt1=uppertext(afkt1)
	afkt2=uppertext(afkt2)
	var/warn=input(src,"Type in the following box: [afkt1][afkt2] (if you can't answer it in time logout.)","AFK Check")as text
	if(!warn||warn==""||warn==null||uppertext(warn)!="[afkt1][afkt2]")
		var/warn2=input(src,"Type in the following box: [afkt1][afkt2] (if you can't answer it in time logout.)","AFK Check")as text
		if(!warn2||warn2==""||warn2==null||uppertext(warn2)!="[afkt1][afkt2]")
			world<<"<font color=#00B211>Dragon AI:</font> \white [src] has been booted for being idle."
			del(client)
		else
			afkchk=0
			AdminMessage("[src] has answered to the AFK check.")
	else
		afkchk=0
		AdminMessage("[src] has answered to the AFK check.")
mob/proc/AFKPOPTIME(X)
	world<<"<font color = #00B211>Dragon AI:</font> \white [src] you are under AFK check."
	src<<"\white AFK Boot In: 10 seconds"
	AdminMessage("[src] AFK Boot In: 10 seconds")
	sleep(10)
	if(!afkchk)return
	src<<"\white AFK Boot In: 9 seconds"
	AdminMessage("[src] AFK Boot In: 9 seconds")
	sleep(10)
	if(!afkchk)return
	src<<"AFK Boot In: 8 seconds"
	AdminMessage("[src] AFK Boot In: 8 seconds")
	sleep(10)
	if(!afkchk)return
	src<<"AFK Boot In: 7 seconds"
	AdminMessage("[src] AFK Boot In: 7 seconds")
	sleep(10)
	if(!afkchk)return
	src<<"AFK Boot In: 6 seconds"
	AdminMessage("\white [src] AFK Boot In: 6 seconds")
	sleep(10)
	if(!afkchk)return
	src<<"AFK Boot In: 5 seconds"
	AdminMessage("[src] AFK Boot In: 5 seconds")
	sleep(10)
	if(!afkchk)return
	src<<"AFK Boot In: 4 seconds"
	AdminMessage("[src] AFK Boot In: 4 seconds")
	sleep(10)
	if(!afkchk)return
	src<<"AFK Boot In: 3 seconds"
	AdminMessage("[src] AFK Boot In: 3 seconds")
	sleep(10)
	if(!afkchk)return
	src<<"AFK Boot In: 2 seconds"
	AdminMessage("[src] AFK Boot In: 2 seconds")
	sleep(10)
	if(!afkchk)return
	src<<"AFK Boot In: 1 seconds"
	AdminMessage("[src] AFK Boot In: 1 seconds")
	sleep(10)
	if(!afkchk)return
	if(X=="BAN")
		if(!afkchk)return
		world<<"<font color=#00B211>Dragon AI:</font> \white [src] has been <font color=red>banned</font>."
		BannedK.Add(ckey)
		var/savefile/Z = new("World Save Files/Bans.sav")
		Z["BannedK"]<<BannedK
		sleep(2)
		del(client)
	else
		if(!afkchk)return
		world<<"<font color=#00B211>Dragon AI:</font> \white [src] has been <font color=red>booted</font> for being \red idle."
		del(client)
world/proc/AFKBOOT()
	for(var/mob/PC/N in world)
		if(!N.loggedin||N.GMLevel||!N.afkchk)continue
		world<<"<font color=#00B211>Dragon AI:</font> \white [N] has been \red booted \font for being \red idle."
		del(N.client)
		sleep(1)
proc/Time()
	var/days=0;var/hours=0;var/minutes=0;var/seconds=0;var/temp
	temp=world.time
	seconds=round(temp/10)
	while(seconds>=60)
		seconds-=60
		++minutes
	while(minutes>=60)
		minutes-=60
		++hours
	while(hours>=24)
		hours-=24
		++days
	if(!days&&!hours&&!minutes&&seconds)return "[seconds] second(s)"
	if(!days&&!hours&&minutes&&seconds)return "[minutes] minute(s) and [seconds] second(s)"
	if(!days&&!hours&&minutes&&!seconds)return "[minutes] minute(s)"
	if(!days&&hours&&!minutes&&!seconds)return "[hours] hour(s)"
	if(!days&&hours&&!minutes&&seconds)return "[hours] hour(s) and [seconds] second(s)"
	if(!days&&hours&&minutes&&!seconds)return "[hours] hour(s) and [minutes] minute(s)"
	if(!days&&hours&&minutes&&seconds)return "[hours] hour(s), [minutes] minute(s) and [seconds] second(s)"
	if(days&&hours&&minutes&&seconds)return "[days] day(s), [hours] hour(s), [minutes] minute(s) and [seconds] second(s)"
	if(days&&!hours&&!minutes&&seconds)return "[days] day(s) and [seconds] second(s)"
	if(days&&!hours&&minutes&&seconds)return "[days] day(s), [minutes] minute(s) and [seconds] second(s)"
	if(days&&hours&&!minutes&&seconds)return "[days] day(s), [hours] hour(s) and [seconds] second(s)"
	if(days&&hours&&minutes&&!seconds)return "[days] day(s), [hours] hour(s) and [minutes] minute(s)"
	if(days&&hours&&!minutes&&seconds)return "[days] day(s), [hours] hour(s) and [seconds] second(s)"
	if(days&&!hours&&minutes&&!seconds)return "[days] day(s) and [minutes] minute(s)"
	if(days&&hours&&!minutes&&!seconds)return "[days] day(s) and [hours] hour(s)"
	if(days&&!hours&&!minutes&&!seconds)return "[days] day(s)"


var/Host
mob/Login()
	sleep(0)
	spawn(0)

		if(client.address==null)
			Host=usr.key
			if(src.GMLevel <= 5)
				usr<<"<font color=red><B>You Have Been Given Admin Powers"
				GMLevel=5
				MasterEnf.Add(usr.ckey)
				spawn(1)usr.AdminLoad()
				spawn(5)BanSave()
				spawn(8)usr.client.SaveChar()
				winset(usr,"admin","is-visible=true")
		AdminLoad()
		..()
