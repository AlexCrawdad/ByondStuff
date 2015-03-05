mob/var/saved_def = 0
obj/Equipment/Buff_Items
	DEF_Shard
		name = "Defense Shard"
		icon = 'Defense Shard.dmi'
		density = 0
		value = 2500
		equiped = 0
		condition = 1
		condition_max = 1
		cooldown = 0
		Click()
			if(src in usr:contents)
				if(cooldown>0)
					usr<<"You are not ready to use the Defense Shard yet! ([(src.cooldown) / 10] seconds)"
					return
				if("def_buff" in usr.buffs)
					usr<<"You already have that buff!"
					if(usr.defshardusing&&usr.defbuffusing<1)
						usr.BUFF_TIMER()
						usr.defbuffusing++
					return
				if(usr.active_buffs >= 3)
					usr<<"You have the maximum amount of buffs already!"
					return
				for(var/obj/Equipment/Buff_Items/DEF_Shard/A in usr)if(A.owner==usr.name&&A.cooldown>0)
					usr<<"You already have [A] in their cool down period!"
					return
				for(var/obj/Equipment/Buff_Items/DEF_Shard/A in world)if(A.owner==usr.name&&A.cooldown>0)
					usr<<"You already have [A] in their cool down period!"
					return
				else
					usr<<"You have activated your <I>Defense Shard (+5% Maximum Defense)!</I>"
					owner=usr.name
					usr.buffs += "def_buff"
					usr.defshardusing=1
					usr.defbuffusing++
					usr.saved_def = usr.defence_max
					usr.defence_max += usr.defence_max*0.05
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
				if(usr.level < 500)
					usr<<"<font color=blue>You need to be level 500 or higher to be able to pick up this shard."
					return
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