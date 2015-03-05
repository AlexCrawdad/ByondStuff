var
	list
		HouseCustom=list()

obj
	Housing
		GreyWall
			icon_state = "wall"
			name = "Grey Housing Wall"
			density = 1
			value = 500
			invenable=1
			Click()
				if(src in usr:contents||usr.z==10)
					src.item_owner=usr.key
					usr<<"You have added the <u>[src]</u> to your house!"
					src.loc = usr.loc
					src.lastx=src.x
					src.lasty=src.y
					src.lastz=src.z
					HouseCustom.Add(src)
					var/savefile/S=new("World Save Files/Housing.sav")
					S["HouseCustom"]<<HouseCustom
			verb
				Pick_Up()
					set src in oview(2)
					set category = null
					if(usr.CheckInventory()==TRUE)return
					if(Move(usr))
						usr<<"You have picked up the: <u>[src]</u>."
						src.loc=usr
						HouseCustom.Remove(src)
						var/savefile/S=new("World Save Files/Housing.sav")
						S["HouseCustom"]<<HouseCustom
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: You cannot Pick up other persons items!"
						return
		GoldWall
			icon_state = "wall2"
			name = "Gold Housing Wall"
			density = 1
			value = 500
			Click()
				if(src in usr:contents||usr.z==10)
					src.item_owner=usr.key
					usr<<"You have added the <u>[src]</u> to your house!"
					src.loc = usr.loc
					src.lastx=src.x
					src.lasty=src.y
					src.lastz=src.z
					HouseCustom.Add(src)
					var/savefile/S=new("World Save Files/Housing.sav")
					S["HouseCustom"]<<HouseCustom
			verb
				Pick_Up()
					set src in oview(2)
					set category = null
					if(usr.CheckInventory()==TRUE)return
					if(Move(usr))
						usr<<"You have picked up the: <u>[src]</u>."
						src.loc=usr
						HouseCustom.Remove(src)
						var/savefile/S=new("World Save Files/Housing.sav")
						S["HouseCustom"]<<HouseCustom
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: You cannot Pick up other persons items!"
						return
		WoodFloor
			icon_state = "floor4"
			name = "Wood Housing Floor"
			density = 0
			value = 500
			Click()
				if(src in usr:contents||usr.z==10)
					src.item_owner=usr.key
					usr<<"You have added the <u>[src]</u> to your house!"
					src.loc = usr.loc
					src.lastx=src.x
					src.lasty=src.y
					src.lastz=src.z
					HouseCustom.Add(src)
					var/savefile/S=new("World Save Files/Housing.sav")
					S["HouseCustom"]<<HouseCustom
			verb
				Pick_Up()
					set src in oview(2)
					set category = null
					if(usr.CheckInventory()==TRUE)return
					if(Move(usr))
						usr<<"You have picked up the: <u>[src]</u>."
						src.loc=usr
						HouseCustom.Remove(src)
						var/savefile/S=new("World Save Files/Housing.sav")
						S["HouseCustom"]<<HouseCustom
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: You cannot Pick up other persons items!"
						return
		Door
			icon_state = "2-1"
			name = "Housing Door"
			density = 0
			value = 500
			Click()
				if(src in usr:contents||usr.z==10)
					src.item_owner=usr.key
					usr<<"You have added the <u>[src]</u> to your house!"
					src.loc = usr.loc
					src.lastx=src.x
					src.lasty=src.y
					src.lastz=src.z
					HouseCustom.Add(src)
					var/savefile/S=new("World Save Files/Housing.sav")
					S["HouseCustom"]<<HouseCustom
			verb
				Pick_Up()
					set src in oview(2)
					set category = null
					if(usr.CheckInventory()==TRUE)return
					if(Move(usr))
						usr<<"You have picked up the: <u>[src]</u>."
						src.loc=usr
						HouseCustom.Remove(src)
						var/savefile/S=new("World Save Files/Housing.sav")
						S["HouseCustom"]<<HouseCustom
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: You cannot Pick up other persons items!"
						return