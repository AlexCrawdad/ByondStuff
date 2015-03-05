mob
	proc
		HumanPotaraFuseForm()
			if(potara_using)return
			potara_using=1
			doing=1
			icon_state="enrage"
			frozen=1
			if(trans1t!="")view(8)<<"\white[src]: \font [trans6t]"
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
			if(crater_on)new/obj/techs/Overlays/Crater_Center(loc)
			if(powerlevel>powerlevel_max)powerlevel=powerlevel_max
			if(ki>ki_max)ki=ki_max
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
			overlays-=hair_icon
			Big_Aura()
			for(var/turf/T in view(src,6))
				var/chance = roll(1,20)
				if(chance == 15)
					missile(new/obj/OrangePU, src, T)
			icon_state=""
			overlays+='Elec Human Red.dmi'
			SHHair_Apply()
			form_1=1
			form_2=1
			form_3=1
			form_4=1
			frozen=0
			doing=0
			VarReset()
			TransformMasteryMultiplier()
			if(!wait_room)safe=0
			return
		HumanFuseForm()
			doing=1
			icon_state="enrage"
			frozen=1
			if(trans1t!="")view(8)<<"\white[src]: \font [trans6t]"
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
			if(crater_on)new/obj/techs/Overlays/Crater_Center(loc)
			if(powerlevel>powerlevel_max)powerlevel=powerlevel_max
			if(ki>ki_max)ki=ki_max
			if(kidefense>kidefense_max)kidefense=kidefense_max
			if(strength>strength_max)strength=strength_max
			if(defence>defence_max)defence=defence_max
			powerlevel*=48
			ki*=47
			strength*=54
			defence*=54
			kidefense*=47
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
			overlays-=hair_icon
			Big_Aura()
			for(var/turf/T in view(src,6))
				var/chance = roll(1,20)
				if(chance == 15)
					missile(new/obj/OrangePU, src, T)
			icon_state=""
			overlays+='Elec Human Red.dmi'
			SHHair_Apply()
			form_1=1
			form_2=1
			form_3=1
			form_4=1
			frozen=0
			doing=0
			VarReset()
			TransformMasteryMultiplier()
			if(!wait_room)safe=0
			return
mob
	proc
		HumanCyborgTrans()
			if(form_5)return
			if(powerlevel_max>=1000000000)
				doing=1
				icon_state="enrage"
				if(trans5t!="")view(8)<<"\white[src]: \font [trans6t]"
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
				if(crater_on)new/obj/techs/Overlays/Crater_Center(loc)
				if(powerlevel>powerlevel_max)powerlevel=powerlevel_max
				if(ki>ki_max)ki=ki_max
				if(kidefense>kidefense_max)kidefense=kidefense_max
				if(strength>strength_max)strength=strength_max
				if(defence>defence_max)defence=defence_max
				Power_Redefine()
				powerlevel*=40
				ki*=40
				kidefense*=40
				strength*=40
				defence*=40
				block+=5
				dodge+=5
				critical+=7
				reflect+=5
				counter+=5
				Skills_Checker()
				underlays-=underlays
				overlays-=aura
				overlays-=hair_icon
				Big_Aura()
				for(var/turf/T in view(src,6))
					var/chance = roll(1,20)
					if(chance == 15)
						missile(new/obj/OrangePU, src, T)
				icon='Cyborg.dmi'
				icon_state=""
				form_5=1
				frozen=0
				doing=0
				if(!wait_room)safe=0
				VarReset()
				TransformMasteryMultiplier()
				return
mob/proc/HumanTrans()
	var/trans_time=upkeep/1.5
	if(upkeep==5)trans_time=5
	if(doing)return
	else
		if(finalformfuse)
			if(fused&&!form_1)
				doing=1
				icon_state="enrage"
				frozen=1
				if(trans1t!="")view(8)<<"\white[src]: \font [trans6t]"
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
				if(crater_on)new/obj/techs/Overlays/Crater_Center(loc)
				if(powerlevel>powerlevel_max)powerlevel=powerlevel_max
				if(ki>ki_max)ki=ki_max
				if(kidefense>kidefense_max)kidefense=kidefense_max
				if(strength>strength_max)strength=strength_max
				if(defence>defence_max)defence=defence_max
				powerlevel*=48
				ki*=47
				strength*=54
				defence*=54
				kidefense*=47
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
				overlays-=hair_icon
				Big_Aura()
				for(var/turf/T in view(src,6))
					var/chance = roll(1,20)
					if(chance == 15)
						missile(new/obj/OrangePU, src, T)
				icon_state=""
				overlays+='Elec Human Red.dmi'
				SHHair_Apply()
				form_1=1
				form_2=1
				form_3=1
				form_4=1
				frozen=0
				doing=0
				if(!wait_room)safe=0
				VarReset()
				TransformMasteryMultiplier()
				return
		if(!src.form_1)
			if(src.powerlevel_max >= 1000000)
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
					src.powerlevel *= 12
					src.ki *= 8
					src.kidefense*=8
					src.strength *= 11
					src.defence *= 11
					src.SkillsReset()
					src.HHair_Apply()
					src.block += 15
					src.dodge += 15
					src.critical += 15
					src.reflect += 15
					src.counter += 15
					Skills_Checker()
					src.overlays -= src.aura
					src.underlays -= src.underlays
					src.speed=src.speed_max-1000
					if(src.speed<1000)src.speed=1000
					src.overlays -= src.hair_icon
					src.Hair_Apply()
					for(var/turf/T in view(src,6))
						var/chance = roll(1,20)
						if(chance == 15)
							missile(new/obj/OrangePU, src, T)
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
				if(src.powerlevel_max >= 10000000)
					if(src.doing)return
					else
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
						src.powerlevel *= 17
						src.ki *= 13
						src.kidefense*=13
						src.strength *= 17
						src.defence *= 17
						src.SkillsReset()
						src.block += 25
						src.dodge += 25
						src.critical += 25
						src.reflect += 25
						src.counter += 25
						Skills_Checker()
						src.USSJ_Apply()
						src.speed=src.speed_max-2000
						if(src.speed<1000)src.speed=1000
						src.overlays -= src.hair_icon
						src.Hair_Apply()
						src.icon_state = ""
						src.overlays -= src.aura
						src.underlays -= src.underlays
						src.Big_Aura()
						for(var/turf/T in view(src,6))
							var/chance = roll(1,20)
							if(chance == 15)
								missile(new/obj/OrangePU, src, T)
						src.overlays += "Elec Human Blue.dmi"
						src.form_2 = 1
						src.frozen = 0
						src.doing = 0
						src.VarReset()
						src.TransformMasteryMultiplier()
						return
			else
				if(!src.form_3)
					if(src.powerlevel_max >= 100000000 && src.level >= 5000)
						if(src.doing)return
						else
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
							src.powerlevel *= 26
							src.ki *= 24
							src.kidefense*=24
							src.strength *= 30
							src.defence *= 30
							src.SkillsReset()
							src.block += 35
							src.dodge +=35
							src.critical += 35
							src.reflect += 35
							src.counter += 35
							Skills_Checker()
							src.speed=src.speed_max-3000
							if(src.speed<1000)src.speed=1000
							src.overlays -= src.aura
							src.underlays -= src.underlays
							src.overlays -= src.hair_icon
							src.Big_Aura()
							src.Skin_Apply()
							src.Hair_Apply()
							for(var/turf/T in view(src,6))
								var/chance = roll(1,20)
								if(chance == 15)
									missile(new/obj/OrangePU, src, T)
							src.icon_state = ""
							src.form_3 = 1
							src.frozen = 0
							src.doing = 0
							src.VarReset()
							src.TransformMasteryMultiplier()
							return
				else
					if(!src.form_4)
						if(src.powerlevel_max >= 250000000)
							if(src.doing)return
							else
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
								if(src.crater_on)new/obj/techs/Overlays/Crater_Center(src.loc)
								if(src.powerlevel>src.powerlevel_max)src.powerlevel = src.powerlevel_max
								if(src.ki>src.ki_max)src.ki = src.ki_max
								if(src.kidefense>src.kidefense_max)src.kidefense=src.kidefense_max
								if(src.strength>src.strength_max)src.strength = src.strength_max
								if(src.defence>src.defence_max)src.defence = src.defence_max
								src.Power_Redefine()
								src.powerlevel=src.powerlevel_max
								src.ki=src.ki_max
								src.powerlevel *= 41
								src.ki *= 47
								src.kidefense*=38
								src.strength *= 47
								src.defence *= 41
								src.SkillsReset()
								src.block += 50
								src.dodge += 55
								src.critical += 55
								src.reflect += 35
								src.counter += 40
								Skills_Checker()
								src.overlays -= src.aura
								src.underlays -= src.underlays
								src.overlays -= src.hair_icon
								src.Big_Aura()
								src.SHHair_Apply()
								src.speed=src.speed_max-4000
								if(src.speed<1000)src.speed=1000
								for(var/turf/T in view(src,6))
									var/chance = roll(1,20)
									if(chance == 15)
										missile(new/obj/OrangePU, src, T)
								src.icon_state = ""
								src.overlays += 'Elec Human Red.dmi'
								src.form_4 = 1
								src.frozen = 0
								src.doing = 0
								src.VarReset()
								src.TransformMasteryMultiplier()
								return