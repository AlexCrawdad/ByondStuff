mob
	Monster
		Cell_Jr
			name = "{NPC}Cell Jr."
			icon = 'Cell Jr.dmi'
			density = 1
			powerlevel = 10000
			powerlevel_max = 10000
			ki = 10000
			ki_max = 10000
			speed = 4000
			strength = 5000
			defence = 5000
			critical = 20
			karma = "Evil"
			race = "Bio-Android"
			level = 50
			zenni = 250
			pk = 1
			exp = 200000
			Bump(mob/M)
				if(istype(M,/mob/PC))src.Attack2(M)
