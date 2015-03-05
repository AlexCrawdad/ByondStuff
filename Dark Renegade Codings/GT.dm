mob/var/death_disease = 0
mob/var/death_disease_total = 0
mob/var/learn_grand = 0

mob/NPC/GT
	icon = 'NPCs.dmi'
	icon_state = "GT"

	name = "{NPC} GT"
	density = 1
	safe = 1

	powerlevel = 7907239072389032

	energy_code = 202

	New()
		src.CreateName()

	verb/Talk()
		set category = null
		set src in oview(1)
		if(src.death_disease == 1)
			usr.death_disease = 0
			usr.doing = 1
			usr << "<font color = blue>GT:</font> Hm, why are you Here?"
			sleep(25)
			usr << "<font color = white>[usr]:</font> I feel this...Sharp Jabbing pain everywhere...."
			sleep(25)
			usr << "<font color = blue>GT:</font> That is not good... You have the Death Disease. Let me find the cure."
			sleep(25)
			usr << "<font color = blue>GT:</font> Here, this will stop the Disease from killing you"
			sleep(25)
			usr << "You swallow a few of the Pills, then the Pain fades away"
			sleep(15)
			usr.doing = 0
			return
		else
			if(!usr.learn_grand)
				usr << "<font color = blue>GT:</font> Whats up [usr.name]. I can make you the best player in this game! By teaching you my signature attack! Grand Storm!"
				sleep(15)
				switch(alert("Do you wish to learn Grand Storm?","Learn Technique","Yes","No"))

					if("Yes")
						if(usr.level >= 50000 && usr.tp >= 5)
							usr.learn_grand = 1
							usr.tp -= 5
							usr << "<center><font color = blue> .:: You learn GRAND Storm! ::.</font></center>"
							sleep(20)
							usr << "<font color = blue>GT:</font> ALRIGHT!! Now you can use it to kill anyone! and I mean ANYONE!"
							usr.contents+=new/mob/learn/verb/Grand_Storm
						else
							usr << "<font color = blue>GT:</font> Yeah..... You're no where near ready to learn my technique."
					else
						return
			else
				usr << "<font color = blue>GT:</font> Whats up [usr.name]?"
				return




mob
	proc
		Death_Disease()
			set background = 1

			var/disease = round(src.powerlevel_max / 10)

			if(src.death_disease == 1)
				if(src.powerlevel_max >= 5000000)
					if(prob(15))
						src << "<font color = white>You feel a sharp jabbing pain all over..."
					else
						if(prob(15))
							src << "<font color = white>You feel it again, somewhat stronger."
						else
							if(prob(15))
								src << "<font color = white>You feel very weak now."
							else
								src << "<font color = white>You grab your chest and fall to your knees as the immense pain cripples you..."
					src.powerlevel = 0
					src.death_disease_total += disease

					if(src.powerlevel <= 0)
						src.Viral_Kill()

					spawn(1500) src.Death_Disease()
				else
					return
			else
				return

		Viral_Kill()
			if(src.powerlevel <= 0)
				usr.DeathCheck(src)
				usr.death_disease = 0
				return
			else
				return