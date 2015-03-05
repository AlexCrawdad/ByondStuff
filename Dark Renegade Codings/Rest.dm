mob/PC/verb/Rest()
	set category = "Training"
	if(jailed)
		usr<<"You're in jail!"
		return
	if(buku||boxing||dualtrain)
		usr<<"You're already doing something!"
		return
	if(rest_delay)
		usr<<"You must wait a moment before resting again."
		return
	if(kaioken||KO)return
	if(rest)
		rest_delay=1
		rest=0
		icon_state=""
		frozen=0
		doing=0
		usr<<"You stopped resting..."
		spawn(25)if(usr)rest_delay=0
		return
	if(doing||!stamina)return
	else
		rest_delay=0
		rest=1
		frozen=1
		doing=1
		usr<<"You sit down and rest..."
		icon_state="meditate"
		spawn(25)if(usr)rest_delay=0
		spawn(1)Rest_Gain()
		return
mob/proc/Rest_Gain()
	set background=1
	while(rest)
		if(KO)break
		else
			if(stamina<=0)
				stamina=0
				rest=0
				icon_state=""
				frozen=0
				doing=0
				usr.overlays-='Rest.dmi'
				usr<<"You are fully rested..."
				rest_delay=0
				break
			if(KO)break
			else
				var/gains=rand(150,250)
				if(stamina>0)
					stamina-=gains
					if(stamina<0)stamina=0
				if(stamina<=0)
					stamina=0
					rest=0
					icon_state=""
					frozen=0
					doing=0
					src<<"You are fully rested..."
					usr.overlays-='Rest.dmi'
					rest_delay=0
					break
				sleep(5)