obj/Grand_Storm/icon = 'Grand.dmi'
mob/var/Grand_Storm_lock = 0
mob/learn/
	verb
		Grand_Storm(mob/M in oview(6))
			set category = "Techniques"

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

			for(var/turf/Floors/Safe_Zone/S in view(6))
				if(S in view(8))
					usr << "They are in a Safe Zone!"
					return

			for(var/turf/Planet_Gravitys/King_Kai/D in view(6))
				if(D in view(8))
					usr << "They are in a Safe Zone!"
					return

			var/ki_damage = round(((usr.ki_skill / usr.ki_skill_max) * usr.level) + usr.powerlevel * 1.25)
			var/ki_cost = src.ki_max

			if(src.ki >= ki_cost)
				if(!src.doing)
					src.ki_lock = 1
					spawn(10) src.ki_lock = 0
					src.doing = 1
					src.ki -= ki_cost
					view(6) << "<font color = white>[src]:</font> Lets see if GT was right!"
					sleep(10)
					view(6) << "<font color = blue>[src]:</font> GRAND "
					sleep(15)
					view(6) << "<font color = blue>[src]:</font> STORM!!!!!!!!!!!!"
					spawn(5) src.doing = 0
					spawn(5) src.frozen = 0

/*					for(var/turf/T in view(M,8))
						var/chance = roll(1,8)
						if(chance == 6)
							missile(new/obj/scatter, T, M)
							ki_damage += src.ki_max * 0.05
							M.powerlevel -= ki_damage
							M.BigKiDeathCheck(src)

*/
					for(var/turf/T in view(src,8))
						var/chance = roll(1,8)
						if(chance == 6)
							missile(new/obj/Grand_Storm, T, M)
					if(prob(M.dodge))
						usr << "\red [M] has avoided some of the blasts."
						M << "<font color=lime>You avoided some of the damage!"
						ki_damage = round(((usr.ki_skill / usr.ki_skill_max) * usr.level) + usr.powerlevel_max * 0.24)
						M.powerlevel -= ki_damage
					else
						M.powerlevel -= ki_damage
						M.DeathCheck(src)

