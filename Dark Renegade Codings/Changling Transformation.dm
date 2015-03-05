mob
	var/form_7=0
	proc
		ChanglingTransMetal()
			if(src.form_7)return
			if(src.powerlevel_max >= 1000000000)
				src.doing = 1
				src.icon_state = "enrage"
				if(src.trans6t!="")view(8)<<"\white[src]: \font [src.trans6t]"
				src.frozen = 1
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
				if(src.changlingmetal)src.icon='Changling - Metal.dmi'
				if(src.changlingmecha)src.icon='Changling - Mecha.dmi'
				if(src.crater_on)new/obj/techs/Overlays/Crater_Center(src.loc)
				if(src.powerlevel>src.powerlevel_max)src.powerlevel = src.powerlevel_max
				if(src.ki>src.ki_max)src.ki = src.ki_max
				if(src.kidefense>src.kidefense_max)src.kidefense=src.kidefense_max
				if(src.strength>src.strength_max)src.strength = src.strength_max
				if(src.defence>src.defence_max)src.defence = src.defence_max
				src.Power_Redefine()
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
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				for(var/turf/T in view(src,6))
					var/chance = roll(1,20)
					if(chance == 15)
						missile(new/obj/PurplePU, src, T)
				src.icon_state = ""
				src.form_7 = 1
				src.frozen = 0
				src.doing = 0
				if(!wait_room)safe=0
				src.VarReset()
				src.TransformMasteryMultiplier()
				return
		ChanglingPotaraFuseForm()
			if(src.potara_using)return
			src.potara_using=1
			src.doing = 1
			src.icon_state = "enrage"
			src.frozen = 1
			if(src.trans1t!="")view(8)<<"\white[src]: \font [src.trans6t]"
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
			src.icon = 'Changling - Form 5.dmi'
			src.form_1 = 1
			src.form_2 = 1
			src.form_3 = 1
			src.form_4 = 1
			src.form_5 = 1
			src.frozen = 0
			src.doing = 0
			if(!wait_room)safe=0
			src.VarReset()
			src.TransformMasteryMultiplier()
			return
		ChanglingFuseForm()
			src.doing = 1
			src.icon_state = "enrage"
			src.frozen = 1
			if(src.trans1t!="")view(8)<<"\white[src]: \font [src.trans6t]"
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
			src.powerlevel *= 50
			src.ki *= 45
			src.strength *= 48
			src.defence *= 48
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
			src.icon = 'Changling - Form 5.dmi'
			src.form_1 = 1
			src.form_2 = 1
			src.form_3 = 1
			src.form_4 = 1
			src.form_5 = 1
			src.frozen = 0
			src.doing = 0
			if(!wait_room)safe=0
			src.VarReset()
			src.TransformMasteryMultiplier()
			return
mob/proc/ChanglingTrans()
	var/trans_time = src.upkeep /1.5
	if(src.upkeep<=5)trans_time=5
	if(src.doing)return
	else
		if(src.gonemetal)
			ChanglingTransMetal()
			return
		if(src.finalformfuse)
			if(src.fused&&!src.form_1)
				src.doing = 1
				src.icon_state = "enrage"
				src.frozen = 1
				if(src.trans1t!="")view(8)<<"\white[src]: \font [src.trans6t]"
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
				src.powerlevel *= 50
				src.ki *= 45
				src.strength *= 48
				src.defence *= 48
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
				src.icon = 'Changling - Form 5.dmi'
				src.form_1 = 1
				src.form_2 = 1
				src.form_3 = 1
				src.form_4 = 1
				src.form_5 = 1
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
				src.frozen = 1
				if(src.trans1t!="")view(8)<<"\white[src]: \font [src.trans1t]"
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
				if(src.powerlevel>src.powerlevel_max)src.powerlevel = src.powerlevel_max
				if(src.ki>src.ki_max)src.ki = src.ki_max
				if(src.kidefense>src.kidefense_max)src.kidefense=src.kidefense_max
				if(src.strength>src.strength_max)src.strength = src.strength_max
				if(src.defence>src.defence_max)src.defence = src.defence_max
				src.Power_Redefine()
				src.powerlevel=src.powerlevel_max
				src.ki=src.ki_max
				src.powerlevel *= 13
				src.ki *= 12
				src.strength *= 10
				src.defence *= 8
				src.kidefense*=8
				src.SkillsReset()
				src.block += 19
				src.dodge += 19
				src.critical += 19
				src.reflect += 19
				src.counter += 19
				Skills_Checker()
				src.speed=src.speed_max-1000
				if(src.speed<1000)src.speed=1000
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				for(var/turf/T in view(src,6))
					var/chance = roll(1,20)
					if(chance == 15)
						missile(new/obj/PurplePU, src, T)
				src.icon_state = ""
				if(gene_cooler)
					src.icon = 'Cooler - Form 3.dmi'
				else
					src.icon = 'Changling - Form 2.dmi'
				src.form_1 = 1
				src.frozen = 0
				src.doing = 0
				if(!wait_room)safe=0
				src.VarReset()
				src.FORM1_EXP()
				src.TransformMasteryMultiplier()
				return
		else
			if(!src.form_2)
				if(src.powerlevel_max >= 10000000)
					src.doing = 1
					src.icon_state = "enrage"
					if(src.trans2t!="")view(8)<<"\white[src]: \font [src.trans2t]"
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
					src.ki *= 17
					src.strength *= 15
					src.defence *= 14
					src.kidefense*=15
					src.SkillsReset()
					src.block += 24
					src.dodge += 24
					src.critical += 24
					src.reflect += 24
					src.counter += 24
					Skills_Checker()
					src.speed=src.speed_max+1000
					if(src.speed<1000)src.speed=1000
					src.underlays -= src.underlays
					src.overlays -= src.aura
					src.overlays+='Elec Blue Small.dmi'
					src.Big_Aura()
					for(var/turf/T in view(src,6))
						var/chance = roll(1,20)
						if(chance == 15)
							missile(new/obj/PurplePU, src, T)
					src.icon_state = ""
					if(gene_cooler)
						src.icon = 'Cooler - Form 2.dmi'
					else
						src.icon = 'Changling - Form 3.dmi'
					src.form_2 = 1
					src.frozen = 0
					src.doing = 0
					if(!wait_room)safe=0
					src.VarReset()
					src.TransformMasteryMultiplier()
					return
			else
				if(!src.form_3)
					if(src.powerlevel_max >= 100000000)
						src.doing = 1
						src.icon_state = "enrage"
						src.frozen = 1
						if(src.trans3t!="")view(8)<<"\white[src]: \font [src.trans3t]"
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
						if(src.powerlevel>src.powerlevel_max)src.powerlevel = src.powerlevel_max
						if(src.ki>src.ki_max)src.ki = src.ki_max
						if(src.kidefense>src.kidefense_max)src.kidefense=src.kidefense_max
						if(src.strength>src.strength_max)src.strength = src.strength_max
						if(src.defence>src.defence_max)src.defence = src.defence_max
						src.Power_Redefine()
						src.powerlevel=src.powerlevel_max
						src.ki=src.ki_max
						src.powerlevel *= 23
						src.ki *= 22
						src.kidefense*=20
						src.strength *= 21
						src.defence *= 18
						src.SkillsReset()
						src.block += 29
						src.dodge += 29
						src.critical += 29
						src.reflect += 29
						src.counter += 29
						Skills_Checker()
						src.speed=src.speed_max-2000
						if(src.speed<1000)src.speed=1000
						src.underlays -= src.underlays
						src.overlays -= src.aura
						src.Big_Aura()
						src.overlays-='Elec Blue Small.dmi'
						src.overlays += 'Elec Blue Big.dmi'
						for(var/turf/T in view(src,6))
							var/chance = roll(1,20)
							if(chance == 15)
								missile(new/obj/PurplePU, src, T)
						src.icon_state = ""
						if(gene_cooler)
							src.icon = 'Cooler - Form 4.dmi'
						else
							src.icon = 'Changling - Form 4.dmi'
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
							src.frozen = 1
							if(src.trans4t!="")view(8)<<"\white[src]: \font [src.trans4t]"
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
							src.Power_Redefine()
							src.powerlevel=src.powerlevel_max
							src.ki=src.ki_max
							src.powerlevel *= 28
							src.ki *= 27
							src.kidefense*=25
							src.strength *= 26
							src.defence *= 23
							src.SkillsReset()
							src.block += 40
							src.dodge += 35
							src.critical += 50
							src.reflect += 35
							src.counter += 35
							Skills_Checker()
							src.speed=src.speed_max-3000
							if(src.speed<1000)src.speed=1000
							src.underlays -= src.underlays
							src.overlays -= src.aura
							src.Big_Aura()
							for(var/turf/T in view(src,6))
								var/chance = roll(1,20)
								if(chance == 15)
									missile(new/obj/PurplePU, src, T)
							src.icon_state = ""
							if(gene_cooler)
								src.icon = 'Cooler - Form 5.dmi'
							else
								src.icon = 'Changling - Form 4 100.dmi'
							src.form_4 = 1
							src.frozen = 0
							src.doing = 0
							if(!wait_room)safe=0
							src.VarReset()
							src.TransformMasteryMultiplier()
							return
					else
						if(!src.form_5)
							if(src.powerlevel_max >= 10000000000)
								src.doing = 1
								src.icon_state = "enrage"
								if(src.trans5t!="")view(8)<<"\white[src]: \font [src.trans5t]"
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
								src.powerlevel *= 43
								src.ki *= 42
								src.kidefense*=40
								src.strength *= 40
								src.defence *= 40
								src.SkillsReset()
								src.block += 45
								src.dodge += 40
								src.critical += 65
								src.reflect += 40
								src.counter += 40
								Skills_Checker()
								src.speed=src.speed_max-4000
								if(src.speed<1000)src.speed=1000
								src.underlays -= src.underlays
								src.overlays -= src.aura
								src.overlays -= 'Elec Blue Big.dmi'
								src.overlays += 'Elec Red Big.dmi'
								src.Big_Aura()
								for(var/turf/T in view(src,6))
									var/chance = roll(1,20)
									if(chance == 15)
										missile(new/obj/PurplePU, src, T)
								src.icon_state = ""
								if(gene_cooler)
									src.icon = 'Cooler - Form 6.dmi'
								else
									src.icon = 'Changling - Form 5.dmi'
								src.form_5 = 1
								src.frozen = 0
								src.doing = 0
								if(!wait_room)safe=0
								src.VarReset()
								src.TransformMasteryMultiplier()
								return
						else
							if(!src.form_6)
								if(src.powerlevel_max >= 200000000000)
									src.doing = 1
									src.icon_state = "enrage"
									if(src.trans6t!="")
										view(8)<<"\white[src]: \font [src.trans6t]"
									src.frozen = 1
									view(10) << sound('thunder.wav')
									if(src.Quake_Effect_Toggle == 0)
										Quake_Effect(src,duration=src.upkeep,strength=1)
									src.underlays -= aura
									src.underlays += aura
									spawn(5) src.underlays -= aura
									src.Fade(yellows)
									sleep(10)
									sleep(trans_time)
									if(src.crater_on)
										new/obj/techs/Overlays/Crater_Center(src.loc)
									sleep(20)
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
									src.powerlevel *= 48
									src.ki *= 47
									src.kidefense*=45
									src.strength *= 45
									src.defence *= 45
									src.block += 4
									src.dodge += 4
									src.critical += 6
									src.reflect += 4
									src.counter += 4
									src.speed=src.speed_max-4000
									if(src.speed<1000)
										src.speed=1000
									src.underlays -= src.underlays
									src.overlays -= src.aura
									src.overlays -= 'Elec Blue Big.dmi'
									src.overlays += 'Elec Red Big.dmi'
									src.Big_Aura()
									for(var/turf/T in view(src,6))
										var/chance = roll(1,20)
										if(chance == 15)
											missile(new/obj/PurplePU, src, T)
									src.icon_state = ""
									if(gene_cooler)
										src.icon = 'Cooler - Form 2.dmi'
									else
										src.icon = 'Changling - Form 11.dmi'
									src.form_6 = 1
									src.frozen = 0
									src.doing = 0
									src.safe = 0
									src.TransformMasteryMultiplier()
									return