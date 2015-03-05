mob
	var
		traveling=0
		tmp
			entering=0
obj/Props/Space_Pod
	icon = 'Space Pod.dmi'
	name = ""
	Space_Pod_1_1
		icon_state = "pod 1-1"
		density = 0
		layer = 12
	Space_Pod_1_2
		icon_state = "pod 1-2"
		density = 0
		layer = 12
	Space_Pod_1_3
		icon_state = "pod 1-3"
		density = 0
		layer = 12
	Space_Pod_1_4
		icon_state = "pod 1-4"
		density = 0
		layer = 12
	Space_Pod_1_5
		icon_state = "pod 1-5"
		density = 1
	Space_Pod_1_6
		icon_state = "pod 1-6"
		density = 1
	Space_Pod_1_7
		icon_state = "pod 1-7"
		density = 1
	Space_Pod_1_8
		icon_state = "pod 1-8"
		density = 1
	Space_Pod_1_9
		icon_state = "pod 1-9"
		density = 1
	Space_Pod_2_1
		icon_state = "pod 2-1"
		density = 1
	Space_Pod_2_2
		icon_state = "pod 2-2"
		density = 1
	Space_Pod_2_3
		icon_state = "pod 2-3"
		density = 1
	Space_Pod_2_4
		icon_state = "pod 2-4"
		density = 0
	Space_Pod_2_5
		icon_state = "pod 2-5"
		density = 0
	Space_Pod_2_6
		icon_state = "pod 2-6"
		density = 0
	Space_Pod_2_7
		icon_state = "pod 2-7"
		density = 0
	Pod1
		icon = 'Stars.dmi'
		icon_state = "travelpod"
		density = 1
	Pod2
		icon = 'Stars.dmi'
		icon_state = "travelpod"
		density = 1
	Pod3
		icon = 'Stars.dmi'
		icon_state = "podgo"
		density = 1
turf/Passages/SpacePod
	Caspule_Entrance
		name = "Space Pod"
		density = 1
		Enter(mob/PC/M)
			if(istype(M,/mob/PC))
				if(!M.client)return
				if(M.entering)return
				M.entering=1
				switch(input("Are you sure you want to go in the caspule corp?")in list("Yes","No"))
					if("Yes")
						for(var/obj/O in M)
							if(O.dball)
								M<<"You can't travel with the dragonballs."
								M.entering=0
								return
						for(var/obj/Earth_Dragonballs/O in M.contents)
							M<<"You cannot enter with the dragonballs!"
							M.entering=0
							return
						for(var/obj/Namek_Dragonballs/O in M.contents)
							M<<"You cannot enter with the dragonballs!"
							M.entering=0
							return
						for(var/obj/Black_Dragonballs/O in M.contents)
							M<<"You cannot enter with the dragonballs!"
							M.entering=0
							return
						M.loc=locate(217,333,6)
						M.it_lock = 1
						M.entering=0
					else
						M.entering=0
						return
			else
				return
	Traveling_Computer
		name = "Traveling Computer"
		density = 1
		verb
			Travel(mob/M)
				set src in oview(2)
				set category = "Actions"
				if(M.traveling)return
				M.traveling=1
				switch(input("Where do you wish to Travel to?")in list("Earth","Namek","Future Earth","Planet Vegeta","Planet Z","Cancel"))
					if("Future Earth")
						M.traveling=0
						M<<"<font color=red>Estimating time to arrive on Future Earth is...1 minute!</font>"
						sleep(600)
						if(!M)return
						M.loc=locate(300,302,3)
						M<<"<font color=white>You have arrived on Future Earth! Thank you for using Capsule Corp! Come back any time, [M]!"
						M.it_lock = 0
					if("Namek")
						M.traveling=0
						M<<"<font color=red>Estimating time to arrive on Namek is...30 seconds!</font>"
						sleep(300)
						if(!M)return
						M.loc=locate(192,266,2)
						M<<"<font color=white>You have arrived on Namek! Thank you for using Capsule Corp! Come back any time, [M]!"
						M.it_lock = 0
					if("Earth")
						M.traveling=0
						M<<"<font color=red>Estimating time to arrive on Earth is...15 seconds!</font>"
						sleep(150)
						if(!M)return
						M.loc=locate(53,263,1)
						M<<"<font color=white>You have arrived on Earth! Thank you for using Capsule Corp! Come back any time, [M]!"
						M.it_lock = 0
					if("Planet Vegeta")
						M.traveling=0
						M<<"<font color=red>Estimating time to arrive on Planet Vegeta is...2 minutes!</font>"
						sleep(1200)
						if(!M)return
						M.loc=locate(97,190,4)
						M<<"<font color=white>You have arrived on Planet Vegeta! Thank you for using Capsule Corp! Come back any time, [M]!"
						M.it_lock = 0
					if("Planet Z")
						M.traveling=0
						M<<"<font color=red>Estimating time to arrive on Planet Z is...1 minute!</font>"
						sleep(600)
						if(!M)return
						M.loc=locate(121,247,8)
						M<<"<font color=white>You have arrived on Planet Z! Thank you for using Capsule Corp! Come back any time, [M]!"
						M<<"<font color=red>Be warned, this Planet is still in the 'Beta' Stage! Islands don't have edges, etc, tell me how you like it!"
						M.it_lock = 0
					if("Cancel")
						M.traveling=0
						return
