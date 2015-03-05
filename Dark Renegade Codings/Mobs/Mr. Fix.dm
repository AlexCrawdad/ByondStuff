mob
	NPC
		Fix
			name = "{NPC}Fix"
			icon = 'mr.fix.dmi'
			icon_state = "Robot"
			density = 1
			safe = 1
			New()
				..()
				src.AddName()
			race = "Robot"
			karma = "Neutral"
			verb
				Talk()
					set src in oview(2)
					set category=null
					if(usr.talking || usr.fused)return
					usr.talking=1
					switch(input("What do you need help with?")in list("Fix Equipment","Overlays/Underlays","Rest/Fly/IT","Dead on Earth","Lost Transform verbs","Cancel"))
						if("Cancel")
							usr.talking=0
							return
						if("Lost Transform verbs")
							if(usr.race=="Saiyan"&&usr.rage_chromosome)
								usr<<"\red I can't do that!"
								usr.talking=0
								return
							else
								for(var/obj/Transform/Transform/T1 in usr)del(T1)
								for(var/obj/Transform/Revert/T2 in usr)del(T2)
								var/obj/Transform/Transform/T1=new
								var/obj/Transform/Revert/T2=new
								T1.loc=usr
								T2.loc=usr
								usr<<"\white Robot: You should get it back by now."
								usr.talking=0
								return
						if("Fix Equipment")
							spawn(1)Unequip()
							sleep(5)
							if(usr.race=="Saiyan"||usr.race=="Half Saiyan"&&usr.Oozaru)
								if(usr.form_5&&!usr.form_6&&usr.rage_chromosome&&usr.powerlevel_max>=3500000)
									usr.icon = 'GOozaru2.dmi'
									usr.icon_state = ""
									usr.overlays += new/obj/techs/Overlays/GOozaru_top
								else
									usr.icon = 'Oozaru.dmi'
									usr.icon_state = ""
									usr.overlays += new/obj/techs/Overlays/Oozaru_top
							usr<<"\white Robot: Your equipment is now fixed."
							usr.talking=0
							return
						if("Fix Icon")
							switch(input(usr,"Are you sure?","Fix Icon")in list("Yes","No"))
								if("Yes")
									usr.Skin_Apply()
									switch(usr.race)
										if("Bio-Android")
											if(!usr.form_1)usr.icon='Bio Android - Form 1.dmi'
											if(usr.form_1)usr.icon='Bio Android - Form 2.dmi'
											if(usr.form_2)usr.icon='Bio Android - Form 3.dmi'
										if("Majin")
											if(!usr.form_1)usr.icon='Majin - Form 1.dmi'
											if(usr.form_1)usr.icon='Majin - Form 2.dmi'
											if(usr.form_2)usr.icon='Majin - Form 3.dmi'
											if(usr.form_3)usr.icon='Majin - Form 4.dmi'
											if(usr.form_4)usr.icon='Majin - Form 5.dmi'
										if("Namekian")
											usr.icon='Namek - Normal.dmi'
											if(usr.form_3)usr.icon='Namek - Super.dmi'
										if("Konat")
											usr.icon='Konat - Form 1.dmi'
											if(usr.form_3)usr.icon='Namek - Super.dmi'
										if("Tuffle")
											usr.icon='Bebi - Form 1.dmi'
											if(usr.form_1)usr.icon='Bebi - Form 2.dmi'
											if(usr.form_2)usr.icon='Bebi - Form 2.dmi'
											if(usr.form_3)usr.icon='Bebi - Form 3.dmi'
											if(usr.form_4)usr.icon='Bebi - Form 3.dmi'
										if("Android")
											if(usr.form_1)usr.icon='Android13form1.dmi'
											if(usr.form_2)usr.icon='Android13form2.dmi'
									usr<<"\white Robot: You are now back to normal."
									usr.talking=0
									return
						if("Overlays/Underlays")
							usr.overlays -= usr.overlays
							for(var/obj/Equipment/O in usr.contents)
								if(O.eq)O.eq=0
								usr.head="EMPTY"
								usr.back="EMPTY"
								usr.chest="EMPTY"
								usr.legs="EMPTY"
								usr.feet="EMPTY"
								usr.arms="EMPTY"
								usr.hands="EMPTY"
								usr.waist="EMPTY"
								usr.underclothes="EMPTY"
								usr.clothes="EMPTY"
								usr.clothes_eq=0
								usr.scouter=0
								usr.scouter_eq=0
								usr.armor=0
								usr.armor_eq=0
								usr.under=0
								usr.under_eq=0
								usr.helmet=0
								usr.helmet_eq=0
								usr.gloves=0
								usr.gloves_eq=0
								usr.z_sword=0
								usr.radar=0
								usr.hench_equiped=0
								usr.saiyan_equiped=0
								usr.sellable_items=0
								usr.weightgi = 0
								usr.weightcape = 0
								usr.weightarmor = 0
								usr.weightarm = 0
								usr.weightleg = 0
								usr.weightankle = 0
								usr.weightwrist = 0
								usr.weighthead = 0
								usr.f_armor=0
								O.suffix = null
								O.equiped=0
								usr.gitems =0
							usr.underlays -= usr.underlays
							usr.CreateName()
							for(var/obj/Equipment/O in usr.contents)
								if(O.eq)O.eq=0
								usr.head="EMPTY"
								usr.back="EMPTY"
								usr.chest="EMPTY"
								usr.legs="EMPTY"
								usr.feet="EMPTY"
								usr.arms="EMPTY"
								usr.hands="EMPTY"
								usr.waist="EMPTY"
								usr.underclothes="EMPTY"
								usr.clothes="EMPTY"
								usr.clothes_eq=0
								usr.scouter=0
								usr.scouter_eq=0
								usr.armor=0
								usr.armor_eq=0
								usr.under=0
								usr.under_eq=0
								usr.helmet=0
								usr.helmet_eq=0
								usr.gloves=0
								usr.gloves_eq=0
								usr.z_sword=0
								usr.radar=0
								usr.hench_equiped=0
								usr.saiyan_equiped=0
								usr.sellable_items=0
								usr.weightgi = 0
								usr.weightcape = 0
								usr.weightarmor = 0
								usr.weightarm = 0
								usr.weightleg = 0
								usr.weightankle = 0
								usr.weightwrist = 0
								usr.weighthead = 0
								usr.f_armor=0
								O.suffix = null
								O.equiped=0
								usr.gitems =0
							if(usr.aura_on)usr.aura_on=0
							if(usr.sixteenitem)
								usr.powerlevel_max-=20000000
								usr.ki_max-=20000000
								usr.kidefense_max-=20000000
								usr.strength_max-=20000000
								usr.defence_max-=20000000
								usr.sixteenitem=0
							if(usr.supremeitem)
								usr.powerlevel_max-=30000000
								usr.ki_max-=30000000
								usr.kidefense_max-=30000000
								usr.strength_max-=30000000
								usr.defence_max-=30000000
								usr.supremeitem=0
							if(usr.evilitem)
								usr.strength_max-=100000000
								usr.evilitem=0
							if(usr.sauronitem)
								usr.defence_max-=10000000
								usr.strength_max-=10000000
								usr.powerlevel_max-=10000000
								usr.ki_max-=10000000
								usr.sauronitem=0
							if(usr.vegitoitem)
								usr.defence_max-=100000000
								usr.strength_max-=100000000
								usr.powerlevel_max-=100000000
								usr.ki_max-=100000000
								usr.vegitoitem=0
							if(usr.gokuitem)
								usr.defence_max-=500000000
								usr.strength_max-=500000000
								usr.powerlevel_max-=500000000
								usr.ki_max-=500000000
								usr.gokuitem=0
							if(usr.greenmonkitem)
								usr.stamina_max-=1000000
								usr.greenmonkitem=0
							if(usr.redmonkitem)
								usr.strength_max-=1500000000
								usr.redmonkitem=0
							if(usr.yellowmonkitem)
								usr.ki_max-=1500000000
								usr.yellowmonkitem=0
							if(usr.whitemonkitem)
								usr.powerlevel_max-=1500000000
								usr.whitemonkitem=0
							if(usr.greymonkitem)
								usr.defence_max-=1500000000
								usr.kidefense_max-=1500000000
								usr.greymonkitem=0
							if(usr.afk)usr.overlays+='afk.dmi'
							if(usr.majin)usr.overlays += 'Majin.dmi'
							if(usr.race == "Saiyan" && usr.has_tail)usr.overlays += 'Tail.dmi'
							if(usr.race=="Saiyan"||usr.race=="Half Saiyan"&&usr.Oozaru)
								if(usr.form_5&&!usr.form_6&&usr.rage_chromosome&&usr.powerlevel_max>=3500000)
									usr.icon = 'GOozaru2.dmi'
									usr.icon_state = ""
									usr.overlays += new/obj/techs/Overlays/GOozaru_top
								else
									usr.icon = 'Oozaru.dmi'
									usr.icon_state = ""
									usr.overlays += new/obj/techs/Overlays/Oozaru_top
							usr<<"\white Robot: You are now back to normal."
							usr.talking=0
							return
						if("Rest/Fly/IT")
							usr.density = 1
							usr.boxing = 0
							usr.buku = 0
							usr.doing = 0
							usr.frozen = 0
							usr.powering = 0
							usr.buku_lock = 0
							usr.icon_state = ""
							usr.charging = 0
							usr.attack_lock	= 0
							usr.ki_lock	= 0
							usr.it_lock	= 0
							usr.buku_lock = 0
							usr.playing = 0
							usr.buku_lock = 0
							usr.grav = 0
							usr.rest=0
							usr.hiting = 0
							usr.dualtrain = 0
							usr.dt_delay = 0
							usr.it_blocked=0
							usr<<"\white Robot: You now should be able to do things normally."
							usr.talking=0
							return
						if("Dead on Earth")
							usr.charging = 0
							usr.icon_state = ""
							usr.overlays -= 'Halo.dmi'
							usr.overlays -= 'Halo.dmi'
							usr.overlays -= 'Halo.dmi'
							usr.dead = 0
							usr.density = 1
							usr.boxing = 0
							usr.buku = 0
							usr.doing = 0
							usr.frozen = 0
							usr.powering = 0
							usr.buku_lock = 0
							usr.icon_state = ""
							usr.charging = 0
							usr.attack_lock	= 0
							usr.ki_lock	= 0
							usr.it_lock	= 0
							usr.buku_lock = 0
							usr.playing = 0
							usr.buku_lock = 0
							usr.grav = 0
							usr.hiting = 0
							usr.dualtrain = 0
							usr.dt_delay = 0
							usr.it_blocked=0
							usr<<"\white Robot: You are now alive."
							usr.talking=0
							return
