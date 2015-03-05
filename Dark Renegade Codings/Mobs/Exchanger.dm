mob
	NPC
		Exchanger
			name="{NPC}Exchanger"
			icon_state="ShopKeeper3"
			density=1
			safe=1
			New()
				..()
				CreateName()
			verb
				Talk()
					set src in oview(2)
					set category=null
					if(usr.talking||usr.fused)return
					usr.talking=1
					switch(input("Hello, welcome to AA Exchange Center! What would you like to do?")in list("Sell","Trade","Cancel"))
						if("Cancel")
							usr.talking=0
							return
						if("Sell")
							if(usr.zenni<100000000)
								usr<<"Exchanger: I'm sorry, but you musy have at least 100 million zennies!"
								usr.talking=0
								return
							switch(input("What would you like to sell your zennies for?")in list("Custom Points","Training Points","Skill Points"))
								if("Custom Points")
									switch(input("Are you sure you want to sell your 100,000,000 zennies for 50,000 custom points?")in list("No","Yes"))
										if("No")
											usr.talking=0
											return
										if("Yes")
											usr.zenni-=100000000
											usr.custom_points+=50000
											usr<<"Exchanger: Thank you for using our services! Enjoy!"
											usr.talking=0
											return
								if("Training Points")
									switch(input("Are you sure you want to sell your 100,000,000 zennies for 100,000 training points?")in list("No","Yes"))
										if("No")
											usr.talking=0
											return
										if("Yes")
											usr.zenni-=100000000
											usr.tp+=100000
											usr<<"Exchanger: Thank you for using our services! Enjoy!"
											usr.talking=0
											return
								if("Skill Points")
									switch(input("Are you sure you want to sell your 100,000,000 zennies for 20,000 skill points?")in list("No","Yes"))
										if("No")
											usr.talking=0
											return
										if("Yes")
											usr.zenni-=100000000
											usr.skill_points+=20000
											usr<<"Exchanger: Thank you for using our services! Enjoy!"
											usr.talking=0
											return
						if("Trade")
							if(usr.level<25000*EXPrebirthgain)
								usr<<"Exchanger: I'm sorry, but you're below the minimum requirement!"
								usr.talking=0
								return
							if(usr.exp > 0)
								switch(input("If you trade your levels, your EXP will get reset to 0.  Do you wish to continue?")in list("No","Yes"))
									if("No")
										usr.talking = 0
										return
							switch(input("What would you like to trade your level for?")in list("Custom Points","Training Points","Zennies","Skill Points","Cancel"))
								if("Custom Points")
									var/lvrequired=6
									var/max=round(usr.level-25000)
									var/amount=input("How much would you like to trade? (Note: Per level, you'll get 6 custom points!) Max: [max]")as num|null
									if(!amount||!usr)
										usr.talking=0
										return
									if(round(usr.level-amount)<25000)
										usr<<"Exchanger: You cannot trade that many!"
										usr.talking=0
										return
									var/total=round(amount*lvrequired)
									usr.custom_points+=total
									usr.level-=amount
									usr<<"Exchanger: Thank you for using our services! Enjoy!"
									usr.exp = 0
									usr.talking=0
									return
								if("Training Points")
									var/lvrequired=500
									var/max=round(usr.level-25000)
									var/amount=input("How much would you like to trade? (Note: Per level, you'll get 500 training points!) Max: [max]")as num|null
									if(!amount||!usr)
										usr.talking=0
										return
									if(round(usr.level-amount)<25000)
										usr<<"Exchanger: You cannot trade that many!"
										usr.talking=0
										return
									var/total=round(amount*lvrequired)
									usr.tp+=total
									usr.level-=amount
									usr<<"Exchanger: Thank you for using our services! Enjoy!"
									usr.exp = 0
									usr.talking=0
									return
								if("Zennies")
									var/lvrequired=10000
									var/max=round(usr.level-25000)
									var/amount=input("How much would you like to trade? (Note: Per level, you'll get 10,000 zennies!) Max: [max]")as num|null
									if(!amount||!usr)
										usr.talking=0
										return
									if(round(usr.level-amount)<25000)
										usr<<"Exchanger: You cannot trade that many!"
										usr.talking=0
										return
									var/total=round(amount*lvrequired)
									usr.zenni+=total
									usr.level-=amount
									usr<<"Exchanger: Thank you for using our services! Enjoy!"
									usr.exp = 0
									usr.talking=0
									return
								if("Skill Points")
									var/lvrequired=6
									var/max=round(usr.level-25000)
									var/amount=input("How much would you like to trade? (Note: Per level, you'll get 6 skill points!) Max: [max]")as num|null
									if(!amount||!usr)
										usr.talking=0
										return
									if(round(usr.level-amount)<25000)
										usr<<"Exchanger: You cannot trade that many!"
										usr.talking=0
										return
									var/total=round(amount*lvrequired)
									usr.skill_points+=total
									usr.level-=amount
									usr<<"Exchanger: Thank you for using our services! Enjoy!"
									usr.exp = 0
									usr.talking=0
									return
								if("Cancel")
									usr.talking=0
									return