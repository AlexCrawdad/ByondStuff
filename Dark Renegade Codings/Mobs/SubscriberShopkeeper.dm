mob
	NPC
		Sub_Shop_Keeper
			name = "{NPC}Subscriber Guy"
			icon_state="subshopkeeper"
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
					switch(input("Buy Sub?")in list("Yes","No"))
						if("Yes")
							if(!usr.Yessub)
								if(usr.zenni >= 5000000000)
									usr.zenni -= 5000000000
									usr.talking=0
									usr.Yessub=1
									usr<<"<font color=white>Shop Keeper:</font> Thanks for Subscribing to AA, we hope you enjoy your stay!"
									sleep(40)
									usr<<"Note: Subscriber does not leak over your Accounts, or Characters, it lasts until your character is deleted."
									return
								else
									usr<<"<font color=white>Shop Keeper:</font> You need 5,000,000,000 zenni!"
									usr.talking=0
									return
							else
								usr<<"<font color=white>Shop Keeper:</font> You have already Subscribed!"
								usr.talking=0
								return
						if("No")
							usr.talking=0
							return

