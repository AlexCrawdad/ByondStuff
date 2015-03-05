turf
	Passages
		BIGEARTH
			Entrances
				West
					density=1
					Enter(mob/M)
						if(istype(M,/mob/PC))
							M.loc=locate(400,99,9)
							M.frozen=0
							M.it_lock = 0
				WestExit
					density=1
					Enter(mob/M)
						if(istype(M,/mob/PC))
							M.loc=locate(1,197,1)
							M.frozen=0
							M.it_lock = 0
				East
					density=1
					Enter(mob/M)
						if(istype(M,/mob/PC))
							M.loc=locate(0,99,10)
							M.frozen=0
							M.it_lock = 0
