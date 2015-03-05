mob/NPC/Dende
	icon_state = "Dende"
	name = "{NPC}Dende"
	density = 1
	safe = 1
	it_lock=1
	it_blocked=1
	New()
		..()
		src.AddName()
	verb/Talk()
		set category = null
		set src in oview(2)
		if(usr.talking || usr.fused)return
		usr.talking=1
		if(usr.powerlevel < usr.powerlevel_max)
			usr<<"<font color=white>Dende:</font> Oh [usr], those wounds look bad, let me heal you!"
			sleep(10)
			usr<<"<font color = #0066FF>Dende puts his hands on your head and you feel much better!"
			sleep(25)
			usr.powerlevel = usr.powerlevel_max
			usr<<"<font color=white>Dende:</font> There, I hope that helps you [usr]!"
			src.icon_state = "Dende"
			usr.talking=0
			return
		else
			usr<<"<font color=white>Dende:</font> How are you today, [usr]?"
			usr.talking=0
			return

