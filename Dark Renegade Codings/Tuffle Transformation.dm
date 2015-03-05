mob/var/obtain_super=0
mob/var/obtain_super_2=0
mob/proc/TuffleTrans()
	if(doing)return
	else
		if(!form_1)
			if(powerlevel_max>=1000000&&level>=1000)
				doing=1
				icon_state="enrage"
				if(trans1t!="")view(8)<<"\white[src]: \font [trans1t]"
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
				frozen=1
				sleep(20)
				for(var/obj/Technique/InvertPower/T in src)del(T)
				speed_max-=2000
				if(speed_max<1000)speed_max=1000
				speed=speed_max
				powerlevel_max*=5
				ki_max*=5
				kidefense_max*=5
				strength_max*=5
				defence_max*=5
				critical_max+=20
				dodge_max+=20
				reflect_max+=20
				block_max+=20
				counter_max+=20
				Skills_Checker()
				powerlevel=powerlevel_max
				ki=ki_max
				kidefense=kidefense_max
				strength=strength_max
				defence=defence_max
				critical=critical_max
				dodge=dodge_max
				reflect=reflect_max
				block=block_max
				src.Big_Aura()
				for(var/turf/T in view(src,6))
					var/chance = roll(1,20)
					if(chance == 15)
						missile(new/obj/BluePU, src, T)
				icon='Bebi - Form 2.dmi'
				icon_state=""
				underlays-=underlays
				overlays-=aura
				Big_Aura()
				form_1=1
				frozen=0
				spam_delay=0
				trans_delay=0
				doing=0
				VarReset()
				return
		else
			if(!form_2)
				if(powerlevel_max>=10000000&&level>=2500)
					doing=1
					icon_state="enrage"
					if(trans2t!="")view(8)<<"\white[src]: \font [trans2t]"
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
					frozen=1
					sleep(19)
					contents+=new/obj/Transform/Revert
					speed_max-=1000
					if(speed_max<1000)speed_max=1000
					speed=speed_max
					powerlevel_max*=6
					ki_max*=6
					kidefense_max*=6
					strength_max*=6
					defence_max*=6
					critical_max+=35
					dodge_max+=35
					reflect_max+=35
					block_max+=35
					counter_max+=35
					Skills_Checker()
					powerlevel=powerlevel_max
					ki=ki_max
					kidefense=kidefense_max
					strength=strength_max
					defence=defence_max
					critical=critical_max
					dodge=dodge_max
					reflect=reflect_max
					block=block_max
					overlays+='Elec Blue Big.dmi'
					underlays-=underlays
					overlays-=aura
					src.Big_Aura()
					for(var/turf/T in view(src,6))
						var/chance = roll(1,20)
						if(chance == 15)
							missile(new/obj/BluePU, src, T)
					icon='Bebi - Form 3.dmi'
					icon_state=""
					form_2=1
					frozen=0
					doing=0
					trans_delay=0
					spam_delay=0
					permtpsboosted=1
					VarReset()
					return
			else
				if(!form_3)
					if(powerlevel_max>=10000000&&level>=5000)
						doing=1
						icon_state="enrage"
						if(trans3t!="")view(8)<<"\white[src]: \font [trans3t]"
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
						frozen=1
						sleep(19)
						if(crater_on)new/obj/techs/Overlays/Crater_Center(loc)
						speed-=1000
						if(speed<1000)speed=1000
						Power_Redefine()
						powerlevel=powerlevel_max
						ki=ki_max
						powerlevel*=3
						ki*=3
						kidefense*=3
						strength*=3
						defence*=3
						SkillsReset()
						critical+=5
						dodge+=5
						reflect+=5
						block+=5
						counter+=5
						Skills_Checker()
						overlays-='Elec Blue Big.dmi'
						overlays+='Elec Red Big.dmi'
						underlays-=underlays
						overlays-=aura
						Big_Aura()
						src.Big_Aura()
						for(var/turf/T in view(src,6))
							var/chance = roll(1,20)
							if(chance == 15)
								missile(new/obj/BluePU, src, T)
						icon_state=""
						form_3=1
						frozen=0
						spam_delay=0
						trans_delay=0
						VarReset()
						doing=0
						return
				else
					if(!src.form_4)
						if(src.powerlevel_max >= 100000000 && src.level >= 10000)
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
							src.powerlevel *= 7
							src.ki *= 10
							src.kidefense*=10
							src.strength *= 6
							src.defence *= 5
							src.speed-=1000
							if(src.speed<1000)
								src.speed=1000
							src.critical += rand(2,6)
							src.dodge += rand(2,6)
							src.reflect += rand(2,6)
							src.block += rand(2,6)
							src.counter += rand(2,6)
							src.overlays -= 'Elec Blue Big.dmi'
							src.overlays += 'Elec Red Big.dmi'
							src.underlays -= src.underlays
							src.overlays -= src.aura
							src.Big_Aura()
							for(var/turf/T in view(src,6))
								var/chance = roll(1,20)
								if(chance == 15)
									missile(new/obj/BluePU, src, T)
							src.icon_state = ""
							src.icon='BebiForm2.dmi'
							src.form_4 = 1
							src.frozen = 0
							src.spam_delay=0
							src.trans_delay=0
							src.doing = 0
							return
					else
						if(!src.form_5)
							if(src.powerlevel_max >= 50000000 && src.level >= 25000)
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
								src.powerlevel *= 7
								src.ki *= 10
								src.kidefense*=10
								src.strength *= 6
								src.defence *= 5
								src.speed-=1000
								if(src.speed<1000)
									src.speed=1000
								src.critical += rand(2,6)
								src.dodge += rand(2,6)
								src.reflect += rand(2,6)
								src.block += rand(2,6)
								src.counter += rand(2,6)
								src.overlays -= 'Elec Blue Big.dmi'
								src.overlays += 'Elec Red Big.dmi'
								src.underlays -= src.underlays
								src.overlays -= src.aura
								src.Big_Aura()
								for(var/turf/T in view(src,6))
									var/chance = roll(1,20)
									if(chance == 15)
										missile(new/obj/BluePU, src, T)
								src.icon_state = ""
								src.icon='Bebi-Form 5.dmi'
								src.form_5 = 1
								src.frozen = 0
								src.spam_delay=0
								src.trans_delay=0
								src.doing = 0
								return