

mob
	var
		sixteenitem=0;supremeitem=0;evilitem=0;sauronitem=0;vegitoitem=0;gokuitem=0;greenmonkitem=0;redmonkitem=0;yellowmonkitem=0;whitemonkitem=0;greymonkitem=0


obj/Equipment
	Android16_item
		icon='#16.dmi'
		name = "Green Armor"
		density = 0
		equiped = 0
		value = 2000
		Click()
			if(src in usr:contents)
				if(!src.item_owner)
					switch(alert("This item is not Bio-Linked. Do you wish to Bio-Link it now?","","Yes","No"))
						if("Yes")src.item_owner=usr.key
				if(!usr.weightgi)
					if(usr.chest == "EMPTY")
						if(src.equiped)
							usr<<"Error: </B> [src] is already equipped!"
							return
						if(src.item_owner!=usr.key&&src.item_owner)
							usr<<"Error: This item is Bio-Linked to someone."
							return
						if(usr.level>=2000)
							usr.overlays += src.icon
							usr<<"You have equiped the: <u>[src]</u>."
							suffix = "(Worn)"
							usr.weight+=src.weight
							usr.chest = src.name
							usr.weightgi = 1
							src.equiped = 1
							usr.powerlevel_max+=20000000
							usr.ki_max+=20000000
							usr.kidefense_max+=20000000
							usr.strength_max+=20000000
							usr.defence_max+=20000000
							usr.sixteenitem=1
							usr.Skills_Checker()
							return
						else
							usr<<"Error: You need to be above level 2000 to wear this!"
							return
					else
						usr<<"Error: You already have something equipped on your Chest or Shoulders!"
						return
				if(usr.weightgi >= 1)
					if(src.equiped)
						usr.overlays -= src.icon
						usr<<"You have unequiped the: <u>[src]</u>."
						suffix = null
						usr.chest = "EMPTY"
						usr.weight-=src.weight
						usr.weightgi = 0
						src.equiped = 0
						usr.powerlevel_max-=20000000
						usr.ki_max-=20000000
						usr.kidefense_max-=20000000
						usr.strength_max-=20000000
						usr.defence_max-=20000000
						usr.sixteenitem=0
					else
						usr<<"Error: You may only have one of: <u>[src]</u> equipped."
						return
		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr<<"You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
			Drop()
				set category = null
				if(!src.equiped)
					usr<<"This is a Valiant Item, you cannot Drop it!"
				else usr<<"You are unable to drop: <u>[src]</u>, it's already equipped."

			Description()
				set category = null
				alert("Greatly Increases PL, KI, STR and DEF.")




obj/Equipment
	Supreme_item
		icon='Supreme Suit.dmi'
		name = "Supreme Suit"
		density = 0
		equiped = 0
		value = 3000
		Click()
			if(src in usr:contents)
				if(!src.item_owner)
					switch(alert("This item is not Bio-Linked. Do you wish to Bio-Link it now?","","Yes","No"))
						if("Yes")src.item_owner=usr.key
				if(!usr.weightgi)
					if(usr.chest == "EMPTY")
						if(src.equiped)
							usr<<"Error: </B> [src] is already equipped!"
							return
						if(src.item_owner!=usr.key&&src.item_owner)
							usr<<"Error: This item is Bio-Linked to someone."
							return
						if(usr.level>=4000)
							usr.overlays += src.icon
							usr<<"You have equiped the: <u>[src]</u>."
							suffix = "(Worn)"
							usr.weight+=src.weight
							usr.chest = src.name
							usr.weightgi = 1
							src.equiped = 1
							usr.powerlevel_max+=30000000
							usr.ki_max+=30000000
							usr.kidefense_max+=30000000
							usr.strength_max+=30000000
							usr.defence_max+=30000000
							usr.supremeitem=1
							usr.Skills_Checker()
							return
						else
							usr<<"Error: You need to be above level 4000 to wear this!"
					else
						usr<<"Error: You already have something equipped on your Chest or Shoulders!"
						return
				if(usr.weightgi >= 1)
					if(src.equiped)
						usr.overlays -= src.icon
						usr<<"You have unequiped the: <u>[src]</u>."
						suffix = null
						usr.chest = "EMPTY"
						usr.weight-=src.weight
						usr.weightgi = 0
						src.equiped = 0
						usr.powerlevel_max-=30000000
						usr.ki_max-=30000000
						usr.kidefense_max-=30000000
						usr.strength_max-=30000000
						usr.defence_max-=30000000
						usr.supremeitem=0
					else
						usr<<"Error: You may only have one of: <u>[src]</u> equipped."
						return
		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr<<"You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
			Drop()
				set category = null
				if(!src.equiped)
					usr<<"This is a Valiant Item, you cannot Drop it!"
				else usr<<"You are unable to drop: <u>[src]</u>, it's equipped."

			Description()
				set category = null
				alert("Greatly Increases PL, KI, STR and DEF.")


obj/Equipment
	Evil_Face
		icon='Death Face.dmi'
		name = "Mask of Death"
		density = 0
		equiped = 0
		value = 3000
		Click()
			if(src in usr:contents)
				if(!usr.weighthead)
					if(usr.head == "EMPTY")
						if(src.equiped)
							usr<<"Error: </B> [src] is already equipped!"
							return
						if(src.item_owner!=usr.key&&src.item_owner)
							usr<<"Error: This item is Bio-Linked to someone."
							return
						if(usr.level>=4000)
							usr.overlays += src.icon
							usr<<"You have equiped the: <u>[src]</u>."
							suffix = "(Worn)"
							usr.weight+=src.weight
							usr.head = src.name
							usr.weighthead = 1
							src.equiped = 1
							usr.strength_max+=100000000
							usr.evilitem=1
							usr.Skills_Checker()
							return
						else
							usr<<"Error: You need to be above level 4000 to wear this!"
					else
						usr<<"Error: You already have something equipped on your Chest or Shoulders!"
						return
				if(usr.weighthead >= 1)
					if(src.equiped)
						usr.overlays -= src.icon
						usr<<"You have unequiped the: <u>[src]</u>."
						suffix = null
						usr.head = "EMPTY"
						usr.weight-=src.weight
						usr.weighthead = 0
						src.equiped = 0
						usr.strength_max-=100000000
						usr.evilitem=0
					else
						usr<<"Error: You may only have one of: <u>[src]</u> equipped."
						return
		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr<<"You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
			Drop()
				set category = null
				if(!src.equiped)
					usr<<"This is a Valiant Item, you cannot Drop it!"
				else usr<<"You are unable to drop: <u>[src]</u>, it's equipped."

			Description()
				set category = null
				alert("This is a Mysterious Mask. Greatly Increases STR.")



obj/Equipment
	Major_Potion
		icon='Food.dmi'
		icon_state="Food Potion"
		name = "Major Potion"
		density = 0
		value = 50000
		Click()
			if(src in usr:contents)
				if(!usr.hungerblock)
					usr<<"You have drank the <u>[src]</u>."
					usr.MassiveHungerBlock()
					del(src)
					if(usr.CheckInventory()==TRUE)return
					return
			else
				usr<<"You Cannot use this Potion whilest another one is active!"
		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr<<"You have picked up the: <u>[src]</u>."
					usr.inven_min += 1

			Description()
				set category = null
				alert("This is a Food Potion. Stops Hunger.(Approx. 167 Minutes.)")

obj/Equipment
	Minor_Potion
		icon='Food.dmi'
		icon_state="Minor Food Potion"
		name = "Minor Potion"
		density = 0
		value = 25000
		Click()
			if(src in usr:contents)
				if(!usr.hungerblock)
					usr<<"You have drank the <u>[src]</u>."
					usr.MiniHungerBlock()
					del(src)
					if(usr.CheckInventory()==TRUE)return
					return
			else
				usr<<"You Cannot use this Potion whilest another one is active!"
		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr<<"You have picked up the: <u>[src]</u>."
					usr.inven_min += 1

			Description()
				set category = null
				alert("This is a Food Potion. Stops Hunger.(Approx 83 Minutes)")

obj/Equipment
	Crunchbar
		icon='Food.dmi'
		icon_state="Crunch Bar"
		name = "Candy Bar"
		density = 0
		value = 100
		Click()
			if(src in usr:contents)
				usr<<"You eat the <u>[src]</u>."
				usr.hunger-=50
				del(src)
				if(usr.CheckInventory()==TRUE)return
				return
			else
				usr<<"You Cannot use this Potion whilest another one is active!"
		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr<<"You have picked up the: <u>[src]</u>."
					usr.inven_min += 1

			Description()
				set category = null
				alert("This is a Candy Bar, Cures 50 Hunger.")



mob/proc/MassiveHungerBlock()
	usr.hungerblock=1
	sleep(100000)
	usr.hungerblock=0

mob/proc/MiniHungerBlock()
	usr.hungerblock=1
	sleep(50000)
	usr.hungerblock=0



obj/Equipment
	SauronArmor
		icon='Sauronnew.dmi'
		name = "Dark Metal Armor"
		density = 0
		equiped = 0
		value = 4000
		Click()
			if(src in usr:contents)
				if(!usr.weightgi)
					if(usr.chest == "EMPTY")
						if(src.equiped)
							usr<<"Error: </B> [src] is already equipped!"
							return
						if(src.item_owner!=usr.key&&src.item_owner)
							usr<<"Error: This item is Bio-Linked to someone."
							return
						if(usr.level>=5000)
							usr.overlays += src.icon
							usr<<"You have equiped the: <u>[src]</u>."
							suffix = "(Worn)"
							usr.weight+=src.weight
							usr.chest = src.name
							usr.weightgi = 1
							src.equiped = 1
							usr.defence_max+=10000000
							usr.strength_max+=10000000
							usr.powerlevel_max+=10000000
							usr.ki_max+=10000000
							usr.sauronitem=1
							usr.Skills_Checker()
							return
						else
							usr<<"Error: You need to be above level 5000 to wear this!"
					else
						usr<<"Error: You already have something equipped on your Chest or Shoulders!"
						return
				if(usr.weightgi >= 1)
					if(src.equiped)
						usr.overlays -= src.icon
						usr<<"You have unequiped the: <u>[src]</u>."
						suffix = null
						usr.chest = "EMPTY"
						usr.weight-=src.weight
						usr.weightgi = 0
						src.equiped = 0
						usr.defence_max-=10000000
						usr.strength_max-=10000000
						usr.powerlevel_max-=10000000
						usr.ki_max-=10000000
						usr.sauronitem=0
					else
						usr<<"Error: You may only have one of: <u>[src]</u> equipped."
						return
		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr<<"You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
			Drop()
				set category = null
				if(!src.equiped)
					usr<<"This is a Valiant Item, you cannot Drop it!"
				else usr<<"You are unable to drop: <u>[src]</u>, it's equipped."

			Description()
				set category = null
				alert("Increases DEF, STR, KI, PL.")



obj/Equipment
	VegitoSuit
		icon='Vegito Suit.dmi'
		name = "Cool Gi"
		density = 0
		equiped = 0
		value = 4500
		Click()
			if(src in usr:contents)
				if(!usr.weightgi)
					if(usr.chest == "EMPTY")
						if(src.equiped)
							usr<<"Error: </B> [src] is already equipped!"
							return
						if(src.item_owner!=usr.key&&src.item_owner)
							usr<<"Error: This item is Bio-Linked to someone."
							return
						if(usr.level>=7000)
							usr.overlays += src.icon
							usr<<"You have equiped the: <u>[src]</u>."
							suffix = "(Worn)"
							usr.weight+=src.weight
							usr.chest = src.name
							usr.weightgi = 1
							src.equiped = 1
							usr.defence_max+=100000000
							usr.strength_max+=100000000
							usr.powerlevel_max+=100000000
							usr.ki_max+=100000000
							usr.vegitoitem=1
							usr.Skills_Checker()
							return
						else
							usr<<"Error: You need to be above level 7000 to wear this!"
					else
						usr<<"Error: You already have something equipped on your Chest or Shoulders!"
						return
				if(usr.weightgi >= 1)
					if(src.equiped)
						usr.overlays -= src.icon
						usr<<"You have unequiped the: <u>[src]</u>."
						suffix = null
						usr.chest = "EMPTY"
						usr.weight-=src.weight
						usr.weightgi = 0
						src.equiped = 0
						usr.defence_max-=100000000
						usr.strength_max-=100000000
						usr.powerlevel_max-=100000000
						usr.ki_max-=100000000
						usr.vegitoitem=0
					else
						usr<<"Error: You may only have one of: <u>[src]</u> equipped."
						return
		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr<<"You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
			Drop()
				set category = null
				if(!src.equiped)
					usr<<"This is a Valiant Item, you cannot Drop it!"
				else usr<<"You are unable to drop: <u>[src]</u>, it's equipped."

			Description()
				set category = null
				alert("Increases DEF, STR, KI, PL.")


obj/Equipment
	GokuSuit
		icon='Goku Suit(NIK).dmi'
		name = "Super Gi"
		density = 0
		equiped = 0
		value = 5000
		Click()
			if(src in usr:contents)
				if(!usr.weightgi)
					if(usr.chest == "EMPTY")
						if(src.equiped)
							usr<<"Error: </B> [src] is already equipped!"
							return
						if(src.item_owner!=usr.key&&src.item_owner)
							usr<<"Error: This item is Bio-Linked to someone."
							return
						if(usr.level>=9000)
							usr.overlays += src.icon
							usr<<"You have equiped the: <u>[src]</u>."
							suffix = "(Worn)"
							usr.weight+=src.weight
							usr.chest = src.name
							usr.weightgi = 1
							src.equiped = 1
							usr.defence_max+=500000000
							usr.strength_max+=500000000
							usr.powerlevel_max+=500000000
							usr.ki_max+=500000000
							usr.gokuitem=1
							usr.Skills_Checker()
							return
						else
							usr<<"Error: You need to be above level 9000 to wear this!"
					else
						usr<<"Error: You already have something equipped on your Chest or Shoulders!"
						return
				if(usr.weightgi >= 1)
					if(src.equiped)
						usr.overlays -= src.icon
						usr<<"You have unequiped the: <u>[src]</u>."
						suffix = null
						usr.chest = "EMPTY"
						usr.weight-=src.weight
						usr.weightgi = 0
						src.equiped = 0
						usr.defence_max-=500000000
						usr.strength_max-=500000000
						usr.powerlevel_max-=500000000
						usr.ki_max-=500000000
						usr.gokuitem=0
					else
						usr<<"Error: You may only have one of: <u>[src]</u> equipped."
						return
		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr<<"You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
			Drop()
				set category = null
				if(!src.equiped)
					usr<<"This is a Valiant Item, you cannot Drop it!"
				else usr<<"You are unable to drop: <u>[src]</u>, it's equipped."

			Description()
				set category = null
				alert("Increases DEF, STR, KI, PL.")


obj/Equipment
	greenmonksuit
		icon='MONKGREEN.dmi'
		name = "Restless Monk Suit"
		density = 0
		equiped = 0
		value = 500
		Click()
			if(src in usr:contents)
				if(!usr.weightgi)
					if(usr.chest == "EMPTY")
						if(src.equiped)
							usr<<"Error: </B> [src] is already equipped!"
							return
						if(src.item_owner!=usr.key&&src.item_owner)
							usr<<"Error: This item is Bio-Linked to someone."
							return
						if(usr.level>=2000)
							usr.overlays += src.icon
							usr<<"You have equiped the: <u>[src]</u>."
							suffix = "(Worn)"
							usr.weight+=src.weight
							usr.chest = src.name
							usr.weightgi = 1
							src.equiped = 1
							usr.stamina_max+=1000000
							usr.greenmonkitem=1
							usr.Skills_Checker()
							return
						else
							usr<<"Error: You need to be above level 2000 to wear this!"
					else
						usr<<"Error: You already have something equipped on your Chest or Shoulders!"
						return
				if(usr.weightgi >= 1)
					if(src.equiped)
						usr.overlays -= src.icon
						usr<<"You have unequiped the: <u>[src]</u>."
						suffix = null
						usr.chest = "EMPTY"
						usr.weight-=src.weight
						usr.weightgi = 0
						src.equiped = 0
						usr.stamina_max-=1000000
						usr.greenmonkitem=0
					else
						usr<<"Error: You may only have one of: <u>[src]</u> equipped."
						return
		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr<<"You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
			Drop()
				set category = null
				if(!src.equiped)
					usr<<"This is a Valiant Item, you cannot Drop it!"
				else usr<<"You are unable to drop: <u>[src]</u>, it's equipped."

			Description()
				set category = null
				alert("Increases Stamina.")


obj/Equipment
	redmonksuit
		icon='MONKRED.dmi'
		name = "Strong Monk Suit"
		density = 0
		equiped = 0
		value = 7000
		Click()
			if(src in usr:contents)
				if(!usr.weightgi)
					if(usr.chest == "EMPTY")
						if(src.equiped)
							usr<<"Error: </B> [src] is already equipped!"
							return
						if(src.item_owner!=usr.key&&src.item_owner)
							usr<<"Error: This item is Bio-Linked to someone."
							return
						if(usr.level>=15000)
							usr.overlays += src.icon
							usr<<"You have equiped the: <u>[src]</u>."
							suffix = "(Worn)"
							usr.weight+=src.weight
							usr.chest = src.name
							usr.weightgi = 1
							src.equiped = 1
							usr.strength_max+=1500000000
							usr.redmonkitem=1
							usr.Skills_Checker()
							return
						else
							usr<<"Error: You need to be above level 15000 to wear this!"
					else
						usr<<"Error: You already have something equipped on your Chest or Shoulders!"
						return
				if(usr.weightgi >= 1)
					if(src.equiped)
						usr.overlays -= src.icon
						usr<<"You have unequiped the: <u>[src]</u>."
						suffix = null
						usr.chest = "EMPTY"
						usr.weight-=src.weight
						usr.weightgi = 0
						src.equiped = 0
						usr.strength_max-=1500000000
						usr.redmonkitem=0
					else
						usr<<"Error: You may only have one of: <u>[src]</u> equipped."
						return
		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr<<"You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
			Drop()
				set category = null
				if(!src.equiped)
					usr<<"This is a Valiant Item, you cannot Drop it!"
				else usr<<"You are unable to drop: <u>[src]</u>, it's equipped."

			Description()
				set category = null
				alert("Increases Strength.")


obj/Equipment
	yellowmonksuit
		icon='MONKYELLOW.dmi'
		name = "Focused Monk Suit"
		density = 0
		equiped = 0
		value = 7100
		Click()
			if(src in usr:contents)
				if(!usr.weightgi)
					if(usr.chest == "EMPTY")
						if(src.equiped)
							usr<<"Error: </B> [src] is already equipped!"
							return
						if(src.item_owner!=usr.key&&src.item_owner)
							usr<<"Error: This item is Bio-Linked to someone."
							return
						if(usr.level>=15000)
							usr.overlays += src.icon
							usr<<"You have equiped the: <u>[src]</u>."
							suffix = "(Worn)"
							usr.weight+=src.weight
							usr.chest = src.name
							usr.weightgi = 1
							src.equiped = 1
							usr.ki_max+=1500000000
							usr.yellowmonkitem=1
							usr.Skills_Checker()
							return
						else
							usr<<"Error: You need to be above level 15000 to wear this!"
					else
						usr<<"Error: You already have something equipped on your Chest or Shoulders!"
						return
				if(usr.weightgi >= 1)
					if(src.equiped)
						usr.overlays -= src.icon
						usr<<"You have unequiped the: <u>[src]</u>."
						suffix = null
						usr.chest = "EMPTY"
						usr.weight-=src.weight
						usr.weightgi = 0
						src.equiped = 0
						usr.ki_max-=1500000000
						usr.yellowmonkitem=0
					else
						usr<<"Error: You may only have one of: <u>[src]</u> equipped."
						return
		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr<<"You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
			Drop()
				set category = null
				if(!src.equiped)
					usr<<"This is a Valiant Item, you cannot Drop it!"
				else usr<<"You are unable to drop: <u>[src]</u>, it's equipped."

			Description()
				set category = null
				alert("Increases Ki.")




obj/Equipment
	whitemonksuit
		icon='MONKWHITE.dmi'
		name = "Powerful Monk Suit"
		density = 0
		equiped = 0
		value = 7400
		Click()
			if(src in usr:contents)
				if(!usr.weightgi)
					if(usr.chest == "EMPTY")
						if(src.equiped)
							usr<<"Error: </B> [src] is already equipped!"
							return
						if(src.item_owner!=usr.key&&src.item_owner)
							usr<<"Error: This item is Bio-Linked to someone."
							return
						if(usr.level>=15000)
							usr.overlays += src.icon
							usr<<"You have equiped the: <u>[src]</u>."
							suffix = "(Worn)"
							usr.weight+=src.weight
							usr.chest = src.name
							usr.weightgi = 1
							src.equiped = 1
							usr.powerlevel_max+=1500000000
							usr.whitemonkitem=1
							usr.Skills_Checker()
							return
						else
							usr<<"Error: You need to be above level 15000 to wear this!"
					else
						usr<<"Error: You already have something equipped on your Chest or Shoulders!"
						return
				if(usr.weightgi >= 1)
					if(src.equiped)
						usr.overlays -= src.icon
						usr<<"You have unequiped the: <u>[src]</u>."
						suffix = null
						usr.chest = "EMPTY"
						usr.weight-=src.weight
						usr.weightgi = 0
						src.equiped = 0
						usr.powerlevel_max-=1500000000
						usr.whitemonkitem=1
					else
						usr<<"Error: You may only have one of: <u>[src]</u> equipped."
						return
		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr<<"You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
			Drop()
				set category = null
				if(!src.equiped)
					usr<<"This is a Valiant Item, you cannot Drop it!"
				else usr<<"You are unable to drop: <u>[src]</u>, it's equipped."

			Description()
				set category = null
				alert("Increases Powerlevel.")

obj/Equipment
	greymonksuit
		icon='MONKGREY.dmi'
		name = "Dense Monk Suit"
		density = 0
		equiped = 0
		value = 7800
		Click()
			if(src in usr:contents)
				if(!usr.weightgi)
					if(usr.chest == "EMPTY")
						if(src.equiped)
							usr<<"Error: </B> [src] is already equipped!"
							return
						if(src.item_owner!=usr.key&&src.item_owner)
							usr<<"Error: This item is Bio-Linked to someone."
							return
						if(usr.level>=15000)
							usr.overlays += src.icon
							usr<<"You have equiped the: <u>[src]</u>."
							suffix = "(Worn)"
							usr.weight+=src.weight
							usr.chest = src.name
							usr.weightgi = 1
							src.equiped = 1
							usr.defence_max+=1500000000
							usr.kidefense_max+=1500000000
							usr.greymonkitem=1
							usr.Skills_Checker()
							return
						else
							usr<<"Error: You need to be above level 15000 to wear this!"
					else
						usr<<"Error: You already have something equipped on your Chest or Shoulders!"
						return
				if(usr.weightgi >= 1)
					if(src.equiped)
						usr.overlays -= src.icon
						usr<<"You have unequiped the: <u>[src]</u>."
						suffix = null
						usr.chest = "EMPTY"
						usr.weight-=src.weight
						usr.weightgi = 0
						src.equiped = 0
						usr.defence_max-=1500000000
						usr.kidefense_max-=1500000000
						usr.greymonkitem=0
					else
						usr<<"Error: You may only have one of: <u>[src]</u> equipped."
						return
		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr<<"You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
			Drop()
				set category = null
				if(!src.equiped)
					usr<<"This is a Valiant Item, you cannot Drop it!"
				else usr<<"You are unable to drop: <u>[src]</u>, it's equipped."

			Description()
				set category = null
				alert("Increases Ki Defense and Defense.")

