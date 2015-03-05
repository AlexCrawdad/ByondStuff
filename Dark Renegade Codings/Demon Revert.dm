mob/proc/DemonRevert()
	potara_using=0
	if(form_1||isusingut)
		isusingut=0
		frozen=1
		icon_state="enrage"
		sleep(10)
		doing=0
		form_1=0
		form_2=0
		form_3=0
		form_4=0
		form_5=0
		form_6=0
		speed=speed_max-1000
		if(speed<1000)speed=1000
		overlays-=transeaura
		overlays-='Elec Demon 1.dmi'
		overlays-='Elec Demon 2.dmi'
		overlays-='Elec Demon 3.dmi'
		Power_Redefine()
		Skin_Apply()
		powerlevel=powerlevel_max
		ki=ki_max
		view(8)<<"[src] has reverted from their transformed state."
		icon_state=""
		frozen=0
		return
	return