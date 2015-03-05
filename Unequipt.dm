mob/proc/Unequip()
	for(var/obj/O in usr)
		O.suffix=null
		O.equiped=0
	usr.weight=0
	usr.overlays-=usr.overlays
	usr.underlays-=usr.underlays
	usr.head="EMPTY"
	usr.back="EMPTY"
	usr.chest="EMPTY"
	usr.legs="EMPTY"
	usr.feet="EMPTY"
	usr.arms="EMPTY"
	usr.hands="EMPTY"
	usr.waist="EMPTY"
	usr.underclothes="EMPTY"
	usr.clothes="EMPTY"
	usr.clothes_eq=0
	usr.scouter=0
	usr.scouter_eq=0
	usr.armor=0
	usr.armor_eq=0
	usr.under=0
	usr.under_eq=0
	usr.helmet=0
	usr.helmet_eq=0
	usr.gloves=0
	usr.gloves_eq=0
	usr.z_sword=0
	usr.radar=0
	usr.hench_equiped=0
	usr.saiyan_equiped=0
	usr.sellable_items=0
	usr.weightgi = 0
	usr.weightcape = 0
	usr.weightarmor = 0
	usr.weightarm = 0
	usr.weightleg = 0
	usr.weightankle = 0
	usr.weightwrist = 0
	usr.weighthead = 0
	usr.f_armor=0
	if(usr.afk)usr.overlays+='afk.dmi'
	if(usr.sixteenitem)
		usr.powerlevel_max-=20000000
		usr.ki_max-=20000000
		usr.kidefense_max-=20000000
		usr.strength_max-=20000000
		usr.defence_max-=20000000
		usr.sixteenitem=0
	if(usr.supremeitem)
		usr.powerlevel_max-=30000000
		usr.ki_max-=30000000
		usr.kidefense_max-=30000000
		usr.strength_max-=30000000
		usr.defence_max-=30000000
		usr.supremeitem=0
	if(usr.evilitem)
		usr.strength_max-=100000000
		usr.evilitem=0
	if(usr.sauronitem)
		usr.defence_max-=10000000
		usr.strength_max-=10000000
		usr.powerlevel_max-=10000000
		usr.ki_max-=10000000
		usr.sauronitem=0
	if(usr.vegitoitem)
		usr.defence_max-=100000000
		usr.strength_max-=100000000
		usr.powerlevel_max-=100000000
		usr.ki_max-=100000000
		usr.vegitoitem=0
	if(usr.gokuitem)
		usr.defence_max-=500000000
		usr.strength_max-=500000000
		usr.powerlevel_max-=500000000
		usr.ki_max-=500000000
		usr.gokuitem=0
	if(usr.greenmonkitem)
		usr.stamina_max-=1000000
		usr.greenmonkitem=0
	if(usr.redmonkitem)
		usr.strength_max-=1500000000
		usr.redmonkitem=0
	if(usr.yellowmonkitem)
		usr.ki_max-=1500000000
		usr.yellowmonkitem=0
	if(usr.whitemonkitem)
		usr.powerlevel_max-=1500000000
		usr.whitemonkitem=0
	if(usr.greymonkitem)
		usr.defence_max-=1500000000
		usr.kidefense_max-=1500000000
		usr.greymonkitem=0