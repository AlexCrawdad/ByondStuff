obj/Equipment/Buff_Items
	EXP_Shard
		name = "Experience Shard"
		icon = 'Experience Shard.dmi'
		density = 0
		value = 2500
		equiped = 0
		condition = 1
		condition_max = 1
		cooldown = 0
		Click()
			if(src in usr:contents)
				if(cooldown>0)
					usr<<"You are not ready to use the Experience Shard yet! ([cooldown / 10] seconds)"
					return
				if("exp_buff" in usr.buffs)
					usr<<"You already have that buff!"
					if(usr.expshardusing&&usr.expbuffusing<1)
						usr.BUFF_TIMER()
						usr.expbuffusing++
					return
				if(usr.active_buffs>=3)
					usr<<"You have the maximum amount of buffs already!"
					return
				for(var/obj/Equipment/Buff_Items/EXP_Shard/A in world)if(A.owner==usr.name&&A.cooldown>0)
					usr<<"You already have [A] in their cool down period!"
					return
				for(var/obj/Equipment/Buff_Items/EXP_Shard/A in usr)if(A.owner==usr.name&&A.cooldown>0)
					usr<<"You already have [A] in their cool down period!"
					return
				else
					if("minor_exp_buff" in usr.buffs)usr.buffs-="minor_exp_buff"
					usr<<"You have activated your <I>Experience Shard (+25% EXP)!</I>"
					owner=usr.name
					usr.buffs += "exp_buff"
					usr.expshardusing=1
					usr.expbuffusing++
					usr.buff_time = 18000
					if(usr.buff_time>0)usr.BUFF_TIMER()
					usr.active_buffs ++
					cooldown = 36000
					BUFF_COOLDOWN()
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
				if(cooldown>0)
					usr<<"You are unable to drop: <u>[src]</u>, as it's still being worn!"
					return
				if(!equiped)
					loc=usr.loc
					usr<<"You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else usr<<"You are unable to drop: <u>[src]</u>, it's already equipped."
	Minor_EXP_Shard
		name = "Minor Experience Shard"
		icon = 'Experience Shard.dmi'
		density = 0
		value = 2500
		equiped = 0
		condition = 1
		condition_max = 1
		cooldown = 0
		Click()
			if(src in usr:contents)
				if(cooldown>0)
					usr<<"You are not ready to use the Experience Shard yet! ([cooldown] econds)"
					return
				if("minor_exp_buff" in usr.buffs)
					usr<<"You already have that buff!"
					return
				if("exp_buff" in usr.buffs)
					usr<<"You already have a more powerful version of this buff!"
					return
				if(usr.active_buffs>=3)
					usr<<"You have the maximum amount of buffs already!"
					return
				else
					usr<<"You have activated your <I>Minor Experience Shard (+5% EXP)!</I>"
					usr.buffs += "minor_exp_buff"
					usr.buff_time = 18000
					usr.active_buffs ++
					cooldown = 36000
					BUFF_COOLDOWN()
					if(usr.buff_time)usr.BUFF_TIMER()
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
				if(!equiped)
					loc = usr.loc
					usr<<"You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else usr<<"You are unable to drop: <u>[src]</u>, it's already equipped."