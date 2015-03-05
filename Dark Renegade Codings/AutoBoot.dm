/*mob/var/tmp/oocafk=0
mob/proc
	AFKBOOTER()
		if(GMLevel<=2&&oocafk>=30)
			oocafk=0
			world<<"<font color=green>Dragon AI:</font> <font color=white>[src] is booted for not talking in OOC!"
			del(src)
			return
	OOCAFKER()
		oocafk+=1
		if(oocafk>=30)AFKBOOTER()
		else
			sleep(600)
			OOCAFKER()*/
