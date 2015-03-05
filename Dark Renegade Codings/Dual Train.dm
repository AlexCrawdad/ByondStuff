mob/var/exp_bonus = 0
mob/var/tmp/dualtrain = 0
mob/var/tmp/dtpartner=""
/*mob/PC/verb/Dual_Train()
	set category = "Training"
	if(dt_delay)
		usr<<"You must wait before dual train again!"
		return
	if(dualtrain)
		doing = 0
		frozen = 0
		dualtrain = 0
		icon_state = ""
		dtpartner=""
		usr<<"You have stopped training"
		for(var/mob/DM in world)
			if(DM.dtpartner==usr)
				if(DM.dualtrain)
					DM.doing = 0
					DM.frozen = 0
					DM.dualtrain = 0
					DM.icon_state = ""
					DM.dtpartner=""
					DM << "You have stopped training"
					return
	for(var/mob/PC/M in get_step(usr,dir))
		if(!M)return
		dt_delay = 1
		M.dt_delay = 1
		spawn(70)
			if(usr)dt_delay = 0
			if(M)M.dt_delay = 0
		if(istype(M,/mob/PC))
			if(stamina>=stamina_max)
				usr<<"You are too drained to train."
				M << "[usr] is too drained to train."
				return
			if(M.stamina>=M.stamina_max)
				usr<<"[M] is too drained to train."
				M << "You are too drained to train."
				return
			if(doing)
				usr<<"You are already doing something!"
				return
			if(M.doing)
				usr<<"[M] is already doing something!"
				return
			if(alert("Are you sure you want to dual train with [M]?","Dual Train with [M]?","Yes","No") == "Yes")
				switch(alert(M,"Would you like to Dual Train with [usr]?","Dual Train","Yes","No"))
					if("Yes")
						if(!M in get_step(usr,dir)||!usr in get_step(M,dir))return
						if(usr in oview(4,M))
							if(!M||!usr)return
							if(doing)
								M << "[usr] is already doing something!"
								usr<<"You are already doing something!"
								return
							if(M.doing)
								usr<<"[M] is already doing something!"
								M << "You are already doing something!"
								return
							if(!M.doing && !doing)
								dualtrain = 1
								doing = 1
								dtpartner=M
								M.dtpartner=usr
								icon_state = "spar fury"
								M.icon_state = "spar fury"
								usr<<"You begin to dual train."
								frozen = 1
								M.dualtrain = 1
								M.doing = 1
								M.icon_state = "spar fury"
								M << "You begin to dual train."
								M.frozen = 1
								Dual_Train2(M)
								return
					if("No")
						if(usr)
							usr<<"[M] does not want to dual train!"
							dt_delay = 0
						M.dt_delay = 0
						return
		else
			usr<<"You can't train with NPC's!"
			return
mob/proc/Dual_Train2(mob/M)
	set background = 1
	if(!src||!M)
		if(src)
			dtpartner=""
			doing = 0
			frozen = 0
			src<<"You have stopped training"
			dualtrain = 0
			icon_state = ""
			dt_delay = 1
			dt_delay = 0
		if(M)
			M.doing = 0
			M << "You have stopped training"
			M.frozen = 0
			M.dualtrain = 0
			M.icon_state = ""
			M.dtpartner=""
			M.dt_delay = 1
			M.dt_delay = 0
		return
	while(dualtrain && M.dualtrain && M && src)
		if(stamina < stamina_max)
			if(M.stamina < M.stamina_max)
				if(M.frozen && frozen)
					var/exp_bonus = 1500
					if(grav_trainer)exp_bonus*=4
					if(gravity_train)exp_bonus*=2
					if(expbuff)exp_bonus*=2.5
					if("exp_buff" in buffs)exp_bonus*=3
					if(in_hbtc)exp_bonus*=6
					if(!staminabuff)stamina+=3.9
					if(src.smallshard)exp_bonus*=1.50
					if(src.largeshard)exp_bonus*=3
					if(src.massshard)exp_bonus*=6
					exp+=exp_bonus*usr.EXPrebirthgain
					Level_Up()
					exp_bonus = 1000
					if(M.expbuff)exp_bonus*=2.5
					if(M.gravity_train)exp_bonus*=2
					if(M.grav_trainer)exp_bonus*=4
					if(M.in_hbtc)exp_bonus*=6
					if(M.smallshard)exp_bonus*=1.50
					if(M.largeshard)exp_bonus*=3
					if(M.massshard)exp_bonus*=6
					if("exp_buff" in M.buffs)exp_bonus*=3
					if(!M.staminabuff)M.stamina+=3.9*usr.staminarebirthgain
					M.exp+=exp_bonus*usr.EXPrebirthgain
					M.Level_Up()
					M.sttps+=1
					if(M.sttps>=100)
						M.sttps=0
						var/i=rand(200,400)
						if(M.tpsboosted)M.tp += i
						if(M.permtpsboosted)M.tp += i
						if("TP_buff" in M.buffs)M.tp+=i/2
						M.tp += i
						if(prob(2))M << "<center><font color=red>Training points \white+[i]</center>"
					sttps+=1
					if(sttps>=100)
						sttps=0
						var/i=rand(200,400)
						if(tpsboosted)tp += i
						if(permtpsboosted)tp += i
						if("TP_buff" in M.buffs)tp+=i/2
						tp += i
						if(prob(2))src<<"<center><font color=red>Training points \white+[i]</center>"
					sleep(5)
					if(!src||!M)
						if(src)
							dtpartner=""
							doing = 0
							frozen = 0
							dualtrain = 0
							src<<"You have stopped training."
							icon_state = ""
							dt_delay = 1
							dt_delay = 0
						if(M)
							M.doing = 0
							M.frozen = 0
							M.dualtrain = 0
							M.icon_state = ""
							M << "You have stopped training."
							M.dtpartner=""
							M.dt_delay = 1
							M.dt_delay = 0
						break
					if(src&&M)continue
					else
						if(!src||!M)
							if(src)
								src<<"You have stopped training."
								dtpartner=""
								doing = 0
								frozen = 0
								dualtrain = 0
								icon_state = ""
								dt_delay = 1
								spawn(70)if(src)dt_delay = 0
							if(M)
								M << "You have stopped training."
								M.doing = 0
								M.frozen = 0
								M.dualtrain = 0
								M.icon_state = ""
								M.dtpartner=""
								M.dt_delay = 1
								spawn(70)if(M)M.dt_delay = 0
							break
				else
					M.doing = 0
					M.frozen = 0
					M.dualtrain = 0
					M.icon_state = ""
					M << "You have stopped training."
					src<<"You have stopped training."
					dtpartner=""
					M.dtpartner=""
					doing = 0
					frozen = 0
					dualtrain = 0
					icon_state = ""
					dt_delay = 1
					M.dt_delay = 1
					spawn(70)
						if(src)dt_delay = 0
						if(M)M.dt_delay = 0
					break
			else
				src<<"You have stopped training."
				doing = 0
				frozen = 0
				dualtrain = 0
				icon_state = ""
				dtpartner=""
				M.dtpartner=""
				M << "You have stopped training"
				M.doing = 0
				M.frozen = 0
				M.dualtrain = 0
				M.icon_state = ""
				dt_delay = 1
				M.dt_delay = 1
				spawn(70)
					if(src)dt_delay = 0
					if(M)M.dt_delay = 0
				break
		else
			src<<"You have stopped training."
			doing = 0
			frozen = 0
			dualtrain = 0
			icon_state = ""
			M.doing = 0
			M.frozen = 0
			M.dualtrain = 0
			M << "You have stopped training."
			dtpartner=""
			M.dtpartner=""
			M.icon_state = ""
			dt_delay = 1
			M.dt_delay = 1
			spawn(70)
				if(src)dt_delay = 0
				if(M)M.dt_delay = 0
			break*/