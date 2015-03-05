mob
	NPC
		Plotguy
			name = "{NPC}Housing Vendor"
			icon_state="Plotguy"
			density = 1
			safe = 1
			New()
				..()
				src.AddName()
			verb
				Talk()
					set src in oview(2)
					set category = null
					if(usr.talking || usr.fused)return
					usr.talking=1
					switch(alert("What do you want?","Plot Window","Buy Plot"/*,"Buy Plot Items (Zenni Only)"*/,"Cancel"))
						if("Buy Plot")
							switch(alert("What type of money do you want to use?","Plot Window","Zenni","Valiants","Cancel"))
								if("Zenni")
									switch(alert("Buy Plot? Costs 10 billion Zenni","Plot Window","Yes","No","Cancel"))
										if("Yes")
											if(worldplotnum<=32)
												if(usr.plotnum>=0)
													if(usr.zenni>=10000000000)
														usr.zenni-=10000000000
														usr<<"You just got a Plot!"
														worldplotnum++
														usr.plotnum=worldplotnum
														usr.talking=0
													else
														usr<<"You don't have enough Zenni!"
														usr.talking=0
												else
													usr<<"You already have a Plot!"
													usr.talking=0
											else
												usr<<"All Plots are Taken. PM Vegito9000 if you get this message, he will add more."
												usr.talking=0
								if("Valiants")
									switch(alert("Buy Plot? Costs Ten Thousand Valiants","Plot Window","Yes","No","Cancel"))
										if("Yes")
											if(worldplotnum<=30)
												if(usr.plotnum>=0)
													if(usr.Valiants>=15000)
														usr.Valiants-=15000
														usr<<"You just got a Plot!"
														worldplotnum++
														usr.plotnum=worldplotnum
														usr.talking=0
													else
														usr<<"You don't have that many Valiants!"
														usr.talking=0
												else
													usr<<"You already have a Plot!"
													usr.talking=0
											else
												usr<<"All Plots are Taken. PM Vegito9000 if you get this message, he will add more."
												usr.talking=0
/*						if("Buy Plot Items (Zenni Only)")
							switch(input("What do you want to buy?")in list("GreyWalls 20 (100000Z)","GoldWalls20(100000Z)","WoodFloors40(150000Z)","Door1(100000Z)","Cancel"))
								if("GreyWalls 20 (100000Z)")
									switch(input("20 Grey walls for your house! Are you sure you want these Items? Cost 100000.")in list("Yes","No"))
										if("Yes")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Housing/GreyWall/O = new
											if(usr.zenni >= O.value)
												O.value=100000
												usr.zenni -= O.value
												usr.contents += O
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










							switch(alert("Buy Plot Items","Plot Window","GreyWalls20(100000Z)",/*"GoldWalls20(100000Z)",*/"WoodFloors40(150000Z)","Door1(100000Z)","Cancel"))
								if("GreyWalls20(100000Z)")
									if(usr.plotnum<=1)
										if(usr.zenni>=100000)
											usr.zenni-=100000
											usr<<"Thanks for shopping, come again!"
											var/obj/Housing/GreyWall/O = new
											O.Move(usr)
											usr.contents += O
											usr.talking=0
										else
											usr<<"You don't have enough Zenni!"
											usr.talking=0
									else
										usr<<"You don't have a Plot, buy one First!"
										usr.talking=0
								if("GoldWalls20(100000Z)")
									if(usr.plotnum<=1)
										if(usr.zenni>=100000)
											usr.zenni-=100000
											usr<<"Thanks for shopping, come again!"
											var/obj/Housing/GoldWall/O = new
											O.Move(usr)
											usr.contents += O
											usr.talking=0
										else
											usr<<"You don't have enough Zenni!"
											usr.talking=0
									else
										usr<<"You don't have a Plot, buy one First!"
										usr.talking=0
								if("WoodFloors40(150000Z)")
									if(usr.plotnum<=1)
										if(usr.zenni>=150000)
											usr.zenni-=150000
											usr<<"Thanks for shopping, come again!"
											var/obj/Housing/WoodFloor/O = new
											O.Move(usr)
											usr.contents += O
											usr.talking=0
										else
											usr<<"You don't have enough Zenni!"
											usr.talking=0
									else
										usr<<"You don't have a Plot, buy one First!"
										usr.talking=0
								if("Door1(100000Z)")
									if(usr.plotnum<=1)
										if(usr.zenni>=100000)
											usr.zenni-=100000
											usr<<"Thanks for shopping, come again!"
											var/obj/Housing/Door/O = new
											O.Move(usr)
											usr.contents += O
											usr.talking=0
										else
											usr<<"You don't have enough Zenni!"
											usr.talking=0
									else
										usr<<"You don't have a Plot, buy one First!"
										usr.talking=0

								if("Cancel")
									usr.talking=0
									return
*/