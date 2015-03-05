world/proc/World_Revive()
	set background = 1
	world << "<font face ='Palatino Linotype' color=Blue>Searching for dead players...</font>"
	while(world)
		for(var/mob/PC/M in world)

			if(M.dead)
				world << "<font face ='Palatino Linotype' color=Blue>[M] found !</font>"
				M.Power_Redefine()
				M.overlays -= 'Halo.dmi'
				M.overlays -= 'Halo.dmi'
				M.overlays -= 'Halo.dmi'
				M.overlays -= 'Halo.dmi'
				M.overlays -= 'Halo.dmi'
				M.loc = locate(rand(51,63),rand(236,246),1)
				M.safe = 0
				M.dead = 0
				world << "<font face ='Palatino Linotype' color=Blue>[M]</font> has been automatically revived!"

		sleep(6000)
		continue
