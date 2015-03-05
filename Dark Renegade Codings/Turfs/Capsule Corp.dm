turf
	Passages
		CapsuleCorp
			ChamberExit
				Enter(var/mob/PC/M)
					if(!ismob(M))return
					M.loc = locate(326,74,1)
					M.buku_lock = 0
					M.ki_lock = 0
					M.it_lock = 0
					M.safe=0
			ChamberEntrance
				Enter(var/mob/PC/M)
					if(!ismob(M))return
					if(M.buku)return
					for(var/obj/O in M.contents)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
					for(var/obj/Earth_Dragonballs/O in M.contents)
						M<<"You cannot enter with the dragonballs!"
						return
					for(var/obj/Namek_Dragonballs/O in M.contents)
						M<<"You cannot enter with the dragonballs!"
						return
					for(var/obj/Black_Dragonballs/O in M.contents)
						M<<"You cannot enter with the dragonballs!"
						return
					M.loc = locate(86,303,6)
					M.safe=1
					M.it_lock=1
					M.ki_lock=1
			TrainingEntrance
				Enter(var/mob/PC/M)
					if(!ismob(M))return
					M.loc = locate(353,228,5)
					M.gravity_train=1
					M.grav=1
					M.safe=1
					M.it_lock=1
					M.ki_lock=1
			SimulationEntrance
				Enter(var/mob/PC/M)
					if(!ismob(M))return
					M.loc = locate(232,50,5)
					M.safe=1
					M.it_lock=1
					M.ki_lock=1
			CapsuleCorpExit
				density = 1
				Enter(var/mob/PC/M)
					if(!ismob(M))return
					M.loc = locate(108,337,6)
					M.gravity_train=0
					M.grav=0
					M.safe=1
					M.it_lock=1
					M.ki_lock=1