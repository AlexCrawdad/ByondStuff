mob
	proc
		MakyoPotaraFuseForm()
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
		MakyoFuseForm()
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
			src.powerlevel *= 40
			src.ki *= 45
			src.strength *= 45
			src.defence *= 40
			src.kidefense*=40
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
mob/proc/MakyoTrans()
	if(src.doing)return
	else
		if(src.finalformfuse)
			if(src.fused)
				src.doing = 1
				src.icon_state = "enrage"
				src.frozen = 1
				if(src.trans1t!="")
					view(8)<<"\white[src]: \font [src.trans6t]"
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
				src.powerlevel *= 52
				src.ki *= 52
				src.kidefense*=35
				src.strength *= 52
				src.defence *= 52
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
				src.Big_Aura()
				src.TransformMasteryMultiplier()
				return
		if(!src.form_1)
			if(src.powerlevel_max>=10000000)
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
					sleep(src.upkeep)
					if(src.powerlevel>src.powerlevel_max)src.powerlevel = src.powerlevel_max
					if(src.ki>src.ki_max)src.ki = src.ki_max
					if(src.kidefense>src.kidefense_max)src.kidefense=src.kidefense_max
					if(src.strength>src.strength_max)src.strength = src.strength_max
					if(src.defence>src.defence_max)src.defence = src.defence_max
					src.Power_Redefine()
					src.powerlevel=src.powerlevel_max
					src.ki=src.ki_max
					src.powerlevel *= 47
					src.ki *= 47
					src.kidefense*=30
					src.strength *= 47
					src.defence *= 47
					src.SkillsReset()
					src.block += 65
					src.dodge += 10
					src.critical += 55
					src.reflect += 25
					src.counter += 15
					Skills_Checker()
					src.overlays -= src.aura
					src.underlays -= src.underlays
					src.overlays += 'Elec Blue Dark.dmi'
					src.speed=1000
					for(var/turf/T in view(src,6))
						var/chance = roll(1,20)
						if(chance == 15)
							missile(new/obj/PurplePU, src, T)
					src.icon = 'Makyo Form 2.dmi'
					src.icon_state = ""
					src.form_1 = 1
					src.frozen = 0
					src.doing = 0
					src.VarReset()
					src.Big_Aura()
					src.FORM1_EXP()
					src.TransformMasteryMultiplier()
					return
mob/proc/MakyoRevert()
	potara_using=0
	if(form_1||form_2||isusingut)
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
		overlays-=transeaura
		overlays-='Elec Blue Dark.dmi'
		icon='Makyo Form 1.dmi'
		Power_Redefine()
		powerlevel=powerlevel_max
		ki=ki_max
		overlays-='Big Aura.dmi'
		overlays-=aura
		view(8)<<"[src] has reverted from their transformed state."
		icon_state=""
		frozen=0
		speed=speed_max-1000
		if(speed<1000)speed=1000
		return
	else return