turf
	Passages
		Whirlpool_Entrance_Exit
			Entrance
				density=1
				Enter(mob/M)
					if(istype(M,/mob/PC))
						if(M.buku == 0)
							M.loc=locate(156,243,5)
							M << "[usr.name]:<font color = red> ARHHHHHHHHHHHHH!!!!!!"
							view(6)<<"<font color=white>[usr.name] is sucked into the Tornado, should you follow?"
						else
							M << "You Must Land First, then walk in, you cannot be sucked in while flying."
							return

			Exit
				density=1
				Enter(mob/M)
					if(istype(M,/mob/PC))M.loc=locate(136,336,1)






turf/Whirlpool
	icon = 'Floors.dmi'
	Whirlpool
		density = 1
		icon_state = "700"