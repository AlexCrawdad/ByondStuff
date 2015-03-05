mob/proc/HumanRevert()
	potara_using=0
	if(form_5)
		frozen=1
		icon_state="enrage"
		sleep(10)
		doing=0
		form_5=0
		overlays-='Elec Blue Small.dmi'
		overlays-='Elec Blue Big.dmi'
		overlays-='Elec Red Big.dmi'
		overlays-='Elec Human Red.dmi'
		overlays-=transeaura
		Power_Redefine()
		powerlevel=powerlevel_max
		ki=ki_max
		overlays-=hair_icon
		Hair_Apply()
		view(8)<<"[src] has reverted from their transformed state."
		icon_state=""
		frozen=0
		speed=speed_max-1000
		if(speed<1000)speed=1000
		return
	if(form_1||isusingut)
		isusingut=0
		frozen=1
		icon_state="enrage"
		sleep(10)
		doing=0
		speed=speed_max-1000
		if(speed<1000)speed=1000
		form_1=0
		form_2=0
		form_3=0
		form_4=0
		form_5=0
		overlays-=transeaura
		overlays-='Elec Blue Small.dmi'
		overlays-='Elec Blue Big.dmi'
		overlays-='Elec Human Blue.dmi'
		overlays-='Elec Human Red.dmi'
		overlays-=hair_icon
		Power_Redefine()
		Skin_Apply()
		Hair_Apply()
		powerlevel=powerlevel_max
		ki=ki_max
		view(8)<<"[src] has reverted from their transformed state."
		icon_state=""
		frozen=0
		return
	return