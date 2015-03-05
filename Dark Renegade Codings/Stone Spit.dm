mob/var/tmp/spit_locked=0
obj/Technique/StoneSpit
	verb/Stone_Spit(mob/M in oview(6))
		set category="Techniques"
		var/ki_cost=round(usr.ki_max*0.32)
		if(usr.buku)return
		else
			if(M.safe)
				usr<<"A force stops you from attacking [M]!"
				return
			if(usr.buku||M.buku||usr.dead)return
			if(usr.safe)
				usr<<"You are currently safe and cannot attack."
				return
			if(usr.spit_locked)
				usr<<"You must wait before using this technique again!"
				return
			if(!M.pk)
				usr<<"[M] Must be a combatant to engage in combat with players!"
				return
			if(!usr.pk)
				usr<<"You are not a combatant!"
				return
			if(usr.ki>=ki_cost)
				usr.spit_locked=1
				usr.doing=1
				usr.ki-=ki_cost
				usr.overlays+=usr.spit_charge
				sleep(6)
				usr.overlays-=usr.spit_charge
				usr.icon_state="attack"
				sleep(5)
				usr.icon_state=""
				M.overlays+=M.stone_spit
				M.frozen=1
				M.attack_lock=1
				M.ki_lock=1
				M.stone_form=1
				M.kidefense*=2
				M.defence*=2
				view(6)<<"<font size=1><B>[M] has been turned into stone!"
				usr.spit_lock()
				M.spit_unlock()
			else return
mob/proc/spit_lock()
	doing=0
	spawn(150)if(src)spit_locked=0
mob/proc/spit_unlock()
	sleep(50)
	if(!src)return
	view(6)<<"<font size=1><B>[src] has broken through the stone!"
	overlays-=stone_spit
	frozen=0
	attack_lock=0
	buku=0
	ki_lock=0
	stone_form=0
	kidefense/=2
	defence/=2
mob
	var
		spit_charge='Stone Charge.dmi'
		stone_spit='Stone.dmi'
		tmp/stone_form=0