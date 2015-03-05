proc/Buff_Cooldown(var/mob/M)
	set background = 1
	while(M)
		if(!M)return
		if(M.scooldown > 0)
			M.scooldown -= 100
		if(M.scooldown <= 0)
			M.scooldown = 0
			M.smallshard = 0
			M << "Your Mini EXP shard has worn off!"
			break
		sleep(100)


proc/Buff_Cooldown2(var/mob/M)
	set background = 1
	while(M)
		if(!M)return
		if(M.lcooldown > 0)
			M.lcooldown -= 100
		if(M.lcooldown <= 0)
			M.lcooldown = 0
			M.largeshard = 0
			M << "Your EXP shard has worn off!"
			break
		sleep(100)

proc/MBuff_Cooldown(var/mob/M)
	set background = 1
	while(M)
		if(!M)return
		if(M.mcooldown > 0)
			M.mcooldown -= 100
		if(M.mcooldown <= 0)
			M.mcooldown = 0
			M.massshard = 0
			M << "Your Massive EXP shard has worn off!"
			break
		sleep(100)