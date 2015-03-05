obj/Equipment/Green_Drop_1
	var/crystal_stored=0
	name="Green Crystal"
	icon='Green Crystal.dmi'
	verb
		Add_Training_Points()
			set category=null
			var/pboost=round(usr.level*2)
			usr<<"<B><font color=green>Training Points: +[applycommas(pboost)]</font></b>"
			usr.tp+=pboost
			del(src)
		Pick_Up()
			set src in oview(0)
			set category=null
			if(Move(usr))
				usr<<"You pick up the [src]."
				usr.inven_min++
				crystal_stored=1
				crystal_event_count--
			else
				usr<<"You cannot pick up the [src]."
		Examine()
			set category=null
			var/examine_info={"<head><title>[name]</title></head><body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=250 id=AutoNumber1 height=95>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Trait</font><font size=1 color=red face=Tahoma>:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>Equipment</font></td>
  </tr>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Owner:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>[usr]</font></b></td>
  </tr>
  <tr>
    <td width=273 colspan=2 height=48><font face=Tahoma size=1>An item that gives you tps!</font></td>
  </tr></table>"}
			usr<<browse(examine_info,"window=Hench;size=300x275;border=0;can_resize=0;can_minimize=0;")
obj/Equipment/Green_Drop_2
	var/crystal_stored=0
	name="Green Crystal"
	icon='Green Crystal.dmi'
	verb
		Add_Powerlevel_Bonus()
			set category=null
			var/pboost=round(50)
			usr<<"<B><font color=green>Powerlevel Bonus: +[applycommas(pboost)]</font></b>"
			usr.power_bonus+=pboost
			del(src)
		Pick_Up()
			set src in oview(0)
			set category=null
			if(Move(usr))
				usr<<"You pick up the [src]."
				usr.inven_min++
				crystal_stored=1
				crystal_event_count--
			else
				usr<<"You cannot pick up the [src]."
		Examine()
			set category=null
			var/examine_info={"<head><title>[name]</title></head><body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=250 id=AutoNumber1 height=95>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Trait</font><font size=1 color=red face=Tahoma>:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>Equipment</font></td>
  </tr>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Owner:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>[usr]</font></b></td>
  </tr>
  <tr>
    <td width=273 colspan=2 height=48><font face=Tahoma size=1>An item that gives you powerlevel!</font></td>
  </tr></table>"}
			usr<<browse(examine_info,"window=Hench;size=300x275;border=0;can_resize=0;can_minimize=0;")
obj/Equipment/Green_Drop_3
	var/crystal_stored=0
	name="Green Crystal"
	icon='Green Crystal.dmi'
	verb
		Boost_All_Stats()
			set category=null
			var/pboost=round(usr.level*10)
			usr<<"<B><font color=green>All Stats: +[applycommas(pboost)]</font></b>"
			usr.powerlevel_max+=pboost
			usr.powerlevel+=pboost
			usr.ki_max+=pboost
			usr.ki+=pboost
			usr.kidefense_max+=pboost
			usr.kidefense+=pboost
			usr.strength_max+=pboost
			usr.strength+=pboost
			usr.defence_max+=pboost
			usr.defence+=pboost
			del(src)
		Pick_Up()
			set src in oview(0)
			set category=null
			if(Move(usr))
				usr<<"You pick up the [src]."
				usr.inven_min++
				crystal_stored=1
				crystal_event_count--
			else
				usr<<"You cannot pick up the [src]."
		Examine()
			set category=null
			var/examine_info={"<head><title>[name]</title></head><body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=250 id=AutoNumber1 height=95>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Trait</font><font size=1 color=red face=Tahoma>:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>Equipment</font></td>
  </tr>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Owner:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>[usr]</font></b></td>
  </tr>
  <tr>
    <td width=273 colspan=2 height=48><font face=Tahoma size=1>An item that gives you all stats!</font></td>
  </tr></table>"}
			usr<<browse(examine_info,"window=Hench;size=300x275;border=0;can_resize=0;can_minimize=0;")
obj/Equipment/Orange_Drop_1
	var/crystal_stored=0
	name="Orange Crystal"
	icon='Orange Crystal.dmi'
	verb
		Add_Training_Points()
			set category=null
			var/pboost=round(usr.level*2)
			usr<<"<B><font color=green>Training Points: +[applycommas(pboost)]</font></b>"
			usr.tp+=pboost
			del(src)
		Pick_Up()
			set src in oview(0)
			set category=null
			if(Move(usr))
				usr<<"You pick up the [src]."
				usr.inven_min++
				crystal_stored=1
				crystal_event_count--
			else
				usr<<"You cannot pick up the [src]."
		Examine()
			set category=null
			var/examine_info={"<head><title>[name]</title></head><body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=250 id=AutoNumber1 height=95>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Trait</font><font size=1 color=red face=Tahoma>:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>Equipment</font></td>
  </tr>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Owner:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>[usr]</font></b></td>
  </tr>
  <tr>
    <td width=273 colspan=2 height=48><font face=Tahoma size=1>An item that gives you tps!</font></td>
  </tr></table>"}
			usr<<browse(examine_info,"window=Hench;size=300x275;border=0;can_resize=0;can_minimize=0;")
obj/Equipment/Orange_Drop_2
	var/crystal_stored=0
	name="Orange Crystal"
	icon='Orange Crystal.dmi'
	verb
		Add_Ki_Bonus()
			set category=null
			var/pboost=round(50)
			usr<<"<B><font color=green>Ki Bonus: +[applycommas(pboost)]</font></b>"
			usr.ki_bonus+=pboost
			del(src)
		Pick_Up()
			set src in oview(0)
			set category=null
			if(Move(usr))
				usr<<"You pick up the [src]."
				usr.inven_min++
				crystal_stored=1
				crystal_event_count--
			else
				usr<<"You cannot pick up the [src]."
		Examine()
			set category=null
			var/examine_info={"<head><title>[name]</title></head><body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=250 id=AutoNumber1 height=95>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Trait</font><font size=1 color=red face=Tahoma>:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>Equipment</font></td>
  </tr>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Owner:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>[usr]</font></b></td>
  </tr>
  <tr>
    <td width=273 colspan=2 height=48><font face=Tahoma size=1>An item that gives you ki!</font></td>
  </tr></table>"}
			usr<<browse(examine_info,"window=Hench;size=300x275;border=0;can_resize=0;can_minimize=0;")
obj/Equipment/Orange_Drop_3
	var/crystal_stored=0
	name="Orange Crystal"
	icon='Orange Crystal.dmi'
	verb
		Boost_All_Stats()
			set category=null
			var/pboost=round(usr.level*10)
			usr<<"<B><font color=green>All Stats: +[applycommas(pboost)]</font></b>"
			usr.powerlevel_max+=pboost
			usr.powerlevel+=pboost
			usr.ki_max+=pboost
			usr.ki+=pboost
			usr.kidefense_max+=pboost
			usr.kidefense+=pboost
			usr.strength_max+=pboost
			usr.strength+=pboost
			usr.defence_max+=pboost
			usr.defence+=pboost
			del(src)
		Pick_Up()
			set src in oview(0)
			set category=null
			if(Move(usr))
				usr<<"You pick up the [src]."
				usr.inven_min++
				crystal_stored=1
				crystal_event_count--
			else
				usr<<"You cannot pick up the [src]."
		Examine()
			set category=null
			var/examine_info={"<head><title>[name]</title></head><body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=250 id=AutoNumber1 height=95>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Trait</font><font size=1 color=red face=Tahoma>:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>Equipment</font></td>
  </tr>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Owner:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>[usr]</font></b></td>
  </tr>
  <tr>
    <td width=273 colspan=2 height=48><font face=Tahoma size=1>An item that gives you all stats!</font></td>
  </tr></table>"}
			usr<<browse(examine_info,"window=Hench;size=300x275;border=0;can_resize=0;can_minimize=0;")
obj/Equipment/Purple_Drop_1
	var/crystal_stored=0
	name="Purple Crystal"
	icon='Purple Crystal.dmi'
	verb
		Add_Training_Points()
			set category=null
			var/pboost=round(usr.level*2)
			usr<<"<B><font color=green>Training Points: +[applycommas(pboost)]</font></b>"
			usr.tp+=pboost
			del(src)
		Pick_Up()
			set src in oview(0)
			set category=null
			if(Move(usr))
				usr<<"You pick up the [src]."
				usr.inven_min++
				crystal_stored=1
				crystal_event_count--
			else
				usr<<"You cannot pick up the [src]."
		Examine()
			set category=null
			var/examine_info={"<head><title>[name]</title></head><body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=250 id=AutoNumber1 height=95>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Trait</font><font size=1 color=red face=Tahoma>:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>Equipment</font></td>
  </tr>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Owner:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>[usr]</font></b></td>
  </tr>
  <tr>
    <td width=273 colspan=2 height=48><font face=Tahoma size=1>An item that gives you tps!</font></td>
  </tr></table>"}
			usr<<browse(examine_info,"window=Hench;size=300x275;border=0;can_resize=0;can_minimize=0;")
obj/Equipment/Purple_Drop_2
	var/crystal_stored=0
	name="Purple Crystal"
	icon='Purple Crystal.dmi'
	verb
		Add_Ki_Bonus()
			set category=null
			var/pboost=round(50)
			usr<<"<B><font color=green>Ki Bonus: +[applycommas(pboost)]</font></b>"
			usr.ki_bonus+=pboost
			del(src)
		Pick_Up()
			set src in oview(0)
			set category=null
			if(Move(usr))
				usr<<"You pick up the [src]."
				usr.inven_min++
				crystal_stored=1
				crystal_event_count--
			else
				usr<<"You cannot pick up the [src]."
		Examine()
			set category=null
			var/examine_info={"<head><title>[name]</title></head><body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=250 id=AutoNumber1 height=95>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Trait</font><font size=1 color=red face=Tahoma>:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>Equipment</font></td>
  </tr>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Owner:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>[usr]</font></b></td>
  </tr>
  <tr>
    <td width=273 colspan=2 height=48><font face=Tahoma size=1>An item that gives you defence!</font></td>
  </tr></table>"}
			usr<<browse(examine_info,"window=Hench;size=300x275;border=0;can_resize=0;can_minimize=0;")
obj/Equipment/Purple_Drop_3
	var/crystal_stored=0
	name="Purple Crystal"
	icon='Purple Crystal.dmi'
	verb
		Boost_All_Stats()
			set category=null
			var/pboost=round(usr.level*10)
			usr<<"<B><font color=green>All Stats: +[applycommas(pboost)]</font></b>"
			usr.powerlevel_max+=pboost
			usr.powerlevel+=pboost
			usr.ki_max+=pboost
			usr.ki+=pboost
			usr.kidefense_max+=pboost
			usr.kidefense+=pboost
			usr.strength_max+=pboost
			usr.strength+=pboost
			usr.defence_max+=pboost
			usr.defence+=pboost
			del(src)
		Pick_Up()
			set src in oview(0)
			set category=null
			if(Move(usr))
				usr<<"You pick up the [src]."
				usr.inven_min++
				crystal_stored=1
				crystal_event_count--
			else
				usr<<"You cannot pick up the [src]."
		Examine()
			set category=null
			var/examine_info={"<head><title>[name]</title></head><body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=250 id=AutoNumber1 height=95>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Trait</font><font size=1 color=red face=Tahoma>:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>Equipment</font></td>
  </tr>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Owner:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>[usr]</font></b></td>
  </tr>
  <tr>
    <td width=273 colspan=2 height=48><font face=Tahoma size=1>An item that gives you all stats!</font></td>
  </tr></table>"}
			usr<<browse(examine_info,"window=Hench;size=300x275;border=0;can_resize=0;can_minimize=0;")
obj/Equipment/Red_Drop_1
	var/crystal_stored=0
	name="Red Crystal"
	icon='Red Crystal.dmi'
	verb
		Add_Training_Points()
			set category=null
			var/pboost=round(usr.level/2)
			usr<<"<B><font color=green>Training Points: +[applycommas(pboost)]</font></b>"
			usr.tp+=pboost
			del(src)
		Pick_Up()
			set src in oview(0)
			set category=null
			if(Move(usr))
				usr<<"You pick up the [src]."
				usr.inven_min++
				crystal_stored=1
				crystal_event_count--
			else
				usr<<"You cannot pick up the [src]."
		Examine()
			set category=null
			var/examine_info={"<head><title>[name]</title></head><body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=250 id=AutoNumber1 height=95>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Trait</font><font size=1 color=red face=Tahoma>:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>Equipment</font></td>
  </tr>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Owner:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>[usr]</font></b></td>
  </tr>
  <tr>
    <td width=273 colspan=2 height=48><font face=Tahoma size=1>An item that gives you tps!</font></td>
  </tr></table>"}
			usr<<browse(examine_info,"window=Hench;size=300x275;border=0;can_resize=0;can_minimize=0;")
obj/Equipment/Red_Drop_2
	var/crystal_stored=0
	name="Red Crystal"
	icon='Red Crystal.dmi'
	verb
		Add_Strength_Bonus()
			set category=null
			var/pboost=round(50)
			usr<<"<B><font color=green>Strength Bonus: +[applycommas(pboost)]</font></b>"
			usr.strength_bonus+=pboost
			del(src)
		Pick_Up()
			set src in oview(0)
			set category=null
			if(Move(usr))
				usr<<"You pick up the [src]."
				usr.inven_min++
				crystal_stored=1
				crystal_event_count--
			else
				usr<<"You cannot pick up the [src]."
		Examine()
			set category=null
			var/examine_info={"<head><title>[name]</title></head><body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=250 id=AutoNumber1 height=95>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Trait</font><font size=1 color=red face=Tahoma>:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>Equipment</font></td>
  </tr>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Owner:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>[usr]</font></b></td>
  </tr>
  <tr>
    <td width=273 colspan=2 height=48><font face=Tahoma size=1>An item that gives you strength!</font></td>
  </tr></table>"}
			usr<<browse(examine_info,"window=Hench;size=300x275;border=0;can_resize=0;can_minimize=0;")
obj/Equipment/Red_Drop_3
	var/crystal_stored=0
	name="Red Crystal"
	icon='Red Crystal.dmi'
	verb
		Boost_All_Stats()
			set category=null
			var/pboost=round(usr.level)
			usr<<"<B><font color=green>All Stats: +[applycommas(pboost)]</font></b>"
			usr.powerlevel_max+=pboost
			usr.powerlevel+=pboost
			usr.ki_max+=pboost
			usr.ki+=pboost
			usr.kidefense_max+=pboost
			usr.kidefense+=pboost
			usr.strength_max+=pboost
			usr.strength+=pboost
			usr.defence_max+=pboost
			usr.defence+=pboost
			del(src)
		Pick_Up()
			set src in oview(0)
			set category=null
			if(Move(usr))
				usr<<"You pick up the [src]."
				usr.inven_min++
				crystal_stored=1
				crystal_event_count--
			else
				usr<<"You cannot pick up the [src]."
		Examine()
			set category=null
			var/examine_info={"<head><title>[name]</title></head><body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=250 id=AutoNumber1 height=95>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Trait</font><font size=1 color=red face=Tahoma>:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>Equipment</font></td>
  </tr>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Owner:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>[usr]</font></b></td>
  </tr>
  <tr>
    <td width=273 colspan=2 height=48><font face=Tahoma size=1>An item that gives you all stats!</font></td>
  </tr></table>"}
			usr<<browse(examine_info,"window=Hench;size=300x275;border=0;can_resize=0;can_minimize=0;")
obj/Equipment/Yellow_Drop_1
	var/crystal_stored=0
	name="Yellow Crystal"
	icon='Yellow Crystal.dmi'
	verb
		Add_Training_Points()
			set category=null
			var/pboost=round(usr.level*2)
			usr<<"<B><font color=green>Training Points: +[applycommas(pboost)]</font></b>"
			usr.tp+=pboost
			del(src)
		Pick_Up()
			set src in oview(0)
			set category=null
			if(Move(usr))
				usr<<"You pick up the [src]."
				usr.inven_min++
				crystal_stored=1
				crystal_event_count--
			else
				usr<<"You cannot pick up the [src]."
		Examine()
			set category=null
			var/examine_info={"<head><title>[name]</title></head><body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=250 id=AutoNumber1 height=95>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Trait</font><font size=1 color=red face=Tahoma>:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>Equipment</font></td>
  </tr>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Owner:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>[usr]</font></b></td>
  </tr>
  <tr>
    <td width=273 colspan=2 height=48><font face=Tahoma size=1>An item that gives you tps!</font></td>
  </tr></table>"}
			usr<<browse(examine_info,"window=Hench;size=300x275;border=0;can_resize=0;can_minimize=0;")
obj/Equipment/Yellow_Drop_2
	var/crystal_stored=0
	name="Yellow Crystal"
	icon='Yellow Crystal.dmi'
	verb
		Add_Defence_Bonus()
			set category=null
			var/pboost=round(50)
			usr<<"<B><font color=green>Defence Bonus: +[applycommas(pboost)]</font></b>"
			usr.defence_bonus+=pboost
			del(src)
		Pick_Up()
			set src in oview(0)
			set category=null
			if(Move(usr))
				usr<<"You pick up the [src]."
				usr.inven_min++
				crystal_stored=1
				crystal_event_count--
			else
				usr<<"You cannot pick up the [src]."
		Examine()
			set category=null
			var/examine_info={"<head><title>[name]</title></head><body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=250 id=AutoNumber1 height=95>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Trait</font><font size=1 color=red face=Tahoma>:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>Equipment</font></td>
  </tr>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Owner:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>[usr]</font></b></td>
  </tr>
  <tr>
    <td width=273 colspan=2 height=48><font face=Tahoma size=1>An item that gives you defence!</font></td>
  </tr></table>"}
			usr<<browse(examine_info,"window=Hench;size=300x275;border=0;can_resize=0;can_minimize=0;")
obj/Equipment/Yellow_Drop_3
	var/crystal_stored=0
	name="Yellow Crystal"
	icon='Yellow Crystal.dmi'
	verb
		Add_Defence_Bonus()
			set category=null
			var/pboost=round(50)
			usr<<"<B><font color=green>Defence Bonus: +[applycommas(pboost)]</font></b>"
			usr.defence_bonus+=pboost
			del(src)
		Pick_Up()
			set src in oview(0)
			set category=null
			if(Move(usr))
				usr<<"You pick up the [src]."
				usr.inven_min++
				crystal_stored=1
				crystal_event_count--
			else
				usr<<"You cannot pick up the [src]."
		Examine()
			set category=null
			var/examine_info={"<head><title>[name]</title></head><body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=250 id=AutoNumber1 height=95>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Trait</font><font size=1 color=red face=Tahoma>:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>Equipment</font></td>
  </tr>
  <tr>
    <td width=273 height=12><font face=Tahoma size=1 color=#FF0000>Owner:</font></b></td>
    <td width=174 height=12><font face=Tahoma size=1>[usr]</font></b></td>
  </tr>
  <tr>
    <td width=273 colspan=2 height=48><font face=Tahoma size=1>An item that gives you defence!</font></td>
  </tr></table>"}
			usr<<browse(examine_info,"window=Hench;size=300x275;border=0;can_resize=0;can_minimize=0;")