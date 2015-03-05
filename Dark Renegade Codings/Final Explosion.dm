obj/Technique/FinalExplosion
	verb
		Final_Explosion()
			set category = "Techniques"
			if(usr.tech_cooldown||usr.fe_using)
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
			if(usr.dead)return
			if(usr.race=="Saiyan"||usr.race=="Half Saiyan")
				usr.icon_state = "enrage"
				usr.fe_using=1
				usr.frozen = 1
				usr.doing=1
				usr.using=1
				usr.tech_cooldown=1
				usr.overlays += 'Flash.dmi'
				sleep(40)
				usr.overlays -= 'Flash.dmi'
				new/obj/techs/Overlays/Crater_Center(usr.loc)
				for(var/obj/Earth_Dragonballs/O in usr)O.loc = usr.loc
				for(var/obj/Namek_Dragonballs/O in usr)O.loc = usr.loc
				for(var/obj/Black_Dragonballs/O in usr)O.loc = usr.loc
				usr.e_db_1 = 0
				usr.e_db_2 = 0
				usr.e_db_3 = 0
				usr.e_db_4 = 0
				usr.e_db_5 = 0
				usr.e_db_6 = 0
				usr.e_db_7 = 0
				usr.n_db_1 = 0
				usr.n_db_2 = 0
				usr.n_db_3 = 0
				usr.n_db_4 = 0
				usr.n_db_5 = 0
				usr.n_db_6 = 0
				usr.n_db_7 = 0
				usr.b_db_1 = 0
				usr.b_db_2 = 0
				usr.b_db_3 = 0
				usr.b_db_4 = 0
				usr.b_db_5 = 0
				usr.b_db_6 = 0
				usr.b_db_7 = 0
				usr.wait_room=0
				for(var/mob/M in oview(8,usr))
					var/damage = usr.ki*2
					if(!M.dead&&!M.safe&&M.pk )
						var/chance1 = rand(1,100)
						var/chance2= rand(1,100)
						var/damage1=(damage*chance1*0.01)-(M.kidefense*chance2*0.01)
						if(damage1 < 0)damage1 = ((damage*0.0001))*chance1
						if(damage1 < 1)damage1 = 1
						if(M.damage_enabled)M << "<font color=red>You took [damage1] damage!"
						if(usr.damage_enabled)usr<<"<font color=red>You caused [damage1] to [M]!"
						M.powerlevel-=damage1
						M.DeathCheck(usr)
				usr.powerlevel=0
				usr.using=0
				spawn(600)if(usr)usr.fe_using=0
				spawn(8)if(usr)usr.tech_cooldown=0
				usr.DeathCheck(usr)
				return