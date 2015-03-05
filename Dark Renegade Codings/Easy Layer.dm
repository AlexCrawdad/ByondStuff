turf
	var/bnorth = 0
	var/bsouth = 0
	var/beast = 0
	var/bwest = 0
	var/gnorth = 0
	var/gsouth = 0
	var/geast = 0
	var/gwest = 0

	Enter(mob/M as mob)//This one means if you try to enter and one of the cases is true

		if(ismob(M))
			if(M.buku)
				return 1

			if(src.gnorth&&M.dir==NORTH)
				return
			else if(src.gsouth&&M.dir==SOUTH)
				return
			else if(src.geast&&M.dir==EAST)
				return
			else if(src.gwest&&M.dir==WEST)
				return

			else
				return..()
		else
			return..()

	Exit(mob/M as mob)//This one means if you try to exit and one of the cases is true

		if(ismob(M))
			if(M.buku)
				return 1

			if(src.bnorth&&M.dir==NORTH)
				return
			else if(src.bsouth&&M.dir==SOUTH)
				return
			else if(src.beast&&M.dir==EAST)
				return
			else if(src.bwest&&M.dir==WEST)
				return

			else
				return..()
		else
			return..()