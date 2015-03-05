obj/Equipment/Consumable/PodCapsule
	name= "Pod Capsule"
	icon='Capsule.dmi'
	icon_state="2"
	Click()
		if(usr.z!=1&&usr.z!=2&&usr.z!=3&&usr.z!=4)
			usr<<"You cannot use this here."
			return
		else new/obj/Spaceship/SpacePod(usr.loc)
obj/Equipment/Consumable/Candy
	name=""
	icon='Candy.dmi'
	icon_state=""
	var/candy_pl
	var/candy_ki
	var/candy_kidef
	var/candy_def
	var/candy_str
	Click()
		if(src in usr:contents)
			if(usr.race=="Majin"||usr.race=="Half Majin")
				usr<<"<font color=red>You put [src] in your mouth and crunch it down."
				if(candy_pl > (usr.powerlevel_max/1500))
					usr<<"<font color=red>You try to eat this candy but your body cannot handle the power"
					return
				usr.eats+=1
				if(candy_pl>1)candy_pl=candy_pl
				usr.powerlevel_max+=candy_pl
				del(src)
			else del(src)
	verb
		Pick_Up()
			set src in oview(0)
			set category=null
			if(usr.CheckInventory()==TRUE)return
			if(Move(usr))
				usr<<"You have picked up [src]."
				usr.inven_min+=1
			else usr<<"You are unable to pick up [src]."
		Drop()
			set category=null
			usr.inven_min-=1
			loc=usr.loc
			usr<<"You have dropped the: <u>[src]</u>."
obj/Equipment/Admin_Item
	name=""
	icon
	icon_state=""
	Click()
		if(src in usr:contents)
			if(!eq)
				usr<<"You wear the [src]."
				suffix="(Worn)"
				usr.overlays+=icon
				eq=1
			else
				usr<<"You remove the [src]."
				suffix=null
				usr.overlays-=icon
				eq=0
	verb
		Pick_Up()
			set src in oview(0)
			set category=null
			if(usr.CheckInventory()==TRUE)return
			if(Move(usr))
				usr<<"You have picked up [src]."
				usr.inven_min+=1
			else usr<<"You are unable to pick up [src]."
		Drop()
			set category=null
			if(!eq)
				usr.inven_min-=1
				loc=usr.loc
				usr<<"You have dropped the: <u>[src]</u>."
			else
				usr<<"Cannot drop it while it is equiped."
				return
		Destroy()
			set category=null
			if(src in usr:contents)
				if(!eq)
					usr.inven_min-=1
					del(src)
				else
					usr<<"Cannot do that while it is equiped."
					return
			else return
obj/Equipment/Guild_Item
	name=""
	icon
	icon_state=""
	Click()
		if(src in usr:contents)
			if(!eq&&guild==usr.guild_name)
				if(usr.gitems<=5)
					usr<<"You wear the [src]."
					suffix="(Worn)"
					usr.overlays+=icon
					usr.gitems+=1
					eq=1
				else
					usr<<"You can only have 5 guild items equipped."
					return
			else
				usr<<"You remove the [src]."
				suffix=null
				usr.overlays-=icon
				eq=0
				usr.gitems-=1
				if(usr.gitems<0)usr.gitems=0
	verb
		Pick_Up()
			set src in oview(0)
			set category=null
			if(usr.CheckInventory()==TRUE)return
			if(guild==usr.guild_name)
				if(Move(usr))
					usr<<"You have picked up [src]."
					usr.inven_min+=1
				else usr<<"You are unable to pick up [src]."
			else
				usr<<"You are not in the guild: [guild]."
				return
		Drop()
			set category=null
			if(!eq)
				usr.inven_min-=1
				loc=usr.loc
				usr<<"You have dropped the: <u>[src]</u>."
			else
				usr<<"Cannot drop it while it is equiped."
				return
		Destroy()
			set category=null
			if(src in usr:contents)
				if(!eq)
					usr.inven_min -= 1
					del(src)
				else
					usr<<"Cannot do that while it is equiped."
					return
			else return
mob/var/gitems=0
obj/Equipment/Guild_Item2
	name=""
	icon
	icon_state=""
	Click()
		if(src in usr:contents)
			if(!eq&&guild==usr.guild_name)
				if(usr.gitems<=5)
					usr<<"You wear the [src]."
					suffix="(Worn)"
					usr.underlays+=icon
					eq=1
					usr.gitems+=1
				else
					usr<<"You can only have 5 guild items equipped."
					return
			else
				usr<<"You remove the [src]."
				suffix=null
				usr.underlays-=icon
				eq=0
				usr.gitems-=1
				if(usr.gitems<0)usr.gitems=0
	verb
		Pick_Up()
			set src in oview(0)
			set category=null
			if(usr.CheckInventory()==TRUE)return
			if(guild==usr.guild_name)
				if(Move(usr))
					usr<<"You have picked up [src]."
					usr.inven_min+=1
				else usr<<"You are unable to pick up [src]."
			else
				usr<<"You are not in the guild: [src.guild]."
				return
		Drop()
			set category=null
			if(!eq)
				usr.inven_min-=1
				loc=usr.loc
				usr<<"You have dropped the: <u>[src]</u>."
			else
				usr<<"Cannot drop it while it is equiped."
				return
		Destroy()
			set category=null
			if(src in usr:contents)
				if(!eq)
					usr.inven_min-=1
					del(src)
				else
					usr<<"Cannot do that while it is equiped."
					return
			else return
obj/Equipment/Consumable/Chip
	name =  "Chip"
	icon = 'Chip.dmi'
	Click()
		if(src in usr:contents)
			if(usr.race == "Android")
				if(usr.gene_model13)
					if(usr.chips < 10)
						usr << "<font color = red>You absorb the chip into your system!"
						usr.chips ++
						usr.powerlevel_max += 1000000
						del(src)
						return
				if(usr.gene_model17)
					if(usr.chips < 15)
						usr << "<font color = red>You absorb the chip into your system!"
						usr.chips ++
						usr.powerlevel_max += 1000000
						del(src)
						return
			else
				usr << "I have to use for this..might as well just drop it."
				return
	verb
		Pick_Up()
			set src in oview(0)
			set category=null
			if(usr.CheckInventory()==TRUE)return
			if(Move(usr))
				usr<<"You have picked up [src]."
				usr.inven_min+=1
			else usr<<"You are unable to pick up [src]."
		Drop()
			set category=null
			usr.inven_min-=1
			loc=usr.loc
			usr<<"You have dropped the <u>[src]</u>."


obj/Equipment/Consumable/MChip
	name =  "Mega Chip"
	icon = 'Mega Chip.dmi'
	Click()
		if(src in usr:contents)
			if(usr.race == "Android")
				if(usr.gene_model13)
					if(usr.mchips < 5)
						usr << "<font color = red>You absorb the Mega Chip into your system!"
						usr.mchips ++
						usr.powerlevel_max += 2000000
						usr.ki_max += 2000000
						del(src)
						return
				if(usr.gene_model17)
					if(usr.mchips < 3)
						usr << "<font color = red>You absorb the Mega Chip into your system!"
						usr.mchips ++
						usr.powerlevel_max += 2000000
						usr.ki_max += 2000000
						del(src)
						return
			else
				usr << "I have to use for this..might as well just drop it."
				return
	verb
		Pick_Up()
			set src in oview(0)
			set category = null
			if(usr.CheckInventory()==TRUE)return
			if(Move(usr))
				usr << "You have picked up [src.name]."
				usr.inven_min += 1
			else
				usr << "You are unable to pick up [src.name]."
		Drop()
			set category = null
			usr.inven_min -= 1
			src.loc = usr.loc
			usr << "You have dropped the <u>[src.name]</u>."