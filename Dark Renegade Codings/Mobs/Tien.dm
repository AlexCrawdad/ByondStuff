mob
	var/learn_thousandattack=0
	NPC
		Tien
			icon_state = "Tien"
			name = "{NPC}Tien"
			density = 1
			safe = 1
			New()
				..()
				src.AddName()
			verb
				Talk()
					set src in oview(2)
					set category = null
					if(usr.talking || usr.fused)return
					usr.talking=1
					if(usr.level>=150&&!usr.learn_splitform)
						usr.learn_splitform=1
						usr.contents+=new/obj/Technique/SplitForm
						usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Split Form."
						usr.talking=0
						return
					if(usr.level>=750&&!usr.learn_solarflare)
						usr.learn_solarflare=1
						usr.contents+=new/obj/Technique/SolarFlare
						usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Solar Flare."
						usr.talking=0
						return
					if(usr.race=="Human")
						if(usr.level>=1200&&!usr.learn_tribeam)
							usr.learn_tribeam=1
							usr.contents+=new/obj/Technique/TriBeam
							usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Tri Beam."
							usr.talking=0
							return
						if(usr.level>=2000&&!usr.learn_thousandattack)
							usr.learn_thousandattack=1
							usr.contents += new/obj/Technique/ThousandAttackSlash
							usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Quad Barrage."
							usr.talking=0
							return
					if(usr.level<150)
						usr<<"\white Tien:\font Get to level 150 and I'll teach you something."
						usr.talking=0
						return
					if(usr.level<750)
						usr<<"\white Tien:\font Get to level 750 and I'll teach you something."
						usr.talking=0
						return
					if(usr.race=="Human")
						if(usr.level<1200&&!usr.learn_tribeam)
							usr<<"\white Tien:\font Get to level 1200 and I'll teach you something."
							usr.talking=0
							return
						if(usr.level<2000&&!usr.learn_thousandattack)
							usr<<"\white Tien:\font Get to level 2000 and I'll teach you something."
							usr.talking=0
							return
						if(usr.learn_tribeam&&usr.learn_thousandattack)
							usr<<"\white Tien:\font Uhh? I have NO more techniques to teach you!"
							usr.talking=0
							return
					else
						usr<<"\white Tien:\font Uhh? I have NO more techniques to teach you!"
						usr.talking=0
						return