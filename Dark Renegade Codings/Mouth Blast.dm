obj/Technique/MouthBlast
	verb
		Mouth_Blast()
			set category="Techniques"
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
			usr.frozen=1
			view(6)<<"\white[usr]: MOUTH..."
			sleep(12)
			view(6)<<"\white[usr]: ...BLAST! "
			sleep(3)
			view(6)<<"\white[usr]: HAAA!"
			spawn(1)
				usr.frozen=0
				usr.doing=0
			spawn(8)if(usr)
				usr.tech_cooldown=0
				usr.using=0
			var/obj/Tech/BeamH/A=new
			setpower+=(usr.level*0.45+(usr.ki_skill/1.5))*(usr.kiuse/20)
			if(usr.legendary_chromosome)A.TechAttackStraight(usr,"Mouth Blast",usr.ki*usr.kiuse+setpower,'Blast.dmi',"",0)
			else A.TechAttackStraight(usr,"Mouth Blast",usr.ki*usr.kiuse+setpower,'Blast.dmi',"",0)