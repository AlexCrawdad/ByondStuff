var/list/GRAV = list (".")
mob/proc/GRAV_CHECK(T as text,var/list/L)
	for(var/V in L)
		if(findtext(T,V))return TRUE
obj
	var
		grav = 0
		gravon = 0
		grav_delay=0
mob
	var/grav_trainer=0
obj/Gravity_Room
	icon = 'Gravity Well.dmi'
	density = 1
	Gravity_Well_1
		icon_state = "1"
	Gravity_Well_2
		icon_state = "2"
	Gravity_Well_3
		icon_state = "3"
	Gravity_Well_4
		icon_state = "4"
	Gravity_Well_5
		icon_state = "5"
	Gravity_Well_6
		icon_state = "6"
	Gravity_Well_7
		icon_state = "7"
	Gravity_Well_8
		icon_state = "8"
	Gravity_Well_9
		icon_state = "9"
	Gravity_Well_10
		icon_state = "10"
		density = 0
		layer = 8
	Gravity_Well_11
		icon_state = "11"
		density = 0
		layer = 8
	Gravity_Well_12
		icon_state = "12"
		density = 0
		layer = 8
	Gravity
		icon_state = "gravity"
		density = 0
		layer = 10
	Gravity_Pull
		icon_state = "gravity pull"
		density = 0
		layer = 10
	Gravity_Control
		verb
			Set_Gravity()
				set src in oview(10)
				set category = "Gravity Controls"
				if(usr.grav_delay)
					usr<<"You must wait a moment"
					return
				if(src.grav_delay)
					usr<<"Someone is using this!"
					return
				src.grav_delay=1
				usr.grav_delay = 1
				var/gravset = input("What do you what to set the gravity to?","Gravity") as num
				var/max = 1500
				if(usr.level < 2000)max = 1500
				if(usr.level >= 2000 && usr.level < 3000)max = 2000
				if(usr.level >= 5000)max = 2500
				if(gravset > max)
					alert("x[max] Gravity is the max amount of gravity you can use.")
					spawn(40)if(usr)usr.grav_delay = 0
					src.grav_delay=0
					return
				if(gravset < 1)
					view(10) << "\red Gravity switched off"
					spawn(40)if(usr)usr.grav_delay = 0
					src.grav_delay=0
					gravon = 0
					grav = 0
					return
				else
					spawn(40)if(usr)usr.grav_delay = 0
					view(10) << "\red Gravity will be set to x[round(gravset)] in 5 seconds"
					sleep(50)
					view(10) << "\red Gravity is now x[round(gravset)]"
					grav = gravset
					src.grav_delay=0
					gravon = 1
					return
			Check_Gravity()
				set src in oview(10)
				set category = "Gravity Controls"
				usr<<"\red Gravity is set to: x[round(grav)]"
				return
	Guild_Gravity_Control
		verb
			Set_Gravity()
				//set src in oview(3)
				set category = "Gravity Controls"
				if(usr.grav_delay)
					usr<<"You must wait a moment"
					return
				if(src.grav_delay)
					usr<<"Someone is using this!"
					return
				src.grav_delay=1
				usr.grav_delay = 1
				var/gravset = input("What do you what to set the gravity too?","Gravity") as num
				var/max = 2000
				if(usr.level < 2000)max = 2000
				if(usr.level >= 2000 && usr.level < 3000)max = 3500
				if(usr.level >= 3000 && usr.level < 50000)max = 5000
				if(usr.level >= 50000)max = 30000
				if(gravset > max)
					alert("x[max] Gravity is the max amount of gravity you can use.")
					spawn(40)if(usr)usr.grav_delay = 0
					src.grav_delay=0
					return
				if(gravset < 1)
					view(10) << "\red Gravity switched off"
					spawn(40)if(usr)usr.grav_delay = 0
					src.grav_delay=0
					gravon = 0
					grav = 0
					return
				else
					spawn(40)if(usr)usr.grav_delay = 0
					view(10) << "\red Gravity will be set to x[round(gravset)] in 5 seconds"
					sleep(50)
					view(10) << "\red Gravity is now x[round(gravset)]"
					grav = gravset
					src.grav_delay=0
					gravon = 1
					return
			Check_Gravity()
				//set src in oview(3)
				set category = "Gravity Controls"
				usr<<"\red Gravity is set to: x[round(grav)]"
				return
