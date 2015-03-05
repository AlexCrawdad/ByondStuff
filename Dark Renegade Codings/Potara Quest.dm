obj/Quests/Supreme_Kai
	Potara_Earring
		name="Potara Earring"
		icon='Skills.dmi'
		icon_state="unarmed"
		density=0
		verb
			View_Quest()
				set category = null
				var/examine_sensu = {"<body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=492 id=AutoNumber1 height=210>
  <tr>
    <td colspan=2 rowspan="4"><div align="center"><font face=Tahoma color=#FF0000><img src="http://i220.photobucket.com/albums/dd55/dark5alex/kai.png"></font></div></td>
    <td height=18 colspan=2><font face=Tahoma color=#FF0000>Quest: [src]
      </font></td>
  </tr>
  <tr>
    <td width=79><font size=1 color=red face=Tahoma>Objective:</font></td>
    <td width=143 height=12><font size=1><font face=Tahoma>Find and kill Shenron.</font></font></td>
  </tr>
  <tr>
    <td width=79><font face=Tahoma size=1 color=#FF0000>Reward</font><font size=1 color=red face=Tahoma>:</font></td>
    <td width=143 height=12><font face=Tahoma size=1>Potara (Item)</font></td>
  </tr>
  <tr>
    <td width=79><font face=Tahoma size=1 color=#FF0000>Quest Giver:</font></td>
    <td width=143 height=12><font face=Tahoma size=1>Supreme Kai</font></td>
  </tr>
  <tr>
    <td colspan=4 height=48><font face=Tahoma size=1>Hello, [usr]! It looks like you're
      raring to go and get stronger. I have just thing for you! But, there's a catch.
      You'll need to go and find Shenron. When you find him, please kill him for me.
      Once you complete that task, only, and only then can I provide you the <u>Potara Earring</u>!
      Got what it takes to be the strongest? I trust you can find that out by doing this quest of mine.
      Good luck, [usr]!</font></td>
  </tr>
</table>
"}
				usr<<browse(examine_sensu,"window=Hench;size=550x350;border=0;can_resize=0; can_minimize=0;")
			Abandon_Quest()
				set category = null
				switch(alert("Do you wish to abandon the Quest: [src]?","Abandon Quest","Yes","No"))
					if("Yes")
						if(usr.completed_potara_quest)
							usr<<"You already finished this quest, go talk to Supreme Kai!"
							return
						else
							usr.doing_potara_quest = 0
							del(src)
					if("No")return