mob/proc/ChanglingRevert()
	potara_using=0
	isusingut=0
	if(form_7)
		frozen=1
		icon_state="enrage"
		sleep(10)
		doing=0
		form_7=0
		overlays-='Elec Blue Small.dmi'
		overlays-='Elec Blue Big.dmi'
		overlays-='Elec Red Big.dmi'
		overlays-=transeaura
		Power_Redefine()
		powerlevel=powerlevel_max
		ki=ki_max
		view(8)<<"[src] has reverted from their transformed state."
		icon_state=""
		frozen=0
		speed=speed_max-1000
		if(speed<1000)speed=1000
		return
	if(form_1)
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
		overlays-='Elec Blue Small.dmi'
		overlays-='Elec Blue Big.dmi'
		overlays-='Elec Red Big.dmi'
		Power_Redefine()
		Skin_Apply()
		powerlevel=powerlevel_max
		ki=ki_max
		view(8)<<"[src] has reverted from their transformed state."
		icon_state=""
		if(gene_cooler)
			src.icon = 'Cooler - Form.dmi'
		else
			src.icon = 'Changling - Form 1.dmi'
		frozen=0
		return
	return