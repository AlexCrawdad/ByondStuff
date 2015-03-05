mob
	proc
		BojackFuseForm()
			doing=1
			icon_state="enrage"
			frozen=1
			if(trans6t!="")view(8)<<"\white[src]: \font [trans6t]"
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
			if(powerlevel>powerlevel_max)powerlevel=powerlevel_max
			if(ki>ki_max)ki=ki_max
			if(kidefense>kidefense_max)kidefense=kidefense_max
			if(strength>strength_max)strength=strength_max
			if(defence>defence_max)defence=defence_max
			powerlevel*=40
			ki*=40
			strength*=40
			defence*=40
			kidefense*=40
			block+=20
			dodge+=20
			critical+=20
			reflect+=20
			counter+=20
			Skills_Checker()
			speed=speed_max-4000
			if(speed<1000)speed=1000
			underlays-=underlays
			overlays-=aura
			Big_Aura()
			for(var/turf/T in view(src,6))
				var/chance = roll(1,20)
				if(chance == 15)
					missile(new/obj/YellowPU, src, T)
			icon_state=""
			overlays+='Elec Blue Dark.dmi'
			form_1=1
			form_2=1
			frozen=0
			doing=0
			if(!wait_room)safe=0
			VarReset()
			src.TransformMasteryMultiplier()
			return
		BojackPotaraFuseForm()
			if(potara_using)return
			potara_using=1
			doing=1
			icon_state="enrage"
			frozen=1
			if(trans6t!="")view(8)<<"\white[src]: \font [trans6t]"
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
			if(powerlevel>powerlevel_max)powerlevel=powerlevel_max
			if(ki>src.ki_max)ki=ki_max
			if(kidefense>kidefense_max)kidefense=kidefense_max
			if(strength>strength_max)strength=strength_max
			if(defence>defence_max)defence=defence_max
			powerlevel*=55
			ki*=55
			strength*=55
			defence*=55
			kidefense*=55
			block+=20
			dodge+=20
			critical+=20
			reflect+=20
			counter+=20
			Skills_Checker()
			speed=speed_max-4000
			if(speed<1000)speed=1000
			underlays-=underlays
			overlays-=aura
			Big_Aura()
			for(var/turf/T in view(src,6))
				var/chance = roll(1,20)
				if(chance == 15)
					missile(new/obj/YellowPU, src, T)
			icon_state=""
			overlays+='Elec Blue Dark.dmi'
			form_1=1
			form_2=1
			frozen=0
			doing=0
			if(!wait_room)safe=0
			VarReset()
			src.TransformMasteryMultiplier()
			return
mob/proc/BojackTrans()
	if(doing)return
	else
		if(finalformfuse)
			if(fused)
				doing=1
				icon_state="enrage"
				frozen=1
				if(trans6t!="")view(8)<<"\white[src]: \font [trans6t]"
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
				sleep(upkeep)
				if(powerlevel>powerlevel_max)powerlevel=powerlevel_max
				if(ki>ki_max)ki=ki_max
				if(kidefense>kidefense_max)kidefense=kidefense_max
				if(strength>strength_max)strength=strength_max
				if(defence>defence_max)defence=defence_max
				powerlevel*=51
				ki*=52
				kidefense*=30
				strength*=51
				defence*=52
				block+=20
				dodge+=20
				critical+=20
				reflect+=20
				counter+=20
				Skills_Checker()
				speed=speed_max-4000
				if(speed<1000)speed=1000
				underlays-=underlays
				overlays-=aura
				for(var/turf/T in view(src,6))
					var/chance = roll(1,20)
					if(chance == 15)
						missile(new/obj/YellowPU, src, T)
				icon_state=""
				overlays+='Elec Blue Dark.dmi'
				form_1=1
				form_2=1
				frozen=0
				doing=0
				if(!wait_room)safe=0
				VarReset()
				Big_Aura()
				src.TransformMasteryMultiplier()
				return
		if(!form_1)
			if(powerlevel_max>=100000000)
				if(doing)return
				else
					doing=1
					icon_state="enrage"
					if(trans1t!="")view(8)<<"\white[src]: \font [trans1t]"
					frozen=1
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
					sleep(upkeep)
					if(powerlevel>powerlevel_max)powerlevel=powerlevel_max
					if(ki>ki_max)ki=ki_max
					if(kidefense>kidefense_max)kidefense=kidefense_max
					if(strength>strength_max)strength=strength_max
					if(defence>defence_max)defence=defence_max
					Power_Redefine()
					powerlevel=powerlevel_max
					ki=ki_max
					powerlevel*=46
					ki*=47
					kidefense*=25
					strength*=46
					defence*=47
					SkillsReset()
					block+=55
					dodge+=10
					critical+=65
					reflect+=25
					counter+=15
					Skills_Checker()
					overlays-=aura
					underlays-=underlays
					overlays+='Elec Blue Dark.dmi'
					for(var/turf/T in view(src,6))
						var/chance = roll(1,20)
						if(chance == 15)
							missile(new/obj/YellowPU, src, T)
					icon='Bojack Form 1.dmi'
					speed=1000
					icon_state=""
					form_1=1
					frozen=0
					doing=0
					VarReset()
					Big_Aura()
					FORM1_EXP()
					src.TransformMasteryMultiplier()
					return
mob/proc/BojackRevert()
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
		overlays-='Elec Blue Dark.dmi'
		icon='Bojack.dmi'
		Power_Redefine()
		powerlevel=powerlevel_max
		ki=ki_max
		overlays-='Big Aura.dmi'
		overlays-=aura
		overlays-=transeaura
		view(8)<<"[src] has reverted from their transformed state."
		icon_state=""
		frozen=0
		speed=speed_max-1000
		if(speed<1000)speed=1000
		return
	return