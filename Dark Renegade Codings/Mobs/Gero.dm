mob
	var
		gero_quest_taking=0
		gero_quest_took=0
		gero_converted=0
		android_16_killed=0
		android_17_killed=0
		android_18_killed=0
	NPC
		Dr_Gero
			name = "{NPC}Dr. Gero"
			icon_state = "Dr.Gero"
			density = 1
			it_blocked=1
			race = "Android"
			karma = "Evil"
			New()
				..()
				src.AddName()
			verb
				Talk()
					set src in oview(2)
					set category = null
					if(usr.talking || usr.fused)return
					usr.talking=1
					if(usr.race == "Android")
						if(!usr.learn_ssdeadlybomber)
							switch(input("Dr Gero: What do you need [usr]?")in list("Download Skill","Nothing"))
								if("Download Skill")
									if(usr.level >= 300 && usr.chips >= 3)
										usr<<"<font color=white>Downloading the new skill into your system..."
										usr.frozen = 1
										usr.sight |= BLIND
										sleep(50)
										usr.frozen = 0
										usr.sight &= ~BLIND
										usr.contents+=new/obj/Technique/SSDeadlyBomber
										sleep(1)
										usr <<"<font color=white>Skill downloaded successfully."
										usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> SS Deadly Bomber."
										usr.frozen = 0
										usr.learn_ssdeadlybomber=1
										usr.talking=0
										return
									else
										usr<<"<font color=white>Error:</font> Hardware not compatible..."
										usr.talking=0
										return
								if("Nothing")
									usr.talking=0
									return
						else
							usr<<"<font color=white>Dr.Gero:</font> How's my test subject doing so far?"
							usr.talking=0
							return
					if(usr.race=="Human")
						if(!usr.gero_quest_taking)
							usr<<"\white Dr. Gero:\font Why, what do we have here...? A human!"
							sleep(30)
							usr<<"\white Dr. Gero:\font You'll be just perfect specimen for my experiment!"
							sleep(30)
							usr <<"\white Dr. Gero: \font Want to be a part of my experiment?"
							switch(input("Cyborg Convertion?")in list("Yes","No"))
								if("No")
									usr<<"\white Dr. Gero: \font Get out of here, you filthy creature!"
									usr.talking=0
									return
								if("Yes")
									usr<<"\white Dr. Gero: \font Good choice! But, I need you to kill Androids 16, 17, and 18..."
									sleep(30)
									usr<<"\white Dr. Gero: \font In order for this convertion to work!"
									sleep(30)
									usr<<"\white Dr. Gero: \font Got the guts to do it?"
									switch(alert("Take Dr. Gero's Quest?","","Yes","No"))
										if("Yes")
											usr<<"\white Dr. Gero: \font Again, GOOD CHOICE!"
											sleep(30)
											usr<<"\white Dr. Gero: \font Go and kill Androids 16, 17, and 18!"
											sleep(30)
											usr<< "\white Dr. Gero: \font And come back!!!"
											usr.gero_quest_taking=1
											usr.contents += new/obj/Quests/Gero/Destruction_of_Androids
											usr.talking=0
											return
										if("No")
											usr <<"\white Dr. Gero: \font You'll be back..."
											usr.talking=0
											return
						if(usr.gero_quest_taking && !usr.gero_quest_took)
							usr<<"\white Dr. Gero: \font You still hasn't kill all of androids!"
							usr.talking=0
							return
						if(usr.gero_quest_taking && usr.gero_quest_took)
							if(usr.gero_converted)
								usr<<"\white Dr. Gero: \font Enjoy your new strong power!"
								usr.talking=0
								return
							else
								usr<<"\white Dr. Gero: \font Ah, thank you for eliminating those pests!"
								sleep(30)
								usr<<"\white Dr. Gero: \font For that, I'm more than glad to convert you into a powerful killing machine!"
								sleep(30)
								usr<<"\white Dr. Gero: \font Would you like that?"
								switch(input("Cyborg Convertion?")in list("Yes","No"))
									if("No")
										usr<<"\white Dr. Gero: \font Ah, perhaps later is best?"
										usr.talking=0
										return
									if("Yes")
										if(usr.potara_fused)
											usr<<"\white Dr. Gero: \font Erm, it may looks like you already potara'd! I simply cannot do this anymore!"
											usr.talking=0
											return
										usr.icon_state="enrage"
										usr<<"\white Dr. Gero: \font Yes... That's it..."
										usr.sight |= BLIND
										usr.doing=1
										usr.frozen=1
										sleep(600)
										if(!usr)return
										usr.powerlevel_max*=1.5
										usr.ki_max*=1.5
										usr.kidefense_max*=1.5
										usr.strength_max*=1.5
										usr.defence_max*=1.5
										usr.powerlevel=usr.powerlevel_max
										usr.ki=usr.ki_max
										usr.kidefense=usr.kidefense_max
										usr.strength=usr.strength_max
										usr.defence=usr.defence_max
										usr.speed_max=1000
										usr.speed=1000
										usr.icon='Cyborg.dmi'
										usr.icon_state=""
										usr.doing=0
										usr.frozen=0
										usr<<"\white Dr. Gero: \font Perfect! A complete success!"
										usr.sight &= ~BLIND
										usr.gero_converted=1
										for(var/obj/Quests/Gero/Destruction_of_Androids/Q)del(Q)
										usr.talking=0
										return
					else
						usr<<"<font color=white>Dr Gero:</font> Get out of here you filthy creature!"
						usr.talking=0
						return
obj/Quests/Gero
	Destruction_of_Androids
		name = "Destruction of Androids"
		icon = 'Skills.dmi'
		icon_state = "critical"
		density = 0
		verb
			View_Quest()
				set category = null
				var/examine_sensu = {"<body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=492 id=AutoNumber1 height=210>
  <tr>
    <td colspan=2 rowspan="4"><div align="center"><font face=Tahoma color=#FF0000><img src="http://i220.photobucket.com/albums/dd55/dark5alex/drgero-android202.jpg"></font></div></td>
    <td height=18 colspan=2><font face=Tahoma color=#FF0000>Quest: [src]
      </font></td>
  </tr>
  <tr>
    <td width=79><font size=1 color=red face=Tahoma>Objective:</font></td>
    <td width=143 height=12><font size=1><font face=Tahoma>Find Androids 16, 17, and 18 and kill them!</font></font></td>
  </tr>
  <tr>
    <td width=79><font face=Tahoma size=1 color=#FF0000>Reward</font><font size=1 color=red face=Tahoma>:</font></td>
    <td width=143 height=12><font face=Tahoma size=1>Convertion (Set boost)</font></td>
  </tr>
  <tr>
    <td width=79><font face=Tahoma size=1 color=#FF0000>Quest Giver:</font></td>
    <td width=143 height=12><font face=Tahoma size=1>Dr.Gero</font></td>
  </tr>
  <tr>
    <td colspan=4 height=48><font face=Tahoma size=1>Hello, specimen! You see,
      I have an experiment that will be a breakthrough in my research! Although, this experiment requires
      you to kill Androids and obtain their data's. Will you do that for me and in
      return, I'll do my best to make you a better killing machine!</font></td>
  </tr>
</table>
"}
				usr << browse(examine_sensu,"window=Hench;size=550x350;border=0;can_resize=0; can_minimize=0;")
			Abandon_Quest()
				set category = null
				switch(alert("Do you wish to abandon the Quest: [src]?","Abandon Quest","Yes","No"))
					if("Yes")
						if(usr.gero_quest_took)
							usr<<"You already finished this quest, go talk to Dr.Gero!"
							return
						usr.gero_quest_taking = 0
						del(src)
					if("No")return