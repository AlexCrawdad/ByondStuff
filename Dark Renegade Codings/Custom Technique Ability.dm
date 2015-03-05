mob
	var
		tmp
			custom_points_faker=0
			custom_piercing_faker=0
			custom_piercing_faker_old=0
			custom_distance_faker=0
			custom_distance_faker_old=0
			custom_delay_faker=0
			custom_delay_faker_old=0
			custom_damage_faker=0
			custom_damage_faker_old=0
			ca_piercing_used=0
			ca_distance_used=0
			ca_delay_used=0
			ca_damage_used=0
			ca_spam=0
mob/PC
	verb
		View_Custom_Stats()
			set category="Channels"
			if(spam_delay)return
			spam_delay=1
			spawn(25)if(usr)spam_delay=0
			custom_lvl=round((custom_damage/20)+(custom_piercing/5)-(custom_delay/5))
			if(custom_lvl<1)custom_lvl=1
			usr<<"<center>\white -----------------------------------"
			usr<<"<center><font size = +2>[custom_name]"
			usr<<"<center><font size = +1>\white Level:\red [round(custom_lvl)]"
			usr<<"<center><font size = +1>\white Power:\red [round(custom_damage)]"
			usr<<"<center><font size = +1>\white Delay:\red [custom_delay]"
			usr<<"<center><font size = +1>\white Knockback:\red [round(custom_piercing/2)]%"
			usr<<"<center><font size = +1>\white Ki Usage:\red [round(custom_ki * 100)]%"
			var/type
			if(custom_homing)type="Homing"
			if(!custom_homing)type="Straight"
			usr<<"<center><font size = +1>\white Type:\red [type]"
			var/kk
			if(custom_kill)kk="Kill"
			if(!custom_kill)kk="KO"
			usr<<"<center><font size = +1>\white Set to:\red [kk]"
			usr<<"<center>\white -----------------------------------"
		SkillDone()
			set hidden=1
			if(ca_spam)return
			ca_spam=1
			switch(input("Are you done editing your custom technique's skills?")in list("Yes","No"))
				if("No")
					ca_spam=0
					return
				if("Yes")
					custom_points=custom_points_faker
					custom_points_faker=0
					if(ca_piercing_used>0)custom_piercing+=custom_piercing_faker-custom_piercing_faker_old
					if(custom_piercing>=200)custom_piercing=200
					custom_piercing_faker=0
					if(ca_distance_used>0)custom_distance+=custom_distance_faker-custom_distance_faker_old
					if(custom_distance>=1000)custom_distance=1000
					custom_distance_faker=0
					if(ca_delay_used>0)custom_delay=custom_delay_faker
					if(custom_delay<1)custom_delay=0
					if(custom_delay>30)custom_delay=30
					custom_delay_faker=0
					if(ca_damage_used>0)custom_damage+=custom_damage_faker-custom_damage_faker_old
					if(custom_damage>=100000)custom_damage=100000
					custom_damage_faker=0
					ca_piercing_used=0
					ca_distance_used=0
					ca_delay_used=0
					ca_damage_used=0
					custom_damage_faker_old=0
					custom_delay_faker_old=0
					custom_distance_faker_old=0
					custom_piercing_faker_old=0
					ca_spam=0
					winshow(usr,"CustomSkill",0)
					return
		DamageAddManual()
			set hidden=1
			if(!custom_points_faker)
				usr<<"You do not have any custom points!"
				return
			if(custom_damage_faker>=100000)
				usr<<"Your damage is at the max!"
				return
			else
				var/chance=input("How many custom points do you want to put into your custom attack's damage?")as num|null
				if(!chance||chance<1)
					usr<<"You need to input one or more custom points!"
					return
				if(chance>custom_points_faker)
					usr<<"You don't have that many points!"
					return
				if(chance+custom_damage_faker>100000)
					usr<<"You cannot use number that is higher than [round(100000-custom_damage_faker)]."
					return
				else
					custom_points_faker-=chance
					custom_damage_faker+=chance
					ca_damage_used++
					if(custom_damage_faker>=100000)custom_damage_faker=100000
					winset(usr,null,"CustomSkill.CustomPoints.text=[custom_points_faker]")
					winset(usr,null,"CustomSkill.DamageInfo.text=[custom_damage_faker]")
		DamageAdd()
			set hidden=1
			if(!custom_points_faker)
				usr<<"You do not have any custom points!"
				return
			if(custom_damage_faker>=100000)
				usr<<"Your damage is at the max!"
				return
			else
				custom_points_faker--
				custom_damage_faker++
				ca_damage_used++
				if(custom_damage_faker>=100000)custom_damage_faker=100000
				winset(usr,null,"CustomSkill.CustomPoints.text=[custom_points_faker]")
				winset(usr,null,"CustomSkill.DamageInfo.text=[custom_damage_faker]")
				return
		DamageMinus()
			set hidden=1
			if(custom_damage_faker<1)
				usr<<"You cannot go lower than this!"
				return
			if(custom_damage_faker>=100000)
				usr<<"Your damage is at the max!"
				return
			else
				custom_points_faker++
				custom_damage_faker--
				ca_damage_used++
				winset(usr,null,"CustomSkill.CustomPoints.text=[custom_points_faker]")
				winset(usr,null,"CustomSkill.DamageInfo.text=[custom_damage_faker]")
				return
		SpeedAddManual()
			set hidden=1
			if(!custom_points_faker)
				usr<<"You do not have any custom points!"
				return
			if(custom_delay_faker<1)
				usr<<"Your speed is at the max!"
				custom_delay_faker=0
				winset(usr,null,"CustomSkill.SpeedInfo.text=[custom_delay_faker]")
				return
			else
				var/chance=input("How many custom points do you want to put into your custom attack's speed?")as num|null
				if(!chance||chance<1)
					usr<<"You need to input one or more custom points!"
					return
				if(chance>custom_points_faker)
					usr<<"You don't have that many points!"
					return
				else
					var/cptotal=custom_delay_faker-chance
					if(cptotal<0)
						usr<<"You cannot use number that is higher than [round(custom_delay_faker)]."
						return
					custom_points_faker-=chance
					custom_delay_faker-=chance
					ca_delay_used++
					winset(usr,null,"CustomSkill.CustomPoints.text=[custom_points_faker]")
					winset(usr,null,"CustomSkill.SpeedInfo.text=[custom_delay_faker]")
					return
		SpeedAdd()
			set hidden=1
			if(!custom_points_faker)
				usr<<"You do not have any custom points!"
				return
			if(custom_delay_faker<1)
				usr<<"Your speed is at the max!"
				custom_delay_faker=0
				winset(usr,null,"CustomSkill.SpeedInfo.text=[custom_delay_faker]")
				return
			else
				if(custom_delay_faker<1)
					usr<<"Your speed is at the max!"
					custom_delay_faker=0
					winset(usr,null,"CustomSkill.SpeedInfo.text=[custom_delay_faker]")
					return
				custom_points_faker--
				custom_delay_faker--
				ca_delay_used++
				winset(usr,null,"CustomSkill.CustomPoints.text=[custom_points_faker]")
				winset(usr,null,"CustomSkill.SpeedInfo.text=[custom_delay_faker]")
				return
		SpeedMinus()
			set hidden=1
			if(custom_delay_faker>29)
				usr<<"Your speed is at the min!"
				custom_delay_faker=30
				winset(usr,null,"CustomSkill.SpeedInfo.text=[custom_delay_faker]")
				return
			else
				custom_points_faker++
				custom_delay_faker++
				ca_delay_used++
				winset(usr,null,"CustomSkill.CustomPoints.text=[custom_points_faker]")
				winset(usr,null,"CustomSkill.SpeedInfo.text=[custom_delay_faker]")
				return
		DistanceAddManual()
			set hidden=1
			if(!custom_points_faker)
				usr<<"You do not have any custom points!"
				return
			if(custom_distance_faker>=1000||custom_distance>=1000)
				usr<<"Your distance is at the max!"
				custom_distance_faker=1000
				winset(usr,null,"CustomSkill.DistanceInfo.text=[custom_distance_faker]")
				return
			else
				var/chance=input("How many custom points do you want to put into your custom attack's distance?")as num|null
				if(!chance||chance<1)
					usr<<"You need to input one or more custom points!"
					return
				if(chance>custom_points_faker)
					usr<<"You don't have that many points!"
					return
				var/cptotal=custom_distance_faker+chance
				if(cptotal>1000)
					usr<<"You cannot use number that is higher than [round(1000-custom_distance_faker)]."
					return
				else
					if(chance>=1000)chance=1000
					custom_points_faker -= chance
					if(custom_distance_faker>=1000)custom_distance_faker=1000
					custom_distance_faker += chance
					ca_distance_used++
					winset(usr,null,"CustomSkill.CustomPoints.text=[custom_points_faker]")
					winset(usr,null,"CustomSkill.DistanceInfo.text=[custom_distance_faker]")
		DistanceAdd()
			set hidden=1
			if(!custom_points_faker)
				usr<<"You do not have any custom points!"
				return
			if(custom_distance_faker>=1000||custom_distance>=1000)
				usr<<"Your distance is at the max!"
				custom_distance_faker=1000
				winset(usr,null,"CustomSkill.DistanceInfo.text=[custom_distance_faker]")
				return
			else
				custom_points_faker--
				custom_distance_faker++
				ca_distance_used++
				winset(usr,null,"CustomSkill.CustomPoints.text=[custom_points_faker]")
				winset(usr,null,"CustomSkill.DistanceInfo.text=[custom_distance_faker]")
				return
		DistanceMinus()
			set hidden=1
			if(custom_distance_faker<1)return
			if(custom_distance_faker>=1000||custom_distance>=1000)
				usr<<"Your distance is at the max!"
				custom_distance_faker=1000
				winset(usr,null,"CustomSkill.DistanceInfo.text=[custom_distance_faker]")
				return
			else
				custom_points_faker++
				custom_distance_faker--
				ca_distance_used++
				winset(usr,null,"CustomSkill.CustomPoints.text=[custom_points_faker]")
				winset(usr,null,"CustomSkill.DistanceInfo.text=[custom_distance_faker]")
				return
		KnockbackAddManual()
			set hidden=1
			if(!custom_points_faker)
				usr<<"You do not have any custom points!"
				return
			if(custom_piercing_faker>=200||custom_piercing>=200)
				usr<<"Your knockback is at the max!"
				custom_piercing_faker=200
				winset(usr,null,"CustomSkill.KnockbackInfo.text=[custom_piercing_faker]")
				return
			else
				var/chance=input("How many custom points do you want to put into your custom attack's knockback?")as num|null
				if(!chance||chance<1)
					usr<<"You need to input one or more custom points!"
					return
				if(chance>custom_points_faker)
					usr<<"You don't have that many points!"
					return
				var/cptotal=custom_piercing_faker+chance
				if(cptotal>200)
					usr<<"You cannot use number that is higher than [round(200-custom_piercing_faker)]."
					return
				else
					if(chance>=200)chance=200
					custom_points_faker-=chance
					if(custom_piercing_faker>=200)custom_piercing_faker=200
					custom_piercing_faker+=chance
					ca_piercing_used++
					winset(usr,null,"CustomSkill.CustomPoints.text=[custom_points_faker]")
					winset(usr,null,"CustomSkill.KnockbackInfo.text=[custom_piercing_faker]")
		KnockbackAdd()
			set hidden=1
			if(!custom_points_faker)
				usr<<"You do not have any custom points!"
				return
			if(custom_piercing_faker>=200||custom_piercing>=200)
				usr<<"Your knockback is at the max!"
				custom_piercing_faker=200
				winset(usr,null,"CustomSkill.KnockbackInfo.text=[custom_piercing_faker]")
				return
				return
			else
				custom_points_faker--
				custom_piercing_faker++
				ca_piercing_used++
				winset(usr,null,"CustomSkill.CustomPoints.text=[custom_points_faker]")
				winset(usr,null,"CustomSkill.KnockbackInfo.text=[custom_piercing_faker]")
				return
		KnockbackMinus()
			set hidden=1
			if(custom_piercing_faker<1)return
			if(custom_piercing_faker>=200||custom_piercing>=200)
				usr<<"Your knockback is at the max!"
				custom_piercing_faker=200
				winset(usr,null,"CustomSkill.KnockbackInfo.text=[custom_piercing_faker]")
				return
			else
				custom_points_faker++
				custom_piercing_faker--
				ca_piercing_used++
				winset(usr,null,"CustomSkill.CustomPoints.text=[custom_points_faker]")
				winset(usr,null,"CustomSkill.KnockbackInfo.text=[custom_piercing_faker]")
				return
		Use_Custom_Points()
			set category="Channels"
			winshow(usr,"CustomSkill",1)
			custom_damage_faker_old=0
			custom_delay_faker_old=0
			custom_distance_faker_old=0
			custom_piercing_faker_old=0
			ca_piercing_used=0
			ca_distance_used=0
			ca_delay_used=0
			ca_damage_used=0
			custom_points_faker=custom_points
			if(custom_piercing>=200)custom_piercing=200
			custom_piercing_faker=custom_piercing
			custom_piercing_faker_old=custom_piercing
			if(custom_distance>=1000)custom_distance=1000
			custom_distance_faker=custom_distance
			custom_distance_faker_old=custom_distance
			custom_delay_faker=custom_delay
			if(custom_damage>=100000)custom_damage=100000
			custom_damage_faker=custom_damage
			custom_damage_faker_old=custom_damage
			winset(usr,null,"CustomSkill.CustomPoints.text=[custom_points_faker]")
			winset(usr,null,"CustomSkill.KnockbackInfo.text=[custom_piercing_faker]")
			winset(usr,null,"CustomSkill.DistanceInfo.text=[custom_distance_faker]")
			winset(usr,null,"CustomSkill.SpeedInfo.text=[custom_delay_faker]")
			winset(usr,null,"CustomSkill.DamageInfo.text=[custom_damage_faker]")
			return
		Custom_Technique()
			set category="Channels"
			switch(input("Do you want to create a custom technique?")in list("Yes","No"))
				if("No")return
				if("Yes")
					winshow(usr,"CustomTech",1)
					winset(usr,null,"CustomTech.SkillName.text='[custom_name]'")
					winset(usr,null,"CustomTech.InfoKiUsage.text=[round(custom_ki*100)]%")
					winset(usr,null,"CustomTech.BattleText1.text='[custom_txt_1]'")
					winset(usr,null,"CustomTech.BattleText2.text='[custom_txt_2]'")
					if(custom_homing)winset(usr,null,"CustomTech.HomingInfo.text=Homing")
					if(!custom_homing)winset(usr,null,"CustomTech.HomingInfo.text='No Homing'")
					if(!custom_kill)winset(usr,null,"CustomTech.InfoKill.text=KO")
					if(custom_kill)winset(usr,null,"CustomTech.InfoKill.text=Kill")
					usr<<output(null,"CustomIcon")
					usr<<output("<big>\icon[custom_icon]</big>","CustomIcon")
					return
		CustomName()
			set hidden=1
			var/T=input("What is your custom technique's name?")as null|text
			if(!T||T==null)return
			if(lentext(T) > 15)
				alert("Cannot exceed 15 characters!")
				return
			T = html_encode(T)
			custom_name = T
			winset(usr,null,"CustomTech.SkillName.text='[custom_name]'")
		CustomIcon()
			set hidden=1
			var/icon/I=input("Select your custom technique's icon:")as null|icon
			if(!I||I==null)return
			custom_icon=I
			usr<<output(null,"CustomIcon")
			usr<<output("<big>\icon[custom_icon]</big>","CustomIcon")
			return
		ChangeHoming()
			set hidden=1
			if(custom_homing)
				winset(usr,null,"CustomTech.HomingInfo.text='No Homing'")
				custom_homing=0
				return
			else
				winset(usr,null,"CustomTech.HomingInfo.text=Homing")
				custom_homing=1
				return
		ChangeKiUsage()
			set hidden=1
			var/test=input("How much ki % do you want to put into your custom attack?")as num
			if(test>100)
				alert("Ki amount automatically set to 100%")
				winset(usr,null,"CustomTech.InfoKiUsage.text=100%")
				custom_ki=1
				return
			if(test<=0)
				alert("Ki amount automatically set to 1%")
				winset(usr,null,"CustomTech.InfoKiUsage.text=1%")
				custom_ki=0.01
				return
			if(test>0&&test<=100)
				alert("Ki amount set to [test]%")
				winset(usr,null,"CustomTech.InfoKiUsage.text=[test]%")
				custom_ki=test/100
				return
		ChangeBattleText1()
			set hidden=1
			var/custom_txt1=input("What's the starting line of your custom attack's battle text?")as text
			if(lentext(custom_txt1)>80)
				alert("Cannot exceed 80 characters.")
				return
			custom_txt1=html_encode(custom_txt1)
			custom_txt_1=custom_txt1
			winset(usr,null,"CustomTech.BattleText1.text='[custom_txt_1]'")
			return
		ChangeBattleText2()
			set hidden=1
			var/custom_txt2=input("What's the ending line of your custom attack's battle text?")as text
			if(lentext(custom_txt2)>80)
				alert("Cannot exceed 80 characters.")
				return
			custom_txt2=html_encode(custom_txt2)
			custom_txt_2=custom_txt2
			winset(usr,null,"CustomTech.BattleText2.text='[custom_txt_2]'")
			return
		ChangeKill()
			set hidden=1
			if(custom_kill)
				winset(usr,null,"CustomTech.InfoKill.text=KO")
				custom_kill=0
				kill=0
				return
			else
				winset(usr,null,"CustomTech.InfoKill.text=KILL")
				custom_kill=1
				kill=1
				return
		TechCompleted()
			set hidden=1
			if(custom_icon)
				if(custom_name)
					alert("Your custom technique is now ready! Enjoy, [usr]!")
					alert("To even improve your custom technique, please use your custom points to increase the skills!")
					winshow(usr,"CustomTech",0)
					return
				else
					alert("Your custom technique doesn't have a name!")
					return
			else
				alert("Your custom icon must have an icon!")
				return