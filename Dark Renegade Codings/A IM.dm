mob
	var/tmp
		list/InstantMessenger=list()
		wisper_delay=0;wisper_muted=0;im_checked=0
	proc
		IMAnnounce()
			while(!im_checked)
				if(!src)break
				if(InstantMessenger.len<1)
					InstantMessenger=list()
					winset(src,"IMbutton","background-color=black;text-color=gray")
					break
				winset(src,"IMbutton","background-color=#FFA500;text-color=black")
				src<<"<u>Whisper Information:</u> You have pending messages!</font>"
				sleep(600)
mob/PC/verb
	CheckIMs()
		set hidden=1
		im_checked=1
		var/which=input("Which IM do you wish to see?","Instant Message")as null|anything in InstantMessenger
		winset(usr,"IMbutton","background-color=black;text-color=gray")
		if(!which)return
		winshow(usr,"\ref[which]",1)
		return
	Instant_Message()
		set category="Channels";set name="Whisper"
		var/list/varPeople=new()
		for(var/client/T)varPeople+=T.mob
		for(var/mob/PC/M in varPeople)if(M&&M.adminhidden)varPeople.Remove(M)
		var/mob/R=input("Who would you like to whisper to?","Whisper")as null|anything in varPeople-usr
		if(!R||!R.wisper_on)
			if(R&&!R.wisper_on)usr<<"Not available."
			return
		var/msg=input("Whisper to [TakeHTML(R.name)]","Message")as null|text
		ChatLog(usr,"Instant Message: [msg]")
		if(!msg||!R)
			if(!R)usr<<"Not available."
			return
		if(R.wisper_on)
			if(Check_For_Profanity(msg,PROFANITY)==TRUE)
				wisper_muted=1
				usr<<"<font color=green>Whisper AI:</font> You've been <font color=red>muted</font> for 30 seconds due to <font color=red>linking</font>!"
				spawn(300)if(usr)
					wisper_muted=0
					usr<<"<font color=green>Whisper AI:</font> You've been <font color=red>unmuted</font>!"
				return
			if(CapsCount(msg)<0)
				usr<<"<font color=green>Whisper AI:</font> \white You've been <font color=red>muted</font> for 30 seconds due to <font color=red>caps</font>!"
				wisper_muted=1
				spawn(300)if(usr&&wisper_muted)
					wisper_muted=0
					usr<<"<font color=green>Whisper AI:</font> You've been <font color=red>unmuted</font>!"
				return
			msg=S.ParseHTML(msg)
			winclone(R,"windowIM","\ref[usr]")
			winclone(usr,"windowIM","\ref[R]")
			winset(usr,"\ref[R]","title=\"PM [TakeHTML(R.name)]\"")
			winset(R,"\ref[usr]","title=\"PM [TakeHTML(usr.name)]\"")
			winset(usr,"\ref[R].IMin","command='send \"\ref[R]\" \"'")
			winset(R, "\ref[usr].IMin","command='send \"\ref[usr]\" \"'")
			R<<output("\white <font color=[namecolor]> [usr]</font>: <font color=[textcolor]>[msg]</font></font>","\ref[usr].IMout")
			usr<<output("\white <font color=[namecolor]> [usr]</font>: <font color=[textcolor]>[msg]</font></font>","\ref[R].IMout")
			R.im_checked=0
			winset(R,"IMbutton","background-color=#FFA500;text-color=black")
			winshow(src,"\ref[R]",1)
			InstantMessenger-=R
			R.InstantMessenger-=usr
			InstantMessenger+=R
			R.InstantMessenger+=usr
			R.IMAnnounce()
			return
		else
			usr<<"[R]'s whisper are off!"
			return
	send(var/ref as text,var/msg as text)
		set category=null
		ChatLog(usr,"Instant Message: [msg]")
		var/R=locate(ref)
		if(!R||!msg||wisper_muted)return
		if(Check_For_Spam(msg,SPAM)==TRUE)
			usr<<"Please do not use linebreak characters."
			return
		if(CapsCount(msg)<0)
			usr<<"<font color=green>Whisper AI:</font> You've been <font color=red>muted</font> for 30 seconds due to <font color=red>caps</font>!"
			wisper_muted=1
			spawn(300)if(usr&&wisper_muted)
				wisper_muted=0
				usr<<"<font color=green>Whisper AI:</font> You've been <font color=red>unmuted</font>!"
			return
		if(Check_For_Profanity(msg,PROFANITY)==TRUE)
			wisper_muted=1
			usr<<"<font color=green>Whisper AI:</font> You've been <font color=red>muted</font> for 30 seconds due to <font color=red>linking</font>!"
			spawn(300)if(usr)
				wisper_muted=0
				usr<<"<font color=green>Whisper AI:</font> You've been <font color=red>unmuted</font>!"
			return
		if(wisper_delay>4)
			wisper_delay=0
			wisper_muted=1
			usr<<"<font color=green>Whisper AI:</font> You've been <font color=red>muted</font> for 30 seconds due to <font color=red>spamming</font>!"
			spawn(300)if(usr)
				wisper_muted=0
				usr<<"<font color=green>Whisper AI:</font> You've been <font color=red>unmuted</font>!"
			return
		tourny_afk_timer=0
		msg=S.ParseHTML(msg)
		wisper_delay++
		spawn(35)if(usr)wisper_delay--
		winshow(usr,"\ref[R]",1)
		winset(R,"\ref[usr]","title=\"PM [TakeHTML(usr.name)]\"")
		R<<output("\white <font color=[namecolor]> [usr]</font>: <font color=[textcolor]>[msg]</font></font>","\ref[usr].IMout")
		usr<<output("\white <font color=[namecolor]> [usr]</font>: <font color=[textcolor]>[msg]</font></font>","\ref[R].IMout")
		if(winget(R,"\ref[usr]","is-visible")=="false")winset(R,"IMbutton","background-color=#FFA500;text-color=black")
		return
