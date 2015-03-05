mob
	NPC
		Valiant_Exchanger
			name = "{NPC}Valiant Exchanger"
			icon_state="Robot"
			density = 1
			safe = 1
			New()
				..()
				src.AddName()
			verb
				Talk()
					set src in oview(2)
					set category=null
					if(usr.talking||usr.fused)return
					usr.talking=1
					switch(input("Bleep Bloop (Buy Away! Some of the Coolest items are Here!")in list("Buy","Cancel"))
						if("Cancel")
							usr.talking=0
							return
						if("Buy")
							if(usr.CheckInventory()==TRUE)
								usr.talking=0
								return
							switch(input("What do you want to buy?")in list("Energy Barrier","Green Armor","Supreme Suit","Mask of Death","Dark Metal Armor","Cool Gi","Never Mind"))
								if("Energy Barrier")
									switch(input("The Energy Barrier, Wear this to Stop people from ITing to you! Are you sure you want this Item? Cost 1000.")in list("Yes","No"))
										if("Yes")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/EnergyBarrier/O = new
											if(usr.Valiants >= O.value)
												usr.Valiants -= O.value
												usr.contents += O
												O.value=1000
												O.weight=0
												usr.talking=0
												usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr<<"<font color=white>Shop Keeper:</font> You need 1000 Valiants!"
												usr.talking=0
												return
										if("No")
											usr.talking=0
											return
								if("Green Armor")
									switch(input("Green Armor, Wear this to gain faster levels and 20mill all stats! Are you sure you want this Item? Cost 2000.(Min Level 2000)")in list("Yes","No"))
										if("Yes")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Android16_item/O = new
											if(usr.Valiants >= O.value)
												O.value=2000
												usr.Valiants -= O.value
												usr.contents += O
												O.weight=2
												usr.talking=0
												usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr<<"<font color=white>Shop Keeper:</font> You need [O.value] Valiants!"
												usr.talking=0
												return
										if("No")
											usr.talking=0
											return
								if("Supreme Suit")
									switch(input("Supreme Suit, Wear this to gain faster levels and 30mill all stats! Are you sure you want this Item? Cost 3000.(Min Level 6000)")in list("Yes","No"))
										if("Yes")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Supreme_item/O = new
											if(usr.Valiants >= O.value)
												usr.Valiants -= O.value
												usr.contents += O
												O.value=3000
												O.weight=2
												usr.talking=0
												usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr<<"<font color=white>Shop Keeper:</font> You need [O.value] Valiants!"
												usr.talking=0
												return
										if("No")
											usr.talking=0
											return
								if("Mask of Death")
									switch(input("The 'Mask of Death', an Old legend rumors the wearer's foes to Cower at its Might!(100million Str boost) Cost 3000.(Min Level 7000)")in list("Yes","No"))
										if("Yes")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Evil_Face/O = new
											if(usr.Valiants >= O.value)
												usr.Valiants -= O.value
												usr.contents += O
												O.value=3000
												usr.talking=0
												usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr<<"<font color=white>Shop Keeper:</font> You need [O.value] Valiants!"
												usr.talking=0
												return
										if("No")
											usr.talking=0
											return
								/*if("Candy Bar")
									switch(input("Candy Bar, Cures hunger! Buy? Cost 10.")in list("Yes","No"))
										if("Yes")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Crunchbar/O = new
											if(usr.Valiants >= O.value)
												usr.Valiants -= O.value
												usr.contents += O
												O.value=10
												usr.talking=0
												usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr<<"<font color=white>Shop Keeper:</font> You need [O.value] Valiants!"
												usr.talking=0
												return
										if("No")
											usr.talking=0
											return
								if("Major Potion")
									switch(input("Major Potion, Stops hunger for a long time! Buy? Cost 5000.")in list("Yes","No"))
										if("Yes")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Major_Potion/O = new
											if(usr.Valiants >= O.value)
												usr.Valiants -= O.value
												usr.contents += O
												O.value=5000
												usr.talking=0
												usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr<<"<font color=white>Shop Keeper:</font> You need [O.value] Valiants!"
												usr.talking=0
												return
										if("No")
											usr.talking=0
											return
								if("Minor Potion")
									switch(input("Minor Potion, Stops hunger for a short time! Buy? Cost 2500.")in list("Yes","No"))
										if("Yes")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Minor_Potion/O = new
											if(usr.Valiants >= O.value)
												usr.Valiants -= O.value
												usr.contents += O
												O.value=2500
												usr.talking=0
												usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr<<"<font color=white>Shop Keeper:</font> You need [O.value] Valiants!"
												usr.talking=0
												return
										if("No")
											usr.talking=0
											return*/
								if("Dark Metal Armor")
									switch(input("Sauron's Armor, It gives the wearer Massive stats!(100million DEF, STR, KI and PL boost) Cost 4000.(Min Level 9000)")in list("Yes","No"))
										if("Yes")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/SauronArmor/O = new
											if(usr.Valiants >= O.value)
												usr.Valiants -= O.value
												usr.contents += O
												O.value=4000
												usr.talking=0
												usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr<<"<font color=white>Shop Keeper:</font> You need 4000 Valiants!"
												usr.talking=0
												return
										if("No")
											usr.talking=0
											return
								if("Cool Gi")
									switch(input("A Cool Gi, It gives the wearer some stats!(1 million DEF, STR, KI and PL boost) Cost 4500.(Min Level 15000)")in list("Yes","No"))
										if("Yes")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/VegitoSuit/O = new
											if(usr.Valiants >= O.value)
												usr.Valiants -= O.value
												usr.contents += O
												O.value=4500
												usr.talking=0
												usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr<<"<font color=white>Shop Keeper:</font> You need 4500 Valiants!"
												usr.talking=0
												return
										if("No")
											usr.talking=0
											return
								if("Never Mind")
									usr.talking=0
									return













mob
	verb
		BuyAnItem()
			set category=null
			if(usr.talking||usr.fused)return
			usr.talking=1
			switch(input("Bleep Bloop (Buy Away! Some of the Coolest items are Here!)")in list("Buy","Cancel"))
				if("Cancel")
					usr.talking=0
					return
				if("Buy")
					if(usr.CheckInventory()==TRUE)
						usr.talking=0
						return
					switch(input("What do you want to buy?")in list("Energy Barrier","Restless Monk Suit","Green Armor","Supreme Suit","Mask of Death","Dark Metal Armor","Cool Gi","Super Gi","Strong Monk Suit","Focused Monk Suit","Powerful Monk Suit","Dense Monk Suit","Never Mind"))
						if("Energy Barrier")
							switch(input("The Energy Barrier, Wear this to Stop people from ITing to you! Are you sure you want this Item? Cost 1000.")in list("Yes","No"))
								if("Yes")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/EnergyBarrier/O = new
									if(usr.Valiants >= O.value)
										usr.Valiants -= O.value
										usr.contents += O
										O.value=1000
										O.weight=0
										usr.talking=0
										usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr<<"<font color=white>Shop Keeper:</font> You need 1000 Valiants!"
										usr.talking=0
										return
								if("No")
									usr.talking=0
									return
						if("Green Armor")
							switch(input("Green Armor, Wear this to gain faster levels and 20mill all stats! Are you sure you want this Item? Cost 2000.(Min Level 2000)")in list("Yes","No"))
								if("Yes")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/Android16_item/O = new
									if(usr.Valiants >= O.value)
										usr.Valiants -= O.value
										usr.contents += O
										O.value=2000
										O.weight=2
										usr.talking=0
										usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr<<"<font color=white>Shop Keeper:</font> You need [O.value] Valiants!"
										usr.talking=0
										return
								if("No")
									usr.talking=0
									return
						if("Restless Monk Suit")
							switch(input("Restless Monk Suit, Wear this to have more Stamina! Cost 500.(Min Level 2000)")in list("Yes","No"))
								if("Yes")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/greenmonksuit/O = new
									if(usr.Valiants >= O.value)
										usr.Valiants -= O.value
										usr.contents += O
										O.value=500
										O.weight=2
										usr.talking=0
										usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr<<"<font color=white>Shop Keeper:</font> You need [O.value] Valiants!"
										usr.talking=0
										return
								if("No")
									usr.talking=0
									return
						if("Supreme Suit")
							switch(input("Supreme Suit, Wear this to gain faster levels and 30 mill all stats! Are you sure you want this Item? Cost 3000.(Min Level 4000)")in list("Yes","No"))
								if("Yes")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/Supreme_item/O = new
									if(usr.Valiants >= O.value)
										usr.Valiants -= O.value
										usr.contents += O
										O.value=3000
										O.weight=2
										usr.talking=0
										usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr<<"<font color=white>Shop Keeper:</font> You need [O.value] Valiants!"
										usr.talking=0
										return
								if("No")
									usr.talking=0
									return
						if("Mask of Death")
							switch(input("The 'Mask of Death', an old legend says that the wearer's foes cower at its might!(100million Str boost) Cost 3000.(Min Level 4000)")in list("Yes","No"))
								if("Yes")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/Evil_Face/O = new
									if(usr.Valiants >= O.value)
										usr.Valiants -= O.value
										usr.contents += O
										O.value=3000
										usr.talking=0
										usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr<<"<font color=white>Shop Keeper:</font> You need [O.value] Valiants!"
										usr.talking=0
										return
								if("No")
									usr.talking=0
									return
						if("Dark Metal Armor")
							switch(input("Dark Metal Armor, It gives the wearer a lot of stats!(10 million DEF, STR, KI and PL boost) Cost 4000.(Min Level 5000)")in list("Yes","No"))
								if("Yes")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/SauronArmor/O = new
									if(usr.Valiants >= O.value)
										usr.Valiants -= O.value
										usr.contents += O
										O.value=4000
										usr.talking=0
										usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr<<"<font color=white>Shop Keeper:</font> You need 4000 Valiants!"
										usr.talking=0
										return
								if("No")
									usr.talking=0
									return
						if("Cool Gi")
							switch(input("A Cool Gi, It gives the wearer quite a few stats!(100 million DEF, STR, KI and PL boost) Cost 4500.(Min Level 7000)")in list("Yes","No"))
								if("Yes")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/VegitoSuit/O = new
									if(usr.Valiants >= O.value)
										usr.Valiants -= O.value
										usr.contents += O
										O.value=4500
										usr.talking=0
										usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr<<"<font color=white>Shop Keeper:</font> You need 4500 Valiants!"
										usr.talking=0
										return
								if("No")
									usr.talking=0
									return
						if("Super Gi")
							switch(input("A Super Gi, It gives quite the stats!(500 million DEF, STR, KI and PL boost) Cost 5000.(Min Level 9000)")in list("Yes","No"))
								if("Yes")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/GokuSuit/O = new
									if(usr.Valiants >= O.value)
										usr.Valiants -= O.value
										usr.contents += O
										O.value=5000
										usr.talking=0
										usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr<<"<font color=white>Shop Keeper:</font> You need 5000 Valiants!"
										usr.talking=0
										return
								if("No")
									usr.talking=0
									return
						if("Strong Monk Suit")
							switch(input("Strong Monk Suit, Wear this for Strength! (1.5 Billion STR) Cost 7000.(Min Level 15000)")in list("Yes","No"))
								if("Yes")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/redmonksuit/O = new
									if(usr.Valiants >= O.value)
										usr.Valiants -= O.value
										usr.contents += O
										O.value=7000
										O.weight=2
										usr.talking=0
										usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr<<"<font color=white>Shop Keeper:</font> You need [O.value] Valiants!"
										usr.talking=0
										return
								if("No")
									usr.talking=0
									return
						if("Focused Monk Suit")
							switch(input("Focused Monk Suit, Wear this for Ki! (1.5 Billion Ki) Cost 7100.(Min Level 15000)")in list("Yes","No"))
								if("Yes")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/yellowmonksuit/O = new
									if(usr.Valiants >= O.value)
										usr.Valiants -= O.value
										usr.contents += O
										O.value=7100
										O.weight=2
										usr.talking=0
										usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr<<"<font color=white>Shop Keeper:</font> You need [O.value] Valiants!"
										usr.talking=0
										return
								if("No")
									usr.talking=0
									return
						if("Powerful Monk Suit")
							switch(input("Powerful Monk Suit, Wear this for Powerlevel! (1.5 Billion PL) Cost 7400.(Min Level 15000)")in list("Yes","No"))
								if("Yes")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/whitemonksuit/O = new
									if(usr.Valiants >= O.value)
										usr.Valiants -= O.value
										usr.contents += O
										O.value=7400
										O.weight=2
										usr.talking=0
										usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr<<"<font color=white>Shop Keeper:</font> You need [O.value] Valiants!"
										usr.talking=0
										return
								if("No")
									usr.talking=0
									return
						if("Dense Monk Suit")
							switch(input("Dense Monk Suit, Wear this for Defense! (1.5 Billion Ki Def and Def) Cost 7800.(Min Level 15000)")in list("Yes","No"))
								if("Yes")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/greymonksuit/O = new
									if(usr.Valiants >= O.value)
										usr.Valiants -= O.value
										usr.contents += O
										O.value=7800
										O.weight=2
										usr.talking=0
										usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr<<"<font color=white>Shop Keeper:</font> You need [O.value] Valiants!"
										usr.talking=0
										return
								if("No")
									usr.talking=0
									return
						if("Never Mind")
							usr.talking=0
							return