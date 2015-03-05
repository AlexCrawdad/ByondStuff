mob
	var
		got_potara=0
		doing_potara_quest=0
		completed_potara_quest=0
mob/NPC
	Supreme_Kai
		name = "{NPC}Supreme Kai"
		icon_state = "Supreme Kai"
		density = 1
		it_blocked = 1
		itspecialblocked = 1
		safe = 1
		energy_code = 3317954
		New()
			src.AddName()
		verb/Talk()
			set src in oview(2)
			set category = null
			if(usr.talking || usr.fused)return
			usr.talking=1
			switch(input("What do you need [usr]?","")in list("I want to go to King Kai's","Quests","Never Mind"))
				if("Never Mind")
					usr.talking=0
					return
				if("Quests")
					if(usr.race!="Saibaman"&&usr.race!="Saiyan"&&usr.race!="Kai"&&usr.race!="Half Saiyan"&&usr.race!="Human"&&usr.race!="Demon"&&usr.race!="Changeling"&&usr.race!="Galactic Warrior"&&usr.race!="Makyo")
						usr<<"\white Supreme Kai: \font [usr], I cannot allow you to take this quest!"
						usr.talking=0
						return
					if(!usr.doing_potara_quest)
						usr<<"\white Supreme Kai: \font Hello, [usr]! I might be able to help your training take a whole new level!"
						sleep(30)
						usr<<"\white Supreme Kai: \font [usr], got what it takes...?"
						switch(input("Do the quest?","")in list("Yes","Never Mind"))
							if("Never Mind")
								usr.talking=0
								return
							if("Yes")
								usr<<"\white Supreme Kai: \font [usr]! Wise choice!"
								sleep(30)
								usr<<"\white Supreme Kai: \font You'll need to kill {Simulation}Shenron and come back."
								usr.talking=0
								usr.doing_potara_quest=1
								usr.contents += new/obj/Quests/Supreme_Kai/Potara_Earring
								return
					if(usr.doing_potara_quest&&!usr.completed_potara_quest)
						usr<<"\white Supreme Kai: \font [usr], you have yet to kill {Simulation}Shenron!"
						sleep(30)
						usr<<"\white Supreme Kai: \font Please go back and finish that task first!"
						usr.talking=0
						return
					if(usr.doing_potara_quest&&usr.completed_potara_quest)
						if(!usr.got_potara)
							usr<<"\white Supreme Kai: \font Congrats, [usr]!"
							sleep(30)
							usr.contents += new/obj/Technique/PotaraDance
							usr<<"You received <u>Potara Earring</u> from Supreme Kai!"
							usr<<"\white Supreme Kai: \font Use that to fuse permanently with anyone that has this potara earring!"
							usr.got_potara=1
							sleep(30)
							usr<<"\white Supreme Kai: \font Kiddo, it's my gift to you for being a hard worker!"
							usr.talking=0
							for(var/obj/Quests/Supreme_Kai/Potara_Earring/Q)del(Q)
							return
						else
							usr<<"\white Supreme Kai: \font Use that earring to achieve your strongest form..."
							usr.talking=0
							return
				if("I want to go to King Kai's")
					usr.loc = locate(93,316,5)
					usr.talking=0
					return