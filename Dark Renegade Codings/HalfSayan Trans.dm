mob
	proc
		DemonicHalfSaiyanPotaraFuseForm()
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
			src.overlays -= src.hair_icon
			src.HHair_Apply()
			src.Big_Aura()
			for(var/turf/T in view(src,6))
				var/chance = roll(1,20)
				if(chance == 15)
					missile(new/obj/BluePU, src, T)
			src.icon_state = ""
			src.overlays += 'Elec White.dmi'
			src.form_1 = 1
			src.form_2 = 1
			src.form_3 = 1
			src.form_4 = 1
			src.form_5 = 1
			src.form_6 = 1
			src.frozen = 0
			src.doing = 0
			src.safe = 0
			src.VarReset()
			src.TransformMasteryMultiplier()
			return
		DemonicHalfSaiyanFuseForm()
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
			src.powerlevel *= 52
			src.ki *= 45
			src.strength *= 52
			src.defence *= 51
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
			src.overlays -= src.hair_icon
			src.HHair_Apply()
			src.Big_Aura()
			for(var/turf/T in view(src,6))
				var/chance = roll(1,20)
				if(chance == 15)
					missile(new/obj/BluePU, src, T)
			src.icon_state = ""
			src.overlays += 'Elec White.dmi'
			src.form_1 = 1
			src.form_2 = 1
			src.form_3 = 1
			src.form_4 = 1
			src.form_5 = 1
			src.form_6 = 1
			src.frozen = 0
			src.doing = 0
			src.safe = 0
			src.VarReset()
			src.TransformMasteryMultiplier()
			return
mob/proc/DemonicHalfSaiyanTrans()
	var/trans_time = src.upkeep / 1.5
	if(src.upkeep == 5)trans_time = 5
	if(src.doing||src.Oozaru)return
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
				src.powerlevel *= 52
				src.ki *= 45
				src.strength *= 52
				src.defence *= 51
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
				src.overlays -= src.hair_icon
				src.HHair_Apply()
				src.Big_Aura()
				for(var/turf/T in view(src,6))
					var/chance = roll(1,20)
					if(chance == 15)
						missile(new/obj/BluePU, src, T)
				src.icon_state = ""
				src.overlays += 'Elec White.dmi'
				src.form_1 = 1
				src.form_2 = 1
				src.form_3 = 1
				src.form_4 = 1
				src.form_5 = 1
				src.form_6 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				src.VarReset()
				src.TransformMasteryMultiplier()
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
					src.ki *= 9
					src.kidefense*=9
					src.strength *= 9
					src.defence *= 10
					src.SkillsReset()
					src.block += 15
					src.dodge += 15
					src.critical += 15
					src.reflect += 15
					src.counter += 15
					Skills_Checker()
					src.speed=src.speed_max-1000
					if(src.speed<1000)src.speed=1000
					src.underlays -= src.underlays
					src.overlays -= src.aura
					src.overlays -= src.hair_icon
					src.Big_Aura()
					src.SSJ_EXP()
					src.SSJHair_Apply()
					for(var/turf/T in view(src,6))
						var/chance = roll(1,20)
						if(chance == 15)
							missile(new/obj/BluePU, src, T)
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
					sleep(trans_time)
					if(src.powerlevel>src.powerlevel_max)src.powerlevel = src.powerlevel_max
					if(src.ki>src.ki_max)src.ki = src.ki_max
					if(src.kidefense>src.kidefense_max)src.kidefense=src.kidefense_max
					if(src.strength>src.strength_max)src.strength = src.strength_max
					if(src.defence>src.defence_max)src.defence = src.defence_max
					src.underlays -= src.underlays
					src.overlays -= src.aura
					src.Big_Aura()
					src.overlays += 'Elec Blue Small.dmi'
					src.Power_Redefine()
					src.powerlevel=src.powerlevel_max
					src.ki=src.ki_max
					src.powerlevel *= 19
					src.ki *= 14
					src.kidefense*=14
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
					for(var/turf/T in view(src,6))
						var/chance = roll(1,20)
						if(chance == 15)
							missile(new/obj/BluePU, src, T)
					src.icon_state = ""
					src.USSJ_Apply()
					src.overlays -= src.hair_icon
					src.USSJHair_Apply()
					src.form_2 = 1
					src.frozen = 0
					src.doing = 0
					src.VarReset()
					src.TransformMasteryMultiplier()
					return
			else
				if(!src.form_3 && src.gone_ssj2)
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
						if(src.crater_on)new/obj/techs/Overlays/Crater_Center(src.loc)
						if(src.powerlevel>src.powerlevel_max)src.powerlevel = src.powerlevel_max
						if(src.ki>src.ki_max)src.ki = src.ki_max
						if(src.kidefense>src.kidefense_max)src.kidefense=src.kidefense_max
						if(src.strength>src.strength_max)src.strength = src.strength_max
						if(src.defence>src.defence_max)src.defence = src.defence_max
						src.underlays -= src.underlays
						src.overlays -= src.aura
						src.Big_Aura()
						src.overlays -= 'Elec Blue Small.dmi'
						src.overlays += 'Elec Blue Big.dmi'
						src.Power_Redefine()
						src.powerlevel=src.powerlevel_max
						src.ki=src.ki_max
						src.powerlevel *= 23
						src.ki *= 18
						src.kidefense*=18
						src.strength *= 21
						src.defence *= 22
						src.SkillsReset()
						src.block += 25
						src.dodge += 25
						src.critical += 25
						src.reflect += 25
						src.counter += 25
						Skills_Checker()
						src.speed=src.speed_max-2000
						if(src.speed<1000)src.speed=1000
						for(var/turf/T in view(src,6))
							var/chance = roll(1,20)
							if(chance == 15)
								missile(new/obj/BluePU, src, T)
						src.icon_state = ""
						src.overlays -= src.hair_icon
						src.SSJHair_Apply()
						src.Skin_Apply()
						src.form_3 = 1
						src.frozen = 0
						src.doing = 0
						src.VarReset()
						src.TransformMasteryMultiplier()
						return
				else
					if(!src.form_4 && src.gone_ssj2)
						if(src.powerlevel_max >= 250000000)
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
							src.overlays -= src.hair_icon
							src.USSJHair_Apply()
							src.overlays -= 'Elec Blue Big.dmi'
							src.overlays += 'Elec Red Big.dmi'
							src.underlays -= src.underlays
							src.overlays -= src.aura
							src.Big_Aura()
							src.Power_Redefine()
							src.powerlevel=src.powerlevel_max
							src.ki=src.ki_max
							src.powerlevel *= 30
							src.ki *= 29
							src.kidefense*=29
							src.strength *= 29
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
							for(var/turf/T in view(src,6))
								var/chance = roll(1,20)
								if(chance == 15)
									missile(new/obj/BluePU, src, T)
							src.icon_state = ""
							src.form_4 = 1
							src.frozen = 0
							src.doing = 0
							src.VarReset()
							src.TransformMasteryMultiplier()
							return
					else
						if(!src.form_5 && src.form_4)
							if(src.powerlevel_max >= 500000000)
								if(src.fused)
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
									sleep(trans_time)
									if(src.crater_on)new/obj/techs/Overlays/Crater_Center(src.loc)
									if(src.powerlevel>src.powerlevel_max)src.powerlevel = src.powerlevel_max
									if(src.ki>src.ki_max)src.ki = src.ki_max
									if(src.kidefense>src.kidefense_max)src.kidefense=src.kidefense_max
									if(src.strength>src.strength_max)src.strength = src.strength_max
									if(src.defence>src.defence_max)src.defence = src.defence_max
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
									if(src.hair != "Bald")src.overlays += 'Hair - SSJ3 Demonic.dmi'
									src.underlays -= src.underlays
									src.overlays -= src.aura
									src.Big_Aura()
									src.Power_Redefine()
									src.powerlevel=src.powerlevel_max
									src.ki=src.ki_max
									src.powerlevel *= 33
									src.ki *= 28
									src.kidefense*=28
									src.strength *= 32
									src.defence *= 33
									src.SkillsReset()
									src.block += 7
									src.dodge += 7
									src.critical += 7
									src.reflect += 7
									src.counter += 7
									Skills_Checker()
									src.speed=src.speed_max-4000
									if(src.speed<1000)src.speed=1000
									for(var/turf/T in view(src,6))
										var/chance = roll(1,20)
										if(chance == 15)
											missile(new/obj/BluePU, src, T)
									src.icon_state = ""
									src.form_5 = 1
									src.frozen = 0
									src.doing = 0
									src.safe = 0
									src.VarReset()
									src.TransformMasteryMultiplier()
									return
						if(!src.form_6 && src.form_4)
							if(src.powerlevel_max >= 1000000000)
								if(src.gone_mystic && !src.fused)
									src.doing = 1
									src.icon_state = "enrage"
									if(src.trans6t!="")(8)<<"\white[src]: \font [src.trans6t]"
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
									src.overlays -= src.hair_icon
									src.HHair_Apply()
									if(src.hair != "Bald")
										src.overlays += 'Hair - SSJ3 Demonic.dmi'
									src.underlays -= src.underlays
									src.overlays -= src.aura
									src.Big_Aura()
									src.overlays -= 'Elec Red Big.dmi'
									src.overlays += 'Elec Demon 3.dmi'
									src.Power_Redefine()
									src.powerlevel=src.powerlevel_max
									src.ki=src.ki_max
									src.powerlevel *= 47
									src.ki *= 41
									src.kidefense*=41
									src.strength *= 45
									src.defence *= 43
									src.SkillsReset()
									src.block += 60
									src.dodge += 60
									src.critical += 60
									src.reflect += 60
									src.counter += 60
									Skills_Checker()
									src.speed=src.speed_max-5000
									if(src.speed<1000)src.speed=1000
									for(var/turf/T in view(src,6))
										var/chance = roll(1,20)
										if(chance == 15)
											missile(new/obj/BluePU, src, T)
									src.icon_state = ""
									src.form_6 = 1
									src.frozen = 0
									src.doing = 0
									src.safe = 0
									src.VarReset()
									src.TransformMasteryMultiplier()
									return
							if(!src.form_6)
								if(src.powerlevel_max >= 1000000000)
									if(src.gone_mystic && !src.fused)
										src.doing = 1
										src.icon_state = "enrage"
										if(src.trans6t!="")(8)<<"\white[src]: \font [src.trans6t]"
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
										src.overlays -= src.hair_icon
										src.HHair_Apply()
										src.underlays -= src.underlays
										src.overlays -= src.aura
										src.Big_Aura()
										src.overlays -= 'Elec Red Big.dmi'
										src.overlays += 'Elec Blue Big.dmi'
										src.Power_Redefine()
										src.powerlevel=src.powerlevel_max
										src.ki=src.ki_max
										src.powerlevel *= 47
										src.ki *= 41
										src.kidefense*=41
										src.strength *= 45
										src.defence *= 43
										src.SkillsReset()
										src.block += 60
										src.dodge += 60
										src.critical += 60
										src.reflect += 60
										src.counter += 60
										Skills_Checker()
										src.speed=src.speed_max-5000
										if(src.speed<1000)src.speed=1000
										for(var/turf/T in view(src,6))
											var/chance = roll(1,20)
											if(chance == 15)
												missile(new/obj/BluePU, src, T)
										src.icon_state = ""
										src.icon = 'DemonForm.dmi'
										src.form_6 = 1
										src.frozen = 0
										src.doing = 0
										src.safe = 0
										src.VarReset()
										src.TransformMasteryMultiplier()
										return