mob


	proc
		updateHealth()
			var/percent=round(src.powerlevel/src.powerlevel_max*100,10)
			if(percent>100) percent = 100

			if(percent<0) percent=0
			for(var/obj/hudMeters/o in src.client.screen)
				o.icon_state=num2text(percent)
			spawn(10)
				src.updateHealth()

		updateki()
			var/percent2=round(src.ki/src.ki_max*100,10)
			if(percent2>100) percent2 = 100

			if(percent2<0) percent2=0
			for(var/obj/kimeters/o in src.client.screen)
				o.icon_state=num2text(percent2)
			spawn(10)
				src.updateki()

		updatestamina()
			var/percent2=round(src.stamina/src.stamina_max*100,10)
			if(percent2>100) percent2 = 100

			if(percent2<0) percent2=0
			for(var/obj/staminameters/o in src.client.screen)
				o.icon_state=num2text(percent2)
			spawn(10)
				src.updatestamina()

		updateexp()
			var/percent3=round(src.exp/src.tnl*100,10)
			if(percent3>100) percent3=100

			if(percent3<0) percent3=0
			for(var/obj/expmeters/o in src.client.screen)
				o.icon_state=num2text(percent3)
			spawn(10)
				src.updateexp()
obj
	hudMeters
		health_01
			icon='PLMeter.dmi'
			icon_state="100"
			layer = 100
			New(client/c)
				screen_loc="1,1"
				c.screen+=src
	kimeters
		ki_01
			icon='KiMeter.dmi'
			icon_state="100"
			layer = 100
			New(client/c)
				screen_loc="6,1"
				c.screen+=src

	expmeters
		exp_01
			icon='EXPMeter.dmi'
			icon_state="100"
			layer = 100
			New(client/c)
				screen_loc="10,1"
				c.screen+=src

	staminameters
		stamina_01
			icon='StaminaMeter.dmi'
			icon_state="100"
			layer = 100
			New(client/c)
				screen_loc="15,1"
				c.screen+=src