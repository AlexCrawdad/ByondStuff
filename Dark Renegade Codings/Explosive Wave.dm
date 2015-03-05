obj/Technique/ExplosiveWave
	verb
		Explosive_Wave()
			set category = "Techniques"
			if(usr.frozen)
				usr<<"You can't move right now."
				return
			if(usr.ki<50000)
				usr<<"Your ki is too low."
				return
			if(usr.tech_cooldown)
				usr<<"You must cooldown."
				return
			if(usr.dead)
				usr<<"You are dead."
				return
			if(usr.using||usr.doing||usr.buku)
				usr<<"You're doing something!"
				return
			if(usr.ki_lock||usr.safe)
				usr<<"You can't use ki right now."
				return
			else
				usr.using=1
				usr.doing=1
				usr.tech_cooldown=1
				view(8)<<"\white [usr]: TAKE THIS!"
				sleep(20)
				view(8)<<"\white [usr]: EXPLOSIVE WAVE..."
				sleep(15)
				view(8)<<"\white [usr]: ...HAA!!!"
				sleep(10)
				view(8)<<"\white [usr] screams in pain as they generated a Ki Explosive around them."
				Explode(new /Effect/BasicBoom(src.loc,1,5))
				for(var/mob/M in oview(5,usr))
					var/damage = usr.ki*2
					usr.ki /= 2
					if(!M.dead&&!M.safe&&M.pk)
						var/chance1 = rand(1,100)
						var/chance2= rand(1,100)
						var/damage1=(damage*chance1*0.01)-(M.kidefense*chance2*0.01)/(((2+get_dist(usr,M))/2))
						if(damage1 < 0)damage1 = (damage1*0.0001)*chance1
						if(damage1 < 1)damage1 = 1
						if(M.damage_enabled)M << "<font color=red>You took [damage1] damage!"
						if(usr.damage_enabled)usr<<"<font color=red>You caused [damage1] to [M]!"
						M.powerlevel-=damage1
						M.DeathCheck(usr)
				usr.using=0
				usr.doing=0
				spawn(8)if(usr)usr.tech_cooldown=0
				return

