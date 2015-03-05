obj/Technique/Sense
	verb
		Sense()
			set category="Techniques"
			if(usr.spam_delay)return
			usr.spam_delay=1
			var/huge=0
			var/strong=0
			var/weak=0
			var/ext=0
			var/tot=0
			usr<<"\cyan You sense:"
			for(var/mob/PC/M in world)
				if(M!=usr)
					tot++
					if(M.powerlevel>=usr.powerlevel*100)ext++
					if(M.powerlevel>=usr.powerlevel*50&&M.powerlevel<usr.powerlevel*100)huge++
					if(M.powerlevel>=usr.powerlevel*10&&M.powerlevel<usr.powerlevel*50)strong++
					if(M.powerlevel<usr.powerlevel)weak++
			sleep(10)
			usr<<"\cyan [ext] <font color=red>Extremely Huge Power(s)!"
			usr<<"\cyan [huge] <font color = yellow>Huge Power(s)!"
			usr<<"\cyan [strong] <font color = green>Strong Power(s)!"
			usr<<"\cyan [weak] <font color=white>Weak Power(s)!"
			if(tot)
				usr<<"\cyan You are more powerful than [round((weak/tot)*100)]% of the players online.</font>"
				usr<<""
			spawn(25)if(usr)usr.spam_delay=0
			return
obj/Technique/SenseAnyone
	verb
		Sense_Anyone(mob/M in world)
			set category = "Techniques"
			if(usr.spam_delay||usr==M)return
			usr.spam_delay=1
			usr<<"\cyan You sense: [M]"
			if(M.powerlevel>usr.powerlevel)usr<<"[M] has more <font color=red>health</font> than you!"
			if(M.powerlevel<usr.powerlevel)usr<<"[M] has less <font color=red>health</font> than you!"
			if(M.ki>usr.ki)usr<<"[M] has more <font color=#00FFFF>ki</font> than you!"
			if(M.ki<usr.ki)usr<<"[M] has less <font color=#00FFFF>ki</font> than you!"
			if(M.kidefense>usr.kidefense)usr<<"[M] has more <font color=green>ki defence</font> than you!"
			if(M.kidefense<usr.kidefense)usr<<"[M] has less <font color=green>ki defence</font> than you!"
			if(M.strength>usr.strength)usr<<"[M] has more <font color=#FFA500>strength</font> than you!"
			if(M.strength<usr.strength)usr<<"[M] has less <font color=#FFA500>strength</font> than you!"
			if(M.defence>usr.defence)usr<<"[M] has more <font color=blue>defence</font> than you!"
			if(M.defence<usr.defence)usr<<"[M] has less <font color=blue>defence</font> than you!"
			usr<<""
			usr<<"[M] has <font color=red><u>[M.karma]</u></font> karma!"
			usr<<"[M]'s Race is <font color=red><u>[M.race]</u></font>!"
			usr<<"[M]'s Level is <font color=red><u>[M.level]</u></font>!"
			usr<<""
			spawn(25)if(usr)usr.spam_delay=0
			return