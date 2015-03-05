obj/Equipment/Consumable
	Senzu
		name="Senzu Bean"
		icon='Senzu Bean.dmi'
		value=500
		Click()
			if(src in usr:contents)
				if(usr.regen_dead)
					usr<<"You can't eat this at the moment."
					return
				if(usr.KO)return
				view(8)<<"[usr] eats a [src]."
				usr.powerlevel=usr.powerlevel_max
				usr.ki=usr.ki_max
				usr.stamina=0
				usr.inven_min-=1
				del(src)
				if(usr.CheckInventory()==TRUE)return
				return
		verb
			Pick_Up()
				set src in oview(0)
				set category=null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr<<"You have picked up the: <u>[src]</u>."
					usr.inven_min+=1
				else usr<<"You are unable to pick up the: <u>[src]</u>."
			Drop()
				set category=null
				loc=usr.loc
				usr<<"You have dropped the: <u>[src]</u>."
				usr.inven_min-=1