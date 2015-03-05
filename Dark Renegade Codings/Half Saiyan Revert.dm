mob/var/form_6 = 0
mob/proc/HalfSaiyanRevert()
	if(src.Oozaru)return
	src.potara_using=0
	if(src.form_1||src.isusingut)
		src.isusingut=0
		src.frozen = 1
		src.icon_state = "enrage"
		sleep(10)
		src.doing = 0
		src.form_1 = 0
		src.form_2 = 0
		src.form_3 = 0
		src.form_4 = 0
		src.form_5 = 0
		src.form_6 = 0
		src.speed=src.speed_max-1000
		if(src.speed<1000)src.speed=1000
		src.overlays -= src.aura
		src.aura = 0
		src.overlays -= 'Elec Blue Small.dmi'
		src.overlays -= 'Elec Blue Big.dmi'
		src.overlays -= 'Elec Red Big.dmi'
		src.overlays -= 'Hair - SSJ3.dmi'
		src.overlays -= 'Elec White.dmi'
		src.overlays-=src.transeaura
		src.Power_Redefine()
		src.Skin_Apply()
		src.overlays -= src.hair_icon
		src.Hair_Apply()
		src.powerlevel=src.powerlevel_max
		src.ki=src.ki_max
		view(8) << "[src] has reverted from their transformed state."
		src.icon_state = ""
		src.frozen = 0
		return
	return