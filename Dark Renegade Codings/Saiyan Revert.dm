mob/proc/SaiyanRevert()
	if(Oozaru)return
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
		form_7=0
		overlays-=transeaura
		overlays-=aura
		aura=0
		overlays-='Elec Blue Small.dmi'
		overlays-='Elec Blue Big.dmi'
		overlays-='Elec Red Big.dmi'
		overlays-='Elec White.dmi'
		overlays-='Hair - SSJ3.dmi'
		overlays-='Hair - SSJ4.dmi'
		overlays-='Hair - SSJ4(fused).dmi'
		overlays-='ssj4tail.dmi'
		overlays-='Elec LSSJ.dmi'
		overlays-='Big Aura.dmi'
		Power_Redefine()
		Skin_Apply()
		Hair_Apply()
		powerlevel=powerlevel_max
		ki=ki_max
		view(8)<<"[src] has reverted from their transformed state."
		icon_state = ""
		frozen=0
		speed=speed_max-1000
		if(speed<1000)speed=1000
		return
	else return
mob/proc/LSaiyanRevert()
	if(Oozaru)return
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
		form_7=0
		overlays-=aura
		aura=0
		overlays-='Elec Blue Small.dmi'
		overlays-='Elec Blue Big.dmi'
		overlays-='Elec Red Big.dmi'
		overlays-='Elec White.dmi'
		overlays-='Hair - SSJ3.dmi'
		overlays-='Hair - SSJ4.dmi'
		overlays-='Hair - SSJ4(fused).dmi'
		overlays-='ssj4tail.dmi'
		overlays-='Elec LSSJ.dmi'
		overlays-='Big Aura.dmi'
		overlays-=transeaura
		Power_Redefine()
		Skin_Apply()
		Hair_Apply()
		powerlevel=powerlevel_max
		ki=ki_max
		view(8)<<"[src] has reverted from their transformed state."
		icon_state=""
		frozen=0
		speed=speed_max-1000
		if(speed<1000)speed=1000
		return
	else return

mob/proc/GSaiyanRevert()
	if(Oozaru)return
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
		form_7=0
		overlays-=aura
		aura=0
		overlays-='Elec Blue Small.dmi'
		overlays-='Elec Blue Big.dmi'
		overlays-='Elec Red Big.dmi'
		overlays-='Elec White.dmi'
		overlays-='Hair - SSJ3.dmi'
		overlays-='Hair - SSJ4.dmi'
		overlays-='Hair - SSJ4(fused).dmi'
		overlays-='ssj4tail.dmi'
		overlays-='Elec LSSJ.dmi'
		overlays-='Big Aura.dmi'
		overlays-='Hair - Trunks Long SSJG.dmi'
		overlays-='Hair - Vegeta SSJG.dmi'
		overlays-='Hair - Teen Gohan SSJG.dmi'
		overlays-='Hair - SSJG Raditz.dmi'
		overlays-='Hair - Goku SSJG.dmi'
		overlays-='Hair - Adult Gohan SSJG.dmi'
		overlays-='Hair - Future Gohan SSJG.dmi'
		overlays-=transeaura
		Power_Redefine()
		Skin_Apply()
		Hair_Apply()
		powerlevel=powerlevel_max
		ki=ki_max
		view(8)<<"[src] has reverted from their transformed state."
		icon_state=""
		frozen=0
		speed=speed_max-1000
		if(speed<1000)speed=1000
		return
	else return