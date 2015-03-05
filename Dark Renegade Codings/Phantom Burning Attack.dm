obj
	Technique
		PhantomBurning
			verb
				Phantom_Burning_Attack()
					set category="Techniques"
					set src in usr.contents
					set name = "Phantom Burning Blast"
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
					view(6)<<"\white[usr]: Phantom BURNING..."
					sleep(12)
					view(6)<<"\white[usr]: ...ATTACK!!! HAAAHH!!"
					spawn(1)
						usr.frozen=0
						usr.doing=0
						usr.using=0
					spawn(8)if(usr)usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					setpower+=(usr.level*1.25+(usr.ki_skill/1.5))*(usr.kiuse/20)
					if(usr.legendary_chromosome)A.TechAttackStraight(usr,"Phantom Burning Attack",usr.ki*usr.kiuse+setpower,'ID Techs.dmi',"8",0)
					else A.TechAttackStraight(usr,"Phantom Burning Attack",usr.ki*usr.kiuse+setpower,'ID Techs.dmi',"8",0)