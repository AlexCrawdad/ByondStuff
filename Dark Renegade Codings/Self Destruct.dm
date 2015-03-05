obj/Technique/SelfDestruct
	verb
		Self_Destruct()
			set category = "Techniques"
			if(usr.powerlevel_max < 10000)
				usr<<"Your body isn't strong enough to sustain anymore damage!"
				return
			if(usr.dead)
				usr<<"You are dead."
				return
			if(usr.tech_cooldown||usr.sd_using)
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
			if(usr.jailed)
				usr<<"You're in jail!"
				return
			if(!usr.pk)
				usr<<"You are not a combatant!"
				return
			switch(alert("Do you want to self destruct? This would cause damage to your circuitry(5% Powerlevel)","","Self Destruct","No"))
				if("No")return
				else
					usr.doing=1
					usr.tech_cooldown=1
					usr.sd_using=1
					view(8)<<"\white [usr]: \font Self Destruct activated. Countdown Started:"
					view(8)<<"\white [usr]: \font 5..."
					sleep(10)
					view(8)<<"\white [usr]: \font 4..."
					sleep(10)
					view(8)<<"\white [usr]: \font 3..."
					sleep(10)
					view(8)<<"\white [usr]: \font 2..."
					sleep(10)
					view(8)<<"\white [usr]: \font 1..."
					sleep(10)
					new/obj/techs/Overlays/Crater_Center(usr.loc)
					for(var/obj/Earth_Dragonballs/O in usr)O.loc=usr.loc
					for(var/obj/Namek_Dragonballs/O in usr)O.loc=usr.loc
					for(var/obj/Black_Dragonballs/O in usr)O.loc=usr.loc
					usr.e_db_1=0
					usr.e_db_2=0
					usr.e_db_3=0
					usr.e_db_4=0
					usr.e_db_5=0
					usr.e_db_6=0
					usr.e_db_7=0
					usr.n_db_1=0
					usr.n_db_2=0
					usr.n_db_3=0
					usr.n_db_4=0
					usr.n_db_5=0
					usr.n_db_6=0
					usr.n_db_7=0
					usr.b_db_1=0
					usr.b_db_2=0
					usr.b_db_3=0
					usr.b_db_4=0
					usr.b_db_5=0
					usr.b_db_6=0
					usr.b_db_7=0
					for(var/mob/M in oview(20,usr))
						var/damage = usr.ki*5
						if(!M.dead&&!M.safe&&M.pk)
							var/chance1 = rand(1,100)
							var/chance2= rand(1,100)
							var/damage1=(damage*chance1*0.01)-(M.kidefense*chance2*0.01)
							if(damage1 < 0)damage1 = ((damage*0.0001))*chance1
							if(damage1 < 1)damage1 = 1
							if(M.damage_enabled)M << "<font color=red>You took [damage1] damage!"
							if(usr.damage_enabled)usr<<"<font color=red>You caused [damage1] to [M]!"
							M.powerlevel-=damage1
							M.DeathCheck(usr)
							spawn(15)if(M&&usr)if(arena_on&&usr.challenge)M.challenger:WinArena("[M.name]")
					usr.SELFDESTRUCTDEATH()
					spawn(30)if(usr)usr.tech_cooldown=0
					spawn(600)if(usr)usr.sd_using=0
					return
mob
	proc
		SELFDESTRUCTDEATH()
			world<<"<font color=red>Battle Information:<font color=white> [src] has self destructed!"
			rest=0
			frozen=0
			boxing=0
			doing=0
			icon_state=""
			density=1
			loc=locate(221,150,5)
			spawn(5)if(src)loc=locate(221,150,5)
			attack_lock=0
			ki_lock=0
			dead=0
			powerlevel=50
			powerlevel_max-=powerlevel_max*0.05
			KO=0
			rage=0
			overlays-='Halo.dmi'
			sight&=~BLIND
			deaths+=1
			if(tourny)
				tourny=0
				if(Entries.Find(src))Entries.Remove(src)
				if(Winners.Find(src))Winners.Remove(src)
				if(!Losers.Find(src))Losers.Add(src)
				wait_room=0
			if(jrtourny)
				jrtourny=0
				if(jrEntries.Find(src))jrEntries.Remove(src)
				if(jrWinners.Find(src))jrWinners.Remove(src)
				if(!jrLosers.Find(src))jrLosers.Add(src)
				wait_room=0
			src<<"You feel minor damage to your circuitry."