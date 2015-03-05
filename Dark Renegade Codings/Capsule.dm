obj/Equipment
	Capsule
		name="Storage Capsule"
		icon='Capsule.dmi'
		density=0
		Click()
			if(src in usr:contents)
				switch(alert("Do you wish to use the storage capsule?","Item","Yes","No"))
					if("Yes")
						usr.inven_max+=15
						usr<<"\white Your maximum item storage has increased to \green 40!"
						del(src)
						return