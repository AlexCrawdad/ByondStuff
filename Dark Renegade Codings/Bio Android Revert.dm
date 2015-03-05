mob/proc/BioRevert()
	if(form_3)
		frozen=1
		icon_state="enrage"
		sleep(10)
		doing=0
		form_3=0
		overlays-='Elec Blue Small.dmi'
		overlays-='Elec Blue Big.dmi'
		overlays-='Elec Red Big.dmi'
		Power_Redefine()
		powerlevel=powerlevel_max
		ki=ki_max
		view(8)<<"[src] has reverted from their Power Weighted Form."
		icon_state=""
		icon='Bio Android - Form 3.dmi'
		frozen=0
		speed=speed_max-1000
		if(speed<1000)speed=1000
		return
	return