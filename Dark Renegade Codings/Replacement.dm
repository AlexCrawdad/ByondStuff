obj/Technique
	Replace_ment
		verb
			Replacement()
				set category="Techniques"
				set src=usr.contents
				var/list/Menu=list()
				for(var/mob/M in oview(6))if(istype(M,/mob/Simulation)||istype(M,/mob/Monster)||istype(M,/mob/PC)||istype(M,/mob/NPC))Menu.Add(M)
				Menu.Remove(usr)
				for(var/mob/M in oview(6))if(istype(M,/mob/PC)&&M.name==usr.name)Menu.Remove(M)
				var/test=input("Who do you want to use replacement on?")as null|anything in Menu
				if(!test)return
				usr.Replacement(test)
mob
	var/tmp/savedloc=0
	proc
		Replacement(mob/M)
			if(M.safe||doing||buku||dead||M.dead)return
			if(!M in oview(6))return
			if(z==6||guild_challenge||gravity_train||grav_trainer||in_hbtc||itfiltered||powerlevel<=100||it_blocked||itblocked||tourny||babatourny||jrtourny||rtourny||guildtourny||jailed||in_war||challenge)
				src<<"<font color=red>You seem to be weak."
				return
			savedloc=loc
			loc=M.loc
			M.loc=savedloc





