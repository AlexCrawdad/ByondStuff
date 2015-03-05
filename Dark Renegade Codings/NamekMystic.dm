mob/proc/NamekMysticTrans()
	if(src.doing)
		return
	else
		if(!src.form_1)
			if(src.powerlevel_max >= 300000  && src.level >= 150)
				src.doing = 1
				src.icon_state = "enrage"
				if(src.trans1t!="")
					view(8)<<"\white[src]: \font [src.trans1t]"
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
				for(var/obj/Technique/InvertPower/T in src)
					del(T)
				src.powerlevel_max *= 4
				src.ki_max *= 2.5
				src.kidefense_max*=2.5
				src.strength_max *= 2.5
				src.defence_max *= 2.5
				src.speed_max-=2000
				if(src.speed_max<1000)
					src.speed_max=1000
				src.speed=src.speed_max
				src.critical_max += rand(6,9)
				src.dodge_max += rand(6,9)
				src.reflect_max += rand(6,9)
				src.block_max += rand(6,9)
				src.counter_max += rand(6,9)
				src.powerlevel = src.powerlevel_max
				src.ki = src.ki_max
				src.kidefense=src.kidefense_max
				src.strength = src.strength_max
				src.defence = src.defence_max
				src.critical = src.critical_max
				src.dodge = src.dodge_max
				src.reflect = src.reflect_max
				src.block = src.block_max
				for(var/turf/T in view(src,6))
					var/chance = roll(1,20)
					if(chance == 15)
						missile(new/obj/BluePU, src, T)
				src.icon_state = ""
				src.icon = 'Namek - Super.dmi'
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.form_1 = 1
				src.frozen = 0
				src.spam_delay=0
				src.trans_delay=0
				src.doing = 0
				return
		else
			if(!src.form_2)
				if(src.powerlevel_max >= 2000000  && src.level >= 300)
					src.doing = 1
					src.icon_state = "enrage"
					if(src.trans2t!="")
						view(8)<<"\white[src]: \font [src.trans2t]"
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
					if(src.crater_on)
						new/obj/techs/Overlays/Crater_Center(src.loc)
					sleep(20)
					src.powerlevel_max *= 3
					src.ki_max *= 4
					src.kidefense_max*=4
					src.strength_max *= 4
					src.defence_max *= 4
					src.speed_max-=1000
					if(src.speed_max<1000)
						src.speed_max=1000
					src.speed=src.speed_max
					src.critical_max += rand(2,8)
					src.dodge_max += rand(2,8)
					src.reflect_max += rand(2,8)
					src.block_max += rand(2,8)
					src.counter_max += rand(2,8)
					src.powerlevel = src.powerlevel_max
					src.ki = src.ki_max
					src.kidefense=src.kidefense_max
					src.strength = src.strength_max
					src.defence = src.defence_max
					src.critical = src.critical_max
					src.dodge = src.dodge_max
					src.reflect = src.reflect_max
					src.block = src.block_max
					src.overlays += 'Elec Blue Small.dmi'
					src.underlays -= src.underlays
					src.overlays -= src.aura
					src.Big_Aura()
					for(var/turf/T in view(src,6))
						var/chance = roll(1,20)
						if(chance == 15)
							missile(new/obj/BluePU, src, T)
					src.icon_state = ""
					src.icon = 'Mistic Form1.dmi'
					src.form_2 = 1
					src.frozen = 0
					src.doing = 0
					src.trans_delay=0
					src.spam_delay=0
					return
			else
				if(!src.form_3)
					if(src.powerlevel_max >= 50000000  && src.level >= 500)
						src.doing = 1
						src.icon_state = "enrage"
						if(src.trans3t!="")
							view(8)<<"\white[src]: \font [src.trans3t]"
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
						if(src.crater_on)
							new/obj/techs/Overlays/Crater_Center(src.loc)
						sleep(20)
						if(src.crater_on)
							new/obj/techs/Overlays/Crater_Center(src.loc)
						src.powerlevel_max *= 7
						src.ki_max *= 7
						src.kidefense_max*=7
						src.strength_max *= 7
						src.defence_max *= 8
						src.speed_max-=1000
						if(src.speed_max<1000)
							src.speed_max=1000
						src.speed=src.speed_max
						src.critical_max += rand(2,6)
						src.dodge_max += rand(2,6)
						src.reflect_max += rand(2,6)
						src.block_max += rand(2,6)
						src.counter_max += rand(2,6)
						src.powerlevel = src.powerlevel_max
						src.ki = src.ki_max
						src.kidefense=src.kidefense_max
						src.strength = src.strength_max
						src.defence = src.defence_max
						src.critical = src.critical_max
						src.dodge = src.dodge_max
						src.reflect = src.reflect_max
						src.block = src.block_max
						src.overlays -= 'Elec Blue Small.dmi'
						src.overlays += 'Elec Blue Big.dmi'
						src.underlays -= src.underlays
						src.overlays -= src.aura
						src.Big_Aura()
						for(var/turf/T in view(src,6))
							var/chance = roll(1,20)
							if(chance == 15)
								missile(new/obj/BluePU, src, T)
						src.icon_state = ""
						src.icon = 'Mistic Form2.dmi'
						src.form_3 = 1
						src.frozen = 0
						src.spam_delay=0
						src.trans_delay=0
						src.doing = 0
						return
				else
					if(!src.form_4)
						if(src.powerlevel_max >= 70000000  && src.level >= 500)
							src.doing = 1
							src.icon_state = "enrage"
							if(src.trans3t!="")
								view(8)<<"\white[src]: \font [src.trans3t]"
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
							if(src.crater_on)
								new/obj/techs/Overlays/Crater_Center(src.loc)
							sleep(20)
							if(src.crater_on)
								new/obj/techs/Overlays/Crater_Center(src.loc)
							src.powerlevel_max *= 7
							src.ki_max *= 7
							src.kidefense_max*=7
							src.strength_max *= 7
							src.defence_max *= 8
							src.speed_max-=1000
							if(src.speed_max<1000)
								src.speed_max=1000
							src.speed=src.speed_max
							src.critical_max += rand(2,6)
							src.dodge_max += rand(2,6)
							src.reflect_max += rand(2,6)
							src.block_max += rand(2,6)
							src.counter_max += rand(2,6)
							src.powerlevel = src.powerlevel_max
							src.ki = src.ki_max
							src.kidefense=src.kidefense_max
							src.strength = src.strength_max
							src.defence = src.defence_max
							src.critical = src.critical_max
							src.dodge = src.dodge_max
							src.reflect = src.reflect_max
							src.block = src.block_max
							src.overlays -= 'Elec Blue Small.dmi'
							src.overlays += 'Elec Blue Big.dmi'
							src.underlays -= src.underlays
							src.overlays -= src.aura
							src.Big_Aura()
							for(var/turf/T in view(src,6))
								var/chance = roll(1,20)
								if(chance == 15)
									missile(new/obj/BluePU, src, T)
							src.icon_state = ""
							src.icon = 'Mistic Form3.dmi'
							src.form_4 = 1
							src.frozen = 0
							src.spam_delay=0
							src.trans_delay=0
							src.doing = 0
							return
					else
						if(!src.form_5)
							if(src.powerlevel_max >= 80000000  && src.level >= 4350 && src.mystic)
								src.doing = 1
								src.icon_state = "enrage"
								if(src.trans3t!="")
									view(8)<<"\white[src]: \font [src.trans3t]"
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
								if(src.crater_on)
									new/obj/techs/Overlays/Crater_Center(src.loc)
								sleep(20)
								if(src.crater_on)
									new/obj/techs/Overlays/Crater_Center(src.loc)
								src.powerlevel_max *= 7
								src.ki_max *= 7
								src.kidefense_max*=7
								src.strength_max *= 7
								src.defence_max *= 8
								src.speed_max-=1000
								if(src.speed_max<1000)
									src.speed_max=1000
								src.speed=src.speed_max
								src.critical_max += rand(2,6)
								src.dodge_max += rand(2,6)
								src.reflect_max += rand(2,6)
								src.block_max += rand(2,6)
								src.counter_max += rand(2,6)
								src.powerlevel = src.powerlevel_max
								src.ki = src.ki_max
								src.kidefense=src.kidefense_max
								src.strength = src.strength_max
								src.defence = src.defence_max
								src.critical = src.critical_max
								src.dodge = src.dodge_max
								src.reflect = src.reflect_max
								src.block = src.block_max
								src.overlays -= 'Elec Blue Small.dmi'
								src.overlays += 'Elec Blue Big.dmi'
								src.underlays -= src.underlays
								src.overlays -= src.aura
								src.Big_Aura()
								for(var/turf/T in view(src,6))
									var/chance = roll(1,20)
									if(chance == 15)
										missile(new/obj/BluePU, src, T)
								src.icon_state = ""
								src.icon = 'Mistic Form4.dmi'
								src.form_5 = 1
								src.frozen = 0
								src.spam_delay=0
								src.trans_delay=0
								src.doing = 0
								return
						else
							if(!src.form_6)
								if(src.powerlevel_max >= 90000000  && src.level >= 5150 && src.mystic)
									src.doing = 1
									src.icon_state = "enrage"
									if(src.trans3t!="")
										view(8)<<"\white[src]: \font [src.trans3t]"
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
									if(src.crater_on)
										new/obj/techs/Overlays/Crater_Center(src.loc)
									sleep(20)
									if(src.crater_on)
										new/obj/techs/Overlays/Crater_Center(src.loc)
									src.powerlevel_max *= 7
									src.ki_max *= 7
									src.kidefense_max*=7
									src.strength_max *= 7
									src.defence_max *= 8
									src.speed_max-=1000
									if(src.speed_max<1000)
										src.speed_max=1000
									src.speed=src.speed_max
									src.critical_max += rand(2,6)
									src.dodge_max += rand(2,6)
									src.reflect_max += rand(2,6)
									src.block_max += rand(2,6)
									src.counter_max += rand(2,6)
									src.powerlevel = src.powerlevel_max
									src.ki = src.ki_max
									src.kidefense=src.kidefense_max
									src.strength = src.strength_max
									src.defence = src.defence_max
									src.critical = src.critical_max
									src.dodge = src.dodge_max
									src.reflect = src.reflect_max
									src.block = src.block_max
									src.overlays -= 'Elec Blue Small.dmi'
									src.overlays += 'Elec Blue Big.dmi'
									src.underlays -= src.underlays
									src.overlays -= src.aura
									src.Big_Aura()
									for(var/turf/T in view(src,6))
										var/chance = roll(1,20)
										if(chance == 15)
											missile(new/obj/BluePU, src, T)
									src.icon_state = ""
									src.icon = 'Mistic Form5.dmi'
									src.form_6 = 1
									src.frozen = 0
									src.spam_delay=0
									src.trans_delay=0
									src.doing = 0
									return

mob/proc/NamekMysticRevert()
	if(src.form_1)
		src.frozen = 1
		src.icon_state = "enrage"
		sleep(10)
		src.doing = 0
		src.form_1 = 0
		src.form_2 = 0
		src.form_3 = 0
		src.form_4 = 0
		src.form_5 = 0
		src.form_6 = 0
		src.icon = 'Mistic.dmi'
		src.overlays -= 'Elec Blue Dark.dmi'
		src.overlays -= 'Elec Blue Big.dmi'
		src.overlays -= 'Elec Red Big.dmi'
		src.Power_Redefine()
		oview() << "[src.name] has reverted from his Transformed state."
		src.icon_state = ""
		src.frozen = 0
		return
	else
		return
