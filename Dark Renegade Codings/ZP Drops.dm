obj/Equipment/Zenni_Drop

	name =  "Zenni Crystal"
	icon = 'Zenni.dmi'
	value = 30000000

	verb
		Add_Zenni()
			set category = null
			var/zpboost = rand(10000,500000)
			usr << "<B><font color = green>Zenni: +[zpboost]"
			usr.zenni += zpboost
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
			usr << "You drop the [src]"

		Description()
			set category = null
			alert("This is a Zenni Crystal, it's value is random.")

