//// Window Showing ////
mob/var/smalluses=1
mob/var/biguses=1
mob/var/massiveuses=1
mob/verb
	Show_Shop()
		set hidden = 1
		winshow(src,"Store")  //Show the window

mob/verb
	Hide_Shop()
		set hidden = 1
		winshow(src,"Store",0) //Hide the window

mob/verb
	OpenStoreSkills()
		set hidden = 1
		winshow(src,"Store",0)  //Hide the window
		winshow(src,"StoreSkills")  //Show the window

mob/verb
	OpenStoreStats()
		set hidden = 1
		winshow(src,"Store",0)  //Hide the window
		winshow(src,"StoreStats")  //Show the window

mob/verb
	OpenStoreVerbs()
		set hidden = 1
		winshow(src,"Store",0)  //Hide the window
		winshow(src,"StoreVerbs")  //Show the window

mob/verb
	OpenStoreEquipment()
		set hidden = 1
		winshow(src,"Store",0)  //Hide the window
		winshow(src,"StoreEquipment")  //Show the window

mob/verb
	OpenStoreMisc()
		set hidden = 1
		winshow(src,"Store",0)  //Hide the window
		winshow(src,"StoreMisc")  //Show the window

mob/verb
	SkillsBack()
		set hidden = 1
		winshow(src,"Store")  //Show the window
		winshow(src,"StoreSkills",0)
		winshow(src,"StoreStats",0)
		winshow(src,"StoreVerbs",0)
		winshow(src,"StoreEquipment",0)
		winshow(src,"StoreMisc",0)
/////////////////////////
//// Here's all the stuff that can be bought from the shop ////
mob/verb
	BuyGoldBoost()
		set hidden = 1
		switch(input("Are you sure you would like to buy the Small Boost??", "Small Boost") in list ("Yes","No"))
			if("Yes")
				if(usr.smalluses<=5)
					if(usr.VP >= 1000)
						usr.smalluses ++
						usr.powerlevel_max *= 1.1
						usr.ki_max *= 1.1
						usr.kidefense_max *= 1.1
						usr.strength_max *= 1.1
						usr.defence_max *= 1.1
						usr.strength = usr.strength_max
						usr.defence = usr.defence_max
						usr.powerlevel = usr.powerlevel_max
						usr.ki = usr.ki_max
						usr.kidefense = usr.kidefense_max
						usr<<"You feel a tingle but you don't pay any mind to it."
						usr.VP -= 1000
						usr << "You bought Gold Boost!"
					else
						usr << "You don't have enough VP, you need 1000 VP, you currently have [VP] VP!"
						return
				else
					usr<< "You Have used this 5 times already!"
					return
			else
				usr << "You didn't buy the Gold Boost!"
	BuyVipBoost()
		set hidden = 1
		switch(input("Are you sure you would like to buy Big Boost??", "Big Boost") in list ("Yes","No"))
			if("Yes")
				if(usr.biguses<=4)
					if(usr.VP >= 1500)
						usr.biguses ++
						usr.powerlevel_max *= 1.5
						usr.ki_max *= 1.5
						usr.kidefense_max *= 1.5
						usr.strength_max *= 1.5
						usr.defence_max *= 1.5
						usr.strength = usr.strength_max
						usr.defence = usr.defence_max
						usr.powerlevel = usr.powerlevel_max
						usr.ki = usr.ki_max
						usr.kidefense = usr.kidefense_max
						usr<<"You feel a great power inside!."
						usr.VP -= 1500
						usr << "You bought Vip Boost!"
					else
						usr << "You don't have enough VP, you need 1500 VP, you currently have [VP] VP!"
						return
				else
					usr<< "You have used it 4 times already!"
					return
			else
				usr << "You didn't buy Vip Package!"
	BuyPremiumBoost()
		set hidden = 1
		switch (input("Are you sure you would like to buy the Massive Boost??", "Massive Boost") in list ("Yes","No"))
			if("Yes")
				if(usr.massiveuses<=3)
					if(usr.VP >= 2000)
						usr.powerlevel_max *= 2.0
						usr.massiveuses++
						usr.ki_max *= 2.0
						usr.kidefense_max *= 2.0
						usr.strength_max *= 2.0
						usr.defence_max *= 2.0
						usr.strength = usr.strength_max
						usr.defence = usr.defence_max
						usr.powerlevel = usr.powerlevel_max
						usr.ki = usr.ki_max
						usr.kidefense = usr.kidefense_max
						usr<<"You feel a great power inside!."
						usr.VP -= 2000
						usr << "You bought Premium Boost!"
					else
						usr << "You don't have enough VP, you need 2000 VP, you currently have [VP] VP!"
						return
				else
					usr<<"You have used it 3 times already!"
					return
			else
				usr << "You didn't buy the Premium Boost!"


	Buy_a_VIP_Boost()
		set category = "Channels"
		set name = "Buy VIP Boosts"
		switch(input("What kind of boost would you like to Buy?", "Buy a Boost") in list ("Small","Big","Massive","Cancel"))
			if("Small")
				usr.BuyGoldBoost()
			if("Big")
				usr.BuyVipBoost()
			if("Massive")
				usr.BuyPremiumBoost()
			if("Cancel")
				return



