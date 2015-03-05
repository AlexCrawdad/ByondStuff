obj/Technique/BurningStar
	verb
		Burning_Star(mob/M in oview(6))
			set category = "Techniques"
			set src in usr.contents
			if(usr.dead)
				usr<<"You are dead."
				return
			if(usr.tech_cooldown)
				usr<<"You must cooldown."
				return
			if(usr.doing)
				usr<<"You are doing something."
				return
			if(usr.frozen)
				usr<<"You can't move right now."
				return
			if(usr.ki<500)
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
			usr.using=1
			usr.doing=1
			usr.tech_cooldown=1
			usr.frozen=1
			view(6) << "<font color=white>[usr]: ...Burning"
			sleep(10)
			view(6) << "<font color=white>[usr]: ...STAR...BAM!!"
			sleep(15)
			view(6) << "<font color=white>[usr]: HAAAAH!!!!"
			spawn(1)
			usr.frozen=0
			usr.doing=0
			usr.using=0
			spawn(8)if(usr)usr.tech_cooldown=0
			var/obj/Tech/BeamH/A=new
			src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/50)
			if(usr.legendary_chromosome)A.TechAttackHoming(usr,"Burning Star",usr.ki*usr.kiuse+src.setpower,'Shooting Star.dmi',"",0)
			else A.TechAttackHoming(usr,"Burning Star",usr.ki*usr.kiuse+src.setpower,'Shooting Star.dmi',"",0)



