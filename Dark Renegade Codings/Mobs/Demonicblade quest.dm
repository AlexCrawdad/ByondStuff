obj/Equipment
	D_Blade
		name = "Demonic Blade"
		icon = 'Demonic Blade.dmi'
		icon_state = "drop"
		var/sword = 'Demonic Blade.dmi'
		value = 5000000
		density = 0
		weight=5.9
		Click()
			if(src in usr:contents)
				if(!src.item_owner)
					switch(alert("This item is not Bio-Linked. Do you wish to Bio-Link it now?","","Yes","No"))
						if("Yes")
							src.item_owner=usr.key
				if(usr.level < 5000)
					usr << "<font color=blue>You need to be level 5000 or higher to be able to pick up this Sword."
					return
				else
					if(!usr.z_sword)
						if(usr.back == "EMPTY")
							if(src.item_owner!=usr.key&&src.item_owner)
								usr<<"Error: This item is Bio-Linked to someone."
								return
							usr.overlays += sword
							usr << "You have equiped the: <u>[src]</u>."
							suffix = "{Worn}"
							usr.z_sword = 1
							src.equiped = 1
							usr.back = "Z-Sword"
						else
							usr << "Error: You already have something equipped on your Shoulders!"
							return
					else
						usr.overlays -= sword
						usr << "You have unequiped the: <u>[src]</u>."
						suffix = null
						usr.z_sword = 0
						src.equiped = 0
						usr.back = "EMPTY"

		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.level < 5000)
					usr << "<font color=blue>You need to be level 5000 or higher to be able to pick up this Sword."
					return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."
			Summon_Jenemba()
				set category = null
				if(usr.race == "Half Saiyan" && usr.gene_demonic)
					if(usr.karma == "Evil" && usr.karma_rating >= 50)
						if(usr.powerlevel_max >= 20000000)
							if(!usr.demonic)
								for(var/mob/NPC/N in oview(15))
									if(N.name == "{NPC}Dabura")
										var/mob/NPC/Jenemba/M = new
										M.owner=usr
										M.loc = usr.loc
									else
										usr << "You must be in HFIL close to Dabura befor you can summon Jenemba."
										return
						else
							usr<<"You need 20,000,000 powerlevel."
							return
					else
						usr<<"You need 50% Evil Karma."
						return
				else
					usr << "You can't summon Jenemba."
					return


mob/var/d_sword_quest = 0
mob/var/demonicsword = 0
obj/quests
	D_Sword_Quest
		name = "Blade of Jenemba"
		density = 1
		icon = 'Demonic Blade.dmi'
		icon_state = "pull out"
		verb
			Pull_Out()
				set category = "Actions"
				set src in oview(1)
				if(usr.race == "Human" || usr.race == "Saiyan" || usr.race == "Half Saiyan" || usr.race == "Android")
					if(!usr.d_sword_quest)
						if(usr.karma == "Evil")
							if(usr.powerlevel_max >= 10000000)
								if(usr.inven_min<usr.inven_max)
									world << "[usr] has managed to pull out <u>The Blade of Jenemba</u>!"
									usr.contents += new/obj/Equipment/D_Blade
									usr.d_sword_quest = 1
									return
								else
									usr<<"You have no space in your inventory."
									return
							else
								usr << "You need 10.000.000 powerlevel."
								return
						else
							usr << "<font color = white>[usr]:</font> Wait... What am I doing? This blade is made of Pure Evil, I can not grasp this sword."
							return
					else
						usr << "<font color = white>[usr]:</font> Wait, I already have one."
						return