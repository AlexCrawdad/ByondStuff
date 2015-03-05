mob/var/form_1=0
mob/var/form_2=0
mob/var/form_3=0
mob/var/form_4=0
mob/var/form_5=0
mob/var/ascended_ssj=0
mob/var/gone_ssj2=0
mob/var/SSJ=0
mob/proc/SaiyanFuseForm()
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
	src.underlays -= aura
	src.underlays += aura
	spawn(5) src.underlays -= aura
	src.Fade(yellows)
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
	powerlevel*=34
	ki*=45
	strength*=42
	defence*=53
	kidefense*=45
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
	src.Big_Aura()
	icon='Male - SSJ4(fused).dmi'
	overlays+='Hair - SSJ4(fused).dmi'
	overlays+='ssj4tail.dmi'
	for(var/turf/T in view(src,6))
		var/chance = roll(1,20)
		if(chance == 15)
			missile(new/obj/RedPU, src, T)
	icon_state=""
	overlays+='Elec Blue Dark.dmi'
	form_1=1
	form_2=1
	form_3=1
	form_4=1
	form_5=1
	frozen=0
	doing=0
	if(!wait_room)safe=0
	TransformMasteryMultiplier()
	VarReset()
	return
mob/proc/SaiyanPotaraFuseForm()
	if(potara_using)return
	potara_using=1
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
	src.underlays -= aura
	src.underlays += aura
	spawn(5) src.underlays -= aura
	src.Fade(yellows)
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
	src.Big_Aura()
	for(var/turf/T in view(src,6))
		var/chance = roll(1,20)
		if(chance == 15)
			missile(new/obj/RedPU, src, T)
	icon='Male - SSJ4(fused).dmi'
	overlays+='Hair - SSJ4(fused).dmi'
	overlays+='ssj4tail.dmi'
	icon_state=""
	overlays+='Elec Blue Dark.dmi'
	form_1=1
	form_2=1
	form_3=1
	form_4=1
	form_5=1
	frozen=0
	doing=0
	if(!wait_room)safe=0
	TransformMasteryMultiplier()
	VarReset()
	return
//--------------------------Honour Gene
mob/proc/HSaiyanTrans()
	if(Oozaru||doing)return
	else
		if(finalformfuse)
			if(fused&&!form_1)
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
				src.underlays -= aura
				src.underlays += aura
				spawn(5) src.underlays -= aura
				src.Fade(yellows)
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
				powerlevel*=34
				ki*=45
				strength*=42
				defence*=53
				kidefense*=45
				SkillsReset()
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
				src.Big_Aura()
				for(var/turf/T in view(src,6))
					var/chance = roll(1,20)
					if(chance == 15)
						missile(new/obj/RedPU, src, T)
				icon='Male - SSJ4(fused).dmi'
				overlays+='Hair - SSJ4(fused).dmi'
				overlays+='ssj4tail.dmi'
				icon_state=""
				overlays+='Elec Blue Dark.dmi'
				form_1=1
				form_2=1
				form_3=1
				form_4=1
				form_5=1
				frozen=0
				doing=0
				if(!wait_room)safe=0
				TransformMasteryMultiplier()
				VarReset()
				return
		if(!src.form_1)
			if(src.powerlevel_max >= 1000000)
				if(!src.ascended_ssj)
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
					src.powerlevel *= 13
					src.ki *= 8
					src.kidefense*=8
					src.strength *= 10
					src.defence *= 9
					src.SkillsReset()
					src.block += 15
					src.dodge += 15
					src.critical += 15
					src.reflect += 15
					src.counter += 15
					Skills_Checker()
					src.speed=src.speed_max-1000
					if(src.speed<1000)src.speed=1000
					src.overlays -= src.aura
					src.underlays -= src.underlays
					src.Big_Aura()
					for(var/turf/T in view(src,6))
						var/chance = roll(1,20)
						if(chance == 15)
							missile(new/obj/YellowPU, src, T)
					src.icon_state = ""
					src.form_1 = 1
					src.frozen = 0
					src.doing = 0
					src.VarReset()
					src.TransformMasteryMultiplier()
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
					sleep(src.upkeep)
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
					src.powerlevel *= 18
					src.ki *= 13
					src.kidefense*=13
					src.strength *= 17
					src.defence *= 14
					src.SkillsReset()
					src.block += 20
					src.dodge += 20
					src.critical += 20
					src.reflect += 20
					src.counter += 20
					Skills_Checker()
					src.speed=src.speed_max+1000
					if(src.speed<1000)src.speed=1000
					src.Big_Aura()
					for(var/turf/T in view(src,6))
						var/chance = roll(1,20)
						if(chance == 15)
							missile(new/obj/YellowPU, src, T)
					src.icon_state = ""
					src.SSJHair_Apply()
					src.SSJ_EXP()
					src.form_2 = 1
					src.frozen = 0
					src.doing = 0
					src.VarReset()
					src.TransformMasteryMultiplier()
					return
			else
				if(!src.form_3)
					if(src.powerlevel_max >= 25000000)
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
						sleep(src.upkeep)
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
						src.overlays += 'Elec Blue Small.dmi'
						src.powerlevel *= 24
						src.ki *= 18
						src.kidefense*=18
						src.strength *= 22
						src.defence *= 19
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
								missile(new/obj/YellowPU, src, T)
						src.icon_state = ""
						src.USSJ_Apply()
						src.USSJHair_Apply()
						src.form_3 = 1
						src.frozen = 0
						src.doing = 0
						src.VarReset()
						src.TransformMasteryMultiplier()
						return
				else
					if(!src.form_4)
						if(src.powerlevel_max >= 50000000)
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
							src.SSJHair_Apply()
							src.SSJ_EXP()
							src.overlays -= src.aura
							src.underlays -= src.underlays
							src.overlays -= 'Elec Blue Small.dmi'
							src.overlays += 'Elec Blue Big.dmi'
							src.Big_Aura()
							src.Skin_Apply()
							src.powerlevel *= 29
							src.ki *= 26
							src.kidefense*=26
							src.strength *= 30
							src.defence *= 28
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
									missile(new/obj/YellowPU, src, T)
							src.icon_state = ""
							src.form_4 = 1
							src.frozen = 0
							src.doing = 0
							if(!wait_room)safe=0
							src.VarReset()
							src.TransformMasteryMultiplier()
							return
					else
						if(!src.form_5)
							if(src.powerlevel_max >= 100000000)
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
								sleep(10)
								if(src.crater_on)
									new/obj/techs/Overlays/Crater_Center(src.loc)
								sleep(20)
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
								src.overlays -= 'Hair - Goku SSJ.dmi'
								src.overlays -= 'Hair - Adult Gohan SSJ.dmi'
								src.overlays -= 'Hair - Teen Gohan SSJ.dmi'
								src.overlays -= 'Hair - Future Gohan SSJ.dmi'
								src.overlays -= 'Hair - Vegeta SSJ.dmi'
								src.overlays -= 'Hair - Trunks Long SSJ.dmi'
								src.overlays -= 'Hair - Raditz SSJ.dmi'
								src.overlays -= 'Hair - Goku USSJ.dmi'
								src.overlays -= 'Hair - Adult Gohan USSJ.dmi'
								src.overlays -= 'Hair - Teen Gohan USSJ.dmi'
								src.overlays -= 'Hair - Future Gohan USSJ.dmi'
								src.overlays -= 'Hair - Vegeta USSJ.dmi'
								src.overlays -= 'Hair - Trunks Long USSJ.dmi'
								src.overlays -= 'Hair - Raditz USSJ.dmi'
								if(src.hair != "Bald")src.overlays += 'Hair - SSJ3.dmi'
								src.overlays -= src.aura
								src.underlays -= src.underlays
								src.overlays -= 'Elec Blue Small.dmi'
								src.overlays += 'Elec Blue Big.dmi'
								src.Big_Aura()
								src.Skin_Apply()
								src.powerlevel *= 32
								src.ki *= 31
								src.kidefense*=31
								src.strength *= 36
								src.defence *= 34
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
										missile(new/obj/YellowPU, src, T)
								src.icon_state = ""
								src.form_5 = 1
								src.frozen = 0
								src.doing = 0
								if(!wait_room)safe=0
								src.VarReset()
								src.TransformMasteryMultiplier()
								return
						else
							if(!src.form_6)
								if(src.powerlevel_max >= 1000000000)
									if(!src.has_tail)
										src<<"Your tail was cut off and you can't transform!"
										return
									else
										src.doing = 1
										src.icon_state = "enrage"
										if(src.trans6t!="")view(8)<<"\white[src]: \font [src.trans6t]"
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
										if(src.crater_on)new/obj/techs/Overlays/Crater_Center(src.loc)
										if(src.powerlevel>src.powerlevel_max)src.powerlevel = src.powerlevel_max
										if(src.ki>src.ki_max)src.ki = src.ki_max
										if(src.kidefense>src.kidefense_max)src.kidefense=src.kidefense_max
										if(src.strength>src.strength_max)src.strength = src.strength_max
										if(src.defence>src.defence_max)src.defence = src.defence_max
										src.Power_Redefine()
										src.powerlevel=src.powerlevel_max
										src.ki=src.ki_max
										src.overlays -= 'Hair - Goku SSJ.dmi'
										src.overlays -= 'Hair - Adult Gohan SSJ.dmi'
										src.overlays -= 'Hair - Teen Gohan SSJ.dmi'
										src.overlays -= 'Hair - Future Gohan SSJ.dmi'
										src.overlays -= 'Hair - Vegeta SSJ.dmi'
										src.overlays -= 'Hair - Trunks Long SSJ.dmi'
										src.overlays -= 'Hair - Raditz SSJ.dmi'
										src.overlays -= 'Hair - Goku USSJ.dmi'
										src.overlays -= 'Hair - Adult Gohan USSJ.dmi'
										src.overlays -= 'Hair - Teen Gohan USSJ.dmi'
										src.overlays -= 'Hair - Future Gohan USSJ.dmi'
										src.overlays -= 'Hair - Vegeta USSJ.dmi'
										src.overlays -= 'Hair - Trunks Long USSJ.dmi'
										src.overlays -= 'Hair - Raditz USSJ.dmi'
										src.overlays -= 'Hair - SSJ3.dmi'
										src.overlays += 'Hair - SSJ4.dmi'
										src.overlays -= src.aura
										src.underlays -= src.underlays
										src.Big_Aura()
										for(var/turf/T in view(src,6))
											var/chance = roll(1,20)
											if(chance == 15)
												missile(new/obj/YellowPU, src, T)
										src.overlays -= 'Elec Blue Small.dmi'
										src.overlays += 'Elec Red Big.dmi'
										src.powerlevel *= 42
										src.ki *= 41
										src.kidefense*=41
										src.strength *= 46
										src.defence *= 44
										src.SkillsReset()
										src.block += 55
										src.dodge += 55
										src.critical += 55
										src.reflect += 55
										src.counter += 55
										Skills_Checker()
										src.speed=src.speed_max-4000
										if(src.speed<1000)src.speed=1000
										if(src.skin=="dark")src.icon = 'Male - SSJ 4 Dark.dmi'
										else src.icon = 'Male - SSJ 4.dmi'
										src.icon_state = ""
										src.form_6 = 1
										src.frozen = 0
										src.doing = 0
										src.VarReset()
										src.TransformMasteryMultiplier()
										return
//---------------------------Pride Gene
mob/proc/PSaiyanTrans()
	if(src.Oozaru||src.doing)return
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
						missile(new/obj/RedPU, src, T)
				src.icon = 'Male - SSJ4(fused).dmi'
				src.overlays += 'Hair - SSJ4(fused).dmi'
				src.overlays += 'ssj4tail.dmi'
				src.icon_state = ""
				src.overlays+='Elec Blue Dark.dmi'
				src.form_1 = 1
				src.form_2 = 1
				src.form_3 = 1
				src.form_4 = 1
				src.form_5 = 1
				src.frozen = 0
				src.doing = 0
				src.VarReset()
				src.TransformMasteryMultiplier()
				if(!wait_room)safe=0
				return
		if(!src.form_1)
			if(src.powerlevel_max >= 1000000)
				if(!src.ascended_ssj)
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
					src.powerlevel *= 13
					src.ki *= 8
					src.kidefense*=8
					src.strength *= 10
					src.defence *= 9
					src.SkillsReset()
					src.block += 15
					src.dodge += 15
					src.critical += 15
					src.reflect += 15
					src.counter += 15
					Skills_Checker()
					src.speed=src.speed_max-1000
					if(src.speed<1000)src.speed=1000
					src.overlays -= src.aura
					src.underlays -= src.underlays
					src.Big_Aura()
					for(var/turf/T in view(src,6))
						var/chance = roll(1,20)
						if(chance == 15)
							missile(new/obj/OrangePU, src, T)
					src.SSJHair_Apply()
					src.SSJ_EXP()
					src.icon_state = ""
					src.form_1 = 1
					src.frozen = 0
					src.doing = 0
					src.VarReset()
					src.TransformMasteryMultiplier()
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
					sleep(src.upkeep)
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
							missile(new/obj/OrangePU, src, T)
					src.overlays += 'Elec Blue Small.dmi'
					src.powerlevel *= 24
					src.ki *= 23
					src.kidefense*=23
					src.strength *= 28
					src.defence *= 26
					src.SkillsReset()
					src.block += 20
					src.dodge += 20
					src.critical += 20
					src.reflect += 20
					src.counter += 20
					Skills_Checker()
					src.speed=src.speed_max+1000
					if(src.speed<1000)src.speed=1000
					src.icon_state = ""
					src.USSJ_Apply()
					src.USSJHair_Apply()
					src.form_2 = 1
					src.frozen = 0
					src.VarReset()
					src.TransformMasteryMultiplier()
					src.doing = 0
					return
			else
				if(!src.form_3)
					if(src.powerlevel_max >= 25000000)
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
						sleep(src.upkeep)
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
								missile(new/obj/OrangePU, src, T)
						src.overlays -= 'Elec Blue Small.dmi'
						src.overlays += 'Elec Blue Big.dmi'
						src.powerlevel *= 30
						src.ki *= 29
						src.kidefense*=29
						src.strength *= 34
						src.defence *= 32
						src.SkillsReset()
						src.block += 25
						src.dodge += 25
						src.critical += 25
						src.reflect += 25
						src.counter += 25
						Skills_Checker()
						src.speed=src.speed_max-2000
						if(src.speed<1000)src.speed=1000
						src.icon_state = ""
						src.Skin_Apply()
						src.form_3 = 1
						src.frozen = 0
						src.VarReset()
						src.TransformMasteryMultiplier()
						src.doing = 0
						return
				else
					if(!src.form_4)
						if(src.powerlevel_max >= 50000000)
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
							src.overlays -= 'Hair - Goku SSJ.dmi'
							src.overlays -= 'Hair - Adult Gohan SSJ.dmi'
							src.overlays -= 'Hair - Teen Gohan SSJ.dmi'
							src.overlays -= 'Hair - Future Gohan SSJ.dmi'
							src.overlays -= 'Hair - Vegeta SSJ.dmi'
							src.overlays -= 'Hair - Trunks Long SSJ.dmi'
							src.overlays -= 'Hair - Raditz SSJ.dmi'
							src.overlays -= 'Hair - Goku USSJ.dmi'
							src.overlays -= 'Hair - Adult Gohan USSJ.dmi'
							src.overlays -= 'Hair - Teen Gohan USSJ.dmi'
							src.overlays -= 'Hair - Future Gohan USSJ.dmi'
							src.overlays -= 'Hair - Vegeta USSJ.dmi'
							src.overlays -= 'Hair - Trunks Long USSJ.dmi'
							src.overlays -= 'Hair - Raditz USSJ.dmi'
							if(src.hair != "Bald")src.SSJHair_Apply()
							src.overlays -= src.aura
							src.underlays -= src.underlays
							src.Big_Aura()
							for(var/turf/T in view(src,6))
								var/chance = roll(1,20)
								if(chance == 15)
									missile(new/obj/OrangePU, src, T)
							src.powerlevel *= 36
							src.ki *= 35
							src.kidefense*=35
							src.strength *= 40
							src.defence *= 38
							src.SkillsReset()
							src.block += 30
							src.dodge += 30
							src.critical += 30
							src.reflect += 30
							src.counter += 30
							Skills_Checker()
							src.speed=src.speed_max-3000
							if(src.speed<1000)src.speed=1000
							src.icon_state = ""
							src.form_4 = 1
							src.frozen = 0
							src.doing = 0
							if(!wait_room)safe=0
							src.VarReset()
							src.TransformMasteryMultiplier()
							return
					else
						if(!src.form_5)
							if(src.powerlevel_max >= 750000000)
								if(!src.has_tail)
									src<<"Your tail was cut off and you can't transform!"
									return
								else
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
									sleep(10)
									if(src.crater_on)
										new/obj/techs/Overlays/Crater_Center(src.loc)
									sleep(20)
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
									src.overlays -= 'Hair - Goku SSJ.dmi'
									src.overlays -= 'Hair - Adult Gohan SSJ.dmi'
									src.overlays -= 'Hair - Teen Gohan SSJ.dmi'
									src.overlays -= 'Hair - Future Gohan SSJ.dmi'
									src.overlays -= 'Hair - Vegeta SSJ.dmi'
									src.overlays -= 'Hair - Trunks Long SSJ.dmi'
									src.overlays -= 'Hair - Raditz SSJ.dmi'
									src.overlays -= 'Hair - Goku USSJ.dmi'
									src.overlays -= 'Hair - Adult Gohan USSJ.dmi'
									src.overlays -= 'Hair - Teen Gohan USSJ.dmi'
									src.overlays -= 'Hair - Future Gohan USSJ.dmi'
									src.overlays -= 'Hair - Vegeta USSJ.dmi'
									src.overlays -= 'Hair - Trunks Long USSJ.dmi'
									src.overlays -= 'Hair - Raditz USSJ.dmi'
									src.overlays -= 'Hair - SSJ3.dmi'
									src.overlays += 'Hair - SSJ4.dmi'
									src.overlays -= src.aura
									src.underlays -= src.underlays
									src.Big_Aura()
									for(var/turf/T in view(src,6))
										var/chance = roll(1,20)
										if(chance == 15)
											missile(new/obj/OrangePU, src, T)
									src.overlays -= 'Elec Blue Small.dmi'
									src.overlays += 'Elec Red Big.dmi'
									src.powerlevel *= 42
									src.ki *= 41
									src.kidefense*=41
									src.strength *= 46
									src.defence *= 44
									src.SkillsReset()
									src.block += 55
									src.dodge += 55
									src.critical += 55
									src.reflect += 55
									src.counter += 55
									Skills_Checker()
									src.speed=src.speed_max-4000
									if(src.speed<1000)src.speed=1000
									if(src.skin=="dark")src.icon = 'Male - SSJ 4 Dark.dmi'
									else src.icon = 'Male - SSJ 4.dmi'
									src.icon_state = ""
									src.form_5 = 1
									src.frozen = 0
									src.doing = 0
									src.VarReset()
									src.TransformMasteryMultiplier()
									return
//-----------------------Legendary Chromosome
mob/proc/LSaiyanTrans()
	if(src.Oozaru||src.doing)return
	else
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
				src.powerlevel *= 17
				src.ki *= 12
				src.kidefense*=12
				src.strength *= 16
				src.defence *= 13
				src.SkillsReset()
				src.block += 15
				src.dodge += 15
				src.critical += 15
				src.reflect += 15
				src.counter += 15
				Skills_Checker()
				src.speed=src.speed_max-1000
				if(src.speed<1000)src.speed=1000
				src.overlays -= src.aura
				src.underlays -= src.underlays
				src.Big_Aura()
				for(var/turf/T in view(src,6))
					var/chance = roll(1,20)
					if(chance == 15)
						missile(new/obj/GreenPU, src, T)
				src.icon_state = ""
				src.form_1 = 1
				src.frozen = 0
				src.doing = 0
				src.SSJHair_Apply()
				src.VarReset()
				src.TransformMasteryMultiplier()
				return
		else
			if(!src.form_2)
				if(src.powerlevel_max >= 100000000)
					if(!src.has_tail)
						src<<"Your tail was cut off and you can't transform!"
						return
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
					sleep(src.upkeep)
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
							missile(new/obj/GreenPU, src, T)
					src.overlays += 'Elec Blue Small.dmi'
					src.powerlevel *= 23
					src.ki *= 18
					src.kidefense*=18
					src.strength *= 22
					src.defence *= 19
					src.SkillsReset()
					src.block += 25
					src.dodge += 25
					src.critical += 25
					src.reflect += 25
					src.counter += 25
					Skills_Checker()
					src.speed=src.speed_max-2000
					if(src.speed<1000)src.speed=1000
					src.icon_state = ""
					src.form_2 = 1
					src.frozen = 0
					src.doing = 0
					src.Hair_Apply()
					src.LSSJHair_Apply()
					src.VarReset()
					src.TransformMasteryMultiplier()
					return
			else
				if(!src.form_3)
					if(src.powerlevel_max >= 100000000)
						if(!src.has_tail)
							src<<"Your tail was cut off and you can't transform!"
							return
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
						sleep(src.upkeep)
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
								missile(new/obj/GreenPU, src, T)
						src.overlays -= 'Elec Blue Small.dmi'
						src.overlays += 'Elec Blue Big.dmi'
						src.powerlevel *= 29
						src.ki *= 24
						src.kidefense*=24
						src.strength *= 28
						src.defence *= 25
						src.SkillsReset()
						src.block += 30
						src.dodge += 30
						src.critical += 30
						src.reflect += 30
						src.counter += 30
						Skills_Checker()
						src.speed=src.speed_max-3000
						if(src.speed<1000)src.speed=1000
						src.icon_state = ""
						src.form_3 = 1
						src.frozen = 0
						src.doing = 0
						src.Hair_Apply()
						src.LSSJHair_Apply()
						src.VarReset()
						src.TransformMasteryMultiplier()
						return
				else
					if(!src.form_4)
						if(src.powerlevel_max >= 250000000)
							if(!src.has_tail)
								src<<"Your tail was cut off and you can't transform!"
								return
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
									missile(new/obj/GreenPU, src, T)
							src.powerlevel *= 35
							src.ki *= 30
							src.kidefense*=30
							src.strength *= 34
							src.defence *= 32
							src.SkillsReset()
							src.block += 35
							src.dodge += 35
							src.critical += 35
							src.reflect += 35
							src.counter += 35
							Skills_Checker()
							src.speed=src.speed_max-4000
							if(src.speed<1000)src.speed=1000
							src.icon_state = ""
							src.form_4 = 1
							src.frozen = 0
							src.doing = 0
							if(!wait_room)safe=0
							src.overlays -= 'Elec Blue Big.dmi'
							src.overlays += 'Elec Red Big.dmi'
							src.Hair_Apply()
							src.LSSJHair_Apply()
							src.VarReset()
							src.TransformMasteryMultiplier()
							return
					else
						if(!src.form_5)
							if(src.powerlevel_max >= 500000000)
								if(!src.has_tail)
									src<<"Your tail was cut off and you can't transform!"
									return
								else
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
									sleep(10)
									if(src.crater_on)
										new/obj/techs/Overlays/Crater_Center(src.loc)
									sleep(20)
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
									src.overlays -= 'Elec Red Big.dmi'
									src.overlays += 'Elec LSSJ.dmi'
									src.powerlevel *= 41
									src.ki *= 36
									src.kidefense*=36
									src.strength *= 40
									src.defence *= 37
									src.SkillsReset()
									src.block += 60
									src.dodge += 35
									src.critical += 65
									src.reflect += 35
									src.counter += 35
									Skills_Checker()
									src.speed=src.speed_max-4000
									if(src.speed<1000)src.speed=1000
									src.Big_Aura()
									for(var/turf/T in view(src,6))
										var/chance = roll(1,20)
										if(chance == 15)
											missile(new/obj/GreenPU, src, T)
									src.icon_state = ""
									src.form_5 = 1
									src.frozen = 0
									src.doing = 0
									src.Hair_Apply()
									src.LSSJHair_Apply()
									src.VarReset()
									src.TransformMasteryMultiplier()
									return
						else
							if(!src.form_6)
								if(src.powerlevel_max >= 1000000000)
									if(!src.has_tail)
										src << "Your tail was cut off and you can't transform!"
										return
									else
										src.doing = 1
										src.icon_state = "enrage"
										if(src.trans5t!="")
											view(8)<<"\white[src]: \font [src.trans5t]"
										src.frozen = 1
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
										if(src.crater_on)
											new/obj/techs/Overlays/Crater_Center(src.loc)
										if(src.powerlevel>src.powerlevel_max)
											src.powerlevel = src.powerlevel_max
										if(src.ki>src.ki_max)
											src.ki = src.ki_max
										if(src.kidefense>src.kidefense_max)
											src.kidefense=src.kidefense_max
										if(src.strength>src.strength_max)
											src.strength = src.strength_max
										if(src.defence>src.defence_max)
											src.defence = src.defence_max
										src.overlays -= 'Hair - Goku SSJ.dmi'
										src.overlays -= 'Hair - Adult Gohan SSJ.dmi'
										src.overlays -= 'Hair - Teen Gohan SSJ.dmi'
										src.overlays -= 'Hair - Future Gohan SSJ.dmi'
										src.overlays -= 'Hair - Vegeta SSJ.dmi'
										src.overlays -= 'Hair - Trunks Long SSJ.dmi'
										src.overlays -= 'Hair - Raditz SSJ.dmi'
										src.overlays -= 'Hair - Goku USSJ.dmi'
										src.overlays -= 'Hair - Adult Gohan USSJ.dmi'
										src.overlays -= 'Hair - Teen Gohan USSJ.dmi'
										src.overlays -= 'Hair - Future Gohan USSJ.dmi'
										src.overlays -= 'Hair - Vegeta USSJ.dmi'
										src.overlays -= 'Hair - Trunks Long USSJ.dmi'
										src.overlays -= 'Hair - Raditz USSJ.dmi'
										src.overlays -= 'Hair - SSJ3.dmi'
										src.overlays += 'Hair - SSJ4.dmi'
										src.overlays -= src.aura
										src.underlays -= src.underlays
										src.Big_Aura()
										for(var/turf/T in view(src,6))
											var/chance = roll(1,20)
											if(chance == 15)
												missile(new/obj/GreenPU, src, T)
										src.overlays -= 'Elec Blue Small.dmi'
										src.overlays += 'Elec Red Big.dmi'
										src.powerlevel *= 47
										src.ki *= 42
										src.kidefense*=42
										src.strength *= 46
										src.defence *= 43
										src.block += 4
										src.dodge += 4
										src.critical += 4
										src.reflect += 4
										src.counter += 4
										src.speed=src.speed_max-4000
										if(src.speed<1000)
											src.speed=1000
										if(src.skin=="dark")
											src.icon = 'Male - LSSJ 4.dmi'
										else
											src.icon = 'Male - LSSJ 4.dmi'
										src.icon_state = ""
										src.form_6 = 1
										src.frozen = 0
										src.doing = 0
										src.TransformMasteryMultiplier()
										return
							else
								if(!src.form_7)
									if(src.powerlevel_max >= 2500000000)
										if(!src.has_tail)
											src << "Your tail was cut off and you can't transform!"
											return
										else
											src.doing = 1
											src.icon_state = "enrage"
											if(src.trans5t!="")
												view(8)<<"\white[src]: \font [src.trans5t]"
											src.frozen = 1
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
											if(src.crater_on)
												new/obj/techs/Overlays/Crater_Center(src.loc)
											if(src.powerlevel>src.powerlevel_max)
												src.powerlevel = src.powerlevel_max
											if(src.ki>src.ki_max)
												src.ki = src.ki_max
											if(src.kidefense>src.kidefense_max)
												src.kidefense=src.kidefense_max
											if(src.strength>src.strength_max)
												src.strength = src.strength_max
											if(src.defence>src.defence_max)
												src.defence = src.defence_max
											src.overlays -= src.aura
											src.underlays -= src.underlays
											src.Big_Aura()
											for(var/turf/T in view(src,6))
												var/chance = roll(1,20)
												if(chance == 15)
													missile(new/obj/GreenPU, src, T)
											src.overlays -= 'Elec Blue Small.dmi'
											src.overlays += 'Elec Red Big.dmi'
											src.powerlevel *= 50
											src.ki *= 50
											src.kidefense*=50
											src.strength *= 50
											src.defence *= 50
											src.block += 4
											src.dodge += 4
											src.critical += 4
											src.reflect += 4
											src.counter += 4
											src.speed=src.speed_max-4000
											if(src.speed<1000)
												src.speed=1000
											if(src.skin=="dark")
												src.icon = 'brolly LSSJ4.dmi'
											else
												src.icon = 'brolly LSSJ4.dmi'
											src.icon_state = ""
											src.form_7 = 1
											src.frozen = 0
											src.doing = 0
											src.TransformMasteryMultiplier()
											return

//-----------GOD TRANS-----------------------------------------------------------------------------------------------
mob/proc/GSaiyanTrans()
	if(src.Oozaru||src.doing)return
	else
		if(!src.form_1)
			if(src.powerlevel_max >= 2500000)
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
				sleep(src.upkeep)
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
				src.powerlevel *= 20
				src.ki *= 15
				src.kidefense*=15
				src.strength *=19
				src.defence *= 16
				src.SkillsReset()
				src.block += 20
				src.dodge += 20
				src.critical += 20
				src.reflect += 20
				src.counter += 20
				Skills_Checker()
				src.speed=src.speed_max+1000
				if(src.speed<1000)src.speed=1000
				src.Big_Aura()
				for(var/turf/T in view(src,6))
					var/chance = roll(1,20)
					if(chance == 15)
						missile(new/obj/YellowPU, src, T)
				src.icon_state = ""
				src.SSJHair_Apply()
				src.SSJ_EXP()
				src.form_1 = 1
				src.frozen = 0
				src.doing = 0
				src.VarReset()
				src.TransformMasteryMultiplier()
				return
		else
			if(!src.form_2)
				if(src.powerlevel_max >= 25000000)
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
					sleep(src.upkeep)
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
					src.overlays += 'Elec Blue Small.dmi'
					src.powerlevel *= 30
					src.ki *= 25
					src.kidefense*=25
					src.strength *= 29
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
							missile(new/obj/YellowPU, src, T)
					src.icon_state = ""
					src.USSJ_Apply()
					src.USSJHair_Apply()
					src.form_2 = 1
					src.frozen = 0
					src.doing = 0
					src.VarReset()
					src.TransformMasteryMultiplier()
					return
			else
				if(!src.form_3)
					if(src.powerlevel_max >= 50000000)
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
						src.overlays -= 'Hair - Goku SSJ.dmi'
						src.overlays -= 'Hair - Adult Gohan SSJ.dmi'
						src.overlays -= 'Hair - Teen Gohan SSJ.dmi'
						src.overlays -= 'Hair - Future Gohan SSJ.dmi'
						src.overlays -= 'Hair - Vegeta SSJ.dmi'
						src.overlays -= 'Hair - Trunks Long SSJ.dmi'
						src.overlays -= 'Hair - Raditz SSJ.dmi'
						src.overlays -= 'Hair - Goku USSJ.dmi'
						src.overlays -= 'Hair - Adult Gohan USSJ.dmi'
						src.overlays -= 'Hair - Teen Gohan USSJ.dmi'
						src.overlays -= 'Hair - Future Gohan USSJ.dmi'
						src.overlays -= 'Hair - Vegeta USSJ.dmi'
						src.overlays -= 'Hair - Trunks Long USSJ.dmi'
						src.overlays -= 'Hair - Raditz USSJ.dmi'
						src.overlays += 'Hair - SSJ3.dmi'
						src.SSJ_EXP()
						src.overlays -= src.aura
						src.underlays -= src.underlays
						src.overlays -= 'Elec Blue Small.dmi'
						src.overlays += 'Elec Blue Big.dmi'
						src.Big_Aura()
						src.Skin_Apply()
						src.powerlevel *= 40
						src.ki *= 35
						src.kidefense*=35
						src.strength *= 39
						src.defence *= 36
						src.SkillsReset()
						src.block += 40
						src.dodge += 40
						src.critical += 40
						src.reflect += 40
						src.counter += 40
						Skills_Checker()
						src.speed=src.speed_max-3000
						if(src.speed<1000)src.speed=1000
						src.Big_Aura()
						for(var/turf/T in view(src,6))
							var/chance = roll(1,20)
							if(chance == 15)
								missile(new/obj/YellowPU, src, T)
						src.icon_state = ""
						src.form_3 = 1
						src.frozen = 0
						src.doing = 0
						if(!wait_room)safe=0
						src.VarReset()
						src.TransformMasteryMultiplier()
						return
				else
					if(!src.form_4)
						if(src.powerlevel_max >= 1000000000)
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
							src.overlays -= 'Hair - Goku SSJ.dmi'
							src.overlays -= 'Hair - Adult Gohan SSJ.dmi'
							src.overlays -= 'Hair - Teen Gohan SSJ.dmi'
							src.overlays -= 'Hair - Future Gohan SSJ.dmi'
							src.overlays -= 'Hair - Vegeta SSJ.dmi'
							src.overlays -= 'Hair - Trunks Long SSJ.dmi'
							src.overlays -= 'Hair - Raditz SSJ.dmi'
							src.overlays -= 'Hair - Goku USSJ.dmi'
							src.overlays -= 'Hair - Adult Gohan USSJ.dmi'
							src.overlays -= 'Hair - Teen Gohan USSJ.dmi'
							src.overlays -= 'Hair - Future Gohan USSJ.dmi'
							src.overlays -= 'Hair - Vegeta USSJ.dmi'
							src.overlays -= 'Hair - Trunks Long USSJ.dmi'
							src.overlays -= 'Hair - Raditz USSJ.dmi'
							src.overlays -= 'Hair - SSJ3.dmi'
							src.GSSJHair_Apply()
							src.SSJ_EXP()
							src.overlays -= src.aura
							src.underlays -= src.underlays
							src.overlays -= 'Elec Blue Small.dmi'
							src.overlays += 'Elec Blue Big.dmi'
							src.Big_Aura()
							src.Skin_Apply()
							src.powerlevel *= 50
							src.ki *= 45
							src.kidefense*=45
							src.strength *= 49
							src.defence *= 46
							src.SkillsReset()
							src.block += 40
							src.dodge += 40
							src.critical += 40
							src.reflect += 40
							src.counter += 40
							Skills_Checker()
							src.speed=src.speed_max-3000
							if(src.speed<1000)src.speed=1000
							src.Big_Aura()
							for(var/turf/T in view(src,6))
								var/chance = roll(1,20)
								if(chance == 15)
									missile(new/obj/YellowPU, src, T)
							src.icon_state = ""
							src.form_4 = 1
							src.frozen = 0
							src.doing = 0
							if(!wait_room)safe=0
							src.VarReset()
							src.TransformMasteryMultiplier()
							return

mob/proc/SSJ_EXP()
	spawn while(1)
		if(src.upkeep>5)
			if(src.race=="Half Saiyan"&&src.form_6)goto Skip
			if(src.form_1)
				src.ssj_exp += rand(0.2,0.4)
				if(src.ssj_exp >= src.ssj_tnl)
					src.ssj_level ++
					src<<"\white You feel your body become used to the Super Saiyan form."
					src.ssj_exp = 0
					src.upkeep -= 3
					if(src.upkeep<5)
						src.upkeep=5
						break
			if(src.ki<=src.ki*0.05&&src.form_1)
				src<<"\white Your ki is too low for you to sustain your Super Saiyan Form."
				if(src.race=="Half Saiyan")src.HalfSaiyanRevert()
				if(src.race=="Saiyan")src.SaiyanRevert()
		Skip
		sleep(100)
mob/proc/FORM1_EXP()
	spawn while(1)
		if(src.upkeep>5)
			if(src.form_1)
				src.form_1_exp += rand(0.2,0.4)
				if(src.form_1_exp >= src.form_1_tnl)
					src.form_1_level ++
					src<<"\white You feel your body become used to your new form."
					src.form_1_exp = 0
					src.upkeep -= 3
					if(src.upkeep<5)
						src.upkeep=5
						break
			if(src.ki<=src.ki*0.05&&src.form_1)
				src<<"\white Your ki is too low for you to sustain your tranformed state."
				if(src.race=="Human")src.HumanRevert()
				if(src.race=="Changeling")src.ChanglingRevert()
				if(src.race=="Demon")src.DemonRevert()
				if(src.race=="Kai")src.KaiRevert()
				if(src.race=="Saibaman")src.SaibamanRevert()
		sleep(100)