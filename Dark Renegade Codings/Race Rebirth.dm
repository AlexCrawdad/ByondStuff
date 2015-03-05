mob
	var
		Rebirthing = 0;powerlevelrebirthgain=1;strengthrebirthgain=1;defenserebirthgain=1;kirebirthgain=1;kidefenserebirthgain=1;EXPrebirthgain=1;staminarebirthgain=1;rboldlvl=0
	verb
		Rebirthing()
			set category = "Training"
			set name = "Rebirth"
			Reincarnate()
	proc
		Reincarnate()
			if(boxing||rest||dualtrain||doing||/*ft_using||*/jailed)return
			if(usr.level < 50000*EXPrebirthgain )
				usr<<"You are not a high enough level to Rebirth!!"
				return
			switch(alert("Do you wish to Rebirth ?","Options","Yes","No"))
				if("Yes")
					if(usr.level < 50000)
						usr<<"No Bug Abuse."
						return
					else
						Rebirth(src)
				if("No")
					return
		Rebirth()
			RebirthGain(src)
			switch(input("What Race would you like to be?")in list("Saiyan","Half Saiyan","Human","Tuffle","Dragon","Majin","Bio-Android","Android","Bio Warrior","Changeling","Demon","Galactic Warrior","Hybrid","Kai","Konat","Makyo","Namekian","Saibaman","Vampire","Dark Angel"))
				if("Saiyan")
					if(src.EXPrebirthgain >= 75)
						switch(input("What Gene would you like to have?")in list("Pride","Honor","Legend","SSG"))
							if("Pride")
								src.race="Saiyan"
								src.icon='Male - Tan.dmi'
								src.rage_chromosome=0;src.train_chromosome=1;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
							if("Honor")
								src.race="Saiyan"
								src.icon='Male - Tan.dmi'
								src.rage_chromosome=1;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
							if("Legend")
								src.race="Saiyan"
								src.icon='Male - Tan.dmi'
								src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=1;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
							if("SSG")
								src.race="Saiyan"
								src.icon='Male - Tan.dmi'
								src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=1;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
						contents += new/obj/Tech/FakeMoon
					else if(src.EXPrebirthgain <75 && src.EXPrebirthgain >= 50)
						switch(input("What Gene would you like to have?")in list("Pride","Honor","Legend"))
							if("Pride")
								src.race="Saiyan"
								src.icon='Male - Tan.dmi'
								src.rage_chromosome=0;src.train_chromosome=1;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
							if("Honor")
								src.race="Saiyan"
								src.icon='Male - Tan.dmi'
								src.rage_chromosome=1;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
							if("Legend")
								src.race="Saiyan"
								src.icon='Male - Tan.dmi'
								src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=1;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
					else
						var/chance = rand(1,100)
						if(chance <= 35)
							src.race="Saiyan"
							src.icon='Male - Tan.dmi'
							src.rage_chromosome=0;src.train_chromosome=1;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
						else if(chance > 35 && chance < 70)
							src.race="Saiyan"
							src.icon='Male - Tan.dmi'
							src.rage_chromosome=1;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
						else if(chance >=70 && chance < 90)
							src.race="Saiyan"
							src.icon='Male - Tan.dmi'
							src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=1;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
						else
							src.race="Saiyan"
							src.icon='Male - Tan.dmi'
							src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=1;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
					contents += new/obj/Tech/FakeMoon

				if("Half Saiyan")
					switch(input("What Gene would you like to have?")in list("Saint","Demonic"))
						if("Saint")
							src.race="Half Saiyan"
							src.icon='Male - Tan.dmi'
							src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=1;src.gene_cooler=0;src.gene_frieza=0
						if("Demonic")
							src.race="Half Saiyan"
							src.icon='Male - Tan.dmi'
							src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=1;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
					contents += new/obj/Tech/FakeMoon
				if("Human")
					src.race="Human"
					src.icon='Male - Tan.dmi'
					src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
				if("Tuffle")
					src.race="Tuffle"
					src.icon='Bebi - Form 1.dmi'
					src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
					contents += new/obj/Technique/Infect
				if("Dragon")
					switch(input("What Gene would you like to have?")in list("Chaos","Holy"))
						if("Chaos")
							src.race="Dragon"
							src.icon='Dragon - Form 1.dmi'
							src.rage_chromosome=0;src.train_chromosome=1;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=1;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
						if("Holy")
							src.race="Dragon"
							src.icon='Shenron level 9.dmi'
							src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=1;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
					contents += new/obj/Technique/WhirlWindSpin
				if("Majin")
					src.race="Majin"
					src.icon='Majin - Form 1.dmi'
					src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
					contents += new/obj/Technique/Regenerate
					contents += new/obj/Technique/FatWrap
					contents += new/obj/Technique/CandyRay
				if("Bio-Android")
					src.race="Bio-Android"
					src.icon='Bio Android - Form 1.dmi'
					src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
					contents += new/obj/Technique/Absorb
					contents += new/obj/Technique/Regenerate
					src << "You have learned Absorb and Regenerate."
				if("Android")
					switch(input("What Gene would you like to have?")in list("17","13"))
						if("13")
							src.race="Android"
							src.icon='Android13form1.dmi'
							src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=1;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
						if("17")
							src.race="Android"
							src.icon='Android17form1.dmi'
							src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=1;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
					learn_lifedrain=1
					contents += new/obj/Technique/SelfDestruct
					contents += new/obj/Technique/LifeAbsorb
					ki_bonus += rand(300,390)
					power_bonus += rand(100,250)
					src << "You have learned Self Destruct and Life Absorb."
				if("Bio Warrior")
					src.race="Bio Warrior"
					src.icon='Bio Warrior 1.dmi'
					src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
				if("Changeling")
					switch(input("What Gene would you like to have?")in list("Frieza","Cooler"))
						if("Frieza")
							src.race="Changeling"
							src.icon='Changling - Form 1.dmi'
							src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=1
						if("Cooler")
							src.race="Changeling"
							src.icon='Cooler - Form.dmi'
							src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=1;src.gene_frieza=0
					learn_kienzandisk=1
					contents+=new/obj/Technique/KienzanDisk
				if("Demon")
					switch(input("What Gene would you like to have?")in list("Angelic","Chaotic"))
						if("Angelic")
							src.race="Demon"
							src.icon='ADemon - Form 1.dmi'
							src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=1;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
						if("Chaotic")
							src.race="Demon"
							src.icon='Demon - Form 1.dmi'
							src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=1;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
					contents += new/obj/Technique/FlameBullet
				if("Galactic Warrior")
					src.race="Galactic Warrior"
					src.icon='Bojack.dmi'
					src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
				if("Hybrid")
					src.race="Ultimate Hybrid"
					src.icon='Ultimate Hybrid Form 1.dmi'
					src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
				if("Kai")
					src.race="Kai"
					src.icon='Kai - Form 1.dmi'
					src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
				if("Konat")
					src.race="Konat"
					src.icon='Konat - Form 1.dmi'
					src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
				if("Makyo")
					src.race="Makyo"
					src.icon='Makyo Form 1.dmi'
					src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
				if("Namekian")
					switch(input("What Gene would you like to have?")in list("Mystic","Warrior"))
						if("Mystic")
							src.race="Namekian"
							src.icon='Mistic.dmi'
							src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=1;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
						if("Warrior")
							src.race="Namekian"
							src.icon='Namek - Normal.dmi'
							src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=1;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
					contents += new/obj/Technique/Regenerate
				if("Saibamen")
					src.race="Saibamen"
					src.icon='Saibaman - Form 1.dmi'
					src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
				if("Vampire")
					src.race="Vampire"
					src.icon='Vamp - Form 1.dmi'
					src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0
					contents += new/obj/Technique/Bite
				if("Dark Angel")
					src.race="Dark Angel"
					src.icon='dark angel.dmi'
					src.rage_chromosome=0;src.train_chromosome=0;src.legendary_chromosome=0;src.god_chromosome=0;src.gene_model13=0;src.gene_model17=0;src.gene_chaotic=0;src.gene_angelic=0;src.gene_chaos=0;src.gene_holy=0;src.gene_mystic=0;src.gene_warrior=0;src.gene_demonic=0;src.gene_saint=0;src.gene_cooler=0;src.gene_frieza=0




		RebirthGain()
			usr.level= 1
			usr.rank = "<FONT COLOR=#ff0000>N</FONT><FONT COLOR=#8b0000>u</FONT><FONT COLOR=#c60000>b</FONT><FONT COLOR=#ff0000>c</FONT><FONT COLOR=#c60000>a</FONT><FONT COLOR=#8b0000>k</FONT><FONT COLOR=#ff0000>e</FONT></FONT>"
			usr.z_rank = "Zenni Starter"
			spawn(0)Unequip()
			sleep(5)
			usr.leveldone = 0
			usr.hbtc_times = 0
			usr.chips = 0
			usr.absorb_kill = 0
			usr.arena_win = 0
			usr.arena_lose = 0
			usr.mchips = 0
			usr.lifedrain_kill = 0
			usr.lcooldown=0
			usr.scooldown=0
			usr.mcooldown=0
			usr.smallshard=0
			usr.largeshard=0
			usr.massshard=0
			usr.rank_boosted=0
			usr.kills = 0
			usr.deaths = 0
			usr.eats = 0
			usr.dodge=0
			usr.block=0
			usr.reflect=0
			usr.critical=0
			usr.counter=0
			usr.dodge_max=5
			usr.vote_boosted=0
			usr.permtpsboosted=0
			usr.block_max=5
			usr.reflect_max=5
			usr.critical_max=5
			usr.counter_max=5
			usr.unarmed_tnl=100
			usr.unarmed_exp=0
			usr.unarmed_skill_max=5
			usr.unarmed_skill=0
			usr.ki_skill_max=5
			usr.ki_skill=0
			usr.ki_tnl=0
			usr.ki_exp=0
			usr.massiveuses=1
			usr.biguses=1
			usr.smalluses=1
			usr.level_random=0
			usr.level_on=0
			usr.exp = 100
			usr.tnl = 50
			usr.powerlevel_max = 1000000
			usr.powerlevel = 1000000
			usr.ki_max=500000
			usr.ki=500000
			usr.kidefense_max=500000
			usr.kidefense=500000
			usr.strength_max=500000
			usr.strength=500000
			usr.defence_max=500000
			usr.defence=500000
			if(usr.key == "AngelReincarnation"||usr.key == "Vegito9000")
				usr.stamina_max=300000
				usr.stamina=0
				usr.speed_max=1
				usr.speed=1
			else
				usr.stamina_max=100000
				usr.stamina=0
				usr.speed_max=1
				usr.speed=1
			usr.nwishes = 0
			usr.wishes = 0
			usr.bwishes = 0
			usr.doing=0
			usr.form_1=0
			usr.form_2=0
			usr.form_3=0
			usr.form_4=0
			usr.form_5=0
			usr.form_6=0
			usr.overlays-=aura
			usr.overlays-='Elec Blue Small.dmi'
			usr.overlays-='Elec Blue Big.dmi'
			usr.overlays-='Elec Red Big.dmi'
			usr.overlays-='Elec White.dmi'
			usr.overlays-='Hair - SSJ3.dmi'
			usr.overlays-='Hair - SSJ4.dmi'
			usr.overlays-='Hair - SSJ4(fused).dmi'
			usr.overlays-='ssj4tail.dmi'
			usr.overlays-='Elec LSSJ.dmi'
			usr.overlays-='Big Aura.dmi'
			usr.overlays-=transeaura
			Power_Redefine(usr)
			Skin_Apply(usr)
			Hair_Apply(usr)
			usr.contents+=new/obj/Transform/Transform
			usr.contents+=new/obj/Transform/Revert
			usr.learn_invertpower=0
			if(usr.powerlevelrebirthgain < 100 )
				usr.powerlevelrebirthgain += 1
			if(usr.strengthrebirthgain < 100 )
				usr.strengthrebirthgain += 1
			if(usr.defenserebirthgain < 100 )
				usr.defenserebirthgain += 1
			if(usr.kirebirthgain < 100 )
				usr.kirebirthgain += 1
			if(usr.kidefenserebirthgain < 100 )
				usr.kidefenserebirthgain += 1
			if(usr.staminarebirthgain < 100 )
				usr.staminarebirthgain += 1
			if(usr.EXPrebirthgain < 100 )
				usr.EXPrebirthgain += 1
			if(usr.powerlevelrebirthgain > 100 )
				usr.powerlevelrebirthgain = 100
			if(usr.strengthrebirthgain > 100 )
				usr.strengthrebirthgain = 100
			if(usr.defenserebirthgain > 100 )
				usr.defenserebirthgain = 100
			if(usr.kirebirthgain > 100 )
				usr.kirebirthgain = 100
			if(usr.kidefenserebirthgain > 100 )
				usr.kidefenserebirthgain = 100
			if(usr.staminarebirthgain > 100)
				usr.staminarebirthgain = 100
			if(usr.EXPrebirthgain > 100 )
				usr.EXPrebirthgain = 100