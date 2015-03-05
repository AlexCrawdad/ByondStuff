mob
	var
		changlingmetal=0
		changlingmecha=0
mob/proc/GoToKingCold()
	if(race!="Changeling"||talking)return
	talking=1
	if(!gonemetal)
		var/luck=rand(1,1000)
		if(luck>=900)
			talking=0
			dead=0
			overlays -= 'Halo.dmi'
			overlays -= 'Halo.dmi'
			overlays -= 'Halo.dmi'
			it_blocked=1
			it_lock=1
			loc=locate(167,194,1)
			return TRUE
		else return FALSE
	else
		talking=0
		dead=0
		overlays -= 'Halo.dmi'
		it_blocked=1
		it_lock=1
		loc=locate(167,194,1)
		return TRUE
mob/proc/GiveMetalBoost(T)
	icon_state="enrage"
	src<<"\white King Cold: \font Yes... That's it..."
	doing=1
	frozen=1
	sleep(40)
	powerlevel_max*=1.5
	ki_max*=1.5
	kidefense_max*=1.5
	strength_max*=1.5
	defence_max*=1.5
	powerlevel=powerlevel_max
	ki=ki_max
	kidefense=kidefense_max
	strength=strength_max
	defence=defence_max
	speed_max=1000
	speed=1000
	src<<"\white King Cold: \font Perfect! A complete success!"
	gonemetal=1
	overlays -= 'Elec Blue Small.dmi'
	overlays -= 'Elec Blue Big.dmi'
	overlays -= 'Elec Red Big.dmi'
	if(T=="Mecha")
		icon='Changling - Mecha.dmi'
		changlingmecha=1
	else
		icon='Changling - Metal.dmi'
		changlingmetal=1
	form_6=1
	for(var/obj/Technique/FusionDance/F in src)del(F)
	learn_fusiondance=2
	dead=0
	doing=0
	boxing=0
	dualtrain=0
	icon_state=""
	overlays -= 'Halo.dmi'
	talking=0
	dead=0
	it_blocked=0
	it_lock=0
	frozen=0
	loc=locate(167,194,1)
	spawn(20)if(src)RegenerateAndro()
mob
	var
		gonemetal=0
	NPC
		King_Cold
			name="{NPC}King Cold"
			icon_state="King Cold"
			density=1
			it_blocked=1
			itspecialblocked = 1
			verb
				Talk()
					set category=null
					set src in oview(2)
					if(usr.talking)return
					usr.talking=1
					if(usr.potara_fused)
						usr.talking=0
						usr.dead=0
						usr.it_blocked=0
						usr.it_lock=0
						usr.overlays -= 'Halo.dmi'
						usr.loc=locate(167,194,1)
						return
					if(usr.race!="Changeling")
						usr.talking=0
						usr.dead=0
						usr.it_blocked=0
						usr.it_lock=0
						usr.overlays -= 'Halo.dmi'
						usr.loc=locate(167,194,1)
						return
					if(!usr.gonemetal)
						alert("Hello, [usr]. Welcome to my humble space ship. Let's go straight to the point. You were dispatched here \
for a reason. I've been working on a few experiments of my own, and I've come up with something that could immensively increase our powers! \
I call it: 'Metal Fusion'. All I need now to complete my tests, is a volunteer.")
						switch(alert("[usr], what do you say? Want to give it a shot?","","Yes","No"))
							if("No")
								usr<<"\white King Cold: \font Very well..."
								usr.talking=0
								usr.dead=0
								usr.it_blocked=0
								usr.it_lock=0
								usr.loc=locate(167,194,1)
								usr.powerlevel=usr.powerlevel_max
								usr.ki=usr.ki_max
								usr.stamina=usr.stamina_max
								usr.safe=1
								spawn(15)if(usr)usr.safe=0
								usr.overlays -= 'Halo.dmi'
							if("Yes")
								switch(alert(usr,"Select wich type you want:","","Mecha","Metal"))
									if("Mecha")usr.GiveMetalBoost("Mecha")
									if("Metal")usr.GiveMetalBoost("Metal")
							else usr.talking=0
					else
						usr.talking=0
						usr.dead=0
						usr.it_blocked=0
						usr.it_lock=0
						usr.overlays -= 'Halo.dmi'
						usr.loc=locate(167,194,1)