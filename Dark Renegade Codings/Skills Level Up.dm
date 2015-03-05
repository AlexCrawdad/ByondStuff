mob/proc/UA_Level_Up()
	if(unarmed_skill==unarmed_skill_max)
		unarmed_exp=0
		return
	if(unarmed_exp>=unarmed_tnl)
		unarmed_exp=0
		unarmed_skill++
		unarmed_tnl=250
		if(prob(10))src<<"<font color=white>Unarmed Skill has increased to \blue[unarmed_skill]</font>!"
mob/proc/Ki_Level_Up()
	if(ki_skill==ki_skill_max)
		ki_exp=0
		return
	if(ki_exp>=ki_tnl)
		ki_exp=0
		ki_skill++
		ki_tnl=250
		if(prob(10))src<<"<font color=white>Ki Skill has increased to \blue[ki_skill]</font>!"
mob/var/level_quality=0
mob/proc/Skill_Level_Up()
	if(level_random>=300)
		var/chance=rand(1,5)
		var/chance_up=rand(1,2)
		if(chance==1)
			if(block_max<65)
				src<<"<center><I><font color=blue>Chance to Block \white +[chance_up]%</center>"
				block+=chance_up
				block_max+=chance_up
				level_random=0
		if(chance==2)
			if(reflect_max<65)
				src<<"<center><I><font color=yellow>Chance to Reflect \white +[chance_up]%</center>"
				reflect+=chance_up
				reflect_max+=chance_up
				level_random=0
		if(chance==3)
			if(dodge_max<65)
				src<<"<center><I><font color=white>Chance to Dodge \white +[chance_up]%</center>"
				dodge+=chance_up
				dodge_max+=chance_up
				level_random=0
		if(chance==4)
			if(critical_max<65)
				src<<"<center><I><font color=green>Chance to Critical \white +[chance_up]%</center>"
				critical+=chance_up
				critical_max+=chance_up
				level_random=0
		if(chance==5)
			if(counter_max<65)
				src<<"<center><I><font color=red>Chance to Counter \white -[chance_up]%</center>"
				counter+=chance_up
				counter_max-=chance_up
				level_random= 0
	if(level_quality>=300)
		var/chance=rand(1,5)
		var/chance_up=rand(1,2)
		if(chance==1)
			if(block_max<65)
				src<<"<center><I><font color=blue>Chance to Block \white +[chance_up]%</center>"
				block+=chance_up
				block_max+=chance_up
				level_quality=0
		if(chance==2)
			if(reflect_max<65)
				src<<"<center><I><font color=yellow>Chance to Reflect \white +[chance_up]%</center>"
				reflect+=chance_up
				reflect_max+=chance_up
				level_quality=0
		if(chance==3)
			if(dodge_max<65)
				src<<"<center><I><font color=white>Chance to Dodge \white +[chance_up]%</center>"
				dodge+=chance_up
				dodge_max+=chance_up
				level_quality=0
		if(chance==4)
			if(critical_max<65)
				src<<"<center><I><font color=green>Chance to Critical \white +[chance_up]%</center>"
				critical+=chance_up
				critical_max+=chance_up
				level_quality=0
		if(chance==5)
			if(counter_max<65)
				src<<"<center><I><font color=red>Chance to Counter \white -[chance_up]%</center>"
				counter+=chance_up
				counter_max-=chance_up
				level_quality=0