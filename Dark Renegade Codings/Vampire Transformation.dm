mob/proc/VampFuseForm()
	src.doing = 1
	src.icon_state = "enrage"
	src.frozen = 1
	if(src.trans1t!="")view(8)<<"\white[src]: \font [src.trans6t]"
	AllTranse()
	view(10) << sound('thunder.wav')
	if(src.Quake_Effect_Toggle == 0)
		Quake_Effect(src,duration=src.upkeep,strength=1)
	src.underlays -= aura
	src.underlays += aura
	spawn(5) src.underlays -= aura
	src.Fade(yellows)
	sleep(10)
	if(src.crater_on)
		new/obj/techs/Overlays/Crater_Center(src.loc)
	sleep(20)
	sleep(src.upkeep)
	if(src.crater_on)new/obj/techs/Overlays/Crater_Center(src.loc)
	if(src.powerlevel>src.powerlevel_max)src.powerlevel = src.powerlevel_max
	if(src.ki>src.ki_max)src.ki = src.ki_max
	if(src.kidefense>src.kidefense_max)src.kidefense=src.kidefense_max
	if(src.strength>src.strength_max)src.strength = src.strength_max
	if(src.defence>src.defence_max)src.defence = src.defence_max
	src.powerlevel *= 45
	src.ki *= 39
	src.strength *= 47
	src.defence *= 45
	src.kidefense*=39
	src.block += 20
	src.dodge += 20
	src.critical += 20
	src.reflect += 20
	src.counter += 20
	Skills_Checker()
	src.speed=src.speed_max-4000
	if(src.speed<1000)src.speed=1000
	src.underlays -= src.underlays
	src.overlays -= src.aura
	src.Big_Aura()
	for(var/turf/T in view(src,6))
		var/chance = roll(1,20)
		if(chance == 15)
			missile(new/obj/PurplePU, src, T)
	src.icon = 'Saibaman - Form 5.dmi'
	src.overlays+='Elec Red Big.dmi'
	src.icon_state = ""
	src.form_1 = 1
	src.frozen = 0
	src.doing = 0
	if(!wait_room)safe=0
	src.VarReset()
	src.TransformMasteryMultiplier()
	return
mob/proc/VampPotaraFuseForm()
	if(src.potara_using)return
	src.potara_using=1
	src.doing = 1
	src.icon_state = "enrage"
	src.frozen = 1
	if(src.trans1t!="")view(8)<<"\white[src]: \font [src.trans6t]"
	AllTranse()
	view(10) << sound('thunder.wav')
	if(src.Quake_Effect_Toggle == 0)
		Quake_Effect(src,duration=src.upkeep,strength=1)
	src.underlays -= aura
	src.underlays += aura
	spawn(5) src.underlays -= aura
	src.Fade(yellows)
	sleep(10)
	if(src.crater_on)
		new/obj/techs/Overlays/Crater_Center(src.loc)
	sleep(20)
	sleep(src.upkeep)
	if(src.crater_on)new/obj/techs/Overlays/Crater_Center(src.loc)
	if(src.powerlevel>src.powerlevel_max)src.powerlevel = src.powerlevel_max
	if(src.ki>src.ki_max)src.ki = src.ki_max
	if(src.kidefense>src.kidefense_max)src.kidefense=src.kidefense_max
	if(src.strength>src.strength_max)src.strength = src.strength_max
	if(src.defence>src.defence_max)src.defence = src.defence_max
	src.powerlevel *= 55
	src.ki *= 55
	src.strength *= 55
	src.defence *= 55
	src.kidefense*=55
	src.block += 20
	src.dodge += 20
	src.critical += 20
	src.reflect += 20
	src.counter += 20
	Skills_Checker()
	src.speed=src.speed_max-4000
	if(src.speed<1000)src.speed=1000
	src.underlays -= src.underlays
	src.overlays -= src.aura
	src.Big_Aura()
	for(var/turf/T in view(src,6))
		var/chance = roll(1,20)
		if(chance == 15)
			missile(new/obj/PurplePU, src, T)
	src.icon = 'Vamp - Form 3.dmi'
	src.overlays+='Elec Red Big.dmi'
	src.icon_state = ""
	src.form_1 = 1
	src.frozen = 0
	src.doing = 0
	if(!wait_room)safe=0
	src.VarReset()
	src.TransformMasteryMultiplier()
	return
mob/proc/VampTrans()
	var/trans_time = src.upkeep/1.5
	if(src.doing)return
	else
		if(src.finalformfuse)
			if(src.fused&&!src.form_1)
				src.doing = 1
				src.icon_state = "enrage"
				src.frozen = 1
				if(src.trans1t!="")view(8)<<"\white[src]: \font [src.trans6t]"
				AllTranse()
				view(10) << sound('thunder.wav')
				if(src.Quake_Effect_Toggle == 0)
					Quake_Effect(src,duration=src.upkeep,strength=1)
				src.underlays -= aura
				src.underlays += aura
				spawn(5) src.underlays -= aura
				src.Fade(yellows)
				sleep(10)
				if(src.crater_on)
					new/obj/techs/Overlays/Crater_Center(src.loc)
				sleep(20)
				sleep(trans_time)
				if(src.crater_on)new/obj/techs/Overlays/Crater_Center(src.loc)
				if(src.powerlevel>src.powerlevel_max)src.powerlevel = src.powerlevel_max
				if(src.ki>src.ki_max)src.ki = src.ki_max
				if(src.kidefense>src.kidefense_max)src.kidefense=src.kidefense_max
				if(src.strength>src.strength_max)src.strength = src.strength_max
				if(src.defence>src.defence_max)src.defence = src.defence_max
				src.powerlevel *= 47
				src.ki *= 47
				src.kidefense*=47
				src.strength *= 48
				src.defence *= 45
				src.SkillsReset()
				src.block += 20
				src.dodge += 20
				src.critical += 20
				src.reflect += 20
				src.counter += 20
				Skills_Checker()
				src.speed=src.speed_max-4000
				if(src.speed<1000)src.speed=1000
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				for(var/turf/T in view(src,6))
					var/chance = roll(1,20)
					if(chance == 15)
						missile(new/obj/PurplePU, src, T)
				src.icon = 'Vamp - Form 3.dmi'
				src.overlays+='Elec Red Big.dmi'
				src.icon_state = ""
				src.form_1 = 1
				src.frozen = 0
				src.doing = 0
				if(!wait_room)safe=0
				src.VarReset()
				src.TransformMasteryMultiplier()
				return
		if(!src.form_1)
			if(src.powerlevel_max >= 5000000)
				src.doing = 1
				src.icon_state = "enrage"
				if(src.trans5t!="")view(8)<<"\white[src]: \font [src.trans5t]"
				AllTranse()
				view(10) << sound('thunder.wav')
				if(src.Quake_Effect_Toggle == 0)
					Quake_Effect(src,duration=src.upkeep,strength=1)
				src.underlays -= aura
				src.underlays += aura
				spawn(5) src.underlays -= aura
				src.Fade(yellows)
				if(src.crater_on)
					new/obj/techs/Overlays/Crater_Center(src.loc)
				src.frozen = 1
				sleep(src.upkeep)
				if(src.crater_on)new/obj/techs/Overlays/Crater_Center(src.loc)
				if(src.powerlevel>src.powerlevel_max)src.powerlevel = src.powerlevel_max
				if(src.ki>src.ki_max)src.ki = src.ki_max
				if(src.kidefense>src.kidefense_max)src.kidefense=src.kidefense_max
				if(src.strength>src.strength_max)src.strength = src.strength_max
				if(src.defence>src.defence_max)src.defence = src.defence_max
				src.Power_Redefine()
				src.powerlevel=src.powerlevel_max
				src.ki=src.ki_max
				src.overlays -= src.aura
				src.underlays -= src.underlays
				src.Big_Aura()
				for(var/turf/T in view(src,6))
					var/chance = roll(1,20)
					if(chance == 15)
						missile(new/obj/PurplePU, src, T)
				src.overlays += 'Elec Red Big.dmi'
				src.powerlevel *= 49
				src.ki *= 50
				src.kidefense*=50
				src.strength *= 50
				src.defence *= 50
				src.SkillsReset()
				src.block += 56
				src.dodge += 56
				src.critical += 56
				src.reflect += 56
				src.counter += 56
				Skills_Checker()
				src.speed=src.speed_max-4000
				if(src.speed<1000)src.speed=1000
				src.icon = 'Vamp - Form 2.dmi'
				src.icon_state=""
				src.permtpsboosted = 1
				src.form_1 = 1
				src.frozen = 0
				src.doing = 0
				if(!wait_room)if(!wait_room)safe=0
				src.VarReset()
				src.FORM1_EXP()
				src.TransformMasteryMultiplier()
				return

mob/proc/VampRevert()
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
		overlays-=aura
		aura=0
		overlays-=transeaura
		overlays-='Elec Green Big.dmi'
		overlays-='Elec Black.dmi'
		overlays-='Elec Red Big.dmi'
		Power_Redefine()
		powerlevel=powerlevel_max
		ki=ki_max
		icon='Vamp - Form 1.dmi'
		view()<<"[src] has reverted from their transformed state."
		icon_state=""
		frozen=0
		return
	else return