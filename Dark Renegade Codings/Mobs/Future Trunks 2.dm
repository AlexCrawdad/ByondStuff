mob/var/viral_heart = 0
mob/var/disease_total = 0

mob/NPC/Future/Trunks
	name = "{NPC}Future Trunks"
	icon_state="Trunks"
	density = 1
	safe = 1
	powerlevel = 2.14748e+030
	powerlevel_max = 2.14748e+030


	New()
		src.CreateName()

	verb/Talk()
		set category = null
		set src in oview(1)
		if(usr.doing == 1)
			return
		if(!usr)return
		if(usr.viral_heart == 1)
			if(usr.viral_heart == 0)
				return
			usr.viral_heart = 0
			usr.doing = 1
			usr << "<font color = white>Trunks:</font> You don't look so well..."
			sleep(25)
			usr << "<font color = white>[usr]:</font> I feel this...Sharp Jabbing pain near my heart."
			sleep(25)
			usr << "<font color = white>Trunks:</font> Ohh no. You have a Viral heart Disease. It's what Goku died of. Because of that, my world is Doomed because of the Androids."
			sleep(25)
			usr << "<font color = white>Trunks:</font> Here, this will stop the Disease from killing you"
			sleep(25)
			usr << "You swallow a few of the Pills, then the Pain fades away"
			sleep(15)
			usr.powerlevel_max += usr.disease_total; usr << "You feel all of your lost strength Return!"; return
			usr.doing = 0
			return
		else
			usr << "<font color = white>Trunks:</font> Perhaps one day I will be strong enough to defeat the Androids..."
			usr.doing = 0
			return

mob
	proc
		Viral_Heart()
			set background = 1

			var/disease = round(src.powerlevel_max / 10)

			if(src.viral_heart == 1)
				if(src.powerlevel_max >= 5000000)
					if(prob(30))
						src.DAMAGEEFFECT()
						src << "<font color = white>You feel a sharp jabbing pain near your heart, and you begin to feel somewhat weaker..."
					else
						if(prob(30))
							src.DAMAGEEFFECT()
							src << "<font color = white>You clutch your chest as you try to focus with the immense pain..."
						else
							if(prob(30))
								src.DAMAGEEFFECT()
								src << "<font color = white>Your chest throbs and you feel the pain getting stronger..."
							else
								src.DAMAGEEFFECT()
								src << "<font color = white>You grab your chest and fall to your knees as the immense pain cripples you..."
					src.powerlevel_max -= disease
					src.powerlevel -= disease
					src.disease_total += disease

					if(src.powerlevel <= 0)
						src.Viral_KO()

					spawn(1500) src.Viral_Heart()
				else
					return
			else
				return

		Viral_KO()
			if(src.powerlevel <= 0)
				view() << "[src.name] fainted!"
				src.KO = 1
				src.frozen = 1
				src.kaioken = 0
				src.sight |= BLIND

				if(src.race == "Namekian")
					src.NamekTrans()

				if(src.race == "Bio-Warrior")
					src.BioWarriorTrans()

				if(src.race == "Half Saiyan")
					src.HalfSaiyanRevert()

				if(src.race == "Changeling")
					src.ChanglingRevert()

				if(src.race == "Tuffle")
					src.TuffleRevert()

				if(src.race == "Bio-Android")
					src.BioRevert()

				if(src.race == "Saiyan")
					src.SaiyanRevert()

				if(src.race == "Demon")
					src.DemonRevert()

				if(src.race == "Saibaman")
					src.SaibamanRevert()

				if(src.race == "Saiyan")
					if(src.legendary_chromosome)src.LSaiyanRevert()
					if(src.god_chromosome)src.GSaiyanRevert()

				if(src.race == "Kai")
					src.KaiRevert()

				if(src.race == "Galactic Warrior")
					src.BojackRevert()

				if(src.race == "Makyo")
					src.MakyoRevert()

				if(src.race == "Cooler")
					src.ChanglingCoolRevert()

				if(src.race == "Babidi")
					src.BabidiRevert()

				if(src.race == "Bardock")
					src.BardockRevert()

				if(src.race == "Bojack")
					src.BojackRevert()

				if(src.race == "Uubub")
					src.UububRevert()

				if(src.race == "Dark Angel")
					src.DarkAngelRevert()

				if(src.race == "Legendary")
					src.LegendaryRevert()

				sleep(100)
				src.powerlevel = 10
				src.KO = 0
				src.frozen = 0
				src.sight &= ~BLIND
				src << "You wake up!"
				return
			else
				return