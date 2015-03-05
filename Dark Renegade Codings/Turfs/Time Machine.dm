mob
	var
		Raditz_passkey=0

turf
	Passages
		Timemachine
			Entrance
				density=1
				Enter(mob/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in M.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here."
								return
						switch(input("What time do you wish to Travel to?")in list("Raditz","Saibas","Cancel"))
							if("Raditz")
								M.traveling=0
								if(M.Raditz_passkey==0)return M<<"you dont have the 'Raditz Passkey'!"
								M<<"<font color=red>Estimating time to arrive on Past Earth is...1 minute!</font>"
								M.frozen=1
								sleep(600)
								if(!M)return
								M.loc=locate(18,288,6)
								M.frozen=0
								M<<"<font color=white>You have arrived on Past Earth!"
								M.it_lock = 0
							if("Saibas")
								M.traveling=0
								if(M.Saiba_passkey==0)return M<<"you dont have the 'Saiba Passkey'!"
								M<<"<font color=red>Estimating time to arrive on Past Earth is...30 seconds!</font>"
								M.frozen=1
								sleep(300)
								if(!M)return
								M.loc=locate(78,277,6)
								M.frozen=0
								M<<"<font color=white>You have arrived on Past Earth!"
								M.it_lock = 0
							if("Cancel")
								M.traveling=0
								return

			Exit
				density=1
				Enter(mob/M)
					if(istype(M,/mob/PC))
						M<<"<font color=red>Estimating time to arrive on Present Earth is...30 seconds!</font>"
						M.frozen=1
						sleep(300)
						if(!M)return
						M.loc=locate(153,93,1)
						M<<"<font color=white>You have arrived on Present Earth!"
						M.frozen=0
						M.it_lock = 0






turf/Timemachine
	icon = 'Time Machine.dmi'
	Part_1
		density = 1
		icon_state = "1"
	Part_2
		density = 1
		icon_state = "2"
	Part_3
		density = 1
		icon_state = "3"
	Part_4
		density = 1
		icon_state = "4"
	Part_5
		density = 1
		icon_state = "5"
	Part_6
		density = 1
		icon_state = "6"
	Part_7
		density = 1
		icon_state = "7"
	Part_8
		density = 1
		icon_state = "8"
	Part_9
		density = 1
		icon_state = "9"