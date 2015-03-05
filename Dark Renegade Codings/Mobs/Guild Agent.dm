mob/NPC/Guild_War_Agent
	name = "{NPC}Guild War Agent"
	icon_state = "yajirobe"
	density = 1
	safe = 1
	it_blocked = 1
	itspecialblocked = 1
	powerlevel = 100
	New()
		src.AddName()
	verb
		Talk()
			set src in oview(2)
			switch(alert("Greetings [usr]! Want to go back to earth?","Go Back To Earth","Yes","No"))
				if("Yes")
					usr.loc = locate(63,112,1)
					return
				if("No")return