obj/Technique/UnleashRage
	verb
		Unleash_Rage()
			set category = "Techniques"
			if(usr.FuseFollower)return
			if(usr.kaioken)
				usr<<"Your body is under too much stress!"
				return
			if(usr.form_2)
				usr<<"Your body is enraged from transforming!"
				return
			if(usr.rage >= 15)
				if(usr.enraged)
					usr<<"You are already enraged!"
					return
				else
					usr.enraged = 1
					usr<<"You feel an uncontrollable rage burn through your body!"
					usr.icon_state = "enrage"
					sleep(25)
					if(!usr)return
					var/bonus = usr.powerlevel_max*(usr.rage / 10)
					usr.powerlevel += bonus
					usr.icon_state = ""
					sleep(600)
					if(!usr)return
					usr.enraged = 0
					usr.rage = 0
					usr.powerlevel -= bonus
					usr<<"You calm down..."
			else
				usr<<"You don't have enough rage..."
				return