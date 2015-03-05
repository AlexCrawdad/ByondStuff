mob/var/absorbing=0
mob/learn
	verb
		Ki_Absorb()
			set category="Techniques"
			if(usr.absorbing)
				if(usr.buku||usr.boxing||usr.dualtrain||usr.rest)
					usr<<"You're already doing something!"
					return
				usr<<"You stop Absorbing Ki"
				usr.absorbing=0
				usr.frozen=0
				usr.doing=0
				return
			else
				if(usr.doing||usr.buku||usr.boxing||usr.dualtrain||usr.rest)
					usr<<"You're already doing something!"
					return
				usr<<"You prepare to start absorbing Ki"
				usr.absorbing=1
				usr.frozen=1
				usr.doing=1
				usr.icon_state="absorb"
				return