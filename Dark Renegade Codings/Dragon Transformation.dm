mob/proc/DragonChaosTrans()
	if(doing)return
	else
		if(!form_1)
			if(powerlevel_max>=100000000&&level>=10000)
				if(e_db_1&&e_db_2&&e_db_3&&e_db_4&&e_db_5&&e_db_6&&e_db_7)
					e_db_1=0
					e_db_2=0
					e_db_3=0
					e_db_4=0
					e_db_5=0
					e_db_6=0
					e_db_7=0
					for(var/obj/Earth_Dragonballs/O in src)del(O)
					for(var/obj/Technique/InvertPower/T in src)del(T)
					DBNIGHT()
					world<<"<font color = green>The sky darkens as Shenron is summoned!</font>"
					src<<browse('Shenron.png',"display=0")
					src<<browse("<body bgcolor=\"black\"><center><img src=Shenron.BMP><p><font color = \"yellow\" size = 4>You have summoned Shenron! </center>")
					spawn(1)world.Earth_Dragonball_Spawn(3000)
					sleep(15)
					src<<browse(null)
					world<<"<font color = green>The sky turns to it's normal color as Shenron grants the wish and departs away!</font>"
					DBDAY()
					doing = 1
					icon_state = "enrage"
					if(trans1t!="")view(8)<<"\white[src]: \font [trans1t]"
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
					frozen = 1
					sleep(35)
					powerlevel_max *= 30
					ki_max *= 30
					kidefense_max*= 30
					strength_max *= 30
					defence_max *= 30
					critical_max += 65
					dodge_max += 45
					reflect_max += 50
					block_max += 60
					counter_max += 50
					Skills_Checker()
					speed = 1
					speed_max = 1
					powerlevel = powerlevel_max
					ki = ki_max
					kidefense=kidefense_max
					strength = strength_max
					defence = defence_max
					critical = critical_max
					dodge = dodge_max
					reflect = reflect_max
					block = block_max
					underlays -= underlays
					overlays -= aura
					Big_Aura()
					for(var/turf/T in view(src,6))
						var/chance = roll(1,20)
						if(chance == 15)
							missile(new/obj/BluePU, src, T)
					icon = 'Dragon - Form 5.dmi'
					overlays += 'Dragon Electric.dmi'
					icon_state = ""
					form_1 = 1
					frozen = 0
					spam_delay=0
					doing = 0
					if(!wait_room)safe=0
					VarReset()
					src.TransformMasteryMultiplier()
					permtpsboosted=1
					return
		else
			if(!form_2)
				if(powerlevel_max>=100000000&&level>=1000)
					if(e_db_1&&e_db_2&&e_db_3&&e_db_4&&e_db_5&&e_db_6&&e_db_7)
						e_db_1=0
						e_db_2=0
						e_db_3=0
						e_db_4=0
						e_db_5=0
						e_db_6=0
						e_db_7=0
						for(var/obj/Earth_Dragonballs/O in src)del(O)
						DBNIGHT()
						world<<"<font color = green>The sky darkens as Shenron is summoned!</font>"
						src<<browse('Shenron.png',"display=0")
						src<<browse("<body bgcolor=\"black\"><center><img src=Shenron.BMP><p><font color = \"yellow\" size = 4>You have summoned Shenron! </center>")
						spawn(1)world.Earth_Dragonball_Spawn(3000)
						sleep(15)
						src<<browse(null)
						world<<"<font color = green>The sky turns to it's normal color as Shenron grants the wish and departs away!</font>"
						DBDAY()
						doing = 1
						icon_state = "enrage"
						if(trans2t!="")view(8)<<"\white[src]: \font [trans2t]"
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
						frozen = 1
						sleep(35)
						powerlevel_max *= 30
						ki_max *= 30
						kidefense_max*= 30
						strength_max *= 30
						defence_max *= 30
						critical_max += 65
						dodge_max += 45
						reflect_max += 50
						block_max += 60
						counter_max += 50
						Skills_Checker()
						speed = 1
						speed_max = 1
						powerlevel = powerlevel_max
						ki = ki_max
						kidefense=kidefense_max
						strength = strength_max
						defence = defence_max
						critical = critical_max
						dodge = dodge_max
						reflect = reflect_max
						block = block_max
						underlays -= underlays
						overlays -= aura
						Big_Aura()
						for(var/turf/T in view(src,6))
							var/chance = roll(1,20)
							if(chance == 15)
								missile(new/obj/BluePU, src, T)
						icon = 'Dragon - Form 3.dmi'
						overlays += 'Dragon Electric.dmi'
						icon_state = ""
						form_2 = 1
						frozen = 0
						spam_delay=0
						doing = 0
						if(!wait_room)safe=0
						VarReset()
						src.TransformMasteryMultiplier()
						permtpsboosted=1
						return
			else
				if(!form_3)
					if(powerlevel_max>=1000000000&&level>=1000)
						if(e_db_1&&e_db_2&&e_db_3&&e_db_4&&e_db_5&&e_db_6&&e_db_7)
							e_db_1=0
							e_db_2=0
							e_db_3=0
							e_db_4=0
							e_db_5=0
							e_db_6=0
							e_db_7=0
							for(var/obj/Earth_Dragonballs/O in src)del(O)
							DBNIGHT()
							world<<"<font color = green>The sky darkens as Shenron is summoned!</font>"
							src<<browse('Shenron.png',"display=0")
							src<<browse("<body bgcolor=\"black\"><center><img src=Shenron.BMP><p><font color = \"yellow\" size = 4>You have summoned Shenron! </center>")
							spawn(1)world.Earth_Dragonball_Spawn(3000)
							sleep(15)
							src<<browse(null)
							world<<"<font color = green>The sky turns to it's normal color as Shenron grants the wish and departs away!</font>"
							DBDAY()
							doing = 1
							icon_state = "enrage"
							if(trans3t!="")view(8)<<"\white[src]: \font [trans3t]"
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
							frozen = 1
							sleep(35)
							powerlevel_max *= 30
							ki_max *= 30
							kidefense_max*= 30
							strength_max *= 30
							defence_max *= 30
							critical_max += 65
							dodge_max += 45
							reflect_max += 50
							block_max += 60
							counter_max += 50
							Skills_Checker()
							speed = 1
							speed_max = 1
							powerlevel = powerlevel_max
							ki = ki_max
							kidefense=kidefense_max
							strength = strength_max
							defence = defence_max
							critical = critical_max
							dodge = dodge_max
							reflect = reflect_max
							block = block_max
							underlays -= underlays
							overlays -= aura
							Big_Aura()
							for(var/turf/T in view(src,6))
								var/chance = roll(1,20)
								if(chance == 15)
									missile(new/obj/BluePU, src, T)
							icon = 'Dragon - Form 4.dmi'
							overlays += 'Dragon Electric.dmi'
							icon_state = ""
							form_3 = 1
							frozen = 0
							spam_delay=0
							doing = 0
							if(!wait_room)safe=0
							VarReset()
							src.TransformMasteryMultiplier()
							permtpsboosted=1
							return
				else
					if(!form_4)
						if(powerlevel_max>=10000000000&&level>=1000)
							if(e_db_1&&e_db_2&&e_db_3&&e_db_4&&e_db_5&&e_db_6&&e_db_7)
								e_db_1=0
								e_db_2=0
								e_db_3=0
								e_db_4=0
								e_db_5=0
								e_db_6=0
								e_db_7=0
								for(var/obj/Earth_Dragonballs/O in src)del(O)
								DBNIGHT()
								world<<"<font color = green>The sky darkens as Shenron is summoned!</font>"
								src<<browse('Shenron.png',"display=0")
								src<<browse("<body bgcolor=\"black\"><center><img src=Shenron.BMP><p><font color = \"yellow\" size = 4>You have summoned Shenron! </center>")
								spawn(1)world.Earth_Dragonball_Spawn(3000)
								sleep(15)
								src<<browse(null)
								world<<"<font color = green>The sky turns to it's normal color as Shenron grants the wish and departs away!</font>"
								DBDAY()
								doing = 1
								icon_state = "enrage"
								if(trans4t!="")view(8)<<"\white[src]: \font [trans4t]"
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
								frozen = 1
								sleep(35)
								powerlevel_max *= 30
								ki_max *= 30
								kidefense_max*= 30
								strength_max *= 30
								defence_max *= 30
								critical_max += 65
								dodge_max += 45
								reflect_max += 50
								block_max += 60
								counter_max += 50
								Skills_Checker()
								speed = 1
								speed_max = 1
								powerlevel = powerlevel_max
								ki = ki_max
								kidefense=kidefense_max
								strength = strength_max
								defence = defence_max
								critical = critical_max
								dodge = dodge_max
								reflect = reflect_max
								block = block_max
								underlays -= underlays
								overlays -= aura
								Big_Aura()
								for(var/turf/T in view(src,6))
									var/chance = roll(1,20)
									if(chance == 15)
										missile(new/obj/BluePU, src, T)
								icon = 'Dragon - Form 5.dmi'
								overlays += 'Dragon Electric.dmi'
								icon_state = ""
								form_4 = 1
								frozen = 0
								spam_delay=0
								doing = 0
								if(!wait_room)safe=0
								VarReset()
								src.TransformMasteryMultiplier()
								permtpsboosted=1
								return
					else
						if(!form_5)
							if(powerlevel_max>=100000000000&&level>=1000)
								if(e_db_1&&e_db_2&&e_db_3&&e_db_4&&e_db_5&&e_db_6&&e_db_7)
									e_db_1=0
									e_db_2=0
									e_db_3=0
									e_db_4=0
									e_db_5=0
									e_db_6=0
									e_db_7=0
									for(var/obj/Earth_Dragonballs/O in src)del(O)
									DBNIGHT()
									world<<"<font color = green>The sky darkens as Shenron is summoned!</font>"
									src<<browse('Shenron.png',"display=0")
									src<<browse("<body bgcolor=\"black\"><center><img src=Shenron.BMP><p><font color = \"yellow\" size = 4>You have summoned Shenron! </center>")
									spawn(1)world.Earth_Dragonball_Spawn(3000)
									sleep(15)
									src<<browse(null)
									world<<"<font color = green>The sky turns to it's normal color as Shenron grants the wish and departs away!</font>"
									DBDAY()
									doing = 1
									icon_state = "enrage"
									if(trans4t!="")view(8)<<"\white[src]: \font [trans4t]"
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
									frozen = 1
									sleep(35)
									powerlevel_max *= 30
									ki_max *= 30
									kidefense_max*= 30
									strength_max *= 30
									defence_max *= 30
									critical_max += 65
									dodge_max += 45
									reflect_max += 50
									block_max += 60
									counter_max += 50
									Skills_Checker()
									speed = 1
									speed_max = 1
									powerlevel = powerlevel_max
									ki = ki_max
									kidefense=kidefense_max
									strength = strength_max
									defence = defence_max
									critical = critical_max
									dodge = dodge_max
									reflect = reflect_max
									block = block_max
									underlays -= underlays
									overlays -= aura
									Big_Aura()
									for(var/turf/T in view(src,6))
										var/chance = roll(1,20)
										if(chance == 15)
											missile(new/obj/BluePU, src, T)
									icon = 'Dragon - Form 6.dmi'
									overlays += 'Dragon Electric.dmi'
									icon_state = ""
									form_5 = 1
									frozen = 0
									spam_delay=0
									doing = 0
									if(!wait_room)safe=0
									VarReset()
									src.TransformMasteryMultiplier()
									permtpsboosted=1
									return

mob/proc/DragonChaosRevert()
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
		src.icon = 'Dragon - Form 1.dmi'
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