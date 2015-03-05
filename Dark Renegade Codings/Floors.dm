area/SafeZone/
	Safe_Zone
		density = 0

turf/Floors
	icon = 'Floors.dmi'
	name = ""

	Floor_HBTC
		icon_state = "HBTC"
		density = 0

	Floor_HBTC2
		icon_state = "HBTC2"
		density = 0

	Floor_HBTCDesert
		icon_state = "HBTCDesert"
		density = 0

	Floor_HBTCDark
		icon_state = "HBTCDark"
		density = 0

	Floor_HBTCDark2
		icon_state = "HBTCDark2"
		density = 0

	Floor_HBTCLight
		icon_state = "HBTCLight"
		density = 0

	Floor_HBTCLight2
		icon_state = "HBTCLight2"
		density = 0

	Floor_Skeleton
		icon_state = "Skeleton"
		density = 0

	Cactus
		icon_state = "Cactus"
		density = 1

	Floor_1_1
		icon_state = "floor 1-1"
		density = 0
	Floor_1_2
		icon_state = "floor 1-2"
		density = 0
	Floor_1_3
		icon_state = "floor 1-3"
		density = 0
	Floor_1_4
		icon_state = "floor 1-4"
		density = 0
	Floor_1_5
		icon_state = "floor 1-5"
		density = 0
	Floor_1_6
		icon_state = "floor 1-6"
		density = 0
	Floor_1_7
		icon_state = "wooden 1"
		density = 0
	Road_1
		icon_state = "road 1"
		density = 0



	Floor_1_11
		icon_state = "1"
		density = 0

	Floor_1_111
		icon_state = "side1"
		density = 0

	Floor_1_112
		icon_state = "side2"
		density = 0

	Floor_1_113
		icon_state = "side3"
		density = 0

	Floor_1_114
		icon_state = "side4"
		density = 0

	Floor_1_22
		icon_state = "2"
		density = 0

	Floor_1_33
		icon_state = "3"
		density = 0

	Floor_1_44
		icon_state = "4"
		density = 0

	Floor_1_55
		icon_state = "5"
		density = 0

	Floor_1_66
		icon_state = "6"
		density = 0

	Floor_1_77
		icon_state = "7"
		density = 0

	Floor_1_88
		icon_state = "8"
		density = 0

	Floor_1_99
		icon_state = "9"
		density = 0

	Floor_1_1010
		icon_state = "10"
		density = 0

	Floor_1_1112
		icon_state = "11"
		density = 0

	Floor_1_1212
		icon_state = "12"
		density = 0

	Floor_1_1313
		icon_state = "13"
		density = 0

	Floor_1_1414
		icon_state = "14"
		density = 0

	Floor_1_1515
		icon_state = "15"
		density = 0

	Floor_1_1616
		icon_state = "16"
		density = 0

	Floor_1_1717
		icon_state = "17"
		density = 0

	Floor_1_1818
		icon_state = "18"
		density = 0

	Floor_1_1919
		icon_state = "19"
		density = 0

	Floor_1_2020
		icon_state = "20"
		density = 0

	Floor_1_2121
		icon_state = "21"
		density = 0

	Floor_1_2222
		icon_state = "22"
		density = 0

	Floor_1_2323
		icon_state = "23"
		density = 0

	Floor_1_2424
		icon_state = "24"
		density = 0

	Floor_1_2525
		icon_state = "25"
		density = 0

	Floor_1_2626
		icon_state = "26"
		density = 0

	Floor_1_2727
		icon_state = "27"
		density = 0

	Floor_1_2828
		icon_state = "28"
		density = 0

	No_Walking
		density = 1
		Enter()

	Sidewalk_1_1
		icon_state = "sidewalk 1-1"
		density = 0
	Sidewalk_1_2
		icon_state = "sidewalk 1-2"
		density = 0
	Sidewalk_1_3
		icon_state = "sidewalk 1-3"
		density = 0
	Sidewalk_1_4
		icon_state = "sidewalk 1-4"
		density = 0
	Sidewalk_1_5
		icon_state = "sidewalk 1-5"
		density = 0
	Sidewalk_1_6
		icon_state = "sidewalk 1-6"
		density = 0
	Sidewalk_1_7
		icon_state = "sidewalk 1-7"
		density = 0
	Sidewalk_1_8
		icon_state = "sidewalk 1-8"
		density = 0
	Sidewalk_1_9
		icon_state = "sidewalk 1-9"
		density = 0
	Sidewalk_1_10
		icon_state = "sidewalk 1-10"
		density = 0
	Sidewalk_1_11
		icon_state = "sidewalk 1-11"
		density = 0
	Sidewalk_1_12
		icon_state = "sidewalk 1-12"
		density = 0

	Sidewalk_1_13
		icon_state = "sidewalk 1-13"
		density = 0

	Sidewalk_1_14
		icon_state = "sidewalk 1-14"
		density = 0

	Sidewalk_1_15
		icon_state = "sidewalk 1-15"
		density = 0

	Sidewalk_1_16
		icon_state = "sidewalk 1-16"
		density = 0

	Sidewalk_1_17
		icon_state = "sidewalk 1-17"
		density = 0

	Sidewalk_1_18
		icon_state = "sidewalk 1-18"
		density = 0

	Stairs
		icon_state = "stairs"
		density = 0
	Stairsjump
		icon_state = "stairs"
		density = 0
		Enter(mob/M)
			if(usr.dir == NORTH)
				usr.loc=locate(x, y+1, z)
			if(usr.dir == SOUTH)
				usr.loc=locate(x, y-1, z)

	newthing
		icon_state = "33"
		density = 0

	newthing1
		icon_state = "34"
		density = 0

	newthing2
		icon_state = "35"
		density = 0

	newthing3
		icon_state = "36"
		density = 0

	newthing4
		icon_state = "37"
		density = 0

	newthing5
		icon_state = "38"
		density = 0

	newthing6
		icon_state = "39"
		density = 0

	newthing7
		icon_state = "40"
		density = 0

	newthing8
		icon_state = "41"
		density = 0


turf/Floors/Craters

	Crater_1
		icon_state = "crater top 1"
		density = 0
	Crater_2
		icon_state = "crater top 2"
		density = 0
	Crater_3
		icon_state = "crater top 3"
		density = 0
	Crater_4
		icon_state = "crater middle 1"
		density = 0
	Crater_5
		icon_state = "crater middle 2"
		density = 0
	Crater_6
		icon_state = "crater middle 3"
		density = 0
	Crater_7
		icon_state = "crater bottom 1"
		density = 0
	Crater_8
		icon_state = "crater bottom 2"
		density = 0
	Crater_9
		icon_state = "crater bottom 3"
		density = 0

	Crater_Small
		icon_state = "small crater"
		density = 0

