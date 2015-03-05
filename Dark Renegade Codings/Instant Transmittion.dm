mob
	var
		itspecialblocked=0
		tmp
			iting=0
			it_blocked=0
			itblocked=0
			it_using=0
obj/Technique/InstantTransmission
	verb/Instant_Transmission()
		set category="Techniques"
		if(usr.tourny||usr.babatourny||usr.jrtourny||usr.rtourny||usr.guildtourny)
			usr <<"<font color=red>You are in tournament!"
			return
		if(usr.it_lock||usr.challenge||usr.in_war||usr.in_hbtc||usr.gravity_train||usr.grav_trainer||usr.guild_challenge)
			usr<<"<font color=red>You seem to be weak."
			return
		if(usr.z==10)
			usr<<"<font color=red>You are in the housing area, you cannot IT here."
			return
		if(usr.dead)
			usr<<"<font color=red>You are Dead, IT cannot be used!"
			return
		if(usr.jailed)
			usr<<"<font color=red>No IT in Jail!"
			return
		if(usr.doing)
			usr<<"<font color=red>You are doing something!"
			return
		for(var/obj/O in usr)
			if(O.dball)
				usr<<"You cannot IT with the dragonballs!"
				return
		if(usr.it_using)return
		usr.it_using=1
		var/list/Menu=list()
		switch(input("Which do you wish to IT to?")in list("Simulations","NPCs","PCs","Cancel"))
			if("Cancel")
				usr.it_using=0
				return
			if("Simulations")
				for(var/mob/M in world)if(istype(M,/mob/Simulation))Menu.Add(M)
			if("NPCs")
				for(var/mob/M in world)if(istype(M,/mob/NPC)||istype(M,/mob/Monster))Menu.Add(M)
			if("PCs")
				for(var/mob/M in world)if(istype(M,/mob/PC)&&M.key)Menu.Add(M)
		Menu.Remove(usr)
		for(var/mob/M in world)if(istype(M,/mob/PC)&&M.name==usr.name)Menu.Remove(M)
		if(usr.race!="Android")
			var/mob/PC/M = input("IT to whom?","Instant Transmission","Cancel")as null|anything in Menu
			if(!M||M=="Cancel"||usr.doing)
				usr.it_using=0
				return
			spawn(5)usr.it_using=0
			usr.NIT(M)
		if(usr.race=="Android")
			var/mob/PC/M = input("IT to whom?","Instant Tranmission","Cancel")as null|anything in Menu
			if(!M||M=="Cancel"||usr.doing)
				usr.it_using=0
				return
			spawn(5)usr.it_using=0
			usr.AIT(M)
mob
	proc
		NIT(mob/M)
			if(!M||M.dead)return
			if(training||doing)
				src<<"<font color=red>You're doing something!"
				return
			if(dead)
				src<<"<font color=red>You are dead..."
				return
			if(M.z==6||M.guild_challenge||M.gravity_train||M.grav_trainer||M.in_hbtc||M.itfiltered||M.powerlevel<=100||M.it_blocked||M.itblocked||M.tourny||M.babatourny||M.jrtourny||M.rtourny||M.guildtourny||M.jailed||M.in_war||M.challenge||M.z==10)
				src<<"<font color=white>You can't seem to Sense [M]'s energy signal..."
				return
			else
				using=1
				icon_state="IT"
				sleep(12)
				icon_state=""
				if(z==6||it_lock||challenge||in_war||in_hbtc||gravity_train||grav_trainer||guild_challenge)
					src<< "<font color=red>You seem to be weak."
					return
				if(jrtourny||babatourny||tourny||!src||doing||!M)return
				if(M.z==6||M.guild_challenge||M.gravity_train||M.grav_trainer||M.in_hbtc||M.itfiltered||M.powerlevel<=100||M.it_blocked||M.itblocked||M.tourny||M.babatourny||M.jrtourny||M.rtourny||M.guildtourny||M.jailed||M.in_war||M.challenge)
					src<<"<font color=white>You can't seem to Sense [M]'s energy signal..."
					return
				for(var/obj/O in src)
					if(O.dball)
						src<<"You cannot IT with the dragonballs!"
						return
				iting=1
				x=M.x
				if(M.y==1)y=M.y
				if(M.y!=1)y=M.y-1
				z=M.z
				iting=0
				using=0
				view(6)<<"<font color=white>[src] Instant Transmissions from beyond appearing in front of [M]!"
				spawn(3)if(src)ITCHECK()
		AIT(mob/M)
			if(!M)return
			if(training||doing)
				src<<"<font color=red>You're doing something!"
				return
			if(M.z==6||M.guild_challenge||M.itfiltered||M.grav_trainer||M.gravity_train||M.tourny||M.babatourny||M.jrtourny||M.rtourny||M.guildtourny||M.jailed||M.in_hbtc||M.in_war||M.challenge)
				src<<"<font color=white>You can't seem to Sense [M]'s energy signal..."
				return
			else
				using=1
				icon_state="IT"
				sleep(12)
				icon_state=""
				if(z==6||it_lock||challenge||in_war||in_hbtc||gravity_train||grav_trainer||guild_challenge)
					src<< "<font color=red>You seem to be weak."
					return
				if(babatourny||tourny||jrtourny||!src||!M)return
				if(M.z==6||M.guild_challenge||M.in_hbtc||M.itfiltered||M.grav_trainer||M.gravity_train||M.powerlevel<=100||M.it_blocked||M.itblocked||M.tourny||M.babatourny||M.jrtourny||M.rtourny||M.guildtourny||M.jailed||M.in_war||M.challenge)
					src<<"<font color=white>You can't seem to Sense [M]'s energy signal..."
					return
				for(var/obj/O in src)
					if(O.dball)
						src<<"You cannot IT with the dragonballs!"
						return
				iting=1
				x=M.x
				if(M.y==1)y=M.y
				if(M.y!=1)y=M.y-1
				z=M.z
				iting=0
				using=0
				view(6)<<"<font color=white>[src] Instant Transmissions from beyond appearing in front of [M]!"
				spawn(3)if(src)ITCHECK()
mob/proc/ITCHECK()
	insafezone=0
	szactivated=0
	traintimer=0
	safe=0
	temptraintimer=0
	if(it_blocked)it_blocked=0
	for(var/turf/Floors/Safe_Zone/S in oview(8,src))
		if(S in oview(1,src))
			if(!szactivated&&!dead&&z!=7&&z!=6&&z!=5)
				insafezone=1
				szactivated=1
				safe=1
				traintimer=0
				temptraintimer=0
				timer()

