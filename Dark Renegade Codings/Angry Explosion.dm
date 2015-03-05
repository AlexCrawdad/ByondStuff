obj/Technique/AngryExplosion
	verb
		Angry_Explosion()
			set category = "Techniques"
			if(usr.tech_cooldown)
				usr<<"You must cooldown."
				return
			if(usr.doing)
				usr<<"You are doing something."
				return
			if(usr.frozen)
				usr<<"You can't move right now."
				return
			if(usr.ki<50000)
				usr<<"Your ki is too low."
				return
			if(usr.ki_lock)
				src<<"You can't use ki right now."
				return
			if(usr.safe)
				usr<<"You can't attack right now."
				return
			if(!usr.pk)
				usr<<"You are not a combatant!"
				return
			if(usr.race=="Majin")
				usr.icon_state="enrage"
				usr.frozen=1
				usr.doing=1
				usr.tech_cooldown=1
				sleep(30)
				for(var/mob/M in oview(8,usr))
					var/damage=usr.ki*2
					new/obj/techs/Overlays/Crater_Center(usr.loc)
					if((!M.dead&&!M.safe&&M.pk))
						var/chance1 = rand(1,100)
						var/chance2= rand(1,100)
						var/damage1=(damage*chance1*0.01)-(M.kidefense*chance2*0.01)
						if(damage1 < 0)damage1 = ((damage*0.0001))*chance1
						if(damage1 < 1)damage1 = 1
						M << "<font color=red>You took [damage1] damage!"
						if(usr.damage_enabled)usr<<"<font color=red>You caused [damage1] to [M]!"
						M.powerlevel-=damage1
						M.DeathCheck(usr)
				usr.ANGRY()
				return
mob
	proc
		ANGRY()
			powerlevel=50
			ki=0
			rest=0
			frozen=1
			boxing=0
			doing=0
			icon_state="Dead"
			regen_dead=1
			doing=0
			frozen=0
			spawn(70)if(src)tech_cooldown=0