mob
	Simulation
		Brolly
			name="{Simulation}Brolly"
			icon_state="brolly"
			level=870
			powerlevel=200000000
			powerlevel_max=200000000
			ki=190000000
			ki_max=190000000
			strength=350000000
			strength_max=350000000
			defence=250000000
			defence_max=250000000
			speed=1300
			zenni=500000
			exp=580000
			karma = "Evil"
			race = "Saiyan"
			CPS=12
			Del()
				if(!src.form_1)
					var/mob/Simulation/Brolly/F=new
					F.loc=src.loc
					F.form_1=1
					F.level=950
					F.speed=1000
					F.icon_state="brolly1"
					CPS=13
				..()
		Babidi
			name="{Simulation}Babidi"
			icon_state="babidi"
			level=300
			powerlevel=200000
			powerlevel_max=200000
			ki=20000000
			ki_max=20000000
			strength=1000
			strength_max=1000
			defence=900
			defence_max=900
			speed=5000
			zenni=5000
			exp=500000
			karma = "Evil"
			race = "Majin"
			CPS=5
		Dabura
			name="{Simulation}Dabura"
			icon_state="dabura"
			level=860
			powerlevel=180000000
			powerlevel_max=180000000
			ki=150000000
			ki_max=150000000
			strength=270000000
			strength_max=270000000
			defence=240000000
			defence_max=240000000
			speed=2000
			zenni=50000
			exp=500000
			karma = "Evil"
			race = "Majin"
			CPS=11
		MajinBuu
			name="{Simulation}Majin Buu"
			icon_state="majinbuu"
			level=890
			powerlevel=200000000
			powerlevel_max=200000000
			ki=190000000
			ki_max=190000000
			strength=350000000
			strength_max=350000000
			defence=250000000
			defence_max=250000000
			speed=3000
			zenni=80000
			exp=580000
			karma = "Evil"
			race = "Majin"
			has_beam="Candy Ray"
			beam_txt="TURN TO CHOCOLATE"
			beamIS="candyray"
			beamIST="candyrayt"
			CPS=12
			Del()
				if(!src.form_1)
					var/mob/Simulation/MajinBuu/F=new
					F.loc=locate(130,222,1)
					F.form_1=1
					F.level=900
					F.speed=3000
					F.icon_state="majinbuu1"
					F.CPS=12
				if(src.form_1&&!src.form_2)
					var/mob/Simulation/MajinBuu/F=new
					F.loc=locate(210,355,1)
					F.form_1=1
					F.form_2=1
					F.level=950
					F.speed=2000
					F.icon_state="majinbuu2"
					F.CPS=13
				if(src.form_2&&!src.form_3)
					var/mob/Simulation/MajinBuu/F=new
					F.loc=locate(96,58,1)
					F.form_1=1
					F.form_2=1
					F.form_3=1
					F.level=1000
					F.speed=1000
					F.icon_state="majinbuu3"
					F.CPS=14
				..()
		Trunks2
			name="{Simulation}Trunks"
			icon_state="trunks2"
			level=860
			speed=2000
			karma = "Good"
			race = "Half Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
			exp=500000
		Goten1
			name="{Simulation}Goten"
			icon_state="goten1"
			level=860
			speed=2000
			karma = "Good"
			race = "Half Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
			exp=520000
		Goku7
			name="{Simulation}Goku"
			icon_state="goku6"
			level=910
			speed=2000
			karma = "Good"
			race = "Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
			exp=580000
		Vegeta5
			name="{Simulation}Vegeta"
			icon_state="vegeta5"
			level=890
			speed=2000
			karma = "Good"
			race = "Saiyan"
			has_beam="Final Flash"
			beam_txt="FINAL FLASH"
			beamIS="finalflash"
			beamIST="finalflasht"
			exp=560000
		Gotenks1
			name="{Simulation}Gotenks"
			icon_state="gotenks1"
			level=950
			speed=2000
			karma = "Good"
			race = "Half Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
			exp=600000
		Gohan4
			name="{Simulation}Gohan"
			icon_state="gohan4"
			level=960
			speed=2000
			karma = "Good"
			race = "Half Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
			exp=560000
		Vegito1
			name="{Simulation}Vegito"
			icon_state="vegito1"
			level=1000
			speed=1000
			karma = "Good"
			race = "Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
			exp=700000