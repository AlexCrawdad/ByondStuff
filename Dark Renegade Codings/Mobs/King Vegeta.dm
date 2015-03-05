mob
	var
		gone_kidef_boost=0
		took_quest=0
		taking_quest=0
		enemies_killed=0
	NPC
		King_Vegeta
			name = "{NPC}King Vegeta"
			icon_state = "King Vegeta"
			safe = 1
			New()
				..()
				src.AddName()
			verb
				Talk()
					set src in oview(2)
					set category = null
					if(usr.talking || usr.fused)return
					usr.talking=1
					switch(alert("What can I do for you?","","Learn Techniques","Quest","Never Mind"))
						if("Never Mind")
							usr.talking=0
							return
						if("Quest")
							if(!usr.taking_quest)
								usr<<"\white King Vegeta: Hm...I can give you good ki defense training..."
								sleep(30)
								usr<<"\white King Vegeta: ...But, only if you killed 25 enemies!"
								sleep(30)
								usr<<"\white King Vegeta: Got what it takes?"
								switch(alert("Take King Vegeta's Quest?","","Yes","No"))
									if("Yes")
										usr<<"\white King Vegeta: Eh, I like your spirit!"
										sleep(30)
										usr<<"\white King Vegeta: Go and kill 25 enemies for me!"
										sleep(30)
										usr<< "\white King Vegeta: And you'll be rewarded!"
										usr.contents += new/obj/Quests/KingVegeta/Enemies_Destruction
										usr.taking_quest=1
										usr.talking=0
										return
									if("No")
										usr <<"\white King Vegeta: Coward!!!"
										usr.talking=0
										return
							if(usr.taking_quest && !usr.took_quest)
								usr<<"\white King Vegeta: You have not killed all 25 enemies yet!"
								sleep(30)
								usr<<"\white King Vegeta: Go back and do your task!"
								usr.talking=0
								return
							if(usr.taking_quest && usr.took_quest)
								if(usr.gone_kidef_boost)
									usr<<"\white King Vegeta: I already gave you your training!"
									usr.talking=0
									return
								else
									switch(input("Are you sure you want to take this training now, [usr]?")in list("No","Yes"))
										if("No")
											usr<<"\white King Vegeta: Mhmm, you wish to train with me later? Very wise, [usr]!"
											usr.talking=0
											return
										else
											usr<<"\white King Vegeta: Eh, good job, [usr]!"
											sleep(30)
											usr<<"\white King Vegeta: There you go, [usr]!"
											sleep(30)
											usr.gone_kidef_boost=1
											usr.icon_state = "enrage"
											usr.kidefense_max *= 2
											sleep(30)
											for(var/obj/Quests/KingVegeta/Enemies_Destruction/Q)del(Q)
											usr.icon_state = ""
											usr<<"\white King Vegeta: Your training has been completed!"
											usr.talking=0
											return
						if("Learn Techniques")
							if(usr.level>=4500)
								if(!usr.learn_replacement)
									usr.learn_replacement=1
									usr.contents+=new/obj/Technique/Replace_ment
									usr<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Replacement."
									usr<<"\white King Vegeta: You now can trick your enemies by switching with them!"
									usr.talking=0
									return
								else
									usr<<"\white King Vegeta: Go and trick those enemies!!!"
									usr.talking=0
									return
							else
								usr<<"\white King Vegeta: Train more, you're not strong enough!"
								usr.talking=0
								return
obj/Quests/KingVegeta
	Enemies_Destruction
		name = "Enemies_Destruction"
		icon = 'Skills.dmi'
		icon_state = "ki"
		density = 0
		verb
			View_Quest()
				set category = null
				var/examine_sensu = {"<body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=492 id=AutoNumber1 height=210>
  <tr>
    <td colspan=2 rowspan="4"><div align="center"><font face=Tahoma color=#FF0000><img src="http://i220.photobucket.com/albums/dd55/dark5alex/kingvegeta.jpg"></font></div></td>
    <td height=18 colspan=2><font face=Tahoma color=#FF0000>Quest: [src]
      </font></td>
  </tr>
  <tr>
    <td width=79><font size=1 color=red face=Tahoma>Objective:</font></td>
    <td width=143 height=12><font size=1><font face=Tahoma>Find any 25 enemies and kill them!</font></font></td>
  </tr>
  <tr>
    <td width=79><font face=Tahoma size=1 color=#FF0000>Reward</font><font size=1 color=red face=Tahoma>:</font></td>
    <td width=143 height=12><font face=Tahoma size=1>Ki Defense Training (Set boost)</font></td>
  </tr>
  <tr>
    <td width=79><font face=Tahoma size=1 color=#FF0000>Quest Giver:</font></td>
    <td width=143 height=12><font face=Tahoma size=1>King Vegeta</font></td>
  </tr>
  <tr>
    <td colspan=4 height=48><font face=Tahoma size=1>Hello, loyalist! I've this awesome training
      that may help you reach your potential even faster! In order to do my training properly,
      you must go and kill 25 enemies first! Got what it takes?!</font></td>
  </tr>
</table>
"}
				usr << browse(examine_sensu,"window=Hench;size=550x350;border=0;can_resize=0; can_minimize=0;")
			Abandon_Quest()
				set category = null
				switch(alert("Do you wish to abandon the Quest: [src]?","Abandon Quest","Yes","No"))
					if("Yes")
						if(usr.took_quest)
							usr<<"You already finished this quest, go talk to King Vegeta!"
							return
						else
							usr.taking_quest = 0
							del(src)
					if("No")return