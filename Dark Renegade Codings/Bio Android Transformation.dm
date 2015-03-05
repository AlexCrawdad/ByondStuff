mob/proc/BioTrans()
	if(doing)return
	else
		if(!form_1)
			if(powerlevel_max>=100000000&&absorb_kill>=10&&level>=300)
				doing=1
				icon_state="enrage"
				frozen=1
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
				for(var/obj/Technique/InvertPower/T in src)del(T)
				powerlevel_max*=5
				ki_max*=5
				strength_max*=5
				defence_max*=5
				kidefense_max*=5
				critical_max+=20
				dodge_max+=20
				reflect_max+=20
				block_max+=20
				counter_max+=20
				Skills_Checker()
				speed_max-=1000
				if(speed_max<1000)speed_max=1000
				speed=speed_max
				powerlevel=powerlevel_max
				ki=ki_max
				kidefense=kidefense_max
				strength=strength_max
				defence=defence_max
				critical=critical_max
				dodge=dodge_max
				reflect=reflect_max
				block=block_max
				for(var/turf/T in view(src,6))
					var/chance = roll(1,20)
					if(chance == 15)
						missile(new/obj/GreenPU, src, T)
				icon_state=""
				icon='Bio Android - Form 2.dmi'
				underlays-=underlays
				overlays-=aura
				Big_Aura()
				form_1=1
				frozen=0
				doing=0
				if(!wait_room)safe=0
				VarReset()
				return
		else
			if(!form_2)
				if(powerlevel_max>=1000000000&&absorb_kill>=30&&level>=800)
					for(var/obj/Technique/Absorb/T in src)del(T)
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
					if(src.crater_on)
						new/obj/techs/Overlays/Crater_Center(src.loc)
					frozen=1
					sleep(20)
					powerlevel_max*=6
					ki_max*=6
					kidefense_max*=6
					strength_max*=6
					defence_max*=6
					critical_max+=30
					dodge_max+=30
					reflect_max+=30
					block_max+=30
					counter_max+=30
					Skills_Checker()
					speed_max-=1000
					if(speed_max<1000)speed_max=1000
					speed=speed_max
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
					Big_Aura()
					for(var/turf/T in view(src,6))
						var/chance = roll(1,20)
						if(chance == 15)
							missile(new/obj/GreenPU, src, T)
					icon_state=""
					icon='Bio Android - Form 3.dmi'
					form_2=1
					frozen=0
					doing=0
					if(!wait_room)safe=0
					VarReset()
					permtpsboosted=1
					return
			else
				if(!form_3)
					if(powerlevel_max>=10000000000&&level>=1300)
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
						frozen=1
						sleep(8)
						if(crater_on)new/obj/techs/Overlays/Crater_Center(loc)
						if(powerlevel>src.powerlevel_max)powerlevel=powerlevel_max
						if(ki>ki_max)ki=ki_max
						if(kidefense>kidefense_max)kidefense=kidefense_max
						if(strength>strength_max)strength=strength_max
						if(defence>defence_max)defence=defence_max
						SkillsReset()
						Power_Redefine()
						powerlevel=powerlevel_max
						ki=ki_max
						powerlevel*=3
						ki*=3
						strength*=3
						defence*=3
						kidefense*=3
						block+=15
						dodge+=15
						critical+=15
						reflect+=15
						counter+=15
						Skills_Checker()
						underlays-=underlays
						overlays-=aura
						overlays-='Elec Blue Big.dmi'
						overlays+='Elec Red Big.dmi'
						Big_Aura()
						speed=speed_max-1000
						if(speed<1000)speed=1000
						for(var/turf/T in view(src,6))
							var/chance = roll(1,20)
							if(chance == 15)
								missile(new/obj/GreenPU, src, T)
						icon_state=""
						icon='Bio Android - Form 4.dmi'
						form_3=1
						frozen=0
						doing=0
						if(!wait_room)safe=0
						VarReset()
						return