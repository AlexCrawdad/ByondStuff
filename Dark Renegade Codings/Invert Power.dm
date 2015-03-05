obj/Technique/InvertPower
	verb/Invert_Power()
		set category = "Combat"
		if(usr.doing||usr.kaioken||usr.KO)return
		else
			if(!usr.form_1)
				if(!usr.inverted)
					if(usr.powerlevel_max>=1000000)
						if(usr.legendarysword)
							usr<<"You cannot transform while wielding the Legendary Sword."
							return
						usr.AllTranse()
						usr.inverted=1
						usr.safe=1
						usr.doing=1
						usr.training=1
						usr.icon_state="enrage"
						if(usr.trans1t!="")view(8)<<"\white[usr]: \font [usr.trans1t]"
						usr.frozen=1
						sleep(20)
						view(8)<<"\white[usr]'s power surges as it goes inverted!"
						usr.Power_Redefine()
						usr.powerlevel=usr.powerlevel_max
						usr.ki=usr.ki_max
						usr.critical=usr.critical_max
						usr.dodge=usr.dodge_max
						usr.reflect=usr.reflect_max
						usr.block=usr.block_max
						usr.powerlevel*=30
						usr.ki*=30
						usr.kidefense*=30
						usr.strength*=30
						usr.defence*=20
						usr.block+=10
						usr.dodge+=10
						usr.critical+=10
						usr.reflect+=10
						usr.counter+=10
						usr.Skills_Checker()
						usr.InvertMasteryMultiplier()
						usr.speed=usr.speed_max-3000
						if(usr.speed<1000)usr.speed=1000
						usr.icon_state=""
						if(usr.crater_on)new/obj/techs/Overlays/Crater_Center(usr.loc)
						usr.overlays+='Elec White.dmi'
						usr.frozen=0
						usr.doing=0
						if(!usr.wait_room)usr.safe=0
						usr.training=0
						usr.lightning=0
						return
				else
					usr.doing=1
					usr.InvertRevert()
			else
				usr<<"You cannot invert in a transformed state."
				return
mob/proc/InvertRevert()
	if(KO)return
	if(inverted)
		frozen=1
		training=1
		icon_state="enrage"
		sleep(10)
		inverted=0
		aura_on=0
		underlays-=aura
		overlays-='Elec White.dmi'
		SkillsReset()
		Power_Redefine()
		powerlevel=powerlevel_max
		ki=ki_max
		view(8)<<"[src] has reverted from their transformed state."
		icon_state=""
		frozen=0
		doing=0
		trans_delay=0
		training=0
		speed=speed_max-1000
		if(speed<1000)speed=1000
		return
	return