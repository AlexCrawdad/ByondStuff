mob/var/demonic = 0
mob/var/gone_demonic = 0
mob
	NPC
		Jenemba
			icon_state = "Jenemba"
			name = "{NPC}Jenemba"
			density=1
			safe=1
			it_blocked=1
			New()
				..()
				src.AddName()
			verb
				Talk()
					set category = null
					set src in oview(1)
					if(src.owner!=usr)
						usr<<"Jenemba is training with [src.owner]."
						return
					if(src.doing)
						usr<<"Jenemba is training at the moment."
						return
					if(usr.d_sword_quest)
						if(usr.karma == "Evil" && usr.karma_rating >= 50)
							if(usr.race == "Half Saiyan" && usr.powerlevel_max >= 20000000 && usr.gene_demonic)
								if(!usr.gone_demonic)
									src.doing = 1
									usr << "<font color = red>Jenemba:</font> There is no possible way!"
									sleep(25)
									usr << "<font color = red>Jenemba:</font> Your able to control the power from my blade?"
									sleep(25)
									usr << "<font color = red>Jenemba:</font> Hmm... But not very well I see. Tell you what, since i despise this world, I shall train you to grasp what power you can from my blade."
									sleep(25)
									usr << "<font color = red>Jenemba:</font> With alittle luck, theres a chance you will be able to channel the blades power into yourself. Now, Shall we begin?"
									sleep(10)
									switch(alert("Allow Jenemba to train you?(Training takes 30 minutes)","","Yes","No"))
										if("Yes")
											if(usr.doing)
												return
											usr.demonic = 1
											usr.doing=1
											usr << "<font color = red>Jenemba:</font> Exellent.. Now sit your ass down and lets begin."
											spawn(1)usr.HalfSaiyanRevert()
											sleep(30)
											if(!usr)
												del(src)
												return
											usr.frozen=1
											usr.doing=1
											usr.safe=1
											usr.gone_demonic=1
											usr.icon_state="rest"
											usr << "\red You feel some of your true power begin to flow through you..."
											sleep(9000)
											if(!usr)
												del(src)
												return
											usr << "\red You feel some of your true power begin to flow through you..."
											usr.powerlevel_max+=usr.powerlevel_max*1.2
											usr.ki_max+=usr.ki_max*1.2
											usr.strength_max+=usr.strength_max*1.2
											usr.defence_max+=usr.defence_max*1.2
											usr.kidefense_max+=usr.kidefense_max*1.2
											sleep(9000)
											if(!usr)
												del(src)
												return
											usr << "\white The ground shakes as the Demonic Power flows through you..."
											Explode(new/Effect/BasicBoom(src.loc,1,4))
											usr.frozen = 0
											usr.safe = 0
											usr.speed_max-=2000
											if(usr.speed_max<1000)
												usr.speed_max=1000
											usr.powerlevel = usr.powerlevel_max
											usr.ki = usr.ki_max
											usr.strength = usr.strength_max
											usr.defence = usr.defence_max
											usr.critical = usr.critical_max
											usr.dodge = usr.dodge_max
											usr.reflect = usr.reflect_max
											usr.block = usr.block_max
											usr << "<font color = red>Jenemba:</font> So, There is hope for you after all. Combining the powers of a Half Saiyan with the powers of my blade. Well Hell, Just when I had lost hope for this world.... Now go, and enslave everyone!"
											usr.doing = 0
											usr.frozen = 0
											usr.safe = 0
											usr.demonic = 1
											usr.form_1 = 1
											usr.form_2 = 1
											usr.form_3 = 1
											usr.form_4 = 1
											usr.form_5 = 1
											sleep(5)
											if(!usr)
												del(src)
												return
											spawn(1)usr.client.SaveChar()
											spawn(2)usr.DemonicHalfSaiyanTrans()
											sleep(20)
											del(src)
										if("No")
											usr.frozen = 0
											usr.safe = 0
											del(src)
											return
								else
									usr << "<font color = red>Jenemba:</font> Theres nothing more I can do for you."
									usr.frozen = 0
									usr.safe = 0
									usr.doing=0
									del(src)
									return
							else
								usr << "<font color = red>Jenemba:</font> You are not strong enough for this training."
								del(src)
								return
						else
							usr << "<font color = red>Jenemba:</font> I only help those that are pure evil."
							src.doing = 0
							del(src)
							return