obj
	Technique
		DragonScan
			verb
				DragoScan()
					set category = "Techniques"
					set name = "Dragon Scan"
					switch(alert("Which Dragonballs do you want to scan?","Dragon Scan","Earth","Namek","Black Star","Cancel"))
						if("Cancel")return
						if("Earth")
							if(usr.CheckEarthBalls()!=TRUE)
								usr<<"The Earth Dragonballs haven't been spawned."
								return
							for(var/obj/Earth_Dragonballs/Earth_Dragonball_1 in world)
								if(Earth_Dragonball_1.x==0||Earth_Dragonball_1.y==0||Earth_Dragonball_1.z==0)usr<<"<font color = lime>[Earth_Dragonball_1.name]: </font> [Earth_Dragonball_1.loc]"
								else usr<<"<font color = lime>[Earth_Dragonball_1.name]: </font> [Earth_Dragonball_1.x], [Earth_Dragonball_1.y], [Earth_Dragonball_1.z]"
						if("Namek")
							if(usr.CheckNamekBalls()!=TRUE)
								usr<<"The Namek Dragonballs haven't been spawned."
								return
							for(var/obj/Namek_Dragonballs/Namek_Dragonball_1 in world)
								if(Namek_Dragonball_1.x==0||Namek_Dragonball_1.y==0||Namek_Dragonball_1.z==0)usr<<"<font color = #4169E1>[Namek_Dragonball_1.name]: </font> [Namek_Dragonball_1.loc]"
								else usr<<"<font color = #4169E1>[Namek_Dragonball_1.name]: </font> [Namek_Dragonball_1.x], [Namek_Dragonball_1.y], [Namek_Dragonball_1.z]"
						if("Black Star")
							if(usr.CheckBlackBalls()!=TRUE)
								usr<<"The Black Star Dragonballs haven't been spawned."
								return
							for(var/obj/Black_Dragonballs/Black_Dragonball_1 in world)
								if(Black_Dragonball_1.x==0||Black_Dragonball_1.y==0||Black_Dragonball_1.z==0)usr<<"<font color = #708090>[Black_Dragonball_1.name]: </font> [Black_Dragonball_1.loc]"
								else usr<<"<font color = #708090>[Black_Dragonball_1.name]: </font> [Black_Dragonball_1.x], [Black_Dragonball_1.y], [Black_Dragonball_1.z]"


