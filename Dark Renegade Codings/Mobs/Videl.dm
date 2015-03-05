mob
	NPC
		Videl
			name = "{NPC}Videl"
			icon_state = "Videl"
			density = 1
			safe = 1
			New()
				..()
				src.AddName()
			verb
				Talk()
					set src in oview(2)
					set category=null
					if(usr.talking || usr.fused)return
					usr.talking = 1
					usr.underlays -= usr.aura
					switch(input("Videl: What do you need?")in list("Change my Aura color","Never Mind"))
						if("Never Mind")
							usr.talking=0
							return
						if("Change my Aura color")
							if(usr.learn_aura)
								usr.underlays-=usr.underlays
								usr.overlays -= usr.aura
								usr.aura_on = 0
								var/hr = input("How much Red do you want to put?") as num
								var/hg = input("How much Green do you want to put?") as num
								var/hb = input("How much Blue do you want to put?") as num
								usr.aura = 'Aura.dmi'
								usr.aura += rgb(hr,hg,hb)
								usr.talking=0
							else
								usr<<"<font color=white>Videl:</font> You must first master your aura before you can change it's colors!"
								usr.talking=0
								return