mob/proc/AndroidTrans()
	if(doing||cant_trans)return
	else
		if(!form_1)
			if(powerlevel_max>=1000000&&chips>=5)
				cant_trans=1
				doing=1
				icon_state="enrage"
				if(trans1t!="")view(8)<<"\white[src]: \font [src.trans1t]"
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
				sleep(25)
				for(var/obj/Technique/InvertPower/T in src)del(T)
				powerlevel_max*=6
				ki_max*=6
				kidefense_max*=6
				strength_max*=6
				defence_max*=6
				critical_max+=15
				dodge_max+=15
				reflect_max+=15
				block_max+=15
				counter_max+=15
				Skills_Checker()
				if(speed_max>2000)
					speed_max=2000
					speed=2000
				overlays+='Elec Light Blue.dmi'
				underlays-=underlays
				overlays-=aura
				Big_Aura()
				powerlevel=powerlevel_max
				ki=ki_max
				kidefense=kidefense_max
				strength=strength_max
				defence=defence_max
				for(var/turf/T in view(src,6))
					var/chance = roll(1,20)
					if(chance == 15)
						missile(new/obj/BluePU, src, T)
				icon_state=""
				form_1=1
				icon='Android13form2.dmi'
				frozen=0
				doing=0
				if(!wait_room)safe=0
				trans_delay=0
				spam_delay=0
				lightning=0
				windeffect=0
				spawn(40)if(src)cant_trans=0
				return
		else
			if(!form_2)
				if(!doing)
					if(!cant_trans)
						if(powerlevel_max>=10000000&&chips>=10)
							doing=1
							icon_state="enrage"
							if(trans2t!="")view(8)<<"\white[src]: \font [trans2t]"
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
							sleep(25)
							powerlevel_max*=9
							ki_max*=9
							kidefense_max*=9
							strength_max*=9
							defence_max*=9
							critical_max+=35
							dodge_max+=35
							reflect_max+=35
							block_max+=35
							counter_max+=35
							Skills_Checker()
							if(speed_max>1000)speed_max=1000
							speed=speed_max
							underlays-=underlays
							overlays-=aura
							Big_Aura()
							overlays-='Elec Light Blue.dmi'
							powerlevel=powerlevel_max
							ki=ki_max
							kidefense=kidefense_max
							strength=strength_max
							defence=defence_max
							overlays+='androidelec.dmi'
							overlays-=hair
							overlays-=hair
							overlays-=hair
							overlays-=hair
							overlays-=hair_icon
							overlays-=hair_icon
							overlays-=hair_icon
							overlays+='Hair - Android.dmi'
							for(var/turf/T in view(src,6))
								var/chance = roll(1,20)
								if(chance == 15)
									missile(new/obj/BluePU, src, T)
							icon_state=""
							form_2=1
							icon='Android13form3.dmi'
							frozen=0
							doing=0
							spam_delay=0
							permtpsboosted=1
							trans_delay=0
							if(!wait_room)safe=0
							VarReset()
							return
			else
				if(!form_3)
					if(!doing)
						if(!cant_trans)
							if(powerlevel_max>= 100000000 &&chips>=10)
								doing=1
								icon_state="enrage"
								if(trans3t!="")view(8)<<"\white[src]: \font [trans3t]"
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
								sleep(25)
								powerlevel_max*=9
								ki_max*=9
								kidefense_max*=9
								strength_max*=9
								defence_max*=9
								critical_max+=35
								dodge_max+=35
								reflect_max+=35
								block_max+=35
								counter_max+=35
								Skills_Checker()
								if(speed_max>1000)speed_max=1000
								speed=speed_max
								underlays-=underlays
								overlays-=aura
								Big_Aura()
								overlays-='Elec Light Blue.dmi'
								powerlevel=powerlevel_max
								ki=ki_max
								kidefense=kidefense_max
								strength=strength_max
								defence=defence_max
								overlays+='androidelec.dmi'
								overlays-=hair
								overlays-=hair
								overlays-=hair
								overlays-=hair
								overlays-=hair_icon
								overlays-=hair_icon
								overlays-=hair_icon
								overlays+='Hair - Android.dmi'
								for(var/turf/T in view(src,6))
									var/chance = roll(1,20)
									if(chance == 15)
										missile(new/obj/BluePU, src, T)
								icon_state=""
								form_3=1
								icon='Android13form3.dmi'
								frozen=0
								doing=0
								spam_delay=0
								permtpsboosted=1
								trans_delay=0
								if(!wait_room)safe=0
								VarReset()
								return
				else
					if(!form_4)
						if(!doing)
							if(!cant_trans)
								if(powerlevel_max>=1000000000&&chips>=10)
									doing=1
									icon_state="enrage"
									if(trans4t!="")view(8)<<"\white[src]: \font [trans4t]"
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
									for(var/obj/Transform/Transform/T in src)del(T)
									if(crater_on)new/obj/techs/Overlays/Crater_Center(loc)
									powerlevel_max*=9
									ki_max*=9
									kidefense_max*=9
									strength_max*=9
									defence_max*=9
									critical_max+=35
									dodge_max+=35
									reflect_max+=35
									block_max+=35
									counter_max+=35
									Skills_Checker()
									if(speed_max>1000)speed_max=1000
									speed=speed_max
									underlays-=underlays
									overlays-=aura
									Big_Aura()
									overlays-='Elec Light Blue.dmi'
									powerlevel=powerlevel_max
									ki=ki_max
									kidefense=kidefense_max
									strength=strength_max
									defence=defence_max
									overlays+='androidelec.dmi'
									overlays-=hair
									overlays-=hair
									overlays-=hair
									overlays-=hair
									overlays-=hair_icon
									overlays-=hair_icon
									overlays-=hair_icon
									overlays+='Hair - Android.dmi'
									for(var/turf/T in view(src,6))
										var/chance = roll(1,20)
										if(chance == 15)
											missile(new/obj/BluePU, src, T)
									icon_state=""
									form_4=1
									icon='Android13form4.dmi'
									frozen=0
									doing=0
									spam_delay=0
									permtpsboosted=1
									trans_delay=0
									if(!wait_room)safe=0
									VarReset()
									return