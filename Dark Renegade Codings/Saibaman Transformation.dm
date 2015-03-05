mob/proc/SaibamanFuseForm()
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
	src.form_2 = 1
	src.form_3 = 1
	src.form_4 = 1
	src.frozen = 0
	src.doing = 0
	if(!wait_room)safe=0
	src.VarReset()
	src.TransformMasteryMultiplier()
	return
mob/proc/SaibamanPotaraFuseForm()
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
	src.icon = 'Saibaman - Form 5.dmi'
	src.overlays+='Elec Red Big.dmi'
	src.icon_state = ""
	src.form_1 = 1
	src.form_2 = 1
	src.form_3 = 1
	src.form_4 = 1
	src.frozen = 0
	src.doing = 0
	if(!wait_room)safe=0
	src.VarReset()
	src.TransformMasteryMultiplier()
	return
mob/proc/SaibamanTrans()
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
				src.powerlevel *= 45
				src.ki *= 39
				src.strength *= 47
				src.defence *= 45
				src.kidefense*=39
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
				src.icon = 'Saibaman - Form 5.dmi'
				src.overlays+='Elec Red Big.dmi'
				src.icon_state = ""
				src.form_1 = 1
				src.form_2 = 1
				src.form_3 = 1
				src.form_4 = 1
				src.frozen = 0
				src.doing = 0
				if(!wait_room)safe=0
				src.VarReset()
				src.TransformMasteryMultiplier()
				return
		if(!src.form_1)
			if(src.powerlevel_max >= 1000000)
				src.doing = 1
				src.icon_state = "enrage"
				if(src.trans1t!="")view(8)<<"\white[src]: \font [src.trans1t]"
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
				src.frozen = 1
				sleep(trans_time)
				if(src.powerlevel>src.powerlevel_max)src.powerlevel = src.powerlevel_max
				if(src.ki>src.ki_max)src.ki = src.ki_max
				if(src.kidefense>src.kidefense_max)src.kidefense=src.kidefense_max
				if(src.strength>src.strength_max)src.strength = src.strength_max
				if(src.defence>src.defence_max)src.defence = src.defence_max
				src.Power_Redefine()
				src.powerlevel=src.powerlevel_max
				src.ki=src.ki_max
				src.powerlevel *= 12
				src.ki *= 8
				src.kidefense*=8
				src.strength *= 10
				src.defence *= 8
				src.SkillsReset()
				src.block += 15
				src.dodge += 15
				src.critical += 15
				src.reflect += 15
				src.counter += 15
				Skills_Checker()
				src.speed=src.speed_max-1000
				if(src.speed<1000)src.speed=1000
				src.Big_Aura()
				for(var/turf/T in view(src,6))
					var/chance = roll(1,20)
					if(chance == 15)
						missile(new/obj/PurplePU, src, T)
				src.icon = 'Saibaman - Form 2.dmi'
				src.icon_state=""
				src.form_1 = 1
				src.frozen = 0
				src.doing = 0
				if(!wait_room)if(!wait_room)safe=0
				src.VarReset()
				src.TransformMasteryMultiplier()
				src.FORM1_EXP()
				return
		else
			if(!src.form_2)
				if(src.powerlevel_max >= 10000000)
					src.doing = 1
					src.icon_state = "enrage"
					if(src.trans2t!="")view(8)<<"\white[src]: \font [src.trans2t]"
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
					src.frozen = 1
					sleep(trans_time)
					if(src.powerlevel>src.powerlevel_max)src.powerlevel = src.powerlevel_max
					if(src.ki>src.ki_max)src.ki = src.ki_max
					if(src.kidefense>src.kidefense_max)src.kidefense=src.kidefense_max
					if(src.strength>src.strength_max)src.strength = src.strength_max
					if(src.defence>src.defence_max)src.defence = src.defence_max
					src.Power_Redefine()
					src.powerlevel=src.powerlevel_max
					src.ki=src.ki_max
					src.powerlevel *= 27
					src.ki *= 24
					src.kidefense*=24
					src.strength *= 24
					src.defence *= 26
					src.SkillsReset()
					src.block += 25
					src.dodge += 25
					src.critical += 25
					src.reflect += 25
					src.counter += 25
					Skills_Checker()
					src.speed=src.speed_max-2000
					if(src.speed<1000)src.speed=1000
					src.Big_Aura()
					for(var/turf/T in view(src,6))
						var/chance = roll(1,20)
						if(chance == 15)
							missile(new/obj/PurplePU, src, T)
					src.overlays+='Elec Green Big.dmi'
					src.icon = 'Saibaman - Form 3.dmi'
					src.icon_state=""
					src.form_2 = 1
					src.frozen = 0
					src.doing = 0
					if(!wait_room)safe=0
					src.VarReset()
					src.TransformMasteryMultiplier()
			else
				if(!src.form_3)
					if(src.powerlevel_max >= 100000000)
						src.doing = 1
						src.icon_state = "enrage"
						if(src.trans3t!="")view(8)<<"\white[src]: \font [src.trans3t]"
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
						src.frozen = 1
						sleep(trans_time)
						if(src.powerlevel>src.powerlevel_max)src.powerlevel = src.powerlevel_max
						if(src.ki>src.ki_max)src.ki = src.ki_max
						if(src.kidefense>src.kidefense_max)src.kidefense=src.kidefense_max
						if(src.strength>src.strength_max)src.strength = src.strength_max
						if(src.defence>src.defence_max)src.defence = src.defence_max
						src.Power_Redefine()
						src.powerlevel=src.powerlevel_max
						src.ki=src.ki_max
						src.powerlevel *= 34
						src.ki *= 32
						src.kidefense*=32
						src.strength *= 32
						src.defence *= 30
						src.SkillsReset()
						src.block += 30
						src.dodge += 30
						src.critical += 30
						src.reflect += 30
						src.counter += 30
						Skills_Checker()
						src.speed=src.speed_max-3000
						if(src.speed<1000)src.speed=1000
						src.Big_Aura()
						for(var/turf/T in view(src,6))
							var/chance = roll(1,20)
							if(chance == 15)
								missile(new/obj/PurplePU, src, T)
						src.icon = 'Saibaman - Form 4.dmi'
						src.overlays-='Elec Green Big.dmi'
						src.overlays+='Elec Black.dmi'
						src.icon_state=""
						src.form_3 = 1
						src.frozen = 0
						src.doing = 0
						if(!wait_room)safe=0
						src.VarReset()
						src.TransformMasteryMultiplier()
				else
					if(!src.form_4)
						if(src.powerlevel_max >= 25000000)
							src.doing = 1
							src.icon_state = "enrage"
							if(src.trans4t!="")view(8)<<"\white[src]: \font [src.trans4t]"
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
							src.frozen = 1
							sleep(trans_time)
							if(src.powerlevel>src.powerlevel_max)src.powerlevel = src.powerlevel_max
							if(src.ki>src.ki_max)src.ki = src.ki_max
							if(src.kidefense>src.kidefense_max)src.kidefense=src.kidefense_max
							if(src.strength>src.strength_max)src.strength = src.strength_max
							if(src.defence>src.defence_max)src.defence = src.defence_max
							src.Power_Redefine()
							src.powerlevel=src.powerlevel_max
							src.ki=src.ki_max
							src.powerlevel *= 30
							src.ki *= 42
							src.kidefense*=43
							src.strength *= 45
							src.defence *= 45
							src.SkillsReset()
							src.block += 35
							src.dodge += 65
							src.critical += 45
							src.reflect += 35
							src.counter += 40
							Skills_Checker()
							src.speed=src.speed_max-4000
							if(src.speed<1000)src.speed=1000
							src.Big_Aura()
							for(var/turf/T in view(src,6))
								var/chance = roll(1,20)
								if(chance == 15)
									missile(new/obj/PurplePU, src, T)
							src.icon = 'Saibaman - Form 5.dmi'
							src.overlays-='Elec Black.dmi'
							src.overlays+='Elec Red Big.dmi'
							src.icon_state=""
							src.form_4 = 1
							src.frozen = 0
							src.doing = 0
							if(!wait_room)safe=0
							src.VarReset()
							src.TransformMasteryMultiplier()
mob/proc/SaibamanRevert()
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
		overlays-=aura
		aura=0
		overlays-=transeaura
		overlays-='Elec Green Big.dmi'
		overlays-='Elec Black.dmi'
		overlays-='Elec Red Big.dmi'
		Power_Redefine()
		powerlevel=powerlevel_max
		ki=ki_max
		icon='Saibaman - Form 1.dmi'
		view()<<"[src] has reverted from their transformed state."
		icon_state=""
		frozen=0
		return
	else return