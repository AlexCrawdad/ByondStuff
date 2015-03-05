mob
	NPC
		Yajirboe
			name = "{NPC}Yajirobe"
			icon_state = "yajirobe"
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
					switch(alert("What can I do for you?","","Learn Techniques","Chat","Never Mind"))
						if("Never Mind")
							usr.talking=0
							return
						if("Learn Techniques")
							if(!usr.learn_freeze)
								usr.contents += new/obj/Technique/Freeze
								usr.learn_freeze=1
								usr.talking=0
								usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Freeze."
								usr<<"\white Yajirobe: Hmph...your enemy will be frozen in time with mah special technique!"
								return
							else
								usr<<"\white Yajirobe: Erm? Just use it on someone, but not me."
								usr.talking=0
								return
						if("Chat")
							usr<<"\white Yajirobe: Well, why don't you just buy me something to eat...?"
							sleep(30)
							usr<<"\white Yajirobe: C'mon, hurry up! I'm hungry fool!"
							sleep(30)
							usr<<"\white Yajirobe: That's does it! FREEZE!!!"
							usr.talking=0
							usr.GMLocked=1
							spawn(30)if(usr)usr.GMLocked=0
							return