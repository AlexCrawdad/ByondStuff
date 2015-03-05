mob/var/KO=0
mob/proc
	KO()
		if(powerlevel<=0)
			if(!KO)
				if(insafezone)
					powerlevel=1+(powerlevel_max/100)
					return
				view()<<"[src] has been knocked out!"
				safe=1
				spawn(3)if(src)safe=0
				KO=1
				frozen=1
				if(client)icon_state=""
				sight|=BLIND
				overlays-='Kaio Aura.dmi'
				kaioken=0
				Power_Redefine()
				spawn(35)if(src)
					KO=0
					frozen=0
					sight&=~BLIND
					powerlevel=1+(powerlevel_max/100)
					src<<"You wake up!"
					return
		return
	Tired_KO()
		if(stamina>=stamina_max)
			stamina=stamina_max
			view(8)<<"[src] has been knocked out!"
			KO=1
			frozen=1
			overlays-='Kaio Aura.dmi'
			kaioken=0
			if(client)icon_state=""
			Power_Redefine()
			sight|=BLIND
			spawn(35)if(src)
				KO=0
				frozen=0
				sight&=~BLIND
				src<<"You wake up!"
				return
		return