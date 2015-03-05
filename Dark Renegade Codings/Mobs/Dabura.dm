mob/NPC/
	Dabura
		name = "{NPC}Dabura"
		icon_state = "Dabura"
		density = 1
		safe = 1
		it_blocked = 1
		itspecialblocked = 1
		New()
			..()
			src.AddName()
		verb/Talk()
			set src in oview(2)
			set category = "Actions"
			if(usr.talking || usr.fused)return
			usr.talking=1
			if(usr.level >= 1000)
				usr.talking=0
				usr<<"<font color=white>Dabura:</font> Go back to Snake Way..."
				usr.loc = locate(41,343,5)
				if(usr.karma=="Evil"&&usr.karma_rating>=30)
					if(!usr.learn_deathball)
						usr.learn_deathball=1
						usr.contents+=new/obj/Technique/DeathBall
						usr<<"<font color=white>Dabura:</font> Here's a little something to help with with those that oppose you."
						usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Death Ball."
						return
			else
				usr.talking=0
				usr<<"<font color=white>Dabura:</font> You're not even strong enough to go back to Snake Way...Train some more..."
				return