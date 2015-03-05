mob/proc/HybridTrans()
	if(doing||cant_trans)return
	else
		if(!form_1)
			if(powerlevel_max>=25000000)
				cant_trans=1
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
				if(src.crater_on)
					new/obj/techs/Overlays/Crater_Center(src.loc)
				sleep(20)
				frozen=1
				sleep(25)
				powerlevel_max*=30
				ki_max*=30
				kidefense_max*=30
				strength_max*=30
				defence_max*=30
				critical_max+=55
				dodge_max+=60
				reflect_max+=60
				block_max+=50
				counter_max+=65
				Skills_Checker()
				if(speed_max>2000)speed_max=2000
				speed=speed_max
				overlays+='Elec Light Blue.dmi'
				underlays-=underlays
				overlays-=aura
				powerlevel=powerlevel_max
				ki=ki_max
				kidefense=kidefense_max
				strength=strength_max
				defence=defence_max
				icon_state = ""
				form_1=1
				icon='Ultimate Hybrid Form 2.dmi'
				for(var/turf/T in view(src,6))
					var/chance = roll(1,20)
					if(chance == 15)
						missile(new/obj/GreenPU, src, T)
				frozen=0
				doing=0
				if(!wait_room)safe=0
				trans_delay=0
				permtpsboosted=1
				spam_delay=0
				VarReset()
				Big_Aura()
				spawn(40)if(src)cant_trans=0
				return
