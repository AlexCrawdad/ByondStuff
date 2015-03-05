mob/var/tmp/opened = 0
mob/var/psnake = 0
mob/var/gone_psnake = 0
mob/NPC/Princess_Snake
	name = "{NPC}PSnake"
	icon_state = "Snake"
	it_blocked = 1
	itspecialblocked = 1
	verb
		Talk()
			set category = null
			set src in oview(8)
			if(usr.fused||usr.talking)return
			usr.talking = 1
			if(!usr.gone_psnake)
				switch(alert("Hehe, [usr]! You, at last, found me! Want your boost?","Boost now?","Get boost","Not now"))
					if("Get boost")
						usr<<"<font color=white>Princess Snake:</font> Ah, [usr]! You found me, its time for your boost!"
						sleep(50)
						usr<<"<font color=white>Princess Snake:</white> There, [usr]! Ha..haha..feel stronger, [usr]?"
						usr.icon_state = ""
						usr.frozen = 0
						usr.doing = 0
						usr.powerlevel_max *= 1.5
						usr.ki_max *= 1.5
						usr.strength_max *= 1.5
						usr.defence_max *= 1.5
						usr.kidefense_max *= 1.5
						usr.strength = usr.strength_max
						usr.ki = usr.ki_max
						usr.powerlevel = usr.powerlevel_max
						usr.defence = usr.defence_max
						usr.kidefense = usr.kidefense_max
						usr.safe = 0
						usr.psnake = 1
						usr.gone_psnake = 1
						usr.talking=0
						return
					if("Not now")
						usr.gone_psnake = 0
						usr.talking=0
						usr<<"<font color=white>Princess Snake:</white> Hehe...you want to get stronger first, then get boost eh? What a wise decision!"
						return
			else
				usr<<"<font color=white>Princess Snake: </font><font color=red>You already got your boost!</font>"
				usr.talking=0
				return