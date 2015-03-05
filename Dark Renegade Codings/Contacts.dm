 //actual contact detection proc is in auto healing.
/*
*ROLES*
-Master (x1)
-------------------------------------
-Best Friend (x1)
-Friend (infinite)
-------------------------------------
-Rival (x1, x2?)
-Sparring Partner (x3 at most)
-------------------------------------
-Worst Enemy (x1)
-Enemy (infinite)
-------------------------------------
-Mom (x1)
-Dad (x1)
-------------------------------------
-Brother (x2 at most)
-Sister (x2 at most)
-------------------------------------
-Grampa (x1)
-Grandma (x1)
-------------------------------------
*/
obj/var
		relationship="None"
		familiarity=0
		contactkey="None"
		alterable=1

obj/contacts
	Contact_Name
		suffix="Relationship (Familiarity)"
		//icon='Contact.dmi'
		relationship="Relationship"
		familiarity="Familiarity"
		alterable=0
	verb
		Set_Relation()
			set category="Misc."
			var/confirm=0
			if(alterable==1)
				switch(input("What relationship do you want [src] to have to you?", "Dragonball Finale", text) in list ("None", "Master", "Student", "Best Friend","Friend","Rival","Sparring Partner","Enemy","Worst Enemy","Mom","Dad","Brother","Sister","Grandma","Grandpa",))
					if("None")
						if(familiarity>=0)
							relationship="None"
							suffix="[relationship] ([round(familiarity)])"
						else
							usr << "<b><font size=1>Not enough familiarity"
					if("Student")
						if(familiarity>=10)
							relationship="Student"
							suffix="[relationship] ([round(familiarity)])"
						else
							usr << "<b><font size=1>Not enough familiarity"
					if("Master")
						if(familiarity>=20)
							for(var/obj/contacts/C in usr.contents)
								if(C.relationship=="Master")
									usr << "<b><font size=1>You already have a master"
									confirm=1
							if(confirm==0)
								relationship="Master"
								suffix="[relationship] ([round(familiarity)])"
						else
							usr << "<b><font size=1>Not enough familiarity"
					if("Best Friend")
						if(familiarity>=50)
							for(var/obj/contacts/C in usr.contents)
								if(C.relationship=="Best Friend")
									usr << "<b><font size=1>You already have a best friend"
									confirm=1
							if(confirm==0)
								relationship="Best Friend"
								suffix="[relationship] ([round(familiarity)])"
						else
							usr << "<b><font size=1>Not enough familiarity"
					if("Friend")
						if(familiarity>=20)
							relationship="Friend"
							suffix="[relationship] ([round(familiarity)])"
						else
							usr << "<b><font size=1>Not enough familiarity"
					if("Rival")
						if(familiarity>=20)
							for(var/obj/contacts/C in usr.contents)
								if(C.relationship=="Rival")
									usr << "<b><font size=1>You already have a rival"
									confirm=1
							if(confirm==0)
								relationship="Rival"
								suffix="[relationship] ([round(familiarity)])"
						else
							usr << "<b><font size=1>Not enough familiarity"
					if("Sparring Partner")
						if(familiarity>=50)
							relationship="Sparring Partner"
							suffix="[relationship] ([round(familiarity)])"
						else
							usr << "<b><font size=1>Not enough familiarity"
					if("Enemy")
						if(familiarity>=0)
							relationship="Enemy"
							suffix="[relationship] ([round(familiarity)])"
						else
							usr << "<b><font size=1>Not enough familiarity"
					if("Worst Enemy")
						if(familiarity>=0)
							for(var/obj/contacts/C in usr.contents)
								if(C.relationship=="Worst Enemy")
									usr << "<b><font size=1>You already have a worst enemy"
									confirm=1
							if(confirm==0)
								relationship="Worst Enemy"
								suffix="[relationship] ([round(familiarity)])"
						else
							usr << "<b><font size=1>Not enough familiarity"
					if("Mother")
						if(familiarity>=50)
							for(var/obj/contacts/C in usr.contents)
								if(C.relationship=="Mother")
									usr << "<b><font size=1>You already have a mom"
									confirm=1
							if(confirm==0)
								relationship="Mother"
								suffix="[relationship] ([round(familiarity)])"
						else
							usr << "<b><font size=1>Not enough familiarity"
					if("Father")
						if(familiarity>=50)
							for(var/obj/contacts/C in usr.contents)
								if(C.relationship=="Father")
									usr << "<b><font size=1>You already have a dad"
									confirm=1
							if(confirm==0)
								relationship="Father"
								suffix="[relationship] ([round(familiarity)])"
						else
							usr << "<b><font size=1>Not enough familiarity"
					if("Brother")
						if(familiarity>=50)
							relationship="Brother"
							suffix="[relationship] ([round(familiarity)])"
						else
							usr << "<b><font size=1>Not enough familiarity"
					if("Sister")
						if(familiarity>=50)
							relationship="Sister"
							suffix="[relationship] ([round(familiarity)])"
						else
							usr << "<b><font size=1>Not enough familiarity"
					if("Grandpa")
						if(familiarity>=50)
							for(var/obj/contacts/C in usr.contents)
								if(C.relationship=="Grandpa")
									usr << "<b><font size=1>You already have a grandpa"
									confirm=1
							if(confirm==0)
								relationship="Grandpa"
								suffix="[relationship] ([round(familiarity)])"
						else
							usr << "<b><font size=1>Not enough familiarity"
					if("Grandma")
						if(familiarity>=50)
							for(var/obj/contacts/C in usr.contents)
								if(C.relationship=="Grandma")
									usr << "<b><font size=1>You already have a grandma"
									confirm=1
							if(confirm==0)
								relationship="Grandma"
								suffix="[relationship] ([round(familiarity)])"
						else
							usr << "<b><font size=1>Not enough familiarity"
				confirm=0
		Delete_Contact()
			set category="Misc."
			if(alterable==1)
				usr << "<b><font size=1><font color='#143806'>[usr.name] contact deleted."
				del(src)