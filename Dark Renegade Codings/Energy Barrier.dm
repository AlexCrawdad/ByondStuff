mob/var/itfiltered=0
obj/Equipment
	EnergyBarrier
		icon='Black Under.dmi'
		name = "Energy Barrier"
		equiped = 0
		value = 3000
		Click()
			if(src in usr:contents)
				if(!usr.itfiltered)
					usr.itfiltered=1
					usr<<"Your energy barrier is now cloaking you!"
					usr.energybarrier()
				else
					usr.itfiltered=0
					usr<<"Your energy barrier has been lowered!"
					return
		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr<<"You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else usr<<"You are unable to pick up the: <u>[src]</u>."
			Drop()
				set category = null
				src.loc = usr.loc
				usr<<"You have dropped the: <u>[src]</u>."
				usr.inven_min -= 1
mob
	var
		energytime=0
		energysmalltime=0
	proc
		energybarrier()
			while(src.itfiltered)
				if(!src)break
				src.energysmalltime ++
				if(src.energysmalltime>=10)
					src.energytime ++
					src.energysmalltime=0
				if(src.energytime>=30)
					src.energytime=0
					src.energysmalltime=0
					src.itfiltered=0
					src<<"Your energy barrier has been lowered!"
				sleep(100)