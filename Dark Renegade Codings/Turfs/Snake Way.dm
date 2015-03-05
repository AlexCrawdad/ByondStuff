turf/Other/KingKai_Jump
	verb
		Jump()
			set src in oview(8)
			set category = null
			if(prob(99))
				usr<<"You managed to jump to King Kai's planet safely!"
				usr.loc = locate(86,310,5)
			else
				usr<<"You just missed King Kai's planet and fell down to HFIL!"
				usr.loc = locate(270,366,5)
turf/SnakeWay
	icon = 'Snake Way.dmi'
	Clouds
		name = "Clouds"
		density = 1
		icon_state = "clouds"
		Enter(var/mob/M)
			M << "You fell down through the clouds to HFIL!"
			M.loc = locate(270,366,5)
			return
	Planet
		name = ""
		density = 1
		icon_state = "planet"
	SnakeWay1
		name = "Snake Way"
		density = 0
		icon_state = "snakeway 1"
	SnakeWay2
		name = "Snake Way"
		density = 0
		icon_state = "snakeway 2"
	SnakeWay3
		name = "Snake Way"
		density = 0
		icon_state = "snakeway 3"
	SnakeWay4
		name = "Snake Way"
		density = 0
		icon_state = "snakeway 4"
	SnakeWay5
		name = "Snake Way"
		density = 0
		icon_state = "snakeway 5"
	SnakeWay6
		name = "Snake Way"
		density = 0
		icon_state = "snakeway 6"
	SnakeWay7
		name = "Snake Way"
		density = 0
		icon_state = "snakeway 7"
	SnakeWay8
		name = "Snake Way"
		density = 0
		icon_state = "snakeway 8"
	SnakeWay9
		name = "Snake Way"
		density = 0
		icon_state = "snakeway 9"
turf/Snake
	icon = 'PSnake.dmi'
	Snake1
		icon_state = "1"
		density = 0
		Enter(var/mob/M)
			M.loc = locate(72,319,7)
			return
	Snake2
		icon_state = "2"
		Enter(var/mob/M)
			M.loc = locate(67,338,7)
			return
	Snake3
		icon_state = "3"
		Enter(var/mob/M)
			M.loc = locate(75,348,7)
			return
	Snake4
		icon_state = "4"
		Enter(var/mob/M)
			M.loc = locate(77,366,7)
			return
	Snake5
		icon_state = "5"
		Enter(var/mob/M)
			M.loc = locate(97,382,7)
			return
	Snake6
		icon_state = "6"
		Enter(var/mob/M)
			M.loc = locate(98,370,7)
			return
	Snake7
		icon_state = "7"
		Enter(var/mob/M)
			M.loc = locate(91,351,7)
			return
	Snake8
		icon_state = "8"
		Enter(var/mob/M)
			M.loc = locate(101,336,7)
			return
	Snake9
		icon_state = "9"
		Enter(var/mob/M)
			M.loc = locate(101,322,7)
			return
	Snake10
		icon_state = "10"
		Enter(var/mob/M)
			M.loc = locate(91,307,7)
			return
	Snake11
		icon_state = "11"
		Enter(var/mob/M)
			M.loc = locate(90,292,7)
			return
	Snake12
		icon_state = "12"
		Enter(var/mob/M)
			M.loc = locate(108,293,7)
			return
	Snake13
		icon_state = "13"
		Enter(var/mob/M)
			M.loc = locate(131,296,7)
			return
	Snake14
		icon_state = "14"
		Enter(var/mob/M)
			M.loc = locate(138,310,7)
			return
	Snake15
		icon_state = "15"
		Enter(var/mob/M)
			M.loc = locate(140,322,7)
			return
	Snake16
		icon_state = "16"
		Enter(var/mob/M)
			M.loc = locate(141,332,7)
			return
	Snake17
		icon_state = "17"
		Enter(var/mob/M)
			M.loc = locate(119,344,7)
			return
	Snake18
		icon_state = "18"
		Enter(var/mob/M)
			M.loc = locate(141,378,7)
			return

