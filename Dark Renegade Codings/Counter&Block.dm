mob/var/skill_points=0
mob/proc/Counter_Attack(mob/M,str,def)
	if(countering||doing||babatourny||tourny||jrtourny)return FALSE
	if(prob(1+(counter/5)))
		if(M.dir==dir)return FALSE
		countering=1
		spawn(speed+4)countering=0
		var/chance1 = rand(1,100)
		var/chance2= rand(1,100)
		var/damage=(str*chance1*0.01)-(def*chance2*.01)
		if(damage < 0)damage = (str*0.0001)*chance1
		if(damage < 1)damage = 1
		if(istype(src,/mob/PC))flick("attack",src)
		if(istype(M,/mob/PC))M<<"\green [src] counters your attack!"
		if(istype(M,/mob/Simulation))M.frozen=0
		view() << sound('punch_med.wav')
		src<<"\green You counter [M]'s attack!"
		M.powerlevel-=damage
		spawn()M.KO()
		return TRUE
	else return FALSE
mob/proc/Block_Attack(mob/M,str,def)
	if(blocking||doing||babatourny||tourny||jrtourny)return FALSE
	if(prob(1+(block/5)))
		if(M.dir==dir)return FALSE
		blocking=1
		spawn(speed+4)if(src)blocking=0
		var/block_power=def*3
		var/chance1 = rand(1,100)
		var/chance2= rand(1,100)
		var/damage=(str*chance1*0.01)-(block_power*chance2*.01)
		if(damage < 0)damage = (str*0.0001)*chance1
		if(damage < 1)damage = 1
		if(istype(src,/mob/PC))flick("block",src)
		if(istype(M,/mob/PC))M<<"\green [src] blocks your attack!"
		if(istype(M,/mob/Simulation))M.frozen=0
		view() << sound('punch_med.wav')
		src<<"\green You block [M]'s attack!"
		powerlevel-=damage
		spawn()KO()
		return TRUE
	else return FALSE
mob/proc/Deflect_Attack(mob/M)
	if(deflecting||doing||babatourny||tourny||jrtourny)return FALSE
	if(prob(reflect/5))
		if(M.dir==dir)return FALSE
		deflecting=1
		spawn(speed+4)if(src)deflecting=0
		if(istype(src,/mob/PC))flick("attack",src)
		if(istype(M,/mob/PC))M<<"\green [src] deflects your attack!"
		view() << sound('punch_med.wav')
		if(istype(M,/mob/Simulation))M.frozen=0
		src<<"\green You deflect [M]'s attack!"
		return TRUE
	else return FALSE
mob/proc/Dodge_Attack(mob/M)
	if(dodging||doing||babatourny||tourny||jrtourny)return FALSE
	if(prob(dodge/5))
		dodging=1
		spawn(speed+4)if(src)dodging=0
		if(istype(src,/mob/PC))flick("IT",src)
		if(istype(M,/mob/PC))M<<"\green [src] dodges your attack!"
		if(istype(M,/mob/Simulation))M.frozen=0
		view() << sound('miss_hvy.wav')
		src<<"\green You dodge [M]'s attack!"
		return TRUE
	else return FALSE