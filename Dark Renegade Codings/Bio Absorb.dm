mob/var/absorb_kill=0
obj/Technique/Absorb
	verb/Absorb(mob/M in get_step(usr,usr.dir))
		set category = "Techniques"
		if(!M)return
		if(usr.doing)
			usr<<"You are doing something already!"
			return
		if(usr.dead||M.dead)
			usr<<"A force stops you from attacking [M]!"
			return
		if(usr.safe||M.safe)
			usr<<"A force stops you from attacking [M]!"
			return
		if(!M.npc && M.client.address == usr.client.address)
			usr<<"You cannot life drain yourself!"
			return
		if(!M.pk)
			usr<<"[M] is not a combatant!"
			return
		if(M.FuseFollower)return
		if(!usr.pk)
			usr<<"You are not a combatant!"
			return
		if(!M.KO && M.powerlevel > 0)
			usr<<"[M] must be knocked out first!"
			return
		if(M.powerlevel_max > (100*usr.powerlevel_max))
			usr<<"<font color=red>You try to absorb [M] but your body cannot handle his power"
			return
		else
			var/absorb=0
			var/absorb2=0
			var/absorb3=0
			var/absorb4=0
			var/absorb5=0
			if(istype(M,/mob/PC))
				absorb=round(M.powerlevel_max/usr.level/1500)
				usr<<"<font color=red><i><b>Powerlevel Gained = [absorb]!!"
				absorb2=round(M.ki_max/usr.level/2000)
				usr<<"<font color=red><i><b>Ki Gained = [absorb2]!!"
				absorb3=round(M.strength_max/usr.level/1500)
				usr<<"<font color=red><i><b>Strength Gained = [absorb3]!!"
				absorb4=round(M.defence_max/usr.level/1500)
				usr<<"<font color=red><i><b>Defence Gained = [absorb4]!!"
				absorb5=round(M.kidefense_max/usr.level/2000)
				usr<<"<font color=red><i><b>Ki Defence Gained = [absorb5]!!"
			usr.doing=1
			usr.frozen=1
			spawn(5)if(usr)
				usr.doing=0
				usr.frozen=0
			usr.powerlevel_max+=absorb
			usr.ki_max+=absorb2
			usr.strength_max+=absorb3
			usr.defence_max+=absorb4
			usr.kidefense_max+=absorb5
			M.powerlevel_max-=absorb/2
			M<<"<font color=red><i><b>Powerlevel Lost = [absorb/2]!!"
			M.ki_max-=absorb2/2
			M<<"<font color=red><i><b>Ki Lost = [absorb2/2]!!"
			M.strength_max-=absorb3/2
			M<<"<font color=red><i><b>Strength Lost = [absorb3/2]!!"
			M.defence_max-=absorb4/2
			M<<"<font color=red><i><b>Defence Lost = [absorb4/2]!!"
			M.kidefense_max-=absorb5/2
			M<<"<font color=red><i><b>Ki Defence Lost = [absorb5/2]!!"
			M.powerlevel=0
			usr.absorb_kill+=1
			usr.AbsorbTechs(M)
			M.DeathCheck(usr,"Absorb")
			return