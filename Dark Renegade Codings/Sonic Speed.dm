obj
	Technique
		SonicSpeed
			verb
				Sonic_Speed()
					set category = "Combat"
					set src in usr.contents
					if(usr.sonicspeed)
						switch(input(usr,"Disable Sonic Speed?")in list("Yes","No"))
							if("Yes")usr.sonicspeed=0
							else return
					else
						switch(input(usr,"Enable Sonic Speed?")in list("Yes","No"))
							if("Yes")usr.sonicspeed=1
							else return