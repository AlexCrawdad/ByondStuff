mob/proc/TuffleRevert()
	if(form_3)
		frozen=1
		isusingut=0
		src.icon_state="enrage"
		sleep(10)
		doing=0
		form_3=0
		form_4=0
		form_5=0
		overlays-='Elec Blue Small.dmi'
		overlays-='Elec Blue Big.dmi'
		overlays-='Elec Red Big.dmi'
		overlays-='Elec White.dmi'
		Power_Redefine()
		powerlevel=powerlevel_max
		ki=ki_max
		view(8)<<"[src] has reverted from their transformed state."
		icon='Bebi - Form 3.dmi'
		icon_state=""
		frozen=0
		speed=speed_max-1000
		if(speed<1000)speed=1000
		return
	return