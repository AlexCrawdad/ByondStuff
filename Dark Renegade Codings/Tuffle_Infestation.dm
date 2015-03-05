obj/Quests/Korin
	tuffle_infestation
		name = "Tuffle Infestation"
		icon = 'Skills.dmi'
		icon_state = "unarmed"
		density = 0
		suffix = "{Difficulty: Hard}"
		verb
			View_Quest()
				set category = null
				var/examine_sensu = {"<body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=492 id=AutoNumber1 height=210>
  <tr>
    <td colspan=2 rowspan="4"><div align="center"><font face=Tahoma color=#FF0000><img src=""></font></div></td>
    <td height=18 colspan=2><font face=Tahoma color=#FF0000>Quest: [src]
      </font></td>
  </tr>
  <tr>
    <td width=79><font size=1 color=red face=Tahoma>Objective:</font></td>
    <td width=143 height=12><font size=1><font face=Tahoma>Kill Tuffles </font></font></td>
  </tr>
  <tr>
    <td width=79><font face=Tahoma size=1 color=#FF0000>Reward</font><font size=1 color=red face=Tahoma>:</font></td>
    <td width=143 height=12><font face=Tahoma size=1>Levels</font></td>
  </tr>
  <tr>
    <td width=79><font face=Tahoma size=1 color=#FF0000>Quest Giver:</font></td>
    <td width=143 height=12><font face=Tahoma size=1>Korin</font></td>
  </tr>
  <tr>
    <td colspan=4 height=48><font face=Tahoma size=1>Hey, [usr]! Kill a few Tuffles for me, ok?</font></td>
  </tr>
</table>

"}
				usr<<browse(examine_sensu,"window=Hench;size=550x350;border=0;can_resize=0; can_minimize=0;")
			Abandon_Quest()
				set category=null
				switch(alert("Do you wish to abandon the Quest: [src]?","Abandon Quest","Yes","No"))
					if("Yes")
						if(usr.tuffle_kills>25)
							usr<<"You already finished this quest, go talk to Korin!"
							return
						else
							usr.korin_start=0
							del(src)
					if("No")return