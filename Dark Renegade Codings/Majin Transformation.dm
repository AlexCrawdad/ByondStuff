mob/proc/MajinTrans()
	if("ki_buff" in buffs)return
	if("pl_buff" in buffs)return
	if("def_buff" in buffs)return
	if("str_buff" in buffs)return
	for(var/obj/Equipment/Buff_Items/STR_Shard/O in contents)if(O.cooldown>0)return
	if(buff3)return
	for(var/obj/Equipment/Buff_Items/DEF_Shard/O in contents)if(O.cooldown>0)return
	if(buff4)return
	for(var/obj/Equipment/Buff_Items/Ki_Shard/O in contents)if(O.cooldown>0)return
	if(buff2)return
	for(var/obj/Equipment/Buff_Items/PL_Shard/O in contents)if(O.cooldown>0)return
	if(buff1)return
	if(doing)return
	else
		if(!form_1)
			if(powerlevel_max>=40000000&&eats>=10)
				doing=1
				frozen=1
				icon_state="enrage"
				if(trans1t!="")view(8)<<"\white[src]: \font [trans1t]"
				AllTranse()
				view(10) << sound('thunder.wav')
				Quake_Effect(src,20,1)
				sleep(20)
				for(var/obj/Technique/InvertPower/T in src)del(T)
				powerlevel_max*=2
				ki_max*=2
				kidefense_max*=2
				strength_max*=2
				defence_max*=2
				critical_max+=10
				dodge_max+=10
				reflect_max+=10
				block_max+=10
				counter_max+=10
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
				icon_state=""
				icon='Majin - Form 2.dmi'
				form_1=1
				frozen=0
				doing=0
				if(!wait_room)safe=0
				spam_delay=0
				VarReset()
				trans_delay=0
				return
		else
			if(!form_2)
				if(powerlevel_max>=70000000&&eats>=20)
					doing=1
					frozen=1
					icon_state="enrage"
					if(trans2t!="")view(8)<<"\white[src]: \font [trans2t]"
					AllTranse()
					Quake_Effect(src,20,1)
					sleep(20)
					powerlevel_max*=3
					ki_max*=2.5
					kidefense_max*=2.5
					strength_max*=2.5
					defence_max*=2.5
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
					overlays-=aura
					underlays-=underlays
					Big_Aura()
					overlays+='Elec Blue Small.dmi'
					icon_state=""
					icon='Majin - Form 3.dmi'
					form_2=1
					frozen=0
					doing=0
					if(!wait_room)safe=0
					spam_delay=0
					trans_delay=0
					VarReset()
					return
			else
				if(!form_3)
					if(powerlevel_max>=122500000&&eats>=30)
						doing=1
						frozen=1
						icon_state="enrage"
						if(trans3t!="")view(8)<<"\white[src]: \font [trans3t]"
						AllTranse()
						view(10) << sound('thunder.wav')
						Quake_Effect(src,20,1)
						sleep(20)
						if(crater_on)new/obj/techs/Overlays/Crater_Center(loc)
						powerlevel_max*=3
						ki_max*=3
						kidefense_max*=3
						strength_max*=3
						defence_max*=3
						critical_max+=5
						dodge_max+=5
						reflect_max+=5
						block_max+=5
						counter_max+=5
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
						overlays-='Elec Blue Small.dmi'
						overlays+='Elec Blue Big.dmi'
						icon_state=""
						icon='Majin - Form 4.dmi'
						form_3=1
						frozen=0
						doing=0
						trans_delay=0
						spam_delay=0
						if(!wait_room)safe=0
						VarReset()
						return
				else
					if(!form_4)
						if(powerlevel_max>=215000000&&eats>=45)
							doing=1
							frozen=1
							icon_state="enrage"
							if(trans4t!="")view(8)<<"\white[src]: \font [trans4t]"
							AllTranse()
							view(10) << sound('thunder.wav')
							Quake_Effect(src,20,1)
							sleep(30)
							for(var/obj/Transform/Transform/T in src)del(T)
							if(crater_on)new/obj/techs/Overlays/Crater_Center(loc)
							powerlevel_max*=3.75
							ki_max*=2.75
							kidefense_max*=2.75
							strength_max*=2.75
							defence_max*=2.75
							critical_max+=25
							dodge_max+=10
							reflect_max+=5
							block_max+=25
							counter_max+=5
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
							overlays-='Elec Blue Big.dmi'
							overlays+='Elec Red Big.dmi'
							icon_state=""
							icon='Majin - Form 5.dmi'
							form_4=1
							frozen=0
							spam_delay=0
							doing=0
							if(!wait_room)safe=0
							trans_delay=0
							permtpsboosted=1
							VarReset()
							return