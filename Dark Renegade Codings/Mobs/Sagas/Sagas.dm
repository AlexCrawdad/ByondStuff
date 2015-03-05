var
	Simulations_on= 0
	Simulations_evil=0
	Simulations_good=0
	Simulation=""
	part=""
	Simulation_difficulty="Easy"
	Simulation_episode=0
	Simulation_spawned=0
mob/var/Simulation_defeated=0
proc
	Simulation_DIFFICULTY()
		if(Simulation_difficulty=="Easy")
			for(var/mob/Simulation/M in world)
				M.powerlevel_max=M.powerlevel_max*7
				M.ki_max=M.ki_max*7
				M.strength_max=M.strength_max*7
				M.defence_max=M.defence_max*7
				M.kidefense_max=M.kidefense_max*7
				if(M.powerlevel>=M.powerlevel_max)M.powerlevel=M.powerlevel_max
				if(M.ki>=M.ki_max)M.ki=M.ki_max
				if(M.strength>=M.strength_max)M.strength=M.strength_max
				if(M.defence>=M.defence_max)M.defence=M.defence_max
				if(M.kidefense>=M.kidefense_max)M.kidefense=M.kidefense_max
				M.exp*=1.5
		if(Simulation_difficulty=="Medium")
			for(var/mob/Simulation/M in world)
				M.powerlevel_max=M.powerlevel_max*100
				M.ki_max=M.ki_max*100
				M.strength_max=M.strength_max*100
				M.defence_max=M.defence_max*100
				M.kidefense_max=M.kidefense_max*100
				if(M.powerlevel>=M.powerlevel_max)M.powerlevel=M.powerlevel_max
				if(M.ki>=M.ki_max)M.ki=M.ki_max
				if(M.strength>=M.strength_max)M.strength=M.strength_max
				if(M.defence>=M.defence_max)M.defence=M.defence_max
				if(M.kidefense>=M.kidefense_max)M.kidefense=M.kidefense_max
				M.exp*=2
		if(Simulation_difficulty=="Hard")
			for(var/mob/Simulation/M in world)
				M.powerlevel_max=M.powerlevel_max*2000
				M.ki_max=M.ki_max*2000
				M.strength_max=M.strength_max*2000
				M.defence_max=M.defence_max*2000
				M.kidefense_max=M.kidefense_max*2000
				if(M.powerlevel>=M.powerlevel_max)M.powerlevel=M.powerlevel_max
				if(M.ki>=M.ki_max)M.ki=M.ki_max
				if(M.strength>=M.strength_max)M.strength=M.strength_max
				if(M.defence>=M.defence_max)M.defence=M.defence_max
				if(M.kidefense>=M.kidefense_max)M.kidefense=M.kidefense_max
				M.exp*=3
		if(Simulation_difficulty=="Extreme")
			for(var/mob/Simulation/M in world)
				M.powerlevel_max=M.powerlevel_max*30000
				M.ki_max=M.ki_max*30000
				M.strength_max=M.strength_max*30000
				M.defence_max=M.defence_max*30000
				M.kidefense_max=M.kidefense_max*30000
				if(M.powerlevel>=M.powerlevel_max)M.powerlevel=M.powerlevel_max
				if(M.ki>=M.ki_max)M.ki=M.ki_max
				if(M.strength>=M.strength_max)M.strength=M.strength_max
				if(M.defence>=M.defence_max)M.defence=M.defence_max
				if(M.kidefense>=M.kidefense_max)M.kidefense=M.kidefense_max
				M.exp*=4
world
	proc
		Simulation_Chooser()
			var/Simulationchooser=rand(1,2)
			switch(Simulationchooser)
				if(1)
					Simulations_on=1
					Simulations_evil=1
					Simulation_CHECK()
				if(2)
					Simulations_on=1
					Simulations_good=1
					Simulation_CHECK()
		Simulation_CHECK()
			while(Simulations_on)
				if(Simulations_on&&Simulations_evil)
					if(!Simulation_episode&&!Simulation_spawned)
						for(var/mob/Simulation/M in world)del(M)
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Evil Simulations has been activated!"
						Simulation="Saiyan"
						part="Raditz"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_episode=1
						Simulation_spawned=1
						var/Raditz=/mob/Simulation/Raditz
						new Raditz(locate(215,171,1))
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==2&&Simulation_spawned!=2)
						Simulation="Saiyan"
						part="Vegeta and Nappa"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=2
						var/Vegeta=/mob/Simulation/Vegeta
						new Vegeta(locate(245,154,1))
						var/Nappa=/mob/Simulation/Nappa
						new Nappa(locate(262,134,1))
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==4&&Simulation_spawned!=4)
						Simulation="Frieza"
						part="Ginyu Force"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=4
						var/Jeice=/mob/Simulation/Jeice
						new Jeice(locate(235,340,2))
						var/Burter=/mob/Simulation/Burter
						new Burter(locate(220,302,2))
						var/Recoom=/mob/Simulation/Recoom
						new Recoom(locate(50,83,2))
						var/Guldo=/mob/Simulation/Guldo
						new Guldo(locate(68,38,2))
						var/Ginyu=/mob/Simulation/Ginyu
						new Ginyu(locate(165,72,2))
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==9&&Simulation_spawned!=9)
						Simulation="Frieza"
						part="Frieza: Form 1"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=9
						var/Frieza=/mob/Simulation/Frieza
						new Frieza(locate(340,205,2))
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==10&&Simulation_spawned!=10)
						Simulation="Frieza"
						part="Frieza: Form 2"
						Simulation_spawned=10
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==11&&Simulation_spawned!=11)
						Simulation="Frieza"
						part="Frieza: Form 3"
						Simulation_spawned=11
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==12&&Simulation_spawned!=12)
						Simulation="Frieza"
						part="Frieza: Form 4"
						Simulation_spawned=12
						world<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==13&&Simulation_spawned!=13)
						Simulation="Frieza"
						part="Frieza: Form 4 100%"
						Simulation_spawned=13
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==14&&Simulation_spawned!=14)
						Simulation="Android"
						part="Cyborg Frieza"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=14
						var/Cyborg_Frieza=/mob/Simulation/MechaFrieza
						new Cyborg_Frieza(locate(368,276,1))
						var/King_Cold=/mob/Simulation/KingCold
						new King_Cold(locate(206,368,1))
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==16&&Simulation_spawned!=16)
						Simulation="Cooler"
						part="Cooler"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=16
						var/Cooler=/mob/Simulation/Cooler
						new Cooler(locate(368,276,1))
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==17&&Simulation_spawned!=17)
						Simulation="Cooler"
						part="Metal Cooler"
						Simulation_spawned=17
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==18&&Simulation_spawned!=18)
						Simulation="Android"
						part="Android 19 and 20"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=18
						var/Android_19=/mob/Simulation/Android19
						new Android_19(locate(153,236,3))
						var/Dr_Gero=/mob/Simulation/Android20
						new Dr_Gero(locate(359,84,3))
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==20&&Simulation_spawned!=20)
						Simulation="Android"
						part="Android 16, 17 and 18"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=20
						var/Android_16=/mob/Simulation/Android16
						new Android_16(locate(86,73,3))
						var/Android_17=/mob/Simulation/Android17
						new Android_17(locate(66,358,3))
						var/Android_18=/mob/Simulation/Android18
						new Android_18(locate(335,48,3))
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==23&&Simulation_spawned!=23)
						Simulation="Android"
						part="Cell: Form I"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=23
						var/Cell=/mob/Simulation/Cell
						new Cell(locate(39,181,1))
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==24&&Simulation_spawned!=24)
						Simulation="Android"
						part="Cell: Imperfect Form"
						Simulation_spawned=24
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==25&&Simulation_spawned!=25)
						Simulation="Android"
						part="Cell: Perfect Form"
						Simulation_spawned=25
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==26&&Simulation_spawned!=26)
						Simulation="Android"
						part="Cell: Power Weighted"
						Simulation_spawned=26
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==27&&Simulation_spawned!=27)
						Simulation="Android"
						part="Cell: Perfect Form Power Weighted"
						Simulation_spawned=27
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==28&&Simulation_spawned!=28)
						Simulation="Brolly"
						part="Brolly"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=28
						var/Broly=/mob/Simulation/Brolly
						new Broly(locate(335,141,2))
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==29&&Simulation_spawned!=29)
						Simulation="Brolly"
						part="Legendary Super Saiyan"
						Simulation_spawned=29
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==30&&Simulation_spawned!=30)
						Simulation="Majin"
						part="Babidi and Dabura"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=30
						var/Dabura=/mob/Simulation/Dabura
						new Dabura(locate(190,68,1))
						var/Babidi=/mob/Simulation/Babidi
						new Babidi(locate(272,23,1))
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==32&&Simulation_spawned!=32)
						Simulation="Majin"
						part="Fat Buu"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=32
						var/Fat_Buu=/mob/Simulation/MajinBuu
						new Fat_Buu(locate(21,112,1))
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==33&&Simulation_spawned!=33)
						Simulation="Majin"
						part="Evil Buu"
						Simulation_spawned=33
						world<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==34&&Simulation_spawned!=34)
						Simulation="Majin"
						part="Super Buu"
						Simulation_spawned=34
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==35&&Simulation_spawned!=35)
						Simulation="Majin"
						part="Kid Buu"
						Simulation_spawned=35
						world<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==36&&Simulation_spawned!=36)
						Simulation="Baby"
						part="Baby"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=36
						spawn(1)Simulation_DIFFICULTY()
						var/Bebi=/mob/Simulation/Baby
						new Bebi(locate(174,262,1))
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode == 37&&Simulation_spawned!=37)
						Simulation="Baby"
						part="Baby Vegeta"
						Simulation_spawned=37
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==38&&Simulation_spawned!=38)
						Simulation="Baby"
						part="Golden Oozaru Baby"
						Simulation_spawned=38
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==39&&Simulation_spawned!=39)
						Simulation="Super 17"
						part="Super 17"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=39
						var/Super17=/mob/Simulation/Super17
						new Super17(locate(195,328,3))
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==40&&Simulation_spawned!=40)
						Simulation="Shenron"
						part="Shenron"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=40
						var/Shenron=/mob/Simulation/Shenron
						new Shenron(locate(10,347,1))
						spawn(1)Simulation_DIFFICULTY()
				/*	if(Simulation_episode==41&&Simulation_spawned!=41)
						Simulation="Shenron"
						part="Shenron"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=40
						var/Shenron=/mob/Simulation/Shenron
						new Shenron(locate(10,347,1))
						spawn(1)Simulation_DIFFICULTY()*/
					if(Simulation_episode==41&&Simulation_spawned!=41)
						Simulation="Shenron"
						part="Omega Shenron"
						Simulation_spawned=41
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						spawn(1)Simulation_DIFFICULTY()
					if(Simulation_episode==42)
						for(var/mob/PC/C in world)
							if(C.onSimulations)
								C<< "<font color=green><u>Simulation Information:</u></font> Good Simulations has been defeated!"
								C<<"<font color=green><u>Simulation Information:</u></font> Moving onto Evil Simulations!"
						Simulations_on= 0
						Simulations_on= 1
						Simulations_good=1
						Simulations_evil=0
						Simulation="Saiyan"
						part="Raditz"
						Simulation_difficulty="Easy"
						Simulation_episode=0
						Simulation_spawned=0
						Simulation_CHECK()
						return

				if(Simulations_on&&Simulations_good)
					if(!Simulation_episode&&!Simulation_spawned)
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Good Simulations has been activated!"
						Simulation="Saiyan"
						part="Goku and Piccolo"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_episode=1
						Simulation_spawned=1
						var/Goku1=/mob/Simulation/Goku1
						var/Piccolo1=/mob/Simulation/Piccolo1
						var/Gohan1=/mob/Simulation/Gohan1
						new Goku1(locate(46,134,1))
						new Piccolo1(locate(36,178,1))
						new Gohan1(locate(220,174,1))
						Simulation_DIFFICULTY()
					if(Simulation_episode==4&&Simulation_spawned!=4)
						Simulation="Saiyan"
						part="Saiyan Force"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=4
						var/Goku2=/mob/Simulation/Goku2
						var/Piccolo2=/mob/Simulation/Piccolo2
						var/Choutzu1=/mob/Simulation/Choutzu1
						var/Krillin1=/mob/Simulation/Krillin1
						var/Tien1=/mob/Simulation/Tien1
						new Goku2(locate(334,148,1))
						new Piccolo2(locate(127,310,1))
						new Choutzu1(locate(368,286,1))
						new Krillin1(locate(230,16,1))
						new Tien1(locate(85,59,1))
						Simulation_DIFFICULTY()
					if(Simulation_episode==9&&Simulation_spawned!=9)
						Simulation="Frieza"
						part="Gohan and Krillin"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=9
						var/Gohan2=/mob/Simulation/Gohan2
						var/Krillin2=/mob/Simulation/Krillin2
						new Gohan2(locate(204,265,2))
						new Krillin2(locate(204,139,2))
						Simulation_DIFFICULTY()
					if(Simulation_episode==11&&Simulation_spawned!=11)
						Simulation="Frieza"
						part="Goku and Vegeta"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=11
						var/Goku3=/mob/Simulation/Goku3
						var/Vegeta2=/mob/Simulation/Vegeta2
						new Goku3(locate(162,79,2))
						new Vegeta2(locate(337,143,2))
						Simulation_DIFFICULTY()
					if(Simulation_episode==13&&Simulation_spawned!=13)
						Simulation="Frieza"
						part="Super Saiyan Goku"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=13
						var/Goku4=/mob/Simulation/Goku4
						new Goku4(locate(52,136,2))
						Simulation_DIFFICULTY()
					if(Simulation_episode==14&&Simulation_spawned!=14)
						Simulation="Android"
						part="Future Trunks"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=14
						var/Trunks1=/mob/Simulation/Trunks1
						new Trunks1(locate(356,380,1))
						Simulation_DIFFICULTY()
					if(Simulation_episode==15&&Simulation_spawned!=15)
						Simulation="Cooler"
						part="Goku and Vegeta"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=15
						var/Goku5=/mob/Simulation/Goku5
						var/Vegeta3=/mob/Simulation/Vegeta3
						new Goku5(locate(261,264,3))
						new Vegeta3(locate(71,365,3))
						Simulation_DIFFICULTY()
					if(Simulation_episode==17&&Simulation_spawned!=17)
						Simulation="Android"
						part="Super Saiyan Vegeta"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=17
						var/Vegeta4 = /mob/Simulation/Vegeta4
						new Vegeta4(locate(115,334,1))
						Simulation_DIFFICULTY()
					if(Simulation_episode==18&&Simulation_spawned!=18)
						Simulation="Android"
						part="Super Saiyan Gohan"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=18
						var/Goku6=/mob/Simulation/Goku6
						var/Gohan3=/mob/Simulation/Gohan3
						new Goku6(locate(355,349,3))
						new Gohan3(locate(247,277,3))
						Simulation_DIFFICULTY()
					if(Simulation_episode==21&&Simulation_spawned!=21)
						Simulation="Brolly"
						part="Trunks and Goten"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=21
						var/Trunks2=/mob/Simulation/Trunks2
						var/Goten1=/mob/Simulation/Goten1
						new Trunks2(locate(324,119,1))
						new Goten1(locate(232,75,1))
						Simulation_DIFFICULTY()
					if(Simulation_episode==23&&Simulation_spawned!=23)
						Simulation="Majin"
						part="Vegeta"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=23
						var/Vegeta5=/mob/Simulation/Vegeta5
						new Vegeta5(locate(252,166,1))
						Simulation_DIFFICULTY()
					if(Simulation_episode==24&&Simulation_spawned!=24)
						Simulation="Majin"
						part="Super Saiyan 3 Goku"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=24
						var/Goku7=/mob/Simulation/Goku7
						new Goku7(locate(197,224,1))
						Simulation_DIFFICULTY()
					if(Simulation_episode==25&&Simulation_spawned!=25)
						Simulation="Majin"
						part="Gotenks and Mystic Gohan"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=25
						var/Gotenks1=/mob/Simulation/Gotenks1
						var/Gohan4=/mob/Simulation/Gohan4
						new Gotenks1(locate(327,48,1))
						new Gohan4(locate(165,136,1))
						Simulation_DIFFICULTY()
					if(Simulation_episode==27&&Simulation_spawned!=27)
						Simulation="Majin"
						part="Vegito"
						for(var/mob/PC/C in world)if(C.onSimulations)C<<"<font color=green><u>Simulation Information:</u></font> Simulation: [Simulation] / Part: [part]"
						Simulation_spawned=27
						var/Vegito1=/mob/Simulation/Vegito1
						new Vegito1(locate(205,363,1))
						Simulation_DIFFICULTY()
					if(Simulation_episode==28)
						for(var/mob/PC/C in world)
							if(C.onSimulations)
								C<< "<font color=green><u>Simulation Information:</u></font> Good Simulations has been defeated!"
								C<<"<font color=green><u>Simulation Information:</u></font> Moving onto Evil Simulations!"
						Simulations_on= 1
						Simulations_evil=1
						Simulations_good=0
						Simulation="Saiyan"
						part="Raditz"
						Simulation_difficulty="Easy"
						Simulation_episode=0
						Simulation_spawned=0
				sleep(300)
mob
	Simulation
		icon='Sagas.dmi'
		pk=1
		density=1
		safe=0
		var
			has_beam=0
			beam_txt=""
			beamI='Techs.dmi'
			beamIS=0
			beamIST=0
			CPS=1
		New()
			..()
			spawn(20)
				if(Simulation_difficulty=="Extreme")WanderExtreme()
				if(Simulation_difficulty=="Hard")WanderHard()
				if(Simulation_difficulty=="Medium")WanderMed()
				if(Simulation_difficulty=="Easy")Wander()
			spawn(50)if(src)SimulationAI()
			spawn(1)
				var/pl=(level*level*(level*0.3))+rand(1,1000)
				var/str=(level*level*(level*0.3))+rand(1,1000)
				powerlevel = pl
				powerlevel_max = pl
				ki=pl*0.95
				ki_max=pl*0.95
				kidefense=pl*0.7
				kidefense_max=pl*0.7
				strength=str
				strength_max=str
				defence=str
				defence_max=str
				zenni=(level*level*0.2)+100
				if(Simulation_difficulty=="Easy")
					powerlevel_max*=0.5
					ki_max*=0.5
					kidefense_max*=0.5
					strength_max*=0.5
					defence_max*=0.5
					Power_Redefine()
		proc
			SimulationPowerUp()
				if(powering)
					if(powerlevel>=powerlevel_max)powerlevel=powerlevel_max
					if(ki>=ki_max)ki=ki_max
					if(powerlevel>=powerlevel_max&&ki>=ki_max)
						powering=0
						doing=0
						frozen=0
						power_delay=0
						overlays-='aura.dmi'
						return
					else spawn(25)if(src)SimulationPowerUp()
					powerlevel+=powerlevel_max*0.15
					ki+=ki_max*0.15
					if(powerlevel>=powerlevel_max&&ki>=ki_max)
						powerlevel=powerlevel_max
						ki=ki_max
						powering=0
						doing=0
						power_delay=0
						frozen=0
						overlays-='aura.dmi'
						return
					else spawn(25)if(src)SimulationPowerUp()
			Location_Checker()
				for(var/mob/PC/M in oview(1))
					if(dir==NORTH&&M.dir==SOUTH)return TRUE
					if(dir==SOUTH&&M.dir==NORTH)return TRUE
					if(dir==EAST&&M.dir==WEST)return TRUE
					if(dir==WEST&&M.dir==EAST)return TRUE
					if(dir==NORTHEAST&&M.dir==SOUTHWEST)return TRUE
					if(dir==SOUTHWEST&&M.dir==NORTHEAST)return TRUE
					if(dir==NORTHWEST&&M.dir==SOUTHEAST)return TRUE
					if(dir==SOUTHEAST&&M.dir==NORTHWEST)return TRUE
					else return FALSE
			SimulationAI()
				spawn while(src)
					if(powerlevel<=powerlevel_max*0.20||ki<=ki_max*0.15)
						if(!powering)
							if(power_delay||doing||KO)break
							power_delay=1
							powering=1
							doing=1
							frozen=1
							overlays+='aura.dmi'
							spawn(20)if(src)SimulationPowerUp()
					if(prob(50))
						if(!doing&&!KO)
							if(dir==NORTH)
								for(var/mob/PC/M in oview(8))
									if(M.x==x&&M.y>y)
										if(name=="{Simulation}Majin Buu"&&ki>5000&&prob(50))
											doing=1
											frozen=1
											view(8)<<"[src]: FAT WRAP!"
											var/obj/Tech/BeamH/A=new
											spawn(5)A.BindAttack("Fat Wrap",'Techs.dmi',"fatwrap",300000000,src,0)
											spawn(5)
												doing=0
												frozen=0
											goto HERE
										if(has_beam!=0)
											if(ki>=5000)
												doing=1
												frozen=1
												view(8)<<"[src]: [beam_txt]!"
												var/obj/Tech/BeamH/A=new
												spawn(5)A.TechAttackBeam(src,"[has_beam]",ki*0.5,'Techs2.dmi',"[beamIS]","[beamIST]",0)
										else
											if(ki>=500)
												doing=1
												frozen=1
												view(8)<<"[src]: HA!"
												var/obj/Tech/BeamH/A=new
												spawn(5)A.TechAttackStraight(src,"Ki Blast",ki*0.07,'Techs.dmi',"blast",0)
							if(dir==SOUTH)
								for(var/mob/PC/M in oview(8))
									if(M.x==x&&M.y<y)
										if(name=="{Simulation}Majin Buu"&&ki>5000&&prob(50))
											doing=1
											frozen=1
											view(8)<<"[src]: FAT WRAP!"
											var/obj/Tech/BeamH/A=new
											spawn(5)A.BindAttack("Fat Wrap",'Techs.dmi',"fatwrap",300000000,src,0)
											spawn(5)
												doing=0
												frozen=0
											goto HERE
										if(has_beam!=0)
											if(ki>=5000)
												doing=1
												frozen=1
												view(8)<<"[src]: [beam_txt]!"
												var/obj/Tech/BeamH/A=new
												spawn(5)A.TechAttackBeam(src,"[has_beam]",ki*0.5,'Techs2.dmi',"[beamIS]","[beamIST]",0)
										else
											if(ki>=500)
												doing=1
												frozen=1
												view(8)<<"[src]: HA!"
												var/obj/Tech/BeamH/A=new
												spawn(5)A.TechAttackStraight(src,"Ki Blast",ki*0.07,'Techs.dmi',"blast",0)
							if(dir==EAST)
								for(var/mob/PC/M in oview(8))
									if(M.x>x&&M.y==y)
										if(name=="{Simulation}Majin Buu"&&ki>5000&&prob(50))
											doing=1
											frozen=1
											view(8)<<"[src]: FAT WRAP!"
											var/obj/Tech/BeamH/A=new
											spawn(5)A.BindAttack("Fat Wrap",'Techs.dmi',"fatwrap",300000000,src,0)
											spawn(5)
												doing=0
												frozen=0
											goto HERE
										if(has_beam!=0)
											if(ki>=5000)
												doing=1
												frozen=1
												view(8)<<"[src]: [beam_txt]!"
												var/obj/Tech/BeamH/A=new
												spawn(5)A.TechAttackBeam(src,"[has_beam]",ki*0.5,'Techs2.dmi',"[beamIS]","[beamIST]",0)
										else
											if(ki>=500)
												doing=1
												frozen=1
												view(8)<<"[src]: HA!"
												var/obj/Tech/BeamH/A=new
												spawn(5)A.TechAttackStraight(src,"Ki Blast",ki*0.07,'Techs.dmi',"blast",0)
							if(dir==WEST)
								for(var/mob/PC/M in oview(8))
									if(M.x<x&&M.y==y)
										if(name=="{Simulation}Majin Buu"&&ki>5000&&prob(50))
											doing=1
											frozen=1
											view(8)<<"[src]: FAT WRAP!"
											var/obj/Tech/BeamH/A=new
											spawn(5)A.BindAttack("Fat Wrap",'Techs.dmi',"fatwrap",300000000,src,0)
											spawn(5)
												doing=0
												frozen=0
											goto HERE
										if(has_beam!=0)
											if(ki>=5000)
												doing=1
												frozen=1
												view(8)<<"[src]: [beam_txt]!"
												var/obj/Tech/BeamH/A=new
												spawn(5)A.TechAttackBeam(src,"[has_beam]",ki*0.5,'Techs2.dmi',"[beamIS]","[beamIST]",0)
										else
											if(ki>=500)
												doing=1
												frozen=1
												view(8)<<"[src]: HA!"
												var/obj/Tech/BeamH/A=new
												spawn(5)A.TechAttackStraight(src,"Ki Blast",ki*0.07,'Techs.dmi',"blast",0)
					HERE
					sleep(15)