mob/var/list/buffs=list()
mob/var/buff_time=0
mob/var/active_buffs=0
mob/var
	kishardusing=0
	defshardusing=0
	strshardusing=0
	plshardusing=0
	zennishardusing=0
	expshardusing=0
	tpshardusing=0
	tmp
		kibuffusing=0
		defbuffusing=0
		strbuffusing=0
		plbuffusing=0
		zennibuffusing=0
		expbuffusing=0
		tpbuffusing=0
mob/proc
	BUFF_TIMER()
		if(buff_time>0)
			buff_time-=100
			if(kibuffusing>0)kibuffusing--
			if(strbuffusing>0)strbuffusing--
			if(tpbuffusing>0)tpbuffusing--
			if(zennibuffusing>0)zennibuffusing--
			if(defbuffusing>0)defbuffusing--
			if(expbuffusing>0)expbuffusing--
			spawn(100)if(src)BUFF_TIMER()
			return
		if(buff_time<=0)
			if("ki_buff" in buffs)
				buffs-="ki_buff"
				ki_max-=saved_ki*0.075
				kidefense_max-=saved_kidefense*0.075
				src<<"Ki shard has worn off!"
				active_buffs--
				kishardusing=0
				return
			if("exp_buff" in buffs)
				buffs-="exp_buff"
				src<<"Exp shard has worn off!"
				active_buffs--
				expshardusing=0
				return
			if("minor_exp_buff" in buffs)
				buffs-="minor_exp_buff"
				active_buffs--
				return
			if("pl_buff" in buffs)
				buffs-="pl_buff"
				powerlevel_max-=saved_pl*0.15
				src<<"PL shard has worn off!"
				active_buffs--
				plshardusing=0
				return
			if("def_buff" in buffs)
				buffs-="def_buff"
				defence_max-=saved_def*0.05
				src<<"Def shard has worn off!"
				active_buffs--
				defshardusing=0
				return
			if("str_buff" in buffs)
				buffs-="str_buff"
				strength_max-=saved_str*0.075
				src<<"Str shard has worn off!"
				active_buffs--
				strshardusing=0
				return
			if("zenni_buff" in buffs)
				buffs-="zenni_buff"
				src<<"Zenni shard has worn off!"
				active_buffs--
				zennishardusing=0
				return
			if("TP_buff" in buffs)
				buffs-="TP_buff"
				src<<"TP shard has worn off!"
				active_buffs--
				tpshardusing=0
				return
			return
obj/proc
	BUFF_COOLDOWN()
		if(cooldown>0)
			cooldown-=100
			spawn(100)if(src)BUFF_COOLDOWN()
			return
		if(cooldown<=0)
			cooldown=0
			if(usr)usr<<"You now can use [src] again!"
			return