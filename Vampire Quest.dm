mob
	var
		killedpastvamps=0
		vampquestp1started=0

turf
	vampirequest
		pastdungeonentrance
			icon = 'Cliffs2.dmi'
			icon_state = "Cave"
			density=0
			Entered(mob/M)
				M.loc=locate(/turf/vampirequest/intopastdungeon)
		intopastdungeon
			density=0
		pastdungeonexit
			icon = 'Cliffs2.dmi'
			icon_state = "Cave"
			density=0
			Entered(mob/M)
				M.loc=locate(/turf/vampirequest/outsidepastentrance)
		outsidepastentrance
			density=0

mob/NPC/Vampquest
	icon = 'NPCs3.dmi'
	icon_state = "vampquest"
	name = "{NPC}Townsman"
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
		usr.talking = 1
		if(!vampquestp1started && usr.powerlevel_max < 2000000000 && usr.level < 100000)
			usr<<"<font color=white>Townsman:</font> Hi! I'm sorry, it doens't seem you're quite ready to help me yet."
			usr.talking=0
			return
		else if(!vampquestp1started && usr.powerlevel_max > 2000000000 && usr.level > 100000)
			usr<<"<font color=white>Townsman:</font> Hi, you look quite strong, you may be able to help me!"
			sleep(15)
			if(!usr)return
			switch(alert("Can you help me?","Quest: Vampires Attack!","Yes","Not Yet"))
				if("Yes")
					usr.vampquestp1started=1
					usr.killedpastvamps=0
					usr.talking=0
					usr<<"<font color=white> Townsman:</font>Great!  There's a great power savaging my village far, far away. "
					sleep(10)
					usr<<"<font color=white> Townsman:</font>Their power is much too great for any one man to handle.  This is what I need you to do."
					sleep(10)
					usr<<"<font color=white> Townsman:</font>I heard that a man named Trunks has a time machine.  You should barrow it to go back in time and destroy them before they become as powerful as they are today!"
					return
				else
					usr<<"<font color=white> Townsman:</font>That's too bad. Your help would really be appreciated!"
					usr.talking = 0
					return
