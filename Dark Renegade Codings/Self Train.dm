mob
	var
		firing=0
		tmp
			checker=""
			undercheck=0
			sttps=0
			stttps=0
			trainspeed=0
mob/PC/verb/SelfTrain()
	set category = "Training"
	set name="Self Train"
	if(jailed)
		usr<<"You're in jail!"
		return
	if(boxing_delay)
		usr<< "You must wait a moment before training again."
		return
	if(stamina>=stamina_max)
		stamina=stamina_max
		usr<<"You're too tired to train!"
		return
	if(boxing)
		icon_state=""
		boxing=0
		frozen=0
		doing=0
		usr<<"You stopped training!"
		boxing_delay=1
		undercheck=0
		spawn(35)if(usr)boxing_delay=0
		return
	if(doing||KO)
		undercheck=0
		return
	if(!boxing)
		boxing_delay=1
		icon_state="spar fury"
		boxing=1
		doing=1
		frozen=1
		usr<<"You begin to train!"
		spawn(35)if(usr)boxing_delay=0
		spawn(1)if(usr)Box_Gain()
		return
mob/proc/Box_Gain()
	set background = 1
	while(boxing)
		if(KO||!frozen)break
		if(stamina>=stamina_max)
			stamina=stamina_max
			overlays+='Rest.dmi'
			layer=60
			usr<<"You've become exhausted from training!"
			boxing=0
			frozen=0
			doing=0
			icon_state=""
			undercheck=0
			break
		else
			sttps+=1
			stttps+=1
			trainspeed+=1
			if(sttps>=20)
				sttps=0
				var/chance=rand(1,20)//make 1,10
				if(permtpsboosted)tp+=chance
				if(tpsboosted)tp+=chance
				if("TP_buff" in buffs)tp+=chance*2
				tp+=chance
				usr<<output("<center><font color=red>Training Points <font color=white>+[chance]","training")
			if(stttps>=20)
				stttps=0
				var/chance=rand(1,10)
				if(permtpsboosted)tp+=chance
				if(tpsboosted)tp+=chance
				if("TP_buff" in buffs)tp+=chance*2
				tp+=chance
				usr<<output("<center><font color=red>Training Points <font color=white>+[chance]","training")
			var/bonus_exp=200//reset to 200 when you re add shadow spar and ft
			var/pwr = round(rand(100,180) + (src.power_bonus + (src.level / 2)))
			var/stat_prob = round(rand(8,18))
			var/stat = round(rand(1,6))
			var/sta = round(rand(30,70))//make 30,70
			var/str = round(rand(100,140) + (src.strength_bonus + (src.level / 2)))//make 100,140
			var/def = round(rand(99,250) + (src.defence_bonus + (src.level / 2)))//make 99,250
			var/kib = round(rand(80,110) + (src.ki_bonus + (src.level / 2)))//make 80,110
			if(grav_trainer)bonus_exp*=2*exphostgain
			if(gravity_train)bonus_exp*=2.5*exphostgain
			if(expbuff)bonus_exp*=1.5*exphostgain
			if("exp_buff" in buffs)bonus_exp*=1.5*exphostgain
			if(in_hbtc)bonus_exp*=3.5*exphostgain
			if(src.smallshard)bonus_exp*=1.5*exphostgain
			if(src.largeshard)bonus_exp*=2.5*exphostgain
			if(src.massshard)bonus_exp*=3*exphostgain
			if(prob(stat_prob))
				if(stat == 1)
					src.strength_max += str*STRMastery*src.strengthrebirthgain
					src.strength += str*STRMastery*src.strengthrebirthgain
					src.STRMastery()
					usr<<output("<font size = -2><font color = #b0c4de>While training you unlock some extra strength: +[str]","training")

				if(stat == 2)
					src.defence_max += def*DEFMastery*src.defenserebirthgain
					src.defence += def*DEFMastery*src.defenserebirthgain
					src.DEFMastery()
					usr<<output("<font size = -2><font color = #6495ed>You feel your Defence grow while training!: +[def]","training")

				if(stat == 3)
					src.ki_max += kib*KIMastery*src.kirebirthgain
					src.ki += kib*KIMastery*src.kirebirthgain
					src.KIMastery()
					usr<<output("<font size = -2><font color = #5f9ea0>Your energy explodes as your Ki increases!: +[kib]","training")

				if(stat == 4)
					src.powerlevel_max += pwr*PLMastery*src.powerlevelrebirthgain
					src.powerlevel += pwr*PLMastery*src.powerlevelrebirthgain
					src.PLMastery()
					usr<<output("<font size = -2><font color = #8fbc8f>Your Powerlevel jumps as you train!: +[pwr]","training")

				if(stat == 5)
					src.stamina_max += sta*src.staminarebirthgain
					src.stamina += sta*src.staminarebirthgain
					usr<<output("<font size = -2><font color = #ffd700>You feel you can do more as your Stamina jumps!: +[sta]","training")
			if(undercheck)
				var/mob/GMC=checker
				GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Self Train)"
			exp+=bonus_exp*src.EXPrebirthgain*exphostgain
			if(!staminabuff)stamina+=3.5
			spawn(1)if(src)Level_Up()
			spawn(1)if(src)Exp_Check()
			spawn(1)if(src)Z_Check()
			sleep(5)