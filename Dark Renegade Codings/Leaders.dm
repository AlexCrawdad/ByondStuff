mob
	var
		hybrid = 0
		hybrid1 = 0
		hybrid2 = 0
		namek = 0
		majin3 = 0
		konat = 0
		konat1 = 0
		konat2 = 0
		makyo = 0
		makyo1 = 0
		makyo2 = 0
		halfsaiyan = 0
		saiyan = 0
		human = 0
		changling = 0
		bioandroid = 0
		tuffle = 0
		demon = 0
		android = 0
		bojack = 0
		dragon = 0
		kai = 0
		saibaman = 0
		namek1 = 0
		majin1 = 0
		halfsaiyan1 = 0
		saiyan1 = 0
		human1 = 0
		changling1 = 0
		bioandroid1 = 0
		tuffle1 = 0
		demon1 = 0
		android1 = 0
		bojack1 = 0
		dragon1 = 0
		kai1 = 0
		saibaman1 = 0
		namek2 = 0
		majin2 = 0
		halfsaiyan2 = 0
		saiyan2 = 0
		human2 = 0
		changling2 = 0
		bioandroid2 = 0
		tuffle2 = 0
		demon2 = 0
		android2 = 0
		bojack2 = 0
		dragon2 = 0
		kai2 = 0
		saibaman2 = 0
		squad = ""
		Rank2 = ""
		in_squad = 0


mob
	Namek_Leader
		verb
			Give_Namek_Number()
				set category = "Namek Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.race == usr.race)
						if(M.pk)
							Menu.Add(M)
				var/mob/M = input("Invite Who?","Namek Invite") as null | anything in Menu
				if(M.namek == 1)
					usr << "You cant make yourself an elite."
					return
				if(M.in_squad)
					usr << "This person has a number already."
					return
				else
					switch(alert(M,"[usr] is asking you to join the Namek Elites, Accept?","Namek Elites","Yes","No"))
						if("Yes")
							if(M.race == "Namek")
								switch(input("What Elite number?") in list ("1","2"))
									if("1")
										M.namek1 = 1
										M.in_squad = 1
										M.squad = "Namek Elite"
										M.Rank2 = "Namek Elite #1"
										M.verbs += typesof(/mob/Namek_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 1!"
									if("2")
										M.namek2 = 1
										M.in_squad = 1
										M.squad = "Namek Elite"
										M.Rank2 = "Namek Elite #2"
										M.verbs += typesof(/mob/Namek_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 2!"
						if("No")
							usr << "[M] has declined your offer."
							return
			Namek_Elite_Boot()
				set category = "Namek Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.name != usr.name)
						if(M.squad == usr.squad)
							Menu.Add(M)
				var/mob/M = input("Who do you want to boot from the Namek Elite?","[usr.squad]") as null | anything in Menu
				if(!M)return
				if(istype(M,/mob))
					if(M.namek)
						alert("You cannot boot the Namek Leader!")
						return
					else
						switch(alert("Are you sure that you want to boot [M] from the [usr.squad]?","","Yes","No"))
							if("Yes")
								world << "<b><font color = red>Elite Info: [usr] has booted [M] from the [usr.squad]!"
								M.verbs -= typesof(/mob/Namek_Verbs/verb)
								M.squad = ""
								M.Rank2 = ""
								M.in_squad = 0
								M.namek1 = 0
								M.namek2 = 0
							if("No")
								return
			Namek_Elite_Announce(T as text)
				set category = "Namek Elite"
				var/list/L
				L = list("font size")
				if(lentext(T) > 400)
					alert("Your message must be less than 400 characters!")
					return
				for(var/X in L)
					if(findtext(T,X))
						alert("You can not change your font size.")
						return
				for(var/mob/X in world)
					if(X.squad == usr.squad)
					 X << "<font size=1><font color = red><b><center>[usr.Rank2] [usr] would like to announce to the Namek Elites:<center><br>[T]"

mob/Namek_Verbs
	verb
		Elite_Say(T as text)
			set category = "Namek Elite"
			var/list/L
			L = list("font size")
			if(lentext(T) > 300)
				alert("Your message must be less than 300 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/X in world)
				if(X.squad == usr.squad)
					X << "<b><font color = red>(Elite Say)([src.Rank2])[src.name]:[T]"
		Elite_Who()
			set category = "Namek Elite"
			var/tmp/C = 0
			usr << "<font size=1><b><font color=red><center>-Online Members-"
			for(var/mob/M in world)
				if(M.squad == usr.squad)
					C += 1
					usr << "<font size=1><b><font color=red>[M.Rank2] [M.name]"
			usr << "<b><font color = red>[C] Members Online!"
		Elite_Leave()
			set category = "Namek Elite"
			if(usr.namek)
				usr << "Namek Leader can't use this verb."
				return
			switch(alert("Are you sure that you want to leave the [usr.squad]?","","Yes","No"))
				if("Yes")
					world << "<b><font color = red>Elite Info: [usr] has left from the [usr.squad]!"
					var/mob/M = usr
					M.verbs -= /mob/Namek_Verbs/verb/Elite_Say
					M.verbs -= /mob/Namek_Verbs/verb/Elite_Who
					M.verbs -= /mob/Namek_Verbs/verb/Elite_Leave
					M.squad = ""
					M.Rank2 = ""
					M.in_squad = 0
					M.namek1 = 0
					M.namek2 = 0
				if("No")
					return

mob
	Majin_Leader
		verb
			Give_Majin_Number()
				set category = "Majin Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.race == usr.race)
						if(M.pk)
							Menu.Add(M)
				var/mob/M = input("Invite Who?","Majin Invite") as null | anything in Menu
				if(M.majin == 1)
					usr << "You cant make yourself an elite."
					return
				if(M.in_squad)
					usr << "This person has a number already."
					return
				else
					switch(alert(M,"[usr] is asking you to join the Majin Elites, Accept?","Majin Elites","Yes","No"))
						if("Yes")
							if(M.race == "Majin")
								switch(input("What Elite number?") in list ("1","2"))
									if("1")
										M.majin1 = 1
										M.in_squad = 1
										M.squad = "Majin Elite"
										M.Rank2 = "Majin Elite #1"
										M.verbs += typesof(/mob/Majin_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 1!"
									if("2")
										M.majin2 = 1
										M.in_squad = 1
										M.squad = "Majin Elite"
										M.Rank2 = "Majin Elite #2"
										M.verbs += typesof(/mob/Majin_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 2!"
						if("No")
							usr << "[M] has declined your offer."
							return
			Majin_Elite_Boot()
				set category = "Majin Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.name != usr.name)
						if(M.squad == usr.squad)
							Menu.Add(M)
				var/mob/M = input("Who do you want to boot from the Majin Elite?","[usr.squad]") as null | anything in Menu
				if(!M)return
				if(istype(M,/mob))
					if(M.majin)
						alert("You cannot boot the Majin Leader!")
						return
					else
						switch(alert("Are you sure that you want to boot [M] from the [usr.squad]?","","Yes","No"))
							if("Yes")
								world << "<b><font color = red>Elite Info: [usr] has booted [M] from the [usr.squad]!"
								M.verbs -= typesof(/mob/Majin_Verbs/verb)
								M.squad = ""
								M.Rank2 = ""
								M.in_squad = 0
								M.majin1 = 0
								M.majin2 = 0
							if("No")
								return
			Majin_Elite_Announce(T as text)
				set category = "Majin Elite"
				var/list/L
				L = list("font size")
				if(lentext(T) > 400)
					alert("Your message must be less than 400 characters!")
					return
				for(var/X in L)
					if(findtext(T,X))
						alert("You can not change your font size.")
						return
				for(var/mob/X in world)
					if(X.squad == usr.squad)
					 X << "<font size=1><font color = red><b><center>[usr.Rank2] [usr] would like to announce to the Majin Elites:<center><br>[T]"

mob/Majin_Verbs
	verb
		Elite_Say(T as text)
			set category = "Majin Elite"
			var/list/L
			L = list("font size")
			if(lentext(T) > 300)
				alert("Your message must be less than 300 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/X in world)
				if(X.squad == usr.squad)
					X << "<b><font color = red>(Elite Say)([src.Rank2])[src.name]:[T]"
		Elite_Who()
			set category = "Majin Elite"
			var/tmp/C = 0
			usr << "<font size=1><b><font color=red><center>-Online Members-"
			for(var/mob/M in world)
				if(M.squad == usr.squad)
					C += 1
					usr << "<font size=1><b><font color=red>[M.Rank2] [M.name]"
			usr << "<b><font color = red>[C] Members Online!"
		Elite_Leave()
			set category = "Majin Elite"
			if(usr.majin)
				usr << "Majin Leader can't use this verb."
				return
			switch(alert("Are you sure that you want to leave the [usr.squad]?","","Yes","No"))
				if("Yes")
					world << "<b><font color = red>Elite Info: [usr] has left from the [usr.squad]!"
					var/mob/M = usr
					M.verbs -= /mob/Majin_Verbs/verb/Elite_Say
					M.verbs -= /mob/Majin_Verbs/verb/Elite_Who
					M.verbs -= /mob/Majin_Verbs/verb/Elite_Leave
					M.squad = ""
					M.Rank2 = ""
					M.in_squad = 0
					M.majin1 = 0
					M.majin2 = 0
				if("No")
					return

mob
	Half_Saiyan_Leader
		verb
			Give_Half_Saiyan_Number()
				set category = "Half Saiyan Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.race == usr.race)
						if(M.pk)
							Menu.Add(M)
				var/mob/M = input("Invite Who?","Half Saiyan Invite") as null | anything in Menu
				if(M.halfsaiyan == 1)
					usr << "You cant make yourself an elite."
					return
				if(M.in_squad)
					usr << "This person has a number already."
					return
				else
					switch(alert(M,"[usr] is asking you to join the Half Saiyan Elites, Accept?","Half Saiyan Elites","Yes","No"))
						if("Yes")
							if(M.race == "Half Saiyan")
								switch(input("What Elite number?") in list ("1","2"))
									if("1")
										M.halfsaiyan1 = 1
										M.in_squad = 1
										M.squad = "Half Saiyan Elite"
										M.Rank2 = "Half Saiyan Elite #1"
										M.verbs += typesof(/mob/Half_Saiyan_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 1!"
									if("2")
										M.halfsaiyan2 = 1
										M.in_squad = 1
										M.squad = "Half Saiyan Elite"
										M.Rank2 = "Half Saiyan Elite #2"
										M.verbs += typesof(/mob/Half_Saiyan_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 2!"
						if("No")
							usr << "[M] has declined your offer."
							return
			Half_Saiyan_Elite_Boot()
				set category = "Half Saiyan Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.name != usr.name)
						if(M.squad == usr.squad)
							Menu.Add(M)
				var/mob/M = input("Who do you want to boot from the Half Saiyan Elite?","[usr.squad]") as null | anything in Menu
				if(!M)return
				if(istype(M,/mob))
					if(M.halfsaiyan)
						alert("You cannot boot the Half Saiyan Leader!")
						return
					else
						switch(alert("Are you sure that you want to boot [M] from the [usr.squad]?","","Yes","No"))
							if("Yes")
								world << "<b><font color = red>Elite Info: [usr] has booted [M] from the [usr.squad]!"
								M.verbs -= typesof(/mob/Half_Saiyan_Verbs/verb)
								M.squad = ""
								M.Rank2 = ""
								M.in_squad = 0
								M.halfsaiyan1 = 0
								M.halfsaiyan2 = 0
							if("No")
								return
			Half_Saiyan_Elite_Announce(T as text)
				set category = "Half Saiyan Elite"
				var/list/L
				L = list("font size")
				if(lentext(T) > 400)
					alert("Your message must be less than 400 characters!")
					return
				for(var/X in L)
					if(findtext(T,X))
						alert("You can not change your font size.")
						return
				for(var/mob/X in world)
					if(X.squad == usr.squad)
					 X << "<font size=1><font color = red><b><center>[usr.Rank2] [usr] would like to announce to the Half Saiyan Elites:<center><br>[T]"

mob/Half_Saiyan_Verbs
	verb
		Elite_Say(T as text)
			set category = "Half Saiyan Elite"
			var/list/L
			L = list("font size")
			if(lentext(T) > 300)
				alert("Your message must be less than 300 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/X in world)
				if(X.squad == usr.squad)
					X << "<b><font color = red>(Elite Say)([src.Rank2])[src.name]:[T]"
		Elite_Who()
			set category = "Half Saiyan Elite"
			var/tmp/C = 0
			usr << "<font size=1><b><font color=red><center>-Online Members-"
			for(var/mob/M in world)
				if(M.squad == usr.squad)
					C += 1
					usr << "<font size=1><b><font color=red>[M.Rank2] [M.name]"
			usr << "<b><font color = red>[C] Members Online!"
		Elite_Leave()
			set category = "Half Saiyan Elite"
			if(usr.halfsaiyan)
				usr << "Half Saiyan Leader can't use this verb."
				return
			switch(alert("Are you sure that you want to leave the [usr.squad]?","","Yes","No"))
				if("Yes")
					world << "<b><font color = red>Elite Info: [usr] has left from the [usr.squad]!"
					var/mob/M = usr
					M.verbs -= /mob/Half_Saiyan_Verbs/verb/Elite_Say
					M.verbs -= /mob/Half_Saiyan_Verbs/verb/Elite_Who
					M.verbs -= /mob/Half_Saiyan_Verbs/verb/Elite_Leave
					M.squad = ""
					M.Rank2 = ""
					M.in_squad = 0
					M.halfsaiyan1 = 0
					M.halfsaiyan2 = 0
				if("No")
					return

mob
	Saiyan_Leader
		verb
			Give_Saiyan_Number()
				set category = "Saiyan Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.race == usr.race)
						if(M.pk)
							Menu.Add(M)
				var/mob/M = input("Invite Who?","Saiyan Invite") as null | anything in Menu
				if(M.saiyan == 1)
					usr << "You cant make yourself an elite."
					return
				if(M.in_squad)
					usr << "This person has a number already."
					return
				else
					switch(alert(M,"[usr] is asking you to join the Saiyan Elites, Accept?","Saiyan Elites","Yes","No"))
						if("Yes")
							if(M.race == "Saiyan")
								switch(input("What Elite number?") in list ("1","2"))
									if("1")
										M.saiyan1 = 1
										M.in_squad = 1
										M.squad = "Saiyan Elite"
										M.Rank2 = "Saiyan Elite #1"
										M.verbs += typesof(/mob/Saiyan_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 1!"
									if("2")
										M.saiyan2 = 1
										M.in_squad = 1
										M.squad = "Saiyan Elite"
										M.Rank2 = "Saiyan Elite #2"
										M.verbs += typesof(/mob/Saiyan_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 2!"
						if("No")
							usr << "[M] has declined your offer."
							return
			Saiyan_Elite_Boot()
				set category = "Saiyan Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.name != usr.name)
						if(M.squad == usr.squad)
							Menu.Add(M)
				var/mob/M = input("Who do you want to boot from the Saiyan Elite?","[usr.squad]") as null | anything in Menu
				if(!M)return
				if(istype(M,/mob))
					if(M.saiyan)
						alert("You cannot boot the Saiyan Leader!")
						return
					else
						switch(alert("Are you sure that you want to boot [M] from the [usr.squad]?","","Yes","No"))
							if("Yes")
								world << "<b><font color = red>Elite Info: [usr] has booted [M] from the [usr.squad]!"
								M.verbs -= typesof(/mob/Saiyan_Verbs/verb)
								M.squad = ""
								M.Rank2 = ""
								M.in_squad = 0
								M.saiyan1 = 0
								M.saiyan2 = 0
							if("No")
								return
			Saiyan_Elite_Announce(T as text)
				set category = "Saiyan Elite"
				var/list/L
				L = list("font size")
				if(lentext(T) > 400)
					alert("Your message must be less than 400 characters!")
					return
				for(var/X in L)
					if(findtext(T,X))
						alert("You can not change your font size.")
						return
				for(var/mob/X in world)
					if(X.squad == usr.squad)
					 X << "<font size=1><font color = red><b><center>[usr.Rank2] [usr] would like to announce to the Saiyan Elites:<center><br>[T]"

mob/Saiyan_Verbs
	verb
		Elite_Say(T as text)
			set category = "Saiyan Elite"
			var/list/L
			L = list("font size")
			if(lentext(T) > 300)
				alert("Your message must be less than 300 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/X in world)
				if(X.squad == usr.squad)
					X << "<b><font color = red>(Elite Say)([src.Rank2])[src.name]:[T]"
		Elite_Who()
			set category = "Saiyan Elite"
			var/tmp/C = 0
			usr << "<font size=1><b><font color=red><center>-Online Members-"
			for(var/mob/M in world)
				if(M.squad == usr.squad)
					C += 1
					usr << "<font size=1><b><font color=red>[M.Rank2] [M.name]"
			usr << "<b><font color = red>[C] Members Online!"
		Elite_Leave()
			set category = "Saiyan Elite"
			if(usr.saiyan)
				usr << "Saiyan Leader can't use this verb."
				return
			switch(alert("Are you sure that you want to leave the [usr.squad]?","","Yes","No"))
				if("Yes")
					world << "<b><font color = red>Elite Info: [usr] has left from the [usr.squad]!"
					var/mob/M = usr
					M.verbs -= /mob/Saiyan_Verbs/verb/Elite_Say
					M.verbs -= /mob/Saiyan_Verbs/verb/Elite_Who
					M.verbs -= /mob/Saiyan_Verbs/verb/Elite_Leave
					M.squad = ""
					M.Rank2 = ""
					M.in_squad = 0
					M.saiyan1 = 0
					M.saiyan2 = 0
				if("No")
					return

mob
	Human_Leader
		verb
			Give_Human_Number()
				set category = "Human Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.race == usr.race)
						if(M.pk)
							Menu.Add(M)
				var/mob/M = input("Invite Who?","Human Invite") as null | anything in Menu
				if(M.human == 1)
					usr << "You cant make yourself an elite."
					return
				if(M.in_squad)
					usr << "This person has a number already."
					return
				else
					switch(alert(M,"[usr] is asking you to join the Human Elites, Accept?","Human Elites","Yes","No"))
						if("Yes")
							if(M.race == "Human")
								switch(input("What Elite number?") in list ("1","2"))
									if("1")
										M.human1 = 1
										M.in_squad = 1
										M.squad = "Human Elite"
										M.Rank2 = "Human Elite #1"
										M.verbs += typesof(/mob/Human_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 1!"
									if("2")
										M.human2 = 1
										M.in_squad = 1
										M.squad = "Human Elite"
										M.Rank2 = "Human Elite #2"
										M.verbs += typesof(/mob/Human_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 2!"
						if("No")
							usr << "[M] has declined your offer."
							return
			Human_Elite_Boot()
				set category = "Human Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.name != usr.name)
						if(M.squad == usr.squad)
							Menu.Add(M)
				var/mob/M = input("Who do you want to boot from the Human Elite?","[usr.squad]") as null | anything in Menu
				if(!M)return
				if(istype(M,/mob))
					if(M.human)
						alert("You cannot boot the Human Leader!")
						return
					else
						switch(alert("Are you sure that you want to boot [M] from the [usr.squad]?","","Yes","No"))
							if("Yes")
								world << "<b><font color = red>Elite Info: [usr] has booted [M] from the [usr.squad]!"
								M.verbs -= typesof(/mob/Human_Verbs/verb)
								M.squad = ""
								M.Rank2 = ""
								M.in_squad = 0
								M.human1 = 0
								M.human2 = 0
							if("No")
								return
			Human_Elite_Announce(T as text)
				set category = "Human Elite"
				var/list/L
				L = list("font size")
				if(lentext(T) > 400)
					alert("Your message must be less than 400 characters!")
					return
				for(var/X in L)
					if(findtext(T,X))
						alert("You can not change your font size.")
						return
				for(var/mob/X in world)
					if(X.squad == usr.squad)
					 X << "<font size=1><font color = red><b><center>[usr.Rank2] [usr] would like to announce to the Human Elites:<center><br>[T]"

mob/Human_Verbs
	verb
		Elite_Say(T as text)
			set category = "Human Elite"
			var/list/L
			L = list("font size")
			if(lentext(T) > 300)
				alert("Your message must be less than 300 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/X in world)
				if(X.squad == usr.squad)
					X << "<b><font color = red>(Elite Say)([src.Rank2])[src.name]:[T]"
		Elite_Who()
			set category = "Human Elite"
			var/tmp/C = 0
			usr << "<font size=1><b><font color=red><center>-Online Members-"
			for(var/mob/M in world)
				if(M.squad == usr.squad)
					C += 1
					usr << "<font size=1><b><font color=red>[M.Rank2] [M.name]"
			usr << "<b><font color = red>[C] Members Online!"
		Elite_Leave()
			set category = "Human Elite"
			if(usr.human)
				usr << "Human Leader can't use this verb."
				return
			switch(alert("Are you sure that you want to leave the [usr.squad]?","","Yes","No"))
				if("Yes")
					world << "<b><font color = red>Elite Info: [usr] has left from the [usr.squad]!"
					var/mob/M = usr
					M.verbs -= /mob/Human_Verbs/verb/Elite_Say
					M.verbs -= /mob/Human_Verbs/verb/Elite_Who
					M.verbs -= /mob/Human_Verbs/verb/Elite_Leave
					M.squad = ""
					M.Rank2 = ""
					M.in_squad = 0
					M.human1 = 0
					M.human2 = 0
				if("No")
					return

mob
	Changling_Leader
		verb
			Give_Changling_Number()
				set category = "Changling Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.race == usr.race)
						if(M.pk)
							Menu.Add(M)
				var/mob/M = input("Invite Who?","Changling Invite") as null | anything in Menu
				if(M.changling == 1)
					usr << "You cant make yourself an elite."
					return
				if(M.in_squad)
					usr << "This person has a number already."
					return
				else
					switch(alert(M,"[usr] is asking you to join the Changling Elites, Accept?","Changling Elites","Yes","No"))
						if("Yes")
							if(M.race == "Changling")
								switch(input("What Elite number?") in list ("1","2"))
									if("1")
										M.changling1 = 1
										M.in_squad = 1
										M.squad = "Changling Elite"
										M.Rank2 = "Changling Elite #1"
										M.verbs += typesof(/mob/Changling_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 1!"
									if("2")
										M.changling2 = 1
										M.in_squad = 1
										M.squad = "Changling Elite"
										M.Rank2 = "Changling Elite #2"
										M.verbs += typesof(/mob/Changling_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 2!"
						if("No")
							usr << "[M] has declined your offer."
							return
			Changling_Elite_Boot()
				set category = "Changling Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.name != usr.name)
						if(M.squad == usr.squad)
							Menu.Add(M)
				var/mob/M = input("Who do you want to boot from the Changling Elite?","[usr.squad]") as null | anything in Menu
				if(!M)return
				if(istype(M,/mob))
					if(M.changling)
						alert("You cannot boot the Changling Leader!")
						return
					else
						switch(alert("Are you sure that you want to boot [M] from the [usr.squad]?","","Yes","No"))
							if("Yes")
								world << "<b><font color = red>Elite Info: [usr] has booted [M] from the [usr.squad]!"
								M.verbs -= typesof(/mob/Changling_Verbs/verb)
								M.squad = ""
								M.Rank2 = ""
								M.in_squad = 0
								M.changling1 = 0
								M.changling2 = 0
							if("No")
								return
			Changling_Elite_Announce(T as text)
				set category = "Changling Elite"
				var/list/L
				L = list("font size")
				if(lentext(T) > 400)
					alert("Your message must be less than 400 characters!")
					return
				for(var/X in L)
					if(findtext(T,X))
						alert("You can not change your font size.")
						return
				for(var/mob/X in world)
					if(X.squad == usr.squad)
					 X << "<font size=1><font color = red><b><center>[usr.Rank2] [usr] would like to announce to the Changling Elites:<center><br>[T]"

mob/Changling_Verbs
	verb
		Elite_Say(T as text)
			set category = "Changling Elite"
			var/list/L
			L = list("font size")
			if(lentext(T) > 300)
				alert("Your message must be less than 300 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/X in world)
				if(X.squad == usr.squad)
					X << "<b><font color = red>(Elite Say)([src.Rank2])[src.name]:[T]"
		Elite_Who()
			set category = "Changling Elite"
			var/tmp/C = 0
			usr << "<font size=1><b><font color=red><center>-Online Members-"
			for(var/mob/M in world)
				if(M.squad == usr.squad)
					C += 1
					usr << "<font size=1><b><font color=red>[M.Rank2] [M.name]"
			usr << "<b><font color = red>[C] Members Online!"
		Elite_Leave()
			set category = "Changling Elite"
			if(usr.changling)
				usr << "Changling Leader can't use this verb."
				return
			switch(alert("Are you sure that you want to leave the [usr.squad]?","","Yes","No"))
				if("Yes")
					world << "<b><font color = red>Elite Info: [usr] has left from the [usr.squad]!"
					var/mob/M = usr
					M.verbs -= /mob/Changling_Verbs/verb/Elite_Say
					M.verbs -= /mob/Changling_Verbs/verb/Elite_Who
					M.verbs -= /mob/Changling_Verbs/verb/Elite_Leave
					M.squad = ""
					M.Rank2 = ""
					M.in_squad = 0
					M.changling1 = 0
					M.changling2 = 0
				if("No")
					return

mob
	Bio_Android_Leader
		verb
			Give_Bio_Android_Number()
				set category = "Bio Android Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.race == usr.race)
						if(M.pk)
							Menu.Add(M)
				var/mob/M = input("Invite Who?","Bio Android Invite") as null | anything in Menu
				if(M.bioandroid == 1)
					usr << "You cant make yourself an elite."
					return
				if(M.in_squad)
					usr << "This person has a number already."
					return
				else
					switch(alert(M,"[usr] is asking you to join the Bio Android Elites, Accept?","Bio Android Elites","Yes","No"))
						if("Yes")
							if(M.race == "Bio-Android")
								switch(input("What Elite number?") in list ("1","2"))
									if("1")
										M.bioandroid1 = 1
										M.in_squad = 1
										M.squad = "Bio Android Elite"
										M.Rank2 = "Bio Android Elite #1"
										M.verbs += typesof(/mob/Bio_Android_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 1!"
									if("2")
										M.bioandroid2 = 1
										M.in_squad = 1
										M.squad = "Bio Android Elite"
										M.Rank2 = "Bio Android Elite #2"
										M.verbs += typesof(/mob/Bio_Android_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 2!"
						if("No")
							usr << "[M] has declined your offer."
							return
			Bio_Android_Elite_Boot()
				set category = "Bio Android Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.name != usr.name)
						if(M.squad == usr.squad)
							Menu.Add(M)
				var/mob/M = input("Who do you want to boot from the Bio Android Elite?","[usr.squad]") as null | anything in Menu
				if(!M)return
				if(istype(M,/mob))
					if(M.bioandroid)
						alert("You cannot boot the Bio Android Leader!")
						return
					else
						switch(alert("Are you sure that you want to boot [M] from the [usr.squad]?","","Yes","No"))
							if("Yes")
								world << "<b><font color = red>Elite Info: [usr] has booted [M] from the [usr.squad]!"
								M.verbs -= typesof(/mob/Bio_Android_Verbs/verb)
								M.squad = ""
								M.Rank2 = ""
								M.in_squad = 0
								M.bioandroid1 = 0
								M.bioandroid2 = 0
							if("No")
								return
			Bio_Android_Elite_Announce(T as text)
				set category = "Bio Android Elite"
				var/list/L
				L = list("font size")
				if(lentext(T) > 400)
					alert("Your message must be less than 400 characters!")
					return
				for(var/X in L)
					if(findtext(T,X))
						alert("You can not change your font size.")
						return
				for(var/mob/X in world)
					if(X.squad == usr.squad)
					 X << "<font size=1><font color = red><b><center>[usr.Rank2] [usr] would like to announce to the Bio Android Elites:<center><br>[T]"

mob/Bio_Android_Verbs
	verb
		Elite_Say(T as text)
			set category = "Bio Android Elite"
			var/list/L
			L = list("font size")
			if(lentext(T) > 300)
				alert("Your message must be less than 300 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/X in world)
				if(X.squad == usr.squad)
					X << "<b><font color = red>(Elite Say)([src.Rank2])[src.name]:[T]"
		Elite_Who()
			set category = "Bio Android Elite"
			var/tmp/C = 0
			usr << "<font size=1><b><font color=red><center>-Online Members-"
			for(var/mob/M in world)
				if(M.squad == usr.squad)
					C += 1
					usr << "<font size=1><b><font color=red>[M.Rank2] [M.name]"
			usr << "<b><font color = red>[C] Members Online!"
		Elite_Leave()
			set category = "Bio Android Elite"
			if(usr.bioandroid)
				usr << "Bio Android Leader can't use this verb."
				return
			switch(alert("Are you sure that you want to leave the [usr.squad]?","","Yes","No"))
				if("Yes")
					world << "<b><font color = red>Elite Info: [usr] has left from the [usr.squad]!"
					var/mob/M = usr
					M.verbs -= /mob/Bio_Android_Verbs/verb/Elite_Say
					M.verbs -= /mob/Bio_Android_Verbs/verb/Elite_Who
					M.verbs -= /mob/Bio_Android_Verbs/verb/Elite_Leave
					M.squad = ""
					M.Rank2 = ""
					M.in_squad = 0
					M.bioandroid1 = 0
					M.bioandroid2 = 0
				if("No")
					return

mob
	Tuffle_Leader
		verb
			Give_Tuffle_Number()
				set category = "Tuffle Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.race == usr.race)
						if(M.pk)
							Menu.Add(M)
				var/mob/M = input("Invite Who?","Tuffle Invite") as null | anything in Menu
				if(M.tuffle == 1)
					usr << "You cant make yourself an elite."
					return
				if(M.in_squad)
					usr << "This person has a number already."
					return
				else
					switch(alert(M,"[usr] is asking you to join the Tuffle Elites, Accept?","Tuffle Elites","Yes","No"))
						if("Yes")
							if(M.race == "Tuffle")
								switch(input("What Elite number?") in list ("1","2"))
									if("1")
										M.tuffle1 = 1
										M.in_squad = 1
										M.squad = "Tuffle Elite"
										M.Rank2 = "Tuffle Elite #1"
										M.verbs += typesof(/mob/Tuffle_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 1!"
									if("2")
										M.tuffle2 = 1
										M.in_squad = 1
										M.squad = "Tuffle Elite"
										M.Rank2 = "Tuffle Elite #2"
										M.verbs += typesof(/mob/Tuffle_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 2!"
						if("No")
							usr << "[M] has declined your offer."
							return
			Tuffle_Elite_Boot()
				set category = "Tuffle Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.name != usr.name)
						if(M.squad == usr.squad)
							Menu.Add(M)
				var/mob/M = input("Who do you want to boot from the Tuffle Elite?","[usr.squad]") as null | anything in Menu
				if(!M)return
				if(istype(M,/mob))
					if(M.tuffle)
						alert("You cannot boot the Tuffle Leader!")
						return
					else
						switch(alert("Are you sure that you want to boot [M] from the [usr.squad]?","","Yes","No"))
							if("Yes")
								world << "<b><font color = red>Elite Info: [usr] has booted [M] from the [usr.squad]!"
								M.verbs -= typesof(/mob/Tuffle_Verbs/verb)
								M.squad = ""
								M.Rank2 = ""
								M.in_squad = 0
								M.tuffle1 = 0
								M.tuffle2 = 0
							if("No")
								return
			Tuffle_Elite_Announce(T as text)
				set category = "Tuffle Elite"
				var/list/L
				L = list("font size")
				if(lentext(T) > 400)
					alert("Your message must be less than 400 characters!")
					return
				for(var/X in L)
					if(findtext(T,X))
						alert("You can not change your font size.")
						return
				for(var/mob/X in world)
					if(X.squad == usr.squad)
					 X << "<font size=1><font color = red><b><center>[usr.Rank2] [usr] would like to announce to the Tuffle Elites:<center><br>[T]"

mob/Tuffle_Verbs
	verb
		Elite_Say(T as text)
			set category = "Tuffle Elite"
			var/list/L
			L = list("font size")
			if(lentext(T) > 300)
				alert("Your message must be less than 300 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/X in world)
				if(X.squad == usr.squad)
					X << "<b><font color = red>(Elite Say)([src.Rank2])[src.name]:[T]"
		Elite_Who()
			set category = "Tuffle Elite"
			var/tmp/C = 0
			usr << "<font size=1><b><font color=red><center>-Online Members-"
			for(var/mob/M in world)
				if(M.squad == usr.squad)
					C += 1
					usr << "<font size=1><b><font color=red>[M.Rank2] [M.name]"
			usr << "<b><font color = red>[C] Members Online!"
		Elite_Leave()
			set category = "Tuffle Elite"
			if(usr.tuffle)
				usr << "Tuffle Leader can't use this verb."
				return
			switch(alert("Are you sure that you want to leave the [usr.squad]?","","Yes","No"))
				if("Yes")
					world << "<b><font color = red>Elite Info: [usr] has left from the [usr.squad]!"
					var/mob/M = usr
					M.verbs -= /mob/Tuffle_Verbs/verb/Elite_Say
					M.verbs -= /mob/Tuffle_Verbs/verb/Elite_Who
					M.verbs -= /mob/Tuffle_Verbs/verb/Elite_Leave
					M.squad = ""
					M.Rank2 = ""
					M.in_squad = 0
					M.tuffle1 = 0
					M.tuffle2 = 0
				if("No")
					return

mob
	Demon_Leader
		verb
			Give_Demon_Number()
				set category = "Demon Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.race == usr.race)
						if(M.pk)
							Menu.Add(M)
				var/mob/M = input("Invite Who?","Demon Invite") as null | anything in Menu
				if(M.demon == 1)
					usr << "You cant make yourself an elite."
					return
				if(M.in_squad)
					usr << "This person has a number already."
					return
				else
					switch(alert(M,"[usr] is asking you to join the Demon Elites, Accept?","Demon Elites","Yes","No"))
						if("Yes")
							if(M.race == "Demon")
								switch(input("What Elite number?") in list ("1","2"))
									if("1")
										M.demon1 = 1
										M.in_squad = 1
										M.squad = "Demon Elite"
										M.Rank2 = "Demon Elite #1"
										M.verbs += typesof(/mob/Demon_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 1!"
									if("2")
										M.demon2 = 1
										M.in_squad = 1
										M.squad = "Demon Elite"
										M.Rank2 = "Demon Elite #2"
										M.verbs += typesof(/mob/Demon_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 2!"
						if("No")
							usr << "[M] has declined your offer."
							return
			Demon_Elite_Boot()
				set category = "Demon Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.name != usr.name)
						if(M.squad == usr.squad)
							Menu.Add(M)
				var/mob/M = input("Who do you want to boot from the Demon Elite?","[usr.squad]") as null | anything in Menu
				if(!M)return
				if(istype(M,/mob))
					if(M.demon)
						alert("You cannot boot the Demon Leader!")
						return
					else
						switch(alert("Are you sure that you want to boot [M] from the [usr.squad]?","","Yes","No"))
							if("Yes")
								world << "<b><font color = red>Elite Info: [usr] has booted [M] from the [usr.squad]!"
								M.verbs -= typesof(/mob/Demon_Verbs/verb)
								M.squad = ""
								M.Rank2 = ""
								M.in_squad = 0
								M.demon1 = 0
								M.demon2 = 0
							if("No")
								return
			Demon_Elite_Announce(T as text)
				set category = "Demon Elite"
				var/list/L
				L = list("font size")
				if(lentext(T) > 400)
					alert("Your message must be less than 400 characters!")
					return
				for(var/X in L)
					if(findtext(T,X))
						alert("You can not change your font size.")
						return
				for(var/mob/X in world)
					if(X.squad == usr.squad)
					 X << "<font size=1><font color = red><b><center>[usr.Rank2] [usr] would like to announce to the Demon Elites:<center><br>[T]"

mob/Demon_Verbs
	verb
		Elite_Say(T as text)
			set category = "Demon Elite"
			var/list/L
			L = list("font size")
			if(lentext(T) > 300)
				alert("Your message must be less than 300 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/X in world)
				if(X.squad == usr.squad)
					X << "<b><font color = red>(Elite Say)([src.Rank2])[src.name]:[T]"
		Elite_Who()
			set category = "Demon Elite"
			var/tmp/C = 0
			usr << "<font size=1><b><font color=red><center>-Online Members-"
			for(var/mob/M in world)
				if(M.squad == usr.squad)
					C += 1
					usr << "<font size=1><b><font color=red>[M.Rank2] [M.name]"
			usr << "<b><font color = red>[C] Members Online!"
		Elite_Leave()
			set category = "Demon Elite"
			if(usr.demon)
				usr << "Demon Leader can't use this verb."
				return
			switch(alert("Are you sure that you want to leave the [usr.squad]?","","Yes","No"))
				if("Yes")
					world << "<b><font color = red>Elite Info: [usr] has left from the [usr.squad]!"
					var/mob/M = usr
					M.verbs -= /mob/Demon_Verbs/verb/Elite_Say
					M.verbs -= /mob/Demon_Verbs/verb/Elite_Who
					M.verbs -= /mob/Demon_Verbs/verb/Elite_Leave
					M.squad = ""
					M.Rank2 = ""
					M.in_squad = 0
					M.demon1 = 0
					M.demon2 = 0
				if("No")
					return

mob
	Android_Leader
		verb
			Give_Android_Number()
				set category = "Android Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.race == usr.race)
						if(M.pk)
							Menu.Add(M)
				var/mob/M = input("Invite Who?","Android Invite") as null | anything in Menu
				if(M.android == 1)
					usr << "You cant make yourself an elite."
					return
				if(M.in_squad)
					usr << "This person has a number already."
					return
				else
					switch(alert(M,"[usr] is asking you to join the Android Elites, Accept?","Android Elites","Yes","No"))
						if("Yes")
							if(M.race == "Android")
								switch(input("What Elite number?") in list ("1","2"))
									if("1")
										M.android1 = 1
										M.in_squad = 1
										M.squad = "Android Elite"
										M.Rank2 = "Android Elite #1"
										M.verbs += typesof(/mob/Android_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 1!"
									if("2")
										M.android2 = 1
										M.in_squad = 1
										M.squad = "Android Elite"
										M.Rank2 = "Android Elite #2"
										M.verbs += typesof(/mob/Android_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 2!"
						if("No")
							usr << "[M] has declined your offer."
							return
			Android_Elite_Boot()
				set category = "Android Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.name != usr.name)
						if(M.squad == usr.squad)
							Menu.Add(M)
				var/mob/M = input("Who do you want to boot from the Android Elite?","[usr.squad]") as null | anything in Menu
				if(!M)return
				if(istype(M,/mob))
					if(M.android)
						alert("You cannot boot the Android Leader!")
						return
					else
						switch(alert("Are you sure that you want to boot [M] from the [usr.squad]?","","Yes","No"))
							if("Yes")
								world << "<b><font color = red>Elite Info: [usr] has booted [M] from the [usr.squad]!"
								M.verbs -= typesof(/mob/Android_Verbs/verb)
								M.squad = ""
								M.Rank2 = ""
								M.in_squad = 0
								M.android1 = 0
								M.android2 = 0
							if("No")
								return
			Android_Elite_Announce(T as text)
				set category = "Android Elite"
				var/list/L
				L = list("font size")
				if(lentext(T) > 400)
					alert("Your message must be less than 400 characters!")
					return
				for(var/X in L)
					if(findtext(T,X))
						alert("You can not change your font size.")
						return
				for(var/mob/X in world)
					if(X.squad == usr.squad)
					 X << "<font size=1><font color = red><b><center>[usr.Rank2] [usr] would like to announce to the Android Elites:<center><br>[T]"

mob/Android_Verbs
	verb
		Elite_Say(T as text)
			set category = "Android Elite"
			var/list/L
			L = list("font size")
			if(lentext(T) > 300)
				alert("Your message must be less than 300 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/X in world)
				if(X.squad == usr.squad)
					X << "<b><font color = red>(Elite Say)([src.Rank2])[src.name]:[T]"
		Elite_Who()
			set category = "Android Elite"
			var/tmp/C = 0
			usr << "<font size=1><b><font color=red><center>-Online Members-"
			for(var/mob/M in world)
				if(M.squad == usr.squad)
					C += 1
					usr << "<font size=1><b><font color=red>[M.Rank2] [M.name]"
			usr << "<b><font color = red>[C] Members Online!"
		Elite_Leave()
			set category = "Android Elite"
			if(usr.android)
				usr << "Android Leader can't use this verb."
				return
			switch(alert("Are you sure that you want to leave the [usr.squad]?","","Yes","No"))
				if("Yes")
					world << "<b><font color = red>Elite Info: [usr] has left from the [usr.squad]!"
					var/mob/M = usr
					M.verbs -= /mob/Android_Verbs/verb/Elite_Say
					M.verbs -= /mob/Android_Verbs/verb/Elite_Who
					M.verbs -= /mob/Android_Verbs/verb/Elite_Leave
					M.squad = ""
					M.Rank2 = ""
					M.in_squad = 0
					M.android1 = 0
					M.android2 = 0
				if("No")
					return

mob
	Bojack_Leader
		verb
			Give_Bojack_Number()
				set category = "Bojack Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.race == usr.race)
						if(M.pk)
							Menu.Add(M)
				var/mob/M = input("Invite Who?","Bojack Invite") as null | anything in Menu
				if(M.bojack == 1)
					usr << "You cant make yourself an elite."
					return
				if(M.in_squad)
					usr << "This person has a number already."
					return
				else
					switch(alert(M,"[usr] is asking you to join the Bojack Elites, Accept?","Bojack Elites","Yes","No"))
						if("Yes")
							if(M.race == "Bojack")
								switch(input("What Elite number?") in list ("1","2"))
									if("1")
										M.bojack1 = 1
										M.in_squad = 1
										M.squad = "Bojack Elite"
										M.Rank2 = "Bojack Elite #1"
										M.verbs += typesof(/mob/Bojack_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 1!"
									if("2")
										M.bojack2 = 1
										M.in_squad = 1
										M.squad = "Bojack Elite"
										M.Rank2 = "Bojack Elite #2"
										M.verbs += typesof(/mob/Bojack_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 2!"
						if("No")
							usr << "[M] has declined your offer."
							return
			Bojack_Elite_Boot()
				set category = "Bojack Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.name != usr.name)
						if(M.squad == usr.squad)
							Menu.Add(M)
				var/mob/M = input("Who do you want to boot from the Bojack Elite?","[usr.squad]") as null | anything in Menu
				if(!M)return
				if(istype(M,/mob))
					if(M.bojack)
						alert("You cannot boot the Bojack Leader!")
						return
					else
						switch(alert("Are you sure that you want to boot [M] from the [usr.squad]?","","Yes","No"))
							if("Yes")
								world << "<b><font color = red>Elite Info: [usr] has booted [M] from the [usr.squad]!"
								M.verbs -= typesof(/mob/Bojack_Verbs/verb)
								M.squad = ""
								M.Rank2 = ""
								M.in_squad = 0
								M.bojack1 = 0
								M.bojack2 = 0
							if("No")
								return
			Bojack_Elite_Announce(T as text)
				set category = "Bojack Elite"
				var/list/L
				L = list("font size")
				if(lentext(T) > 400)
					alert("Your message must be less than 400 characters!")
					return
				for(var/X in L)
					if(findtext(T,X))
						alert("You can not change your font size.")
						return
				for(var/mob/X in world)
					if(X.squad == usr.squad)
					 X << "<font size=1><font color = red><b><center>[usr.Rank2] [usr] would like to announce to the Bojack Elites:<center><br>[T]"

mob/Bojack_Verbs
	verb
		Elite_Say(T as text)
			set category = "Bojack Elite"
			var/list/L
			L = list("font size")
			if(lentext(T) > 300)
				alert("Your message must be less than 300 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/X in world)
				if(X.squad == usr.squad)
					X << "<b><font color = red>(Elite Say)([src.Rank2])[src.name]:[T]"
		Elite_Who()
			set category = "Bojack Elite"
			var/tmp/C = 0
			usr << "<font size=1><b><font color=red><center>-Online Members-"
			for(var/mob/M in world)
				if(M.squad == usr.squad)
					C += 1
					usr << "<font size=1><b><font color=red>[M.Rank2] [M.name]"
			usr << "<b><font color = red>[C] Members Online!"
		Elite_Leave()
			set category = "Bojack Elite"
			if(usr.bojack)
				usr << "Bojack Leader can't use this verb."
				return
			switch(alert("Are you sure that you want to leave the [usr.squad]?","","Yes","No"))
				if("Yes")
					world << "<b><font color = red>Elite Info: [usr] has left from the [usr.squad]!"
					var/mob/M = usr
					M.verbs -= /mob/Bojack_Verbs/verb/Elite_Say
					M.verbs -= /mob/Bojack_Verbs/verb/Elite_Who
					M.verbs -= /mob/Bojack_Verbs/verb/Elite_Leave
					M.squad = ""
					M.Rank2 = ""
					M.in_squad = 0
					M.bojack1 = 0
					M.bojack2 = 0
				if("No")
					return

mob
	Dragon_Leader
		verb
			Give_Dragon_Number()
				set category = "Dragon Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.race == usr.race)
						if(M.pk)
							Menu.Add(M)
				var/mob/M = input("Invite Who?","Dragon Invite") as null | anything in Menu
				if(M.dragon == 1)
					usr << "You cant make yourself an elite."
					return
				if(M.in_squad)
					usr << "This person has a number already."
					return
				else
					switch(alert(M,"[usr] is asking you to join the Dragon Elites, Accept?","Dragon Elites","Yes","No"))
						if("Yes")
							if(M.race == "Dragon")
								switch(input("What Elite number?") in list ("1","2"))
									if("1")
										M.dragon1 = 1
										M.in_squad = 1
										M.squad = "Dragon Elite"
										M.Rank2 = "Dragon Elite #1"
										M.verbs += typesof(/mob/Dragon_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 1!"
									if("2")
										M.dragon2 = 1
										M.in_squad = 1
										M.squad = "Dragon Elite"
										M.Rank2 = "Dragon Elite #2"
										M.verbs += typesof(/mob/Dragon_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 2!"
						if("No")
							usr << "[M] has declined your offer."
							return
			Dragon_Elite_Boot()
				set category = "Dragon Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.name != usr.name)
						if(M.squad == usr.squad)
							Menu.Add(M)
				var/mob/M = input("Who do you want to boot from the Dragon Elite?","[usr.squad]") as null | anything in Menu
				if(!M)return
				if(istype(M,/mob))
					if(M.dragon)
						alert("You cannot boot the Dragon Leader!")
						return
					else
						switch(alert("Are you sure that you want to boot [M] from the [usr.squad]?","","Yes","No"))
							if("Yes")
								world << "<b><font color = red>Elite Info: [usr] has booted [M] from the [usr.squad]!"
								M.verbs -= typesof(/mob/Dragon_Verbs/verb)
								M.squad = ""
								M.Rank2 = ""
								M.in_squad = 0
								M.dragon1 = 0
								M.dragon2 = 0
							if("No")
								return
			Dragon_Elite_Announce(T as text)
				set category = "Dragon Elite"
				var/list/L
				L = list("font size")
				if(lentext(T) > 400)
					alert("Your message must be less than 400 characters!")
					return
				for(var/X in L)
					if(findtext(T,X))
						alert("You can not change your font size.")
						return
				for(var/mob/X in world)
					if(X.squad == usr.squad)
					 X << "<font size=1><font color = red><b><center>[usr.Rank2] [usr] would like to announce to the Dragon Elites:<center><br>[T]"

mob/Dragon_Verbs
	verb
		Elite_Say(T as text)
			set category = "Dragon Elite"
			var/list/L
			L = list("font size")
			if(lentext(T) > 300)
				alert("Your message must be less than 300 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/X in world)
				if(X.squad == usr.squad)
					X << "<b><font color = red>(Elite Say)([src.Rank2])[src.name]:[T]"
		Elite_Who()
			set category = "Dragon Elite"
			var/tmp/C = 0
			usr << "<font size=1><b><font color=red><center>-Online Members-"
			for(var/mob/M in world)
				if(M.squad == usr.squad)
					C += 1
					usr << "<font size=1><b><font color=red>[M.Rank2] [M.name]"
			usr << "<b><font color = red>[C] Members Online!"
		Elite_Leave()
			set category = "Dragon Elite"
			if(usr.dragon)
				usr << "Dragon Leader can't use this verb."
				return
			switch(alert("Are you sure that you want to leave the [usr.squad]?","","Yes","No"))
				if("Yes")
					world << "<b><font color = red>Elite Info: [usr] has left from the [usr.squad]!"
					var/mob/M = usr
					M.verbs -= /mob/Dragon_Verbs/verb/Elite_Say
					M.verbs -= /mob/Dragon_Verbs/verb/Elite_Who
					M.verbs -= /mob/Dragon_Verbs/verb/Elite_Leave
					M.squad = ""
					M.Rank2 = ""
					M.in_squad = 0
					M.dragon1 = 0
					M.dragon2 = 0
				if("No")
					return

mob
	Kai_Leader
		verb
			Give_Kai_Number()
				set category = "Kai Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.race == usr.race)
						if(M.pk)
							Menu.Add(M)
				var/mob/M = input("Invite Who?","Kai Invite") as null | anything in Menu
				if(M.kai == 1)
					usr << "You cant make yourself an elite."
					return
				if(M.in_squad)
					usr << "This person has a number already."
					return
				else
					switch(alert(M,"[usr] is asking you to join the Kai Elites, Accept?","Kai Elites","Yes","No"))
						if("Yes")
							if(M.race == "Kai")
								switch(input("What Elite number?") in list ("1","2"))
									if("1")
										M.kai1 = 1
										M.in_squad = 1
										M.squad = "Kai Elite"
										M.Rank2 = "Kai Elite #1"
										M.verbs += typesof(/mob/Kai_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 1!"
									if("2")
										M.kai2 = 1
										M.in_squad = 1
										M.squad = "Kai Elite"
										M.Rank2 = "Kai Elite #2"
										M.verbs += typesof(/mob/Kai_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 2!"
						if("No")
							usr << "[M] has declined your offer."
							return
			Kai_Elite_Boot()
				set category = "Kai Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.name != usr.name)
						if(M.squad == usr.squad)
							Menu.Add(M)
				var/mob/M = input("Who do you want to boot from the Kai Elite?","[usr.squad]") as null | anything in Menu
				if(!M)return
				if(istype(M,/mob))
					if(M.kai)
						alert("You cannot boot the Kai Leader!")
						return
					else
						switch(alert("Are you sure that you want to boot [M] from the [usr.squad]?","","Yes","No"))
							if("Yes")
								world << "<b><font color = red>Elite Info: [usr] has booted [M] from the [usr.squad]!"
								M.verbs -= typesof(/mob/Kai_Verbs/verb)
								M.squad = ""
								M.Rank2 = ""
								M.in_squad = 0
								M.kai1 = 0
								M.kai2 = 0
							if("No")
								return
			Kai_Elite_Announce(T as text)
				set category = "Kai Elite"
				var/list/L
				L = list("font size")
				if(lentext(T) > 400)
					alert("Your message must be less than 400 characters!")
					return
				for(var/X in L)
					if(findtext(T,X))
						alert("You can not change your font size.")
						return
				for(var/mob/X in world)
					if(X.squad == usr.squad)
					 X << "<font size=1><font color = red><b><center>[usr.Rank2] [usr] would like to announce to the Kai Elites:<center><br>[T]"

mob/Kai_Verbs
	verb
		Elite_Say(T as text)
			set category = "Kai Elite"
			var/list/L
			L = list("font size")
			if(lentext(T) > 300)
				alert("Your message must be less than 300 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/X in world)
				if(X.squad == usr.squad)
					X << "<b><font color = red>(Elite Say)([src.Rank2])[src.name]:[T]"
		Elite_Who()
			set category = "Kai Elite"
			var/tmp/C = 0
			usr << "<font size=1><b><font color=red><center>-Online Members-"
			for(var/mob/M in world)
				if(M.squad == usr.squad)
					C += 1
					usr << "<font size=1><b><font color=red>[M.Rank2] [M.name]"
			usr << "<b><font color = red>[C] Members Online!"
		Elite_Leave()
			set category = "Kai Elite"
			if(usr.kai)
				usr << "Kai Leader can't use this verb."
				return
			switch(alert("Are you sure that you want to leave the [usr.squad]?","","Yes","No"))
				if("Yes")
					world << "<b><font color = red>Elite Info: [usr] has left from the [usr.squad]!"
					var/mob/M = usr
					M.verbs -= /mob/Kai_Verbs/verb/Elite_Say
					M.verbs -= /mob/Kai_Verbs/verb/Elite_Who
					M.verbs -= /mob/Kai_Verbs/verb/Elite_Leave
					M.squad = ""
					M.Rank2 = ""
					M.in_squad = 0
					M.kai1 = 0
					M.kai2 = 0
				if("No")
					return

mob
	Saibaman_Leader
		verb
			Give_Saibaman_Number()
				set category = "Saibaman Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.race == usr.race)
						if(M.pk)
							Menu.Add(M)
				var/mob/M = input("Invite Who?","Saibaman Invite") as null | anything in Menu
				if(M.saibaman == 1)
					usr << "You cant make yourself an elite."
					return
				if(M.in_squad)
					usr << "This person has a number already."
					return
				else
					switch(alert(M,"[usr] is asking you to join the Saibaman Elites, Accept?","Saibaman Elites","Yes","No"))
						if("Yes")
							if(M.race == "Saibaman")
								switch(input("What Elite number?") in list ("1","2"))
									if("1")
										M.saibaman1 = 1
										M.in_squad = 1
										M.squad = "Saibaman Elite"
										M.Rank2 = "Saibaman Elite #1"
										M.verbs += typesof(/mob/Saibaman_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 1!"
									if("2")
										M.saibaman2 = 1
										M.in_squad = 1
										M.squad = "Saibaman Elite"
										M.Rank2 = "Saibaman Elite #2"
										M.verbs += typesof(/mob/Saibaman_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 2!"
						if("No")
							usr << "[M] has declined your offer."
							return
			Saibaman_Elite_Boot()
				set category = "Saibaman Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.name != usr.name)
						if(M.squad == usr.squad)
							Menu.Add(M)
				var/mob/M = input("Who do you want to boot from the Saibaman Elite?","[usr.squad]") as null | anything in Menu
				if(!M)return
				if(istype(M,/mob))
					if(M.saibaman)
						alert("You cannot boot the Saibaman Leader!")
						return
					else
						switch(alert("Are you sure that you want to boot [M] from the [usr.squad]?","","Yes","No"))
							if("Yes")
								world << "<b><font color = red>Elite Info: [usr] has booted [M] from the [usr.squad]!"
								M.verbs -= typesof(/mob/Saibaman_Verbs/verb)
								M.squad = ""
								M.Rank2 = ""
								M.in_squad = 0
								M.saibaman1 = 0
								M.saibaman2 = 0
							if("No")
								return
			Saibaman_Elite_Announce(T as text)
				set category = "Saibaman Elite"
				var/list/L
				L = list("font size")
				if(lentext(T) > 400)
					alert("Your message must be less than 400 characters!")
					return
				for(var/X in L)
					if(findtext(T,X))
						alert("You can not change your font size.")
						return
				for(var/mob/X in world)
					if(X.squad == usr.squad)
					 X << "<font size=1><font color = red><b><center>[usr.Rank2] [usr] would like to announce to the Saibaman Elites:<center><br>[T]"

mob/Saibaman_Verbs
	verb
		Elite_Say(T as text)
			set category = "Saibaman Elite"
			var/list/L
			L = list("font size")
			if(lentext(T) > 300)
				alert("Your message must be less than 300 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/X in world)
				if(X.squad == usr.squad)
					X << "<b><font color = red>(Elite Say)([src.Rank2])[src.name]:[T]"
		Elite_Who()
			set category = "Saibaman Elite"
			var/tmp/C = 0
			usr << "<font size=1><b><font color=red><center>-Online Members-"
			for(var/mob/M in world)
				if(M.squad == usr.squad)
					C += 1
					usr << "<font size=1><b><font color=red>[M.Rank2] [M.name]"
			usr << "<b><font color = red>[C] Members Online!"
		Elite_Leave()
			set category = "Saibaman Elite"
			if(usr.saibaman)
				usr << "Saibaman Leader can't use this verb."
				return
			switch(alert("Are you sure that you want to leave the [usr.squad]?","","Yes","No"))
				if("Yes")
					world << "<b><font color = red>Elite Info: [usr] has left from the [usr.squad]!"
					var/mob/M = usr
					M.verbs -= /mob/Saibaman_Verbs/verb/Elite_Say
					M.verbs -= /mob/Saibaman_Verbs/verb/Elite_Who
					M.verbs -= /mob/Saibaman_Verbs/verb/Elite_Leave
					M.squad = ""
					M.Rank2 = ""
					M.in_squad = 0
					M.saibaman1 = 0
					M.saibaman2 = 0
				if("No")
					return


mob
	Hybrid_Leader
		verb
			Give_Hybrid_Number()
				set category = "Hybrid Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.race == usr.race)
						if(M.pk)
							Menu.Add(M)
				var/mob/M = input("Invite Who?","Hybrid Invite") as null | anything in Menu
				if(M.hybrid == 1)
					usr << "You cant make yourself an elite."
					return
				if(M.in_squad)
					usr << "This person has a number already."
					return
				else
					switch(alert(M,"[usr] is asking you to join the Saibaman Elites, Accept?","Saibaman Elites","Yes","No"))
						if("Yes")
							if(M.race == "Hybrid")
								switch(input("What Elite number?") in list ("1","2"))
									if("1")
										M.hybrid1 = 1
										M.in_squad = 1
										M.squad = "Saibaman Elite"
										M.Rank2 = "Saibaman Elite #1"
										M.verbs += typesof(/mob/Hybrid_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 1!"
									if("2")
										M.hybrid2 = 1
										M.in_squad = 1
										M.squad = "Saibaman Elite"
										M.Rank2 = "Saibaman Elite #2"
										M.verbs += typesof(/mob/Hybrid_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 2!"
						if("No")
							usr << "[M] has declined your offer."
							return
			Hybrid_Elite_Boot()
				set category = "Hybrid Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.name != usr.name)
						if(M.squad == usr.squad)
							Menu.Add(M)
				var/mob/M = input("Who do you want to boot from the Saibaman Elite?","[usr.squad]") as null | anything in Menu
				if(!M)return
				if(istype(M,/mob))
					if(M.hybrid)
						alert("You cannot boot the Hybrid Leader!")
						return
					else
						switch(alert("Are you sure that you want to boot [M] from the [usr.squad]?","","Yes","No"))
							if("Yes")
								world << "<b><font color = red>Elite Info: [usr] has booted [M] from the [usr.squad]!"
								M.verbs -= typesof(/mob/Hybrid_Verbs/verb)
								M.squad = ""
								M.Rank2 = ""
								M.in_squad = 0
								M.hybrid1 = 0
								M.hybrid2 = 0
							if("No")
								return
			Hybrid_Elite_Announce(T as text)
				set category = "Hybrid Elite"
				var/list/L
				L = list("font size")
				if(lentext(T) > 400)
					alert("Your message must be less than 400 characters!")
					return
				for(var/X in L)
					if(findtext(T,X))
						alert("You can not change your font size.")
						return
				for(var/mob/X in world)
					if(X.squad == usr.squad)
					 X << "<font size=1><font color = red><b><center>[usr.Rank2] [usr] would like to announce to the Hybrid Elites:<center><br>[T]"

mob/Hybrid_Verbs
	verb
		Elite_Say(T as text)
			set category = "Hybrid Elite"
			var/list/L
			L = list("font size")
			if(lentext(T) > 300)
				alert("Your message must be less than 300 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/X in world)
				if(X.squad == usr.squad)
					X << "<b><font color = red>(Elite Say)([src.Rank2])[src.name]:[T]"
		Elite_Who()
			set category = "Hybrid Elite"
			var/tmp/C = 0
			usr << "<font size=1><b><font color=red><center>-Online Members-"
			for(var/mob/M in world)
				if(M.squad == usr.squad)
					C += 1
					usr << "<font size=1><b><font color=red>[M.Rank2] [M.name]"
			usr << "<b><font color = red>[C] Members Online!"
		Elite_Leave()
			set category = "Hybrid Elite"
			if(usr.hybrid)
				usr << "Hybrid Leader can't use this verb."
				return
			switch(alert("Are you sure that you want to leave the [usr.squad]?","","Yes","No"))
				if("Yes")
					world << "<b><font color = red>Elite Info: [usr] has left from the [usr.squad]!"
					var/mob/M = usr
					M.verbs -= /mob/Hybrid_Verbs/verb/Elite_Say
					M.verbs -= /mob/Hybrid_Verbs/verb/Elite_Who
					M.verbs -= /mob/Hybrid_Verbs/verb/Elite_Leave
					M.squad = ""
					M.Rank2 = ""
					M.in_squad = 0
					M.hybrid1 = 0
					M.hybrid2 = 0
				if("No")
					return

mob
	Konat_Leader
		verb
			Give_Konat_Number()
				set category = "Konat Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.race == usr.race)
						if(M.pk)
							Menu.Add(M)
				var/mob/M = input("Invite Who?","Konat Invite") as null | anything in Menu
				if(M.konat == 1)
					usr << "You cant make yourself an elite."
					return
				if(M.in_squad)
					usr << "This person has a number already."
					return
				else
					switch(alert(M,"[usr] is asking you to join the Konat Elites, Accept?","Konat Elites","Yes","No"))
						if("Yes")
							if(M.race == "Konat")
								switch(input("What Elite number?") in list ("1","2"))
									if("1")
										M.konat1 = 1
										M.in_squad = 1
										M.squad = "Konat Elite"
										M.Rank2 = "Konat Elite #1"
										M.verbs += typesof(/mob/Konat_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 1!"
									if("2")
										M.konat2 = 1
										M.in_squad = 1
										M.squad = "Konat Elite"
										M.Rank2 = "Konat Elite #2"
										M.verbs += typesof(/mob/Konat_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 2!"
						if("No")
							usr << "[M] has declined your offer."
							return
			Konat_Elite_Boot()
				set category = "Konat Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.name != usr.name)
						if(M.squad == usr.squad)
							Menu.Add(M)
				var/mob/M = input("Who do you want to boot from the Konat Elite?","[usr.squad]") as null | anything in Menu
				if(!M)return
				if(istype(M,/mob))
					if(M.konat)
						alert("You cannot boot the Konat Leader!")
						return
					else
						switch(alert("Are you sure that you want to boot [M] from the [usr.squad]?","","Yes","No"))
							if("Yes")
								world << "<b><font color = red>Elite Info: [usr] has booted [M] from the [usr.squad]!"
								M.verbs -= typesof(/mob/Konat_Verbs/verb)
								M.squad = ""
								M.Rank2 = ""
								M.in_squad = 0
								M.konat1 = 0
								M.konat2 = 0
							if("No")
								return
			Konat_Elite_Announce(T as text)
				set category = "Konat Elite"
				var/list/L
				L = list("font size")
				if(lentext(T) > 400)
					alert("Your message must be less than 400 characters!")
					return
				for(var/X in L)
					if(findtext(T,X))
						alert("You can not change your font size.")
						return
				for(var/mob/X in world)
					if(X.squad == usr.squad)
					 X << "<font size=1><font color = red><b><center>[usr.Rank2] [usr] would like to announce to the Konat Elites:<center><br>[T]"

mob/Konat_Verbs
	verb
		Elite_Say(T as text)
			set category = "Konat Elite"
			var/list/L
			L = list("font size")
			if(lentext(T) > 300)
				alert("Your message must be less than 300 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/X in world)
				if(X.squad == usr.squad)
					X << "<b><font color = red>(Elite Say)([src.Rank2])[src.name]:[T]"
		Elite_Who()
			set category = "Konat Elite"
			var/tmp/C = 0
			usr << "<font size=1><b><font color=red><center>-Online Members-"
			for(var/mob/M in world)
				if(M.squad == usr.squad)
					C += 1
					usr << "<font size=1><b><font color=red>[M.Rank2] [M.name]"
			usr << "<b><font color = red>[C] Members Online!"
		Elite_Leave()
			set category = "Konat Elite"
			if(usr.konat)
				usr << "Konat Leader can't use this verb."
				return
			switch(alert("Are you sure that you want to leave the [usr.squad]?","","Yes","No"))
				if("Yes")
					world << "<b><font color = red>Elite Info: [usr] has left from the [usr.squad]!"
					var/mob/M = usr
					M.verbs -= /mob/Konat_Verbs/verb/Elite_Say
					M.verbs -= /mob/Konat_Verbs/verb/Elite_Who
					M.verbs -= /mob/Konat_Verbs/verb/Elite_Leave
					M.squad = ""
					M.Rank2 = ""
					M.in_squad = 0
					M.konat1 = 0
					M.konat2 = 0
				if("No")
					return

mob
	Makyo_Leader
		verb
			Give_Makyo_Number()
				set category = "Makyo Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.race == usr.race)
						if(M.pk)
							Menu.Add(M)
				var/mob/M = input("Invite Who?","Makyo Invite") as null | anything in Menu
				if(M.makyo == 1)
					usr << "You cant make yourself an elite."
					return
				if(M.in_squad)
					usr << "This person has a number already."
					return
				else
					switch(alert(M,"[usr] is asking you to join the Makyo Elites, Accept?","Konat Elites","Yes","No"))
						if("Yes")
							if(M.race == "Konat")
								switch(input("What Elite number?") in list ("1","2"))
									if("1")
										M.makyo1 = 1
										M.in_squad = 1
										M.squad = "Makyo Elite"
										M.Rank2 = "Makyo Elite #1"
										M.verbs += typesof(/mob/Makyo_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 1!"
									if("2")
										M.makyo2 = 1
										M.in_squad = 1
										M.squad = "Makyo Elite"
										M.Rank2 = "Makyo Elite #2"
										M.verbs += typesof(/mob/Makyo_Verbs/verb)
										world << "<b><font color = red>Elite Info: [M] is now the [M.race] Elite No. 2!"
						if("No")
							usr << "[M] has declined your offer."
							return
			Makyo_Elite_Boot()
				set category = "Konat Elite"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.name != usr.name)
						if(M.squad == usr.squad)
							Menu.Add(M)
				var/mob/M = input("Who do you want to boot from the Konat Elite?","[usr.squad]") as null | anything in Menu
				if(!M)return
				if(istype(M,/mob))
					if(M.makyo)
						alert("You cannot boot the Konat Leader!")
						return
					else
						switch(alert("Are you sure that you want to boot [M] from the [usr.squad]?","","Yes","No"))
							if("Yes")
								world << "<b><font color = red>Elite Info: [usr] has booted [M] from the [usr.squad]!"
								M.verbs -= typesof(/mob/Makyo_Verbs/verb)
								M.squad = ""
								M.Rank2 = ""
								M.in_squad = 0
								M.makyo1 = 0
								M.makyo2 = 0
							if("No")
								return
			Makyo_Elite_Announce(T as text)
				set category = "Makyo Elite"
				var/list/L
				L = list("font size")
				if(lentext(T) > 400)
					alert("Your message must be less than 400 characters!")
					return
				for(var/X in L)
					if(findtext(T,X))
						alert("You can not change your font size.")
						return
				for(var/mob/X in world)
					if(X.squad == usr.squad)
					 X << "<font size=1><font color = red><b><center>[usr.Rank2] [usr] would like to announce to the Makyo Elites:<center><br>[T]"

mob/Makyo_Verbs
	verb
		Elite_Say(T as text)
			set category = "Makyo Elite"
			var/list/L
			L = list("font size")
			if(lentext(T) > 300)
				alert("Your message must be less than 300 characters!")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert("You can not change your font size.")
					return
			for(var/mob/X in world)
				if(X.squad == usr.squad)
					X << "<b><font color = red>(Elite Say)([src.Rank2])[src.name]:[T]"
		Elite_Who()
			set category = "Makyo Elite"
			var/tmp/C = 0
			usr << "<font size=1><b><font color=red><center>-Online Members-"
			for(var/mob/M in world)
				if(M.squad == usr.squad)
					C += 1
					usr << "<font size=1><b><font color=red>[M.Rank2] [M.name]"
			usr << "<b><font color = red>[C] Members Online!"
		Elite_Leave()
			set category = "Makyo Elite"
			if(usr.makyo)
				usr << "Makyo Leader can't use this verb."
				return
			switch(alert("Are you sure that you want to leave the [usr.squad]?","","Yes","No"))
				if("Yes")
					world << "<b><font color = red>Elite Info: [usr] has left from the [usr.squad]!"
					var/mob/M = usr
					M.verbs -= /mob/Makyo_Verbs/verb/Elite_Say
					M.verbs -= /mob/Makyo_Verbs/verb/Elite_Who
					M.verbs -= /mob/Makyo_Verbs/verb/Elite_Leave
					M.squad = ""
					M.Rank2 = ""
					M.in_squad = 0
					M.makyo1 = 0
					M.makyo2 = 0
				if("No")
					return

