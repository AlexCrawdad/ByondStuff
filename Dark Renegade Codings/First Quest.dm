obj/Quests/Goku
	First_Quest
		name="First Quest"
		icon='Skills.dmi'
		icon_state="unarmed"
		density=0
		verb
			View_Quest()
				set category=null
				var/examine_sensu={"<body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=492 id=AutoNumber1 height=210>
  <tr>
    <td colspan=2 rowspan="4"><div align="center"><font face ='Palatino Linotype'  color=#FF0000><img src="img src here"></font></div></td>
    <td height=18 colspan=2><font face ='Palatino Linotype'  color=#FF0000>Quest: [src]
      </font></td>
  </tr>
  <tr>
    <td width=79><font face ='Palatino Linotype'  size=1 color='#4d503b'> face=Tahoma>Objective:</font></td>
    <td width=143 height=12><font face ='Palatino Linotype'  size=1><font face ='Palatino Linotype' >Hit Master Roshis Turtle!</font></font></td>
  </tr>
  <tr>
    <td width=79><font face ='Palatino Linotype'  size=1 color=#FF0000>Reward</font><font face ='Palatino Linotype'  size=1 color='#4d503b'> face=Tahoma>:</font></td>
    <td width=143 height=12><font face ='Palatino Linotype'  size=1>Levels and Stats</font></td>
  </tr>
  <tr>
    <td width=79><font face ='Palatino Linotype'  size=1 color=#FF0000>Quest Giver:</font></td>
    <td width=143 height=12><font face ='Palatino Linotype'  size=1>Goku</font></td>
  </tr>
  <tr>
    <td colspan=4 height=48><font face ='Palatino Linotype'  size=1>Use Master Roshi's Boost Rock!</font></td>
  </tr>
</table>
"}
				usr<<browse(examine_sensu,"window=Hench;size=550x350;border=0;can_resize=0; can_minimize=0;")
			Abandon_Quest()
				set category=null
				switch(alert("Do you wish to abandon the Quest: [src]?","Abandon Quest","Yes","No"))
					if("Yes")
						if(usr.first_quest_complete)
							usr<<"You already finished this quest, go talk to Neon!"
							return
						else
							usr.first_quest_start=0
							del(src)
					if("No")return