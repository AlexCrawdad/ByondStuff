proc
	DragonballFixer()
		for(var/obj/D in world)
			if(D.summonedshernon)
				D.summonedshernon=0
				del(D)
				DBDAY()
				spawn(9000)world.Earth_Dragonball_Spawn()
		for(var/obj/D in world)
			if(D.summonedbkshernon)
				D.summonedbkshernon=0
				del(D)
				DBDAY()
				spawn(14000)world.Namek_Dragonball_Spawn()
		for(var/obj/D in world)
			if(D.summonedporunga)
				D.summonedporunga=0
				del(D)
				DBDAY()
				spawn(18000)world.Black_Dragonball_Spawn()
		return
	DBNIGHT()
		for(var/area/outside/A in world)
			A.overlays=null
			A.overlays+=new/obj/Daycycle/DBall
	DBDAY()
		for(var/area/outside/A in world)
			A.overlays=null
			A.overlays+=new/obj/Daycycle/RDBall
mob/proc/CheckInventory()
	var/count=0
	for(var/obj/Equipment/E in src)count++
	for(var/obj/Gym/G in src)count++
	for(var/obj/Props/Furnature/GF in src)count++
	for(var/obj/S in contents)if(S.value)sellable_items++
	inven_min=count
	if(inven_min>=inven_max)
		src<<"You have no more space in your inventory."
		return TRUE
obj/Earth_Dragonballs
	dball=1
	layer=MOB_LAYER-1
	Earth_Dragonball_1
		name = "Earth Dragonball 1"
		icon = 'dragonball.dmi'
		icon_state = "1"
		density = 0
		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.z != 1)
					world<<"\red Earth Dragonballs has been destroyed due to being not on Earth!"
					EARTHDESTROYER()
					return
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr<<"You pick up the [src]"
						usr.e_db_1 = 1
						usr.inven_min += 1
					else
						usr<<"You cannot pick up the [src]"
						return
				else
					usr<<"You cannot pick up this!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr<<"You drop the [src]"
				usr.e_db_1 = 0
				usr.inven_min -= 1
	Earth_Dragonball_2
		name = "Earth Dragonball 2"
		icon = 'dragonball.dmi'
		icon_state = "2"
		density = 0
		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.z != 1)
					world<<"\red Earth Dragonballs has been destroyed due to being not on Earth!"
					EARTHDESTROYER()
					return
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr<<"You pick up the [src]"
						usr.e_db_2 = 1
						usr.inven_min += 1
					else
						usr<<"You cannot pick up the [src]"
						return
				else
					usr<<"You are not a combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr<<"You drop the [src]"
				usr.e_db_2 = 0
				usr.inven_min -= 1
	Earth_Dragonball_3
		name = "Earth Dragonball 3"
		icon = 'dragonball.dmi'
		icon_state = "3"
		density = 0
		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.z != 1)
					world<<"\red Earth Dragonballs has been destroyed due to being not on Earth!"
					EARTHDESTROYER()
					return
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr<<"You pick up the [src]"
						usr.e_db_3 = 1
						usr.inven_min += 1
					else
						usr<<"You cannot pick up the [src]"
						return
				else
					usr<<"You are not a combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr<<"You drop the [src]"
				usr.e_db_3 = 0
				usr.inven_min -= 1
	Earth_Dragonball_4
		name = "Earth Dragonball 4"
		icon = 'dragonball.dmi'
		icon_state = "4"
		density = 0
		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.z != 1)
					world<<"\red Earth Dragonballs has been destroyed due to being not on Earth!"
					EARTHDESTROYER()
					return
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr<<"You pick up the [src]"
						usr.e_db_4 = 1
						usr.inven_min += 1
					else
						usr<<"You cannot pick up the [src]"
						return
				else
					usr<<"You are not a combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr<<"You drop the [src]"
				usr.e_db_4 = 0
				usr.inven_min -= 1
	Earth_Dragonball_5
		name = "Earth Dragonball 5"
		icon = 'dragonball.dmi'
		icon_state = "5"
		density = 0
		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.z != 1)
					world<<"\red Earth Dragonballs has been destroyed due to being not on Earth!"
					EARTHDESTROYER()
					return
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr<<"You pick up the [src]"
						usr.e_db_5 = 1
						usr.inven_min += 1
					else
						usr<<"You cannot pick up the [src]"
						return
				else
					usr<<"You are not a combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr<<"You drop the [src]"
				usr.e_db_5 = 0
				usr.inven_min -= 1
	Earth_Dragonball_6
		name = "Earth Dragonball 6"
		icon = 'dragonball.dmi'
		icon_state = "6"
		density = 0
		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.z != 1)
					world<<"\red Earth Dragonballs has been destroyed due to being not on Earth!"
					EARTHDESTROYER()
					return
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr<<"You pick up the [src]"
						usr.e_db_6 = 1
						usr.inven_min += 1
					else
						usr<<"You cannot pick up the [src]"
						return
				else
					usr<<"You are not a combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr<<"You drop the [src]"
				usr.e_db_6 = 0
				usr.inven_min -= 1
	Earth_Dragonball_7
		name = "Earth Dragonball 7"
		icon = 'dragonball.dmi'
		icon_state = "7"
		density = 0
		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.z != 1)
					world<<"\red Earth Dragonballs has been destroyed due to being not on Earth!"
					EARTHDESTROYER()
					return
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr<<"You pick up the [src]"
						usr.e_db_7 = 1
						usr.inven_min += 1
					else
						usr<<"You cannot pick up the [src]"
						return
				else
					usr<<"You are not a combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr<<"You drop the [src]"
				usr.e_db_7 = 0
				usr.inven_min -= 1
obj/Namek_Dragonballs
	dball=1
	layer=MOB_LAYER
	Namek_Dragonball_1
		name = "Namekian Dragonball 1"
		icon = 'dragonball.dmi'
		icon_state = "n1"
		density = 0
		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Porunga")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.z != 2)
					world<<"\red Namek Dragonballs has been destroyed due to being not on Namek!"
					NAMEKDESTROYER()
					return
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr<<"You pick up the [src]"
						usr.n_db_1 = 1
						usr.inven_min += 1
					else
						usr<<"You cannot pick up the [src]"
						return
				else
					usr<<"You are not a combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr<<"You drop the [src]"
				usr.n_db_1 = 0
				usr.inven_min -= 1
	Namek_Dragonball_2
		name = "Namekian Dragonball 2"
		icon = 'dragonball.dmi'
		icon_state = "n2"
		density = 0
		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Porunga")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.z != 2)
					world<<"\red Namek Dragonballs has been destroyed due to being not on Namek!"
					NAMEKDESTROYER()
					return
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr<<"You pick up the [src]"
						usr.n_db_2 = 1
						usr.inven_min += 1
					else
						usr<<"You cannot pick up the [src]"
						return
				else
					usr<<"You are not a combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr<<"You drop the [src]"
				usr.n_db_2 = 0
				usr.inven_min -= 1
	Namek_Dragonball_3
		name = "Namekian Dragonball 3"
		icon = 'dragonball.dmi'
		icon_state = "n3"
		density = 0
		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Porunga")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.z != 2)
					world<<"\red Namek Dragonballs has been destroyed due to being not on Namek!"
					NAMEKDESTROYER()
					return
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr<<"You pick up the [src]"
						usr.n_db_3 = 1
						usr.inven_min += 1
					else
						usr<<"You cannot pick up the [src]"
						return
				else
					usr<<"You are not a combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr<<"You drop the [src]"
				usr.n_db_3 = 0
				usr.inven_min -= 1
	Namek_Dragonball_4
		name = "Namekian Dragonball 4"
		icon = 'dragonball.dmi'
		icon_state = "n4"
		density = 0
		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Porunga")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.z != 2)
					world<<"\red Namek Dragonballs has been destroyed due to being not on Namek!"
					NAMEKDESTROYER()
					return
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr<<"You pick up the [src]"
						usr.n_db_4 = 1
						usr.inven_min += 1
					else
						usr<<"You cannot pick up the [src]"
						return
				else
					usr<<"You are not a combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr<<"You drop the [src]"
				usr.n_db_4 = 0
				usr.inven_min -= 1
	Namek_Dragonball_5
		name = "Namekian Dragonball 5"
		icon = 'dragonball.dmi'
		icon_state = "n5"
		density = 0
		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Porunga")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.z != 2)
					world<<"\red Namek Dragonballs has been destroyed due to being not on Namek!"
					NAMEKDESTROYER()
					return
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr<<"You pick up the [src]"
						usr.n_db_5 = 1
						usr.inven_min += 1
					else
						usr<<"You cannot pick up the [src]"
						return
				else
					usr<<"You are not a combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr<<"You drop the [src]"
				usr.n_db_5 = 0
				usr.inven_min -= 1
	Namek_Dragonball_6
		name = "Namekian Dragonball 6"
		icon = 'dragonball.dmi'
		icon_state = "n6"
		density = 0
		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Porunga")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.z != 2)
					world<<"\red Namek Dragonballs has been destroyed due to being not on Namek!"
					NAMEKDESTROYER()
					return
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr<<"You pick up the [src]"
						usr.n_db_6 = 1
						usr.inven_min += 1
					else
						usr<<"You cannot pick up the [src]"
						return
				else
					usr<<"You are not a combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr<<"You drop the [src]"
				usr.n_db_6 = 0
				usr.inven_min -= 1
	Namek_Dragonball_7
		name = "Namekian Dragonball 7"
		icon = 'dragonball.dmi'
		icon_state = "n7"
		density = 0
		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Porunga")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.z != 2)
					world<<"\red Namek Dragonballs has been destroyed due to being not on Namek!"
					NAMEKDESTROYER()
					return
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr<<"You pick up the [src]"
						usr.n_db_7 = 1
						usr.inven_min += 1
					else
						usr<<"You cannot pick up the [src]"
						return
				else
					usr<<"You are not a combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr<<"You drop the [src]"
				usr.n_db_7 = 0
				usr.inven_min -= 1
obj/Black_Dragonballs
	dball=1
	layer=MOB_LAYER
	Black_Dragonball_1
		name = "Black Star Dragonball 1"
		icon = 'dragonball.dmi'
		icon_state = "b1"
		density = 0
		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Omega Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.z != 4)
					world<<"\red Black Star Dragonballs has been destroyed due to being not on Yardrat!"
					BLACKDESTROYER()
					return
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr<<"You pick up the [src]"
						usr.b_db_1 = 1
						usr.inven_min += 1
					else
						usr<<"You cannot pick up the [src]"
						return
				else
					usr<<"You are not a combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr<<"You drop the [src]"
				usr.b_db_1 = 0
				usr.inven_min -= 1
	Black_Dragonball_2
		name = "Black Star Dragonball 2"
		icon = 'dragonball.dmi'
		icon_state = "b2"
		density = 0
		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Omega Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.z != 4)
					world<<"\red Black Star Dragonballs has been destroyed due to being not on Yardrat!"
					BLACKDESTROYER()
					return
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr<<"You pick up the [src]"
						usr.b_db_2 = 1
						usr.inven_min += 1
					else
						usr<<"You cannot pick up the [src]"
						return
				else
					usr<<"You are not a combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr<<"You drop the [src]"
				usr.b_db_2 = 0
				usr.inven_min -= 1
	Black_Dragonball_3
		name = "Black Star Dragonball 3"
		icon = 'dragonball.dmi'
		icon_state = "b3"
		density = 0
		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Omega Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.z != 4)
					world<<"\red Black Star Dragonballs has been destroyed due to being not on Yardrat!"
					BLACKDESTROYER()
					return
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr<<"You pick up the [src]"
						usr.b_db_3 = 1
						usr.inven_min += 1
					else
						usr<<"You cannot pick up the [src]"
						return
				else
					usr<<"You are not a combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr<<"You drop the [src]"
				usr.b_db_3 = 0
				usr.inven_min -= 1
	Black_Dragonball_4
		name = "Black Star Dragonball 4"
		icon = 'dragonball.dmi'
		icon_state = "b4"
		density = 0
		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Omega Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.z != 4)
					world<<"\red Black Star Dragonballs has been destroyed due to being not on Yardrat!"
					BLACKDESTROYER()
					return
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr<<"You pick up the [src]"
						usr.b_db_4 = 1
						usr.inven_min += 1
					else
						usr<<"You cannot pick up the [src]"
						return
				else
					usr<<"You are not a combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr<<"You drop the [src]"
				usr.b_db_4 = 0
				usr.inven_min -= 1
	Black_Dragonball_5
		name = "Black Star Dragonball 5"
		icon = 'dragonball.dmi'
		icon_state = "b5"
		density = 0
		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Omega Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.z != 4)
					world<<"\red Black Star Dragonballs has been destroyed due to being not on Yardrat!"
					BLACKDESTROYER()
					return
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr<<"You pick up the [src]"
						usr.b_db_5 = 1
						usr.inven_min += 1
					else
						usr<<"You cannot pick up the [src]"
						return
				else
					usr<<"You are not a combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr<<"You drop the [src]"
				usr.b_db_5 = 0
				usr.inven_min -= 1
	Black_Dragonball_6
		name = "Black Star Dragonball 6"
		icon = 'dragonball.dmi'
		icon_state = "b6"
		density = 0
		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Omega Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.z != 4)
					world<<"\red Black Star Dragonballs has been destroyed due to being not on Yardrat!"
					BLACKDESTROYER()
					return
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr<<"You pick up the [src]"
						usr.b_db_6 = 1
						usr.inven_min += 1
					else
						usr<<"You cannot pick up the [src]"
						return
				else
					usr<<"You are not a combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr<<"You drop the [src]"
				usr.b_db_6 = 0
				usr.inven_min -= 1
	Black_Dragonball_7
		name = "Black Star Dragonball 7"
		icon = 'dragonball.dmi'
		icon_state = "b7"
		density = 0
		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon("Omega Shenron")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.z != 4)
					world<<"\red Black Star Dragonballs has been destroyed due to being not on Yardrat!"
					BLACKDESTROYER()
					return
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr<<"You pick up the [src]"
						usr.b_db_7 = 1
						usr.inven_min += 1
					else
						usr<<"You cannot pick up the [src]"
						return
				else
					usr<<"You are not a combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr<<"You drop the [src]"
				usr.b_db_7 = 0
				usr.inven_min -= 1
world
	proc
		Earth_Dragonball_Spawn(S=1)
			set background=1
			earthtimed=0
			earth_spawned=1
			earthactivated=1
			earthtimer=15
			sleep(0)
			spawn(1)
				sleep(S)
				for(var/obj/O in world)if(istype(O,/obj/Earth_Dragonballs))return
				world<<"<center><u>Earth Dragonballs</u> has been <font color=green><u>revived</u></font>!"
				var/db1=0
				var/db2=0
				var/db3=0
				var/db4=0
				var/db5=0
				var/db6=0
				var/db7=0
				spawn(1)
					while(!db1)
						var/turf/T=locate(rand(1,400),rand(1,400),1)
						if(T.dbable)
							new/obj/Earth_Dragonballs/Earth_Dragonball_1(T)
							db1=1
							break
					while(!db2)
						var/turf/T=locate(rand(1,400),rand(1,400),1)
						if(T.dbable)
							new/obj/Earth_Dragonballs/Earth_Dragonball_2(T)
							db2=1
							break
					while(!db3)
						var/turf/T=locate(rand(1,400),rand(1,400),1)
						if(T.dbable)
							new/obj/Earth_Dragonballs/Earth_Dragonball_3(T)
							db3=1
							break
					while(!db4)
						var/turf/T=locate(rand(1,400),rand(1,400),1)
						if(T.dbable)
							new/obj/Earth_Dragonballs/Earth_Dragonball_4(T)
							db4=1
							break
					while(!db5)
						var/turf/T=locate(rand(1,400),rand(1,400),1)
						if(T.dbable)
							new/obj/Earth_Dragonballs/Earth_Dragonball_5(T)
							db5=1
							break
					while(!db6)
						var/turf/T=locate(rand(1,400),rand(1,400),1)
						if(T.dbable)
							new/obj/Earth_Dragonballs/Earth_Dragonball_6(T)
							db6=1
							break
					while(!db7)
						var/turf/T=locate(rand(1,400),rand(1,400),1)
						if(T.dbable)
							new/obj/Earth_Dragonballs/Earth_Dragonball_7(T)
							db7=1
							break
		Namek_Dragonball_Spawn(S=1)
			set background=1
			namektimed=0
			namek_spawned=1
			namekactivated=1
			namektimer=25
			sleep(0)
			spawn(1)
				sleep(S)
				for(var/obj/O in world)if(istype(O,/obj/Namek_Dragonballs))return
				world<<"<center><u>Namek Dragonballs</u> has been <font color=green><u>revived</u></font>!"
				var/db1=0
				var/db2=0
				var/db3=0
				var/db4=0
				var/db5=0
				var/db6=0
				var/db7=0
				spawn(1)
					while(!db1)
						var/turf/T=locate(rand(1,400),rand(1,400),2)
						if(T.dbable)
							new/obj/Namek_Dragonballs/Namek_Dragonball_1(T)
							db1=1
							break
					while(!db2)
						var/turf/T=locate(rand(1,400),rand(1,400),2)
						if(T.dbable)
							new/obj/Namek_Dragonballs/Namek_Dragonball_2(T)
							db2=1
							break
					while(!db3)
						var/turf/T=locate(rand(1,400),rand(1,400),2)
						if(T.dbable)
							new/obj/Namek_Dragonballs/Namek_Dragonball_3(T)
							db3=1
							break
					while(!db4)
						var/turf/T=locate(rand(1,400),rand(1,400),2)
						if(T.dbable)
							new/obj/Namek_Dragonballs/Namek_Dragonball_4(T)
							db4=1
							break
					while(!db5)
						var/turf/T=locate(rand(1,400),rand(1,400),2)
						if(T.dbable)
							new/obj/Namek_Dragonballs/Namek_Dragonball_5(T)
							db5=1
							break
					while(!db6)
						var/turf/T=locate(rand(1,400),rand(1,400),2)
						if(T.dbable)
							new/obj/Namek_Dragonballs/Namek_Dragonball_6(T)
							db6=1
							break
					while(!db7)
						var/turf/T=locate(rand(1,400),rand(1,400),2)
						if(T.dbable)
							new/obj/Namek_Dragonballs/Namek_Dragonball_7(T)
							db7=1
							break
		Black_Dragonball_Spawn(S=1)
			set background=1
			blacktimed=0
			black_spawned=1
			blackactivated=1
			blacktimer=35
			sleep(0)
			spawn(1)
				sleep(S)
				for(var/obj/O in world)if(istype(O,/obj/Black_Dragonballs))return
				world<<"<center><u>Black Star Dragonballs</u> has been <font color=green><u>revived</u></font>!"
				var/db1=0
				var/db2=0
				var/db3=0
				var/db4=0
				var/db5=0
				var/db6=0
				var/db7=0
				spawn(1)
					while(!db1)
						var/turf/T=locate(rand(1,400),rand(1,400),4)
						if(T.dbable)
							new/obj/Black_Dragonballs/Black_Dragonball_1(T)
							db1=1
							break
					while(!db2)
						var/turf/T=locate(rand(1,400),rand(1,400),4)
						if(T.dbable)
							new/obj/Black_Dragonballs/Black_Dragonball_2(T)
							db2=1
							break
					while(!db3)
						var/turf/T=locate(rand(1,400),rand(1,400),4)
						if(T.dbable)
							new/obj/Black_Dragonballs/Black_Dragonball_3(T)
							db3=1
							break
					while(!db4)
						var/turf/T=locate(rand(1,400),rand(1,400),4)
						if(T.dbable)
							new/obj/Black_Dragonballs/Black_Dragonball_4(T)
							db4=1
							break
					while(!db5)
						var/turf/T=locate(rand(1,400),rand(1,400),4)
						if(T.dbable)
							new/obj/Black_Dragonballs/Black_Dragonball_5(T)
							db5=1
							break
					while(!db6)
						var/turf/T=locate(rand(1,400),rand(1,400),4)
						if(T.dbable)
							new/obj/Black_Dragonballs/Black_Dragonball_6(T)
							db6=1
							break
					while(!db7)
						var/turf/T=locate(rand(1,400),rand(1,400),4)
						if(T.dbable)
							new/obj/Black_Dragonballs/Black_Dragonball_7(T)
							db7=1
							break
mob/proc/Summon_Dragon(D)
	if(D=="Shenron")
		if(wishes<7)
			if(e_db_1&&e_db_2&&e_db_3&&e_db_4&&e_db_5&&e_db_6&&e_db_7)
				for(var/obj/Earth_Dragonballs/O in world)del(O)
				e_db_1=0
				e_db_2=0
				e_db_3=0
				e_db_4=0
				e_db_5=0
				e_db_6=0
				e_db_7=0
				world<<"<font color = green>The sky darkens as [D] is summoned!</font>"
				src<<sound('makewish.wav')
				DBNIGHT()
				SUMMONSHERNON()
				winshow(src,"Guide",1)
				src<<browse('Shenron.png',"display=0")
				src<<browse("<body bgcolor=\"black\"><center><img src=Shenron.png><p><font color = \"yellow\" size = 4>You have summoned [D]! </center>")
				egrant=1
				sleep(15)
				switch(input("What is your wish?")in list("Level","Power","Ki","Karma","Training Points","Zenni"))
					if("Training Points")
						tp+=300000
						wishes+=1
						SHERNONDESTROYER()
						world<<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						view()<<sound('dbs_flying.wav')
						DBDAY()
						src<<"Your wish has been granted!"
						src<<"<font color=yellow>You have gained 300,000 TPS!</font>"
						spawn(1)world.Earth_Dragonball_Spawn(3000)
						return
					if("Zenni")
						var/gainer=rand(1000000,2000000)
						zenni+=gainer
						if("zenni_buff" in buffs)zenni+=gainer
						wishes+=1
						SHERNONDESTROYER()
						world<<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						view()<<sound('dbs_flying.wav')
						DBDAY()
						src<<"Your wish has been granted!"
						src<<"<font color=yellow>You have gained [gainer] zennies!</font>"
						spawn(1)world.Earth_Dragonball_Spawn(3000)
						return
					if("Level")
						spawn(2)
							var/amount=5000
							wishes+=1
							while(amount>0)
								if(!src)return
								exp=tnl
								Level_Up()
								amount-=1
								sleep(0.25)
						SHERNONDESTROYER()
						world<<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						view()<<sound('dbs_flying.wav')
						DBDAY()
						src<<"Your wish has been granted!"
						spawn(1)world.Earth_Dragonball_Spawn(3000)
						return
					if("Power")
						var/gainer=rand(1000000,2000000)
						powerlevel_max+=gainer
						wishes+=1
						SHERNONDESTROYER()
						world<<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						view()<<sound('dbs_flying.wav')
						DBDAY()
						src<<"Your wish has been granted!"
						src<<"<font color=yellow>You have gained [gainer] Powerlevel!</font>"
						spawn(1)world.Earth_Dragonball_Spawn(3000)
						return
					if("Defense")
						var/gainer=rand(1000000,2000000)
						defence_max+=gainer
						wishes+=1
						SHERNONDESTROYER()
						world<<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						view()<<sound('dbs_flying.wav')
						DBDAY()
						src<<"Your wish has been granted!"
						src<<"<font color=yellow>You have gained [gainer] Defense!</font>"
						spawn(1)world.Earth_Dragonball_Spawn(3000)
						return
					if("Strength")
						var/gainer=rand(1000000,2000000)
						strength_max+=gainer
						wishes+=1
						SHERNONDESTROYER()
						world<<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						view()<<sound('dbs_flying.wav')
						DBDAY()
						src<<"Your wish has been granted!"
						src<<"<font color=yellow>You have gained [gainer] Strength!</font>"
						spawn(1)world.Earth_Dragonball_Spawn(3000)
						return
					if("Ki")
						var/gainer=rand(1000000,2000000)
						ki_max+=gainer
						kidefense_max+=gainer
						wishes+=1
						SHERNONDESTROYER()
						world<<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						view()<<sound('dbs_flying.wav')
						DBDAY()
						src<<"Your wish has been granted!"
						src<<"<font color=yellow>You have gained [gainer] Ki!</font>"
						spawn(1)world.Earth_Dragonball_Spawn(3000)
						return
					if("Karma")
						switch(alert("Do you wish to be Pure or Evil?","","Pure","Evil"))
							if("Pure")
								karma="Good"
								karma_rating=50
							else
								karma="Evil"
								karma_rating=50
						wishes+=1
						SHERNONDESTROYER()
						world<<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						view()<<sound('dbs_flying.wav')
						DBDAY()
						src<<"Your wish has been granted!"
						spawn(1)world.Earth_Dragonball_Spawn(3000)
						return
		else
			src<<"You have used all your wishes up!"
			return
	if(D=="Porunga")
		if(nwishes<5)
			if(n_db_1&&n_db_2&&n_db_3&&n_db_4&&n_db_5&&n_db_6&&n_db_7)
				for(var/obj/Namek_Dragonballs/O in world)del(O)
				n_db_1=0
				n_db_2=0
				n_db_3=0
				n_db_4=0
				n_db_5=0
				n_db_6=0
				n_db_7=0
				src << sound('makewish.wav')
				world<<"<font color = green>The sky darkens as [D] is summoned!</font>"
				DBNIGHT()
				SUMMONPORUNGA()
				winshow(src,"Guide",1)
				src<<browse('Porguna.PNG',"display=0")
				src<<browse("<body bgcolor=\"black\"><center><img src=Porguna.PNG><p><font color = \"yellow\" size = 4>You have summoned [D]! </center>")
				sleep(15)
				switch(input("What is your wish?")in list("Level","Power","Defense","Strength","Ki","Karma","Training Points","Zenni"))
					if("Training Points")
						var/gainer=500000
						tp+=gainer
						nwishes+=1
						world<<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						view()<<sound('dbs_flying.wav')
						PORUNGADESTROYER()
						DBDAY()
						src<<"Your wish has been granted!"
						src<<"<font color=yellow>You have gained [gainer] TPS!</font>"
						spawn(1)world.Namek_Dragonball_Spawn(9000)
						return
					if("Zenni")
						var/gainer=rand(2500000,3000000)
						zenni += gainer
						if("zenni_buff" in buffs)zenni+=gainer
						nwishes+=1
						world<<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						view()<<sound('dbs_flying.wav')
						PORUNGADESTROYER()
						DBDAY()
						src<<"Your wish has been granted!"
						src<<"<font color=yellow>You have gained [gainer] Zennies!</font>"
						spawn(1)world.Namek_Dragonball_Spawn(9000)
						return
					if("Level")
						spawn(2)
							var/amount=10000
							nwishes+=1
							while(amount>0)
								if(!src)return
								exp=tnl
								Level_Up()
								amount-=1
								sleep(0.25)
						world<<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						view()<<sound('dbs_flying.wav')
						PORUNGADESTROYER()
						DBDAY()
						src<<"Your wish has been granted!"
						spawn(1)world.Namek_Dragonball_Spawn(9000)
						return
					if("Power")
						var/gainer=rand(2500000,3000000)
						powerlevel_max+=gainer
						nwishes +=1
						world<<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						view()<<sound('dbs_flying.wav')
						PORUNGADESTROYER()
						DBDAY()
						src<<"Your wish has been granted!"
						src<<"<font color=yellow>You have gained [gainer] Powerlevel!</font>"
						spawn(1)world.Namek_Dragonball_Spawn(9000)
						return
					if("Ki")
						var/gainer=rand(2500000,3000000)
						ki_max+=gainer
						kidefense_max+=gainer
						nwishes +=1
						world<<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						view()<<sound('dbs_flying.wav')
						PORUNGADESTROYER()
						DBDAY()
						src<<"Your wish has been granted!"
						src<<"<font color=yellow>You have gained [gainer] Ki!</font>"
						spawn(1)world.Namek_Dragonball_Spawn(9000)
						return
					if("Defense")
						var/gainer=rand(2500000,3000000)
						defence_max+=gainer
						nwishes+=1
						world<<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						view()<<sound('dbs_flying.wav')
						PORUNGADESTROYER()
						DBDAY()
						src<<"Your wish has been granted!"
						src<<"<font color=yellow>You have gained [gainer] Defense!</font>"
						spawn(1)world.Namek_Dragonball_Spawn(9000)
						return
					if("Strength")
						var/gainer=rand(2500000,3000000)
						strength_max+=gainer
						nwishes+=1
						world<<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						view()<<sound('dbs_flying.wav')
						PORUNGADESTROYER()
						DBDAY()
						src<<"Your wish has been granted!"
						src<<"<font color=yellow>You have gained [gainer] Strength!</font>"
						spawn(1)world.Namek_Dragonball_Spawn(9000)
						return
					if("Karma")
						switch(alert("Do you wish to be Pure or Evil?","","Pure","Evil"))
							if("Pure")
								karma="Good"
								karma_rating=50
							else
								karma="Evil"
								karma_rating=50
						nwishes+=1
						world<<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						view()<<sound('dbs_flying.wav')
						PORUNGADESTROYER()
						DBDAY()
						src<<"Your wish has been granted!"
						spawn(1)world.Namek_Dragonball_Spawn(9000)
						return
		else
			src<<"You have used all your wishes up!"
			return
	if(D=="Omega Shenron")
		if(level<15000)
			src<<"You need to be at least level 15,000 to be able to summon the Omega Shenron!"
			return
		if(!bwishes)
			if(b_db_1&&b_db_2&&b_db_3&&b_db_4&&b_db_5&&b_db_6&&b_db_7)
				for(var/obj/Black_Dragonballs/O in world)del(O)
				b_db_1=0
				b_db_2=0
				b_db_3=0
				b_db_4=0
				b_db_5=0
				b_db_6=0
				b_db_7=0
				world<<"<font color = green>The sky darkens as <font color=gray>[D]</font> is summoned!</font>"
				src<<sound('makewish.wav')
				DBNIGHT()
				SUMMONBKSHERNON()
				winshow(src,"Guide",1)
				src<<browse('BKShenron.png',"display=0")
				src<<browse("<body bgcolor=\"black\"><center><img src=BKShenron.png><p><font color = \"yellow\" size = 4>You have summoned [D]! </center>")
				bgrant=1
				sleep(15)
				switch(input("What is your wish?")in list("Level","Power","Defense","Strength","Ki","Training Points","Zenni"))
					if("Defense")
						var/gainer=45000000
						defence_max+=gainer
						bwishes+=1
						world<<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						view()<<sound('dbs_flying.wav')
						BKSHERNONDESTROYER()
						DBDAY()
						src<<"Your wish has been granted!"
						src<<"<font color=yellow>You have gained [gainer] Defense!</font>"
						spawn(1)world.Black_Dragonball_Spawn(18000)
						return
					if("Strength")
						var/gainer=45000000
						strength_max+=gainer
						bwishes+=1
						world<<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						view()<<sound('dbs_flying.wav')
						BKSHERNONDESTROYER()
						DBDAY()
						src<<"Your wish has been granted!"
						src<<"<font color=yellow>You have gained [gainer] Strength!</font>"
						spawn(1)world.Black_Dragonball_Spawn(18000)
						return
					if("Training Points")
						var/gainer=rand(2000000,5000000)
						tp+=gainer
						if("TP_buff" in buffs)tp+=gainer
						bwishes+=1
						world<<"<font color = green>The sky turns to it's normal color as <font color=gray>[D]</font> grants the wish and departs away!</font>"
						view()<<sound('dbs_flying.wav')
						BKSHERNONDESTROYER()
						DBDAY()
						src<<"Your wish has been granted!"
						src<<"<font color=yellow>You have gained [gainer] TPS!</font>"
						spawn(1)world.Black_Dragonball_Spawn(18000)
						return
					if("Zenni")
						var/gainer=rand(3000000000,6000000000)
						zenni+=gainer
						if("zenni_buff" in buffs)zenni+=gainer
						bwishes+=1
						world<<"<font color = green>The sky turns to it's normal color as <font color=gray>[D]</font> grants the wish and departs away!</font>"
						view()<<sound('dbs_flying.wav')
						BKSHERNONDESTROYER()
						DBDAY()
						src<<"Your wish has been granted!"
						src<<"<font color=yellow>You have gained [gainer] Zennies!</font>"
						spawn(1)world.Black_Dragonball_Spawn(18000)
						return
					if("Level")
						spawn(2)
							var/amount=15000
							bwishes+=1
							while(amount>0)
								if(!src)return
								exp=tnl
								Level_Up()
								amount-=1
								sleep(0.25)
						world<<"<font color = green>The sky turns to it's normal color as <font color=gray>[D]</font> grants the wish and departs away!</font>"
						view()<<sound('dbs_flying.wav')
						BKSHERNONDESTROYER()
						DBDAY()
						src<<"Your wish has been granted!"
						spawn(1)world.Black_Dragonball_Spawn(18000)
						return
					if("Power")
						var/gainer=45000000
						powerlevel_max+=gainer
						bwishes+=1
						world<<"<font color = green>The sky turns to it's normal color as <font color=gray>[D]</font> grants the wish and departs away!</font>"
						view()<<sound('dbs_flying.wav')
						BKSHERNONDESTROYER()
						DBDAY()
						src<<"Your wish has been granted!"
						src<<"<font color=yellow>You have gained [gainer] Powerleve!</font>"
						spawn(1)world.Black_Dragonball_Spawn(18000)
						return
					if("Ki")
						var/gainer=45000000
						ki_max+=gainer
						kidefense_max+=gainer
						bwishes+=1
						world<<"<font color = green>The sky turns to it's normal color as <font color=gray>[D]</font> grants the wish and departs away!</font>"
						view()<<sound('dbs_flying.wav')
						BKSHERNONDESTROYER()
						DBDAY()
						src<<"Your wish has been granted!"
						src<<"<font color=yellow>You have gained [gainer] Ki!</font>"
						spawn(1)world.Black_Dragonball_Spawn(18000)
						return
		else
			src<<"You have already used your wish!"
			return
obj/BKSHERNON
	icon='oshenlong.dmi'
	A
		density=1
		icon_state="1"
	B
		density=1
		icon_state="2"
	C
		density=1
		icon_state="3"
	D
		density=1
		icon_state="4"
	E
		density=1
		icon_state="5"
	F
		density=1
		icon_state="6"
	G
		density=1
		icon_state="7"
	H
		density=1
		icon_state="8"
	I
		density=1
		icon_state="9"
	J
		density=1
		icon_state="10"
	K
		density=1
		icon_state="11"
	L
		density=1
		icon_state="12"
obj/PORUNGA
	icon='porunga.dmi'
	A
		density=1
		icon_state="1"
	B
		density=1
		icon_state="2"
	C
		density=1
		icon_state="3"
	D
		density=1
		icon_state="4"
	E
		density=1
		icon_state="5"
	F
		density=1
		icon_state="6"
	G
		density=1
		icon_state="7"
	H
		density=1
		icon_state="8"
	I
		density=1
		icon_state="9"
	J
		density=1
		icon_state="10"
	K
		density=1
		icon_state="11"
	L
		density=1
		icon_state="12"
obj/SHERNON
	icon='Shernon.dmi'
	bl1
		density=1
		icon_state="bl1"
	cl1
		icon_state="cl1"
		density=1
	tl1
		icon_state="tl1"
		density=1
	m1b
		icon_state="m1b"
		density=1
	m1c
		icon_state="m1c"
		density=1
	m1t
		density=1
		icon_state="m1t"
	m2b
		icon_state="m2b"
		density=1
	m2c
		icon_state="m2c"
		density=1
	m2t
		icon_state="m2t"
		density=1
	rb
		icon_state="rb"
		density=1
	rc
		density=1
		icon_state="rc"
	rt
		icon_state="rt"
		density=1
obj
	var
		summonedshernon=0
		summonedbkshernon=0
		summonedporunga=0
mob/proc/SUMMONPORUNGA()
	var/obj/PORUNGA/A/A
	var/obj/PORUNGA/B/B
	var/obj/PORUNGA/C/C
	var/obj/PORUNGA/D/D
	var/obj/PORUNGA/E/E
	var/obj/PORUNGA/F/F
	var/obj/PORUNGA/G/G
	var/obj/PORUNGA/H/H
	var/obj/PORUNGA/I/I
	var/obj/PORUNGA/J/J
	var/obj/PORUNGA/K/K
	var/obj/PORUNGA/L/L
	A=new
	B=new
	C=new
	D=new
	E=new
	F=new
	G=new
	H=new
	I=new
	J=new
	K=new
	L=new
	A.summonedporunga=1
	B.summonedporunga=1
	C.summonedporunga=1
	D.summonedporunga=1
	E.summonedporunga=1
	F.summonedporunga=1
	G.summonedporunga=1
	H.summonedporunga=1
	I.summonedporunga=1
	J.summonedporunga=1
	K.summonedporunga=1
	L.summonedporunga=1
	A.loc=locate(x-1,y+1,z)
	B.loc=locate(x-1,y+2,z)
	C.loc=locate(x-1,y+3,z)
	D.loc=locate(x,y+1,z)
	E.loc=locate(x,y+2,z)
	F.loc=locate(x,y+3,z)
	G.loc=locate(x+1,y+1,z)
	H.loc=locate(x+1,y+2,z)
	I.loc=locate(x+1,y+3,z)
	J.loc=locate(x+2,y+1,z)
	K.loc=locate(x+2,y+2,z)
	L.loc=locate(x+2,y+3,z)
mob/proc/SUMMONBKSHERNON()
	var/obj/BKSHERNON/A/A
	var/obj/BKSHERNON/B/B
	var/obj/BKSHERNON/C/C
	var/obj/BKSHERNON/D/D
	var/obj/BKSHERNON/E/E
	var/obj/BKSHERNON/F/F
	var/obj/BKSHERNON/G/G
	var/obj/BKSHERNON/H/H
	var/obj/BKSHERNON/I/I
	var/obj/BKSHERNON/J/J
	var/obj/BKSHERNON/K/K
	var/obj/BKSHERNON/L/L
	A=new
	B=new
	C=new
	D=new
	E=new
	F=new
	G=new
	H=new
	I=new
	J=new
	K=new
	L=new
	A.summonedbkshernon=1
	B.summonedbkshernon=1
	C.summonedbkshernon=1
	D.summonedbkshernon=1
	E.summonedbkshernon=1
	F.summonedbkshernon=1
	G.summonedbkshernon=1
	H.summonedbkshernon=1
	I.summonedbkshernon=1
	J.summonedbkshernon=1
	K.summonedbkshernon=1
	L.summonedbkshernon=1
	A.loc=locate(x-1,y+1,z)
	B.loc=locate(x-1,y+2,z)
	C.loc=locate(x-1,y+3,z)
	D.loc=locate(x,y+1,z)
	E.loc=locate(x,y+2,z)
	F.loc=locate(x,y+3,z)
	G.loc=locate(x+1,y+1,z)
	H.loc=locate(x+1,y+2,z)
	I.loc=locate(x+1,y+3,z)
	J.loc=locate(x+2,y+1,z)
	K.loc=locate(x+2,y+2,z)
	L.loc=locate(x+2,y+3,z)
mob/proc/SUMMONSHERNON()
	var/obj/SHERNON/bl1/A
	var/obj/SHERNON/cl1/B
	var/obj/SHERNON/tl1/C
	var/obj/SHERNON/m1b/D
	var/obj/SHERNON/m1c/E
	var/obj/SHERNON/m1t/F
	var/obj/SHERNON/m2b/G
	var/obj/SHERNON/m2c/H
	var/obj/SHERNON/m2t/I
	var/obj/SHERNON/rb/J
	var/obj/SHERNON/rc/K
	var/obj/SHERNON/rt/L
	A=new
	B=new
	C=new
	D=new
	E=new
	F=new
	G=new
	H=new
	I=new
	J=new
	K=new
	L=new
	A.summonedshernon=1
	B.summonedshernon=1
	C.summonedshernon=1
	D.summonedshernon=1
	E.summonedshernon=1
	F.summonedshernon=1
	G.summonedshernon=1
	H.summonedshernon=1
	I.summonedshernon=1
	J.summonedshernon=1
	K.summonedshernon=1
	L.summonedshernon=1
	A.loc=locate(x-1,y+1,z)
	B.loc=locate(x-1,y+2,z)
	C.loc=locate(x-1,y+3,z)
	D.loc=locate(x,y+1,z)
	E.loc=locate(x,y+2,z)
	F.loc=locate(x,y+3,z)
	G.loc=locate(x+1,y+1,z)
	H.loc=locate(x+1,y+2,z)
	I.loc=locate(x+1,y+3,z)
	J.loc=locate(x+2,y+1,z)
	K.loc=locate(x+2,y+2,z)
	L.loc=locate(x+2,y+3,z)
proc/SHERNONDESTROYER()
	for(var/obj/D in world)if(D.summonedshernon)
		D.summonedshernon=0
		del(D)
proc/BKSHERNONDESTROYER()
	for(var/obj/D in world)if(D.summonedbkshernon)
		D.summonedbkshernon=0
		del(D)
proc/PORUNGADESTROYER()
	for(var/obj/D in world)if(D.summonedporunga)
		D.summonedporunga=0
		del(D)

var/tmp/earthtimed=0
var/tmp/namektimed=0
var/tmp/blacktimed=0
var
	earth_spawned=0
	namek_spawned=0
	black_spawned=0
var/earthtimer=15
var/namektimer=25
var/blacktimer=35
var/earthactivated=0
var/namekactivated=0
var/blackactivated=0