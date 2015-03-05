obj/Equipment/TP_Drop
	var/droploc = 0
	name = "TP Crystal"
	icon = 'TP Drop.dmi'
	value = 100000000
	verb
		Add_Training_Points()
			set category = null
			var/tpboost = rand(1,2000)
			usr << "<B><font color = green>TP: +[tpboost]"
			usr.tp += tpboost
			sleep(1)
			del(src)

		Pick_Up()
			set src in oview(0)
			set category = null
			if(Move(usr))
				usr << "You pick up the [src]"
			else
				usr << "You cannot pick up the [src]"


		Drop()
			set category = null
			src.loc = usr.loc
			droploc=src.loc
			usr << "You drop the [src]"
			sleep (50)
			if(src.loc == droploc)
				del(src)


		Description()
			set category = null
			alert("This is a TP Crystal, The amount of TP's gained from the Crystal is a Dynamic amount varying from 1 to 5000, they are usually left where a person was killed.")