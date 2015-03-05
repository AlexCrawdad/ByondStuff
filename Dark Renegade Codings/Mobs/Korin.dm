mob/var/beans = 1
mob/var/tuffle_kills=0
mob/var/korin_start=0
mob/var/korin_finished=0
mob/NPC/Korin
	icon_state = "Korin"
	name = "{NPC}Korin"
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
		if(usr.CheckInventory()==TRUE)
			usr.talking=0
			return
		if(usr.beans>0)
			usr<<"<font color=white>Korin:</white> Hey [usr], I think this may help you in your training!"
			sleep(25)
			usr<<"<font color = #0066FF>Korin puts a Senzu Bean in your hand."
			sleep(25)
			usr<<"<font color=white>Korin:</white> Come back later, I may have more for you."
			usr.contents += new/obj/Equipment/Consumable/Senzu
			usr.inven_min ++
			usr.beans --
			usr.talking = 0
			sleep(1200)
			if(!usr)return
			usr.beans = 1
			return
		else
			if(!usr.korin_start)
				usr<<"<font color=white>Korin:</font> Hi, [usr]. your Training is going nicely!"
				sleep(15)
				if(!usr)return
				switch(alert("Help?","Quest: Tuffle Infestation","Yes","Not Yet"))
					if("Yes")
						usr.korin_start=1
						usr.tuffle_kills=0
						usr.contents += new/obj/Quests/Korin/tuffle_infestation
						usr.talking=0
						usr<<"<font color=white>Korin:</font> Good to hear! Tuffles have came here from the Past, <font color=red>kill 25 of them</font>!"
						return
					else
						usr<<"<font color=white>Korin:</font> okay, Get stronger then come Back."
						usr.talking=0
						return
			else
				if(usr.tuffle_kills>=25&&!usr.korin_finished)
					usr.exp+=120000000
					usr<<"\white EXP +12000000"
					usr.Level_Up()
					for(var/obj/Quests/Korin/tuffle_infestation/Q)del(Q)
					usr.talking=0
					usr.korin_finished=1
					usr<<"<font color=white>Korin:</font> Later [usr]!"
					return
				else
					if(!usr.tuffle_kills>=25)
						usr<<"<font color=white>Korin:</font> Go kill 25 Tuffles!"
						usr.talking=0
						return
					else
						if(usr.korin_finished)
							usr<<"See ya Later [usr]"
							usr.talking=0
	verb/Buy_Bean()
		set category = null
		set src in oview(2)
		if(usr.talking)return
		usr.talking = 1
		if(usr.CheckInventory()==TRUE)
			usr.talking=0
			return
		var/bcost = 1000000
		if(usr.zenni >= bcost)
			if(usr.inven_min < usr.inven_max)
				usr<<"<font color = #0066FF>Korin puts a Senzu Bean in your hand."
				sleep(15)
				if(usr.zenni < bcost)return
				if(!usr)return
				usr<<"<font color=white>Korin:</white> Thanks [usr], I know its Expensive, but it's Expensive to grow em too...."
				usr.contents += new/obj/Equipment/Consumable/Senzu
				usr.zenni -= bcost
				usr.talking = 0
				return
			else
				usr<<"<font color=white>Korin:</white> You dont have enough room."
				usr.talking = 0
				return
		else
			usr<<"<font color=white>Korin:</white> You need 1,000,000 zenni."
			usr.talking = 0
			return