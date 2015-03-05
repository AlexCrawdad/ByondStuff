mob/var/level_tp=0
mob/var/level_chance=0
mob/var/spam_lvl=0
mob/var/transelvl=0
mob/var/leveldone=0
mob/var/sp_leveler=0
mob/var/lv_up=0
mob/var/tmp/sptp=0//ERASE ME WHEN YOU ADD SHADOW SPAR AND FOCUS TRAIN AGAIN
mob/proc/Level_Up()
	if(!client||!loggedin)return
	if(level>=100000*EXPrebirthgain)
		exp=0
		return
	if(exp>=tnl)
		var/power_gain=(level*0.01+(src.power_bonus+level+rand(10,50))/1000)
		if(power_gain < 0)power_gain=0
		var/ki_gain=(level*0.01+(level+rand(10,50))/1000)
		if(ki_gain < 0)ki_gain=0
		var/str_gain=(level*0.01+(level+rand(10,50))/1000)
		if(str_gain < 0)str_gain=0
		var/def_gain=(level*0.01+(level+rand(10,50))/1000)
		if(def_gain < 0)def_gain=0
		exp-=tnl
		level++
		level_tp++
		spam_lvl++
		sp_leveler++
		lv_up++
		if(lv_up>=1000&&level>=5000)
			lv_up=0
			var/zenni_up=500
			if(leveldone)zenni_up*=1.0
			if(leveldone==2)zenni_up*=0.5
			if(leveldone==3)zenni_up*=0.5
			if(leveldone==4)zenni_up*=1.0
			if(leveldone==5)zenni_up*=1.0
			if(leveldone==6)zenni_up*=1.0
			if(leveldone==7)zenni_up*=1.5
			if(leveldone==8)zenni_up*=1.5
			if(leveldone==9)zenni_up*=1.5
			if(leveldone==10)zenni_up*=2.0
			if(leveldone==11)zenni_up*=2.0
			if("zenni_buff" in buffs)zenni_up*=20
			zenni+=zenni_up
		if(sp_leveler>=2000)
			sp_leveler=0
			skill_points+=2
			src<<output("<center><I><font color=gray>You have gained 2 skill points!","MainMapPan.training")
		unarmed_skill_max+=2
		ki_skill_max+=2
		stamina_exp+=rand(4,6)
		if(plboosted)power_gain*=1.5
		powerlevel_max+=power_gain*src.powerlevelrebirthgain
		powerlevel+=power_gain*src.powerlevelrebirthgain
		if(kiboosted)ki_gain*=1.5
		ki_max+=ki_gain*kirebirthgain
		ki+=ki_gain*kirebirthgain
		kidefense+=ki_gain*kidefenserebirthgain
		kidefense_max+=ki_gain*kidefenserebirthgain
		add_exp=level
		if(strboosted)str_gain*=1.5
		if(defboosted)def_gain*=1.5
		strength+=str_gain*strengthrebirthgain
		defence+=def_gain*defenserebirthgain
		strength_max+=str_gain*strengthrebirthgain
		defence_max+=def_gain*defenserebirthgain
		if(level_on)
			usr<<output("<center><I>------------------------------</I></center>","MainMapPan.Training Box")
			usr<<output("<center><font color = gray>« Level Up: <font color=#8B0000> [src] <font color = gray> Level: \white [level] <font color = gray>»</font></center>","Training Box")
			usr<<output("<center><I><font color = gray>Your stored energy explodes as your Powerlevel grows <font color=#8B0000> +[round(power_gain*src.powerlevelrebirthgain)]</center>","Training Box")
			usr<<output("<center><I><font color = gray>Your stored energy explodes as your Ki grows <font color=#8B0000> +[round(ki_gain*src.kirebirthgain)]</center>","Training Box")
			usr<<output("<center><I><font color = gray>Your stored energy explodes as your Ki Defense grows <font color=#8B0000> +[round(ki_gain*src.kidefenserebirthgain)]</center>","Training Box")
			usr<<output("<center><I><font color = gray>Your stored energy explodes as your Strength grows <font color=#8B0000> +[round(str_gain*src.strengthrebirthgain)]</center>","Training Box")
			usr<<output("<center><I><font color = gray>Your stored energy explodes as your Defense grows <font color=#8B0000> +[round(def_gain*src.defenserebirthgain)]</center>","Training Box")
			usr<<output("<center><I>------------------------------</I></center>","MainMapPan.Training Box")
			overlays+='LUP.dmi'
			spawn(15)if(src)overlays-='LUP.dmi'
		stamina_tnl+=0.05
/*		tnl+=1.3
		if(level>500)tnl+=1
		if(level>5000)tnl+=5
		if(level>10000)tnl+=10
		if(level>20000)tnl+=20
		if(level>40000)tnl+=40
		if(level>50000)tnl+=80*/
		if(stattrain)
			tnl-=stattrain/110
			stamina_max+=stattrain/110
		if(spam_lvl>=50)
			if(CreationSpam.Find("2[ckey]"))CreationSpam.Remove("2[ckey]")
			else if(CreationSpam.Find("1[ckey]"))CreationSpam.Remove("1[ckey]")
			spam_lvl=0
		if(!gone_ssj)if(train_chromosome&&level>=100)TrainSSJ()
		if(level>=1000*EXPrebirthgain&&!leveldone)
			if(level_on)
				world<<"[EXPinfo] </u></font> [src] has entered <u><font color=green>Warrior Mode!</u></font>!"
			leveldone=1
		if(level>=2000*EXPrebirthgain&&leveldone==1)
			if(level_on)
				world<<"[EXPinfo] </u></font> [src] has entered <u><font color=green>Assasin Mode!</u></font>!"
			leveldone=2
		if(level>=4000*EXPrebirthgain&&leveldone==2)
			if(level_on)
				world<<"[EXPinfo] </u></font> [src] has entered <u><font color=green>Deadly Shadow Mode!</u></font>!"
			leveldone=3
		if(level>=5000*EXPrebirthgain&&leveldone==3)
			if(level_on)
				world<<"[EXPinfo] </u></font> [src] has entered <u><font color=green>Demon Mode!</u></font>!"
			leveldone=4
		if(level>=8000*EXPrebirthgain&&leveldone==4)
			if(level_on)
				world<<"[EXPinfo] </u></font> [src] has entered <u><font color=green>Immortal Mode!</u></font>!"
			leveldone=5
		if(level>=9000*EXPrebirthgain&&leveldone==5)
			if(level_on)
				world<<"[EXPinfo] </u></font> [src] has entered <u><font color=green>God Mode!</u></font>!"
			leveldone=6
		if(level>=10000*EXPrebirthgain&&leveldone==6)
			if(level_on)
				world<<"[EXPinfo] </u></font> [src] has entered <u><font color=green>Infero Mode!</u></font>!"
			leveldone=7
		if(level>=15000*EXPrebirthgain&&leveldone==7)
			if(level_on)
				world<<"[EXPinfo] </u></font> [src] has entered <u><font color=green>Titan Mode!</u></font>!"
			leveldone=8
		if(level>=25000*EXPrebirthgain&&leveldone==8)
			if(level_on)
				world<<"[EXPinfo]  </u></font> [src] has entered <u><font color=green>Dragon Mode</u></font>!"
			leveldone=9
		if(level>=35000*EXPrebirthgain&&leveldone==9)
			if(level_on)
				world<<"[EXPinfo]  </u></font> [src] has entered <u><font color=green>Semi God of Destruction</u> Mode</font>!"
			leveldone=10
		if(level>=45000*EXPrebirthgain&&leveldone==10)
			if(level_on)
				world<<"[EXPinfo]  </u></font> [src] has entered <u><font color=green>True God of Destrucution</u> Mode!</font>!"
			leveldone=11
		if(level>=10000*EXPrebirthgain&&!pvplvl)
			pvplvl=1
			src<<"<u><font color=red>Training Information:</u></font> [src], you have now unlocked the level requirement for Ultimate Transformation!</u></font>"
		spawn(1)if(src)Exp_Check()
		spawn(1)if(src)Skill_Gain()
		spawn(1)if(src)Level_Up()
		return
//		var/tps=rand(5,10)
		sttps++
		stttps++
		sptp++
		if(sttps>=5)
			sttps=0
			var/chance=rand(5,10)
			if(permtpsboosted)tp += chance
			if(tpsboosted)tp += chance
			if("TP_buff" in buffs)tp+=chance/2
			if(weight>0)tp+=chance/2
			tp += chance
			src<<output("<center><font color=red>Training Points <font color=white>+[chance]","training")
		if(stttps>=10)
			stttps=0
			var/chance=rand(5,10)
			if(permtpsboosted)tp += chance
			if(tpsboosted)tp += chance
			if("TP_buff" in buffs)tp+=chance/2
			if(weight>0)tp+=chance/2
			tp += chance
			src<<output("<center><font color=red>Training Points <font color=white>+[chance]","training")
/*		if(sptp>=5)
			tp += tps
			if(permtpsboosted)tp += tps
			if(tpsboosted)tp += tps
			if("TP_buff" in buffs)tp+=tps/2
			if(weight>0)tp+=tps/2
			src<<output("<center><font color=red>Training Points <font color=white>+[tps]","training")
			sptp=0*/
		spawn(1)if(src)Skill_Gain()
		spawn(1)if(src)Level_Up()
		spawn(1)if(src)Exp_Check()
		spawn(1)if(src)Z_Check()
		sleep(0.1)
		return


mob/proc/PK_LVLUP(var/N as num)
	if(!client||!loggedin)return
	if(N>1)
		var/cpp=round(N/2)
		if(cpp>3)cpp=3
		custom_points+=round(cpp)
		src<<output("<center><font color=red>Custom Points <font color=white>+[round(cpp)]</center></font>","MainMapPan.Training Box")
	else
		custom_points+=1
		src<<output("<center><font color=red>Custom Points <font color=white>+1</center></font>","MainMapPan.Training Box")
mob/proc/Fatigue_Level_Up()
	if(!client||!loggedin)return
	if(stamina_exp>=stamina_tnl)
		stamina_tnl+=4.3
		stamina_exp-=stamina_tnl
		stamina_max+=100
		speed+=0.4
		speed_max+=0.4
		src<<output("\white You feel your Endurance increase...","MainMapPan.Training Box")
mob
	proc
		TrainSSJ()
			if(!client||!loggedin)return
			if(train_chromosome)
				if(race=="Saiyan"&&level>=750)
					if(powerlevel_max>=90000)
						buku=0
						rest=0
						frozen=1
						boxing=0
						focus_boxing=0
						doing=1
						icon_state=""
						gone_ssj=1
						density=1
						icon_state="enrage"
						view(8)<<"\white <I>[src] feels an uncontrollable rage burning in them as they remember the Saiyans who have surpassed them."
						sleep(25)
						view(8)<<"\white <I>[src] clenches their fists, as tears well in their eyes. Veins protrude from their hands and forehead as the ground rumbles..."
						sleep(25)
						view(8)<<"\white [src]: I AM THE STRONGEST OF THE SAIYANS! NO ONE SHALL SURPASS ME!!"
						icon_state = ""
						contents+=new/obj/Transform/Transform
						contents+=new/obj/Transform/Revert
						PSaiyanTrans()
						Explode(new /Effect/BasicBoom(loc,1,4))
						sleep(25)
//						UnTraining()
//						FocusUnTraining()
						frozen=0
						doing=0
						var/chance=rand(20,60)
						if(prob(chance))
							src<<"You are unable to fully control your Super Saiyan state!"
							SaiyanRevert()