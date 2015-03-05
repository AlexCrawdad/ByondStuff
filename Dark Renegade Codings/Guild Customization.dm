mob
	NPC
		GuildGymDealer
			icon_state="gh1"
			name="{NPC}Guild Shop Keeper"
			density=1
			safe=1
			New()
				..()
				src.AddName()
			verb
				Talk()
					set category=null
					set src in oview(2)
					if(usr.talking)return
					usr.talking=1
					switch(input("Hello. How can I help you today?")in list("Buy","Sell","Cancel"))
						if("Cancel")
							usr.talking=0
							return
						if("Sell")
							var/list/Sellable=new/list()
							for(var/obj/Gym/I in usr)Sellable.Add(I)
							for(var/obj/Props/Furnature/F in usr)Sellable.Add(F)
							if(!Sellable.len)
								usr<<"<font color=white>Shop Keeper:</font> You don't have any Guild Equipment to sell."
								usr.talking=0
								return
							Sellable.Add("Cancel")
							var/obj/sell=input("What do you want to sell?")as anything in Sellable
							if(sell=="Cancel")
								usr.talking=0
								return
							var/confirm=input("Do you want to sell [sell.name] for [sell.value] zenni?")in list("Yes","No")
							if(!sell in usr.contents)
								usr.talking=0
								return
							if(confirm=="No")
								usr.talking=0
								return
							else
								usr.zenni+=sell.value
								usr.talking=0
								usr<<"<font color=white>Shop Keeper:</font> Thank you. Have a nice day."
								del(sell)
							if(usr.CheckInventory()==TRUE)
								usr.talking=0
								return
						if("Buy")
							if(usr.CheckInventory()==TRUE)
								usr.talking=0
								return
							usr.talking=1
							switch(input("What do you want to buy?")in list("Gym Equipment","Furniture"))
								if("Furniture")
									switch(input("What do you want to buy?")in list("Tables","Desks","Stools"))
										if("Tables")
											switch(input("What do you want to buy?")in list("Table","Cancel"))
												if("Cancel")
													usr.talking=0
													return
												if("Table")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Props/Furnature/GTable/O=new
													if(usr.zenni >= O.value)
														usr.zenni -= O.value
														O.Move(usr)
														O.value*=0.5
														O.weight=0
														usr.talking=0
														usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr<<"<font color=white>Shop Keeper:</font> You need [O.value] zenni!"
														usr.talking=0
														return
										if("Stools")
											switch(input("What do you want to buy?")in list("Stool","Cancel"))
												if("Cancel")
													usr.talking=0
													return
												if("Stool")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Props/Furnature/GStool/O=new
													if(usr.zenni >= O.value)
														usr.zenni -= O.value
														O.Move(usr)
														O.value*=0.5
														O.weight=0
														usr.talking=0
														usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr<<"<font color=white>Shop Keeper:</font> You need [O.value] zenni!"
														usr.talking=0
														return
										if("Desks")
											switch(input("What do you want to buy?")in list("Desk Left End","Desk Horizontal","Desk Right End","Desk Top End","Desk Vertical","Desk Bottom End","Cancel"))
												if("Cancel")
													usr.talking=0
													return
												if("Desk Left End")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Props/Furnature/GDesk_1_1/O=new
													if(usr.zenni >= O.value)
														usr.zenni -= O.value
														O.Move(usr)
														O.value*=0.5
														O.weight=0
														usr.talking=0
														usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr<<"<font color=white>Shop Keeper:</font> You need [O.value] zenni!"
														usr.talking=0
														return
												if("Desk Horizontal")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Props/Furnature/GDesk_1_2/O=new
													if(usr.zenni >= O.value)
														usr.zenni -= O.value
														O.Move(usr)
														O.value*=0.5
														O.weight=0
														usr.talking=0
														usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr<<"<font color=white>Shop Keeper:</font> You need [O.value] zenni!"
														usr.talking=0
														return
												if("Desk Right End")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Props/Furnature/GDesk_1_3/O=new
													if(usr.zenni >= O.value)
														usr.zenni -= O.value
														O.Move(usr)
														O.value*=0.5
														O.weight=0
														usr.talking=0
														usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr<<"<font color=white>Shop Keeper:</font> You need [O.value] zenni!"
														usr.talking=0
														return
												if("Desk Top End")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Props/Furnature/GDesk_2_1/O=new
													if(usr.zenni >= O.value)
														usr.zenni -= O.value
														O.Move(usr)
														O.value*=0.5
														O.weight=0
														usr.talking=0
														usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr<<"<font color=white>Shop Keeper:</font> You need [O.value] zenni!"
														usr.talking=0
														return
												if("Desk Vertical")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Props/Furnature/GDesk_2_2/O=new
													if(usr.zenni >= O.value)
														usr.zenni -= O.value
														O.Move(usr)
														O.value*=0.5
														O.weight=0
														usr.talking=0
														usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr<<"<font color=white>Shop Keeper:</font> You need [O.value] zenni!"
														usr.talking=0
														return
												if("Desk Bottom End")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Props/Furnature/GDesk_2_3/O=new
													if(usr.zenni >= O.value)
														usr.zenni -= O.value
														O.Move(usr)
														O.value*=0.5
														O.weight=0
														usr.talking=0
														usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr<<"<font color=white>Shop Keeper:</font> You need [O.value] zenni!"
														usr.talking=0
														return
								if("Gym Equipment")
									if(!usr.in_guild)
										usr.talking=0
										usr<<"<font color=white>Shop Keeper:</font> Woops, you'll need to be in a guild and be a leader of that guild!"
										return
									if(!usr.guild_leader && usr.in_guild)
										usr.talking=0
										usr<<"<font color=white>Shop Keeper:</font> You're not a leader of your guild!"
										return
									switch(input("What do you want to buy?")in list("Strength Machine","Defense Machine","Ki Machine","Dummy","Treadmill","Never Mind"))
										if("Strength Machine")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Gym/GWeight/O=new
											if(usr.zenni >= O.value)
												usr.zenni -= O.value
												O.Move(usr)
												O.value*=0.5
												O.weight=0
												usr.talking=0
												usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr<<"<font color=white>Shop Keeper:</font> You need [O.value] zenni!"
												usr.talking=0
												return
										if("Defense Machine")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Gym/GMachine/O=new
											if(usr.zenni >= O.value)
												usr.zenni -= O.value
												O.Move(usr)
												O.value*=0.5
												O.weight=0
												usr.talking=0
												usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr<<"<font color=white>Shop Keeper:</font> You need [O.value] zenni!"
												usr.talking=0
												return
										if("Ki Machine")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Gym/GKiDeflectMachine/O=new
											if(usr.zenni >= O.value)
												usr.zenni -= O.value
												O.Move(usr)
												O.value*=0.5
												O.weight=0
												usr.talking=0
												usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr<<"<font color=white>Shop Keeper:</font> You need [O.value] zenni!"
												usr.talking=0
												return
										if("Dummy")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Gym/GTraining_Dummy/O=new
											if(usr.zenni >= O.value)
												usr.zenni -= O.value
												O.Move(usr)
												O.value*=0.5
												O.weight=0
												usr.talking=0
												usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr<<"<font color=white>Shop Keeper:</font> You need [O.value] zenni!"
												usr.talking=0
												return
										if("Treadmill")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Gym/GTreadmill/O=new
											if(usr.zenni >= O.value)
												usr.zenni -= O.value
												O.Move(usr)
												O.value*=0.5
												O.weight=0
												usr.talking=0
												usr<<"<font color=white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr<<"<font color=white>Shop Keeper:</font> You need [O.value] zenni!"
												usr.talking=0
												return
										if("Never Mind")
											usr.talking=0
											return
