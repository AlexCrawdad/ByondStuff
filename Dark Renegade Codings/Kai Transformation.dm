mob
	proc
		KaiPotaraFuseForm()
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
			src.icon_state = ""
			src.overlays+='Elec Blue Dark.dmi'
			src.form_1 = 1
			src.form_2 = 1
			src.frozen = 0
			src.doing = 0
			if(!wait_room)safe=0
			src.VarReset()
			src.TransformMasteryMultiplier()
			return
		KaiFuseForm()
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
			src.powerlevel *= 34
			src.ki *= 45
			src.strength *= 42
			src.defence *= 53
			src.kidefense*=45
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
			src.icon_state = ""
			src.overlays+='Elec Blue Dark.dmi'
			src.form_1 = 1
			src.form_2 = 1
			src.frozen = 0
			src.doing = 0
			if(!wait_room)safe=0
			src.VarReset()
			src.TransformMasteryMultiplier()
			return
mob/proc/KaiTrans()
	var/trans_time = src.upkeep/1.5
	if(src.upkeep==5)trans_time = 5
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
				src.powerlevel *= 34
				src.ki *= 45
				src.strength *= 42
				src.defence *= 53
				src.kidefense*=45
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
				src.icon_state = ""
				src.overlays+='Elec Blue Dark.dmi'
				src.form_1 = 1
				src.form_2 = 1
				src.frozen = 0
				src.doing = 0
				if(!wait_room)safe=0
				src.VarReset()
				src.TransformMasteryMultiplier()
				return
		if(!src.form_1)
			if(src.powerlevel_max>=1000000&&src.ki_max>=1000000)
				if(src.doing)return
				else
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
					src.powerlevel *= 18
					src.ki *= 28
					src.kidefense*= 36
					src.strength *= 25
					src.defence *= 28
					src.SkillsReset()
					src.block += 35
					src.dodge += 35
					src.critical += 35
					src.reflect += 35
					src.counter += 35
					Skills_Checker()
					src.overlays -= src.aura
					src.underlays -= src.underlays
					src.speed=1000
					for(var/turf/T in view(src,6))
						var/chance = roll(1,20)
						if(chance == 15)
							missile(new/obj/PurplePU, src, T)
					src.icon_state = ""
					src.form_1 = 1
					src.frozen = 0
					src.doing = 0
					src.VarReset()
					src.FORM1_EXP()
					src.TransformMasteryMultiplier()
					return
		else
			if(!src.form_2)
				if(src.powerlevel_max>=10000000&&src.ki_max>=10000000)
					if(src.doing)return
					else
						src.doing = 1
						src.icon_state = "enrage"
						if(src.trans1t!="")view(8)<<"\white[src]: \font [src.trans2t]"
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
						src.powerlevel *= 35
						src.ki *= 44
						src.kidefense*= 57
						src.strength *= 37
						src.defence *= 44
						src.SkillsReset()
						src.block += 45
						src.dodge += 55
						src.critical += 45
						src.reflect += 55
						src.counter += 50
						Skills_Checker()
						src.overlays -= src.aura
						src.underlays -= src.underlays
						src.speed=1000
						for(var/turf/T in view(src,6))
							var/chance = roll(1,20)
							if(chance == 15)
								missile(new/obj/PurplePU, src, T)
						src.overlays+='Elec Blue Dark.dmi'
						src.icon_state = ""
						src.form_2 = 1
						src.frozen = 0
						src.doing = 0
						src.VarReset()
						src.TransformMasteryMultiplier()
						return
mob/proc/KaiRevert()
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
		src.overlays-=src.transeaura
		src.overlays -= 'Elec Blue Dark.dmi'
		src.Power_Redefine()
		src.powerlevel=src.powerlevel_max
		src.ki=src.ki_max
		view() << "[src] has reverted from their transformed state."
		src.icon_state = ""
		src.frozen = 0
		src.speed=src.speed_max-1000
		if(src.speed<1000)src.speed=1000
		return
	return