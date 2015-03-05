mob/proc
	Class_Selection()
		class
		switch(input("Class Selection", "Class") in list("Defender","Aggressor","Energy Manipulator","Velocitor", "Mystic","Perfect Assassin","Destroyer"))

			if("Defender")
				if(src.race == "Majin" || src.race == "Android")
					alert("Majins and Androids cannot choose the Defender Class")
					goto class
				else
					switch(input("Defenders are the protectors of good! They receive a higher defense skill than all other Classes!") in list("I want to be a Defender","No, I want to be something else"))
						if("I want to be a Defender")
							src.class = "Defender"
							src.defence_bonus += 5000
							src.defence += 5000
							src.defence_max += 5000
						if("No, I want to be something else")
							goto class

			if("Aggressor")
				switch(input("Aggressors gain a Stregth bonus, making them perfect for Melee battles! ") in list("I want to be a Aggressor","No, I want to be something else"))
					if("I want to be a Aggressor")
						src.class = "Aggressor"
						src.strength_bonus += 5000
						src.strength += 5000
						src.strength_max += 5000
					if("No, I want to be something else")
						goto class

			if("Energy Manipulator")
				switch(input("Energy Manipulators focus purely on energy manipulation, and because of this are a force to be reckoned with!") in list("I want to be an Energy Manipulator","No, I want to be something else"))
					if("I want to be an Energy Manipulator")
						src.class = "Energy Manipulator"
						src.ki_bonus += 5000
						src.ki += 5000
						src.ki_max += 5000
					if("No, I want to be something else")
						goto class

			if("Velocitor")
				switch(input("Velocitors are those who beleive speed is the most important attribute, because of this they are hard to hit!") in list("I want to be a Velocitor","No, I want to be something else"))
					if("I want to be a Velocitor")
						src.class = "Velocitor"
						src.power_bonus += 5000
						src.powerlevel += 5000
						src.powerlevel_max += 5000
					if("No, I want to be something else")
						goto class

			if("Mystic")
				switch(input("Mystics focus on all of their attributes evenly and are not particularly good at anything in particular") in list("I want to be a Mystic","No, I want to be something else"))
					if("I want to be a Mystic")
						src.class = "Mystic"
						src.ki_bonus += 1000
						src.ki += 1000
						src.ki_max += 1000
						src.power_bonus += 1000
						src.powerlevel += 1000
						src.powerlevel_max += 1000
						src.strength_bonus += 1000
						src.strength += 1000
						src.strength_max += 1000
						src.defence_bonus += 1000
						src.defence += 1000
						src.defence_max += 1000
					if("No, I want to be something else")
						goto class

			if("Perfect Assassin")
				switch(input("Perfect Assasins are assasin's that use ki and speed to kill who they like!") in list("I want to be a Perfect Assasin","No, I want to be something else"))
					if("I want to be a Perfect Assassin")
						src.class = "Perfect Assassin"
						src.ki_bonus += 1000
						src.ki += 1000
						src.ki_max += 1000
						src.ki_bonus += 1000
						src.ki += 1000
						src.ki_max += 1000
					if("No, I want to be something else")
						goto class

			if("Destroyer")
				switch(input("Destroyers are warriors that like to have power and strength!") in list("I want to be a Destroyer","No, I want to be something else"))
					if("I want to be a Destroyer")
						src.class = "Destroyer"
						src.power_bonus += 2000
						src.powerlevel += 2000
						src.powerlevel_max += 2000
						src.strength_bonus += 2000
						src.strength += 2000
						src.strength_max += 2000
					if("No, I want to be something else")
						goto class