mob/PC
	verb
		Focus_Train()
			set category="Training"
			//RegSpamGuard()
			if(commandlocked)return
			if(boxing||rest||dualtrain||doing||ft_using||jailed||train)return
			if(waiting)
				usr<<"You must wait before you can train again!"
				return
			if(stamina>=stamina_max)
				usr<<"You are too drained to train!"
				return
			ft_using=1
			var/random=input("Which do you want to focus train on?","Focus Train")in list("Powerlevel","Strength","Defense","Ki","Ki Defense","Cancel")
			if(boxing||rest||dualtrain||doing||jailed||train)
				ft_using=0
				return
			switch(random)
				if("Cancel")
					ft_using=0
					return
				if("Powerlevel")
					ft_using=0
					ft_strength=0
					ft_defence=0
					ft_ki=0
					ft_kidefence=0
					ft_power=1
				if("Strength")
					ft_using=0
					ft_strength=1
					ft_defence=0
					ft_ki=0
					ft_kidefence=0
					ft_power=0
				if("Defense")
					ft_using=0
					ft_strength=0
					ft_defence=1
					ft_ki=0
					ft_kidefence=0
					ft_power=0
				if("Ki")
					ft_using=0
					ft_strength=0
					ft_defence=0
					ft_ki=1
					ft_kidefence=0
					ft_power=0
				if("Ki Defense")
					ft_using=0
					ft_strength=0
					ft_defence=0
					ft_ki=0
					ft_kidefence=1
					ft_power=0
			MacroFocusReset()
			train=1
			position=0
			A1=image('Arrow.dmi',usr,icon_state="l")
			A1.pixel_y=32
			A1.pixel_x=-32
			A1.layer=1005
			usr<<A1
			A2=image('Arrow.dmi',usr,icon_state="m")
			A2.pixel_y=32
			A2.layer=1005
			usr<<A2
			A3=image('Arrow.dmi',usr,icon_state="r")
			A3.pixel_y=32
			A3.pixel_x=32
			A3.layer=1005
			usr<<A3
			doing=1
			icon_state="spar fury"
			usr<<"You begin to focus train! Push the correct arrow keys to train."
			frozen=1
			FocusTraining()

		FTTraining_Down()
			set hidden=1
			//RegSpamGuard()
			if(commandlocked)return
			if(position==1)
				if(D[1]=="Down")
					position++
					Focus_Train2()
					client.images-=AD1
					DG=image('Arrow.dmi',usr,icon_state="down_gone")
					DG.pixel_y=32
					DG.pixel_x=-32
					DG.layer=1005
					usr<<DG
				else
					usr<<"Incorrect!"
					FocusUnTraining()
			else if(position==2)
				if(D[2]=="Down")
					position++
					Focus_Train2()
					client.images-=AD2
					DG=image('Arrow.dmi',usr,icon_state="down_gone")
					DG.pixel_y=32
					DG.pixel_x=-16
					DG.layer=1005
					usr<<DG
				else
					usr<<"Incorrect!"
					FocusUnTraining()
			else if(position==3)
				if(D[3]=="Down")
					position++
					Focus_Train2()
					client.images-=AD3
					DG=image('Arrow.dmi',usr,icon_state="down_gone")
					DG.pixel_y=32
					DG.pixel_x=0
					DG.layer=1005
					usr<<DG
				else
					usr<<"Incorrect!"
					FocusUnTraining()
			else if(position==4)
				if(D[4]=="Down")
					position++
					Focus_Train2()
					client.images-=AD4
					DG=image('Arrow.dmi',usr,icon_state="down_gone")
					DG.pixel_y=32
					DG.pixel_x=16
					DG.layer=1005
					usr<<DG
				else
					usr<<"Incorrect!"
					FocusUnTraining()
			else if(position==5)
				if(D[5]=="Down")
					Focus_Train2()
					DG=image('Arrow.dmi',usr,icon_state="down_gone")
					DG.pixel_y=32
					DG.pixel_x=32
					DG.layer=1005
					usr<<DG
					FocusTraining()
				else
					usr<<"Incorrect!"
					FocusUnTraining()
		FTTraining_Left()
			set hidden=1
			//RegSpamGuard()
			if(commandlocked)return
			if(position==1)
				if(D[1]=="Left")
					position++
					Focus_Train2()
					client.images-=AL1
					LG=image('Arrow.dmi',usr,icon_state="left_gone")
					LG.pixel_y=32
					LG.pixel_x=-32
					LG.layer=1005
					usr<<LG
				else
					usr<<"Incorrect!"
					FocusUnTraining()
			else if(position==2)
				if(D[2]=="Left")
					position++
					Focus_Train2()
					client.images-=AL2
					LG=image('Arrow.dmi',usr,icon_state="left_gone")
					LG.pixel_y=32
					LG.pixel_x=-16
					LG.layer=1005
					usr<<LG
				else
					usr<<"Incorrect!"
					FocusUnTraining()
			else if(position==3)
				if(D[3]=="Left")
					position++
					Focus_Train2()
					client.images-=AL3
					LG=image('Arrow.dmi',usr,icon_state="left_gone")
					LG.pixel_y=32
					LG.pixel_x=0
					LG.layer=1005
					usr<<LG
				else
					usr<<"Incorrect!"
					FocusUnTraining()
			else if(position==4)
				if(D[4]=="Left")
					position++
					Focus_Train2()
					client.images-=AL4
					LG=image('Arrow.dmi',usr,icon_state="left_gone")
					LG.pixel_y=32
					LG.pixel_x=16
					LG.layer=1005
					usr<<LG
				else
					usr<<"Incorrect!"
					FocusUnTraining()
			else if(position==5)
				if(D[5]=="Left")
					Focus_Train2()
					LG=image('Arrow.dmi',usr,icon_state="left_gone")
					LG.pixel_y=32
					LG.pixel_x=32
					LG.layer=1005
					usr<<LG
					FocusTraining()
				else
					usr<<"Incorrect!"
					FocusUnTraining()
		FTTraining_Up()
			set hidden=1
			//RegSpamGuard()
			if(commandlocked)return
			if(position==1)
				if(D[1]=="Up")
					position++
					Focus_Train2()
					client.images-=AU1
					UG=image('Arrow.dmi',usr,icon_state="up_gone")
					UG.pixel_y=32
					UG.pixel_x=-32
					UG.layer=1005
					usr<<UG
				else
					usr<<"Incorrect!"
					FocusUnTraining()
			else if(position==2)
				if(D[2]=="Up")
					position++
					Focus_Train2()
					client.images-=AU2
					UG=image('Arrow.dmi',usr,icon_state="up_gone")
					UG.pixel_y=32
					UG.pixel_x=-16
					UG.layer=1005
					usr<<UG
				else
					usr<<"Incorrect!"
					FocusUnTraining()
			else if(position==3)
				if(D[3]=="Up")
					position++
					Focus_Train2()
					client.images-=AU3
					UG=image('Arrow.dmi',usr,icon_state="up_gone")
					UG.pixel_y=32
					UG.pixel_x=0
					UG.layer=1005
					usr<<UG
				else
					usr<<"Incorrect!"
					FocusUnTraining()
			else if(position==4)
				if(D[4]=="Up")
					position++
					Focus_Train2()
					client.images-=AU4
					UG=image('Arrow.dmi',usr,icon_state="up_gone")
					UG.pixel_y=32
					UG.pixel_x=16
					UG.layer=1005
					usr<<UG
				else
					usr<<"Incorrect!"
					FocusUnTraining()
			else if(position==5)
				if(D[5]=="Up")
					Focus_Train2()
					UG=image('Arrow.dmi',usr,icon_state="up_gone")
					UG.pixel_y=32
					UG.pixel_x=32
					UG.layer=1005
					usr<<UG
					FocusTraining()
				else
					usr<<"Incorrect!"
					FocusUnTraining()
		FTTraining_Right()
			set hidden=1
			//RegSpamGuard()
			if(commandlocked)return
			if(position==1)
				if(D[1]=="Right")
					position++
					Focus_Train2()
					client.images-=AR1
					RG=image('Arrow.dmi',usr,icon_state="right_gone")
					RG.pixel_y=32
					RG.pixel_x=-32
					RG.layer=1005
					usr<<RG
				else
					usr<<"Incorrect!"
					FocusUnTraining()
			else if(position==2)
				if(D[2]=="Right")
					position++
					Focus_Train2()
					client.images-=AR2
					RG=image('Arrow.dmi',usr,icon_state="right_gone")
					RG.pixel_y=32
					RG.pixel_x=-16
					RG.layer=1005
					usr<<RG
				else
					usr<<"Incorrect!"
					FocusUnTraining()
			else if(position==3)
				if(D[3]=="Right")
					position++
					Focus_Train2()
					client.images-=AR3
					RG=image('Arrow.dmi',usr,icon_state="right_gone")
					RG.pixel_y=32
					RG.pixel_x=0
					RG.layer=1005
					usr<<RG
				else
					usr<<"Incorrect!"
					FocusUnTraining()
			else if(position==4)
				if(D[4]=="Right")
					position++
					Focus_Train2()
					client.images-=AR4
					RG=image('Arrow.dmi',usr,icon_state="right_gone")
					RG.pixel_y=32
					RG.pixel_x=16
					RG.layer=1005
					usr<<RG
				else
					usr<<"Incorrect!"
					FocusUnTraining()
			else if(position==5)
				if(D[5]=="Right")
					Focus_Train2()
					RG=image('Arrow.dmi',usr,icon_state="right_gone")
					RG.pixel_y=32
					RG.pixel_x=32
					RG.layer=1005
					usr<<RG
					FocusTraining()
				else
					usr<<"Incorrect!"
					FocusUnTraining()
mob
	proc
		FocusUnTraining()
			train=0
			position=0
			doing=0
			frozen=0
			icon_state=""
			amount=1
			spawn(3)if(src)client.images=null
			ft_strength=0
			ft_defence=0
			ft_ki=0
			ft_kidefence=0
			ft_power=0
			ftcorrect=0
			ftexp=1
			MacroDefaultReset()
			return
		FocusTraining()
			var/i
			amount=1
			if(position==5)
				position=1
				client.images=null
				A1=image('Arrow.dmi',src,icon_state="l")
				A1.pixel_y=32
				A1.pixel_x=-32
				A1.layer=1005
				src<<A1
				A2=image('Arrow.dmi',src,icon_state="m")
				A2.pixel_y=32
				A2.layer=1005
				src<<A2
				A3=image('Arrow.dmi',src,icon_state="r")
				A3.pixel_y=32
				A3.pixel_x=32
				A3.layer=1005
				src<<A3
				sleep(1)
			else position++
			for(i=1,i<=5,i++)
				L[i]=rand(1,4)
				if(amount==1)
					if(L[i]==1)
						AU1=image('Arrow.dmi',src,icon_state="up")
						AU1.pixel_y=32
						AU1.pixel_x=-32
						AU1.layer=1005
						src<<AU1
						D[i]="Up"
					else if(L[i]==2)
						AD1=image('Arrow.dmi',src,icon_state="down")
						AD1.pixel_y=32
						AD1.pixel_x=-32
						AD1.layer=1005
						src<<AD1
						D[i]="Down"
					else if(L[i]==3)
						AL1=image('Arrow.dmi',src,icon_state="left")
						AL1.pixel_y=32
						AL1.pixel_x=-32
						AL1.layer=1005
						src<<AL1
						D[i]="Left"
					else if(L[i]==4)
						AR1=image('Arrow.dmi',src,icon_state="right")
						AR1.pixel_y=32
						AR1.pixel_x=-32
						AR1.layer=1005
						src<<AR1
						D[i]="Right"
					amount=2
				else if(amount==2)
					if(L[i]==1)
						AU2=image('Arrow.dmi',src,icon_state="up")
						AU2.pixel_y=32
						AU2.pixel_x=-16
						AU2.layer=1005
						src<<AU2
						D[i]="Up"
					else if(L[i]==2)
						AD2=image('Arrow.dmi',src,icon_state="down")
						AD2.pixel_y=32
						AD2.pixel_x=-16
						AD2.layer=1005
						src<<AD2
						D[i]="Down"
					else if(L[i]==3)
						AL2=image('Arrow.dmi',src,icon_state="left")
						AL2.pixel_y=32
						AL2.pixel_x=-16
						AL2.layer=1005
						src<<AL2
						D[i]="Left"
					else if(L[i]==4)
						AR2=image('Arrow.dmi',src,icon_state="right")
						AR2.pixel_y=32
						AR2.pixel_x=-16
						AR2.layer=1005
						src<<AR2
						D[i]="Right"
					amount=3
				else if(amount==3)
					if(L[i]==1)
						AU3=image('Arrow.dmi',src,icon_state="up")
						AU3.pixel_y=32
						AU3.pixel_x=0
						AU3.layer=1005
						src<<AU3
						D[i]="Up"
					else if(L[i]==2)
						AD3=image('Arrow.dmi',src,icon_state="down")
						AD3.pixel_y=32
						AD3.pixel_x=0
						AD3.layer=1005
						src<<AD3
						D[i]="Down"
					else if(L[i]==3)
						AL3=image('Arrow.dmi',src,icon_state="left")
						AL3.pixel_y=32
						AL3.pixel_x=0
						AL3.layer=1005
						src<<AL3
						D[i]="Left"
					else if(L[i]==4)
						AR3=image('Arrow.dmi',src,icon_state="right")
						AR3.pixel_y=32
						AR3.pixel_x=0
						AR3.layer=1005
						src<<AR3
						D[i]="Right"
					amount=4
				else if(amount==4)
					if(L[i]==1)
						AU4=image('Arrow.dmi',src,icon_state="up")
						AU4.pixel_y=32
						AU4.pixel_x=16
						AU4.layer=1005
						src<<AU4
						D[i]="Up"
					else if(L[i]==2)
						AD4=image('Arrow.dmi',src,icon_state="down")
						AD4.pixel_y=32
						AD4.pixel_x=16
						AD4.layer=1005
						src<<AD4
						D[i]="Down"
					else if(L[i]==3)
						AL4=image('Arrow.dmi',src,icon_state="left")
						AL4.pixel_y=32
						AL4.pixel_x=16
						AL4.layer=1005
						src<<AL4
						D[i]="Left"
					else if(L[i]==4)
						AR4=image('Arrow.dmi',src,icon_state="right")
						AR4.pixel_y=32
						AR4.pixel_x=16
						AR4.layer=1005
						src<<AR4
						D[i]="Right"
					amount=5
				else if(amount==5)
					if(L[i]==1)
						AU5=image('Arrow.dmi',src,icon_state="up")
						AU5.pixel_y=32
						AU5.pixel_x=32
						AU5.layer=1005
						src<<AU5
						D[i]="Up"
					else if(L[i]==2)
						AD5=image('Arrow.dmi',src,icon_state="down")
						AD5.pixel_y=32
						AD5.pixel_x=32
						AD5.layer=1005
						src<<AD5
						D[i]="Down"
					else if(L[i]==3)
						AL5=image('Arrow.dmi',src,icon_state="left")
						AL5.pixel_y=32
						AL5.pixel_x=32
						AL5.layer=1005
						src<<AL5
						D[i]="Left"
					else if(L[i]==4)
						AR5=image('Arrow.dmi',src,icon_state="right")
						AR5.pixel_y=32
						AR5.pixel_x=32
						AR5.layer=1005
						src<<AR5
						D[i]="Right"
					amount=0

mob
	var
		ft_toggler=0
		tmp
			ft_strength=0
			ft_defence=0
			ft_ki=0
			ft_kidefence=0
			ft_power=0
			ft_using=0
			ftcorrect=0
			ftexp=1
mob/proc/Focus_Train2()
	var/exp_bonus=(level*2*EXPrebirthgain*exphostgain)
	if(stamina>=stamina_max)
		src<<"You feel weak so you stop training!"
		FocusUnTraining()
		return
	else
		/*if(ft_strength&&strength_max>=powerlevel_max*3)
			src<<"Your strength is at the max!"
			return
		if(ft_defence&&defence_max>=powerlevel_max*3)
			src<<"Your defense is at the max!"
			return
		if(ft_ki&&ki_max>=powerlevel_max*3)
			src<<"Your ki is at the max!"
			return
		if(ft_kidefence&&kidefense_max>=powerlevel_max*3)
			src<<"Your ki defense is at the max!"
			return*/
		ftcorrect++
		if(ftcorrect>=70&&ftexp<3)
			if(ftexp==2)ftexp=3
			if(ftexp==1)ftexp=2
			ftcorrect=0
			src<<"<center>Focus Train Multiplier x[ftexp]!</center>"
		if(ftexp>1)exp_bonus*=ftexp*EXPrebirthgain*exphostgain
		if(in_hbtc)exp_bonus*=2.6*EXPrebirthgain*exphostgain
		if(ft_power)
			if(ft_toggler)
				if("focus_buff" in buffs)src<<output("Your powerlevel has gained by [exp_bonus*2]!","Training Box")
				else src<<output("Your powerlevel has gained by [applycommas(exp_bonus)]!","Training Box")
			powerlevel_max+=exp_bonus
			if("focus_buff" in buffs)powerlevel_max+=exp_bonus
		if(ft_strength)
			if(ft_toggler)
				if("focus_buff" in buffs)src<<output("Your strength has gained by [exp_bonus*2]!","Training Box")
				else src<<output("Your strength has gained by [applycommas(exp_bonus)]!","Training Box")
			strength_max+=exp_bonus
			if("focus_buff" in buffs)strength_max+=exp_bonus
		if(ft_defence)
			if(ft_toggler)
				if("focus_buff" in buffs)src<<output("Your defense has gained by [exp_bonus*2]!","Training Box")
				else src<<output("Your defense has gained by [applycommas(exp_bonus)]!","Training Box")
			defence_max+=exp_bonus
			if("focus_buff" in buffs)defence_max+=exp_bonus
		if(ft_ki)
			if(ft_toggler)
				if("focus_buff" in buffs)src<<output("Your ki has gained by [exp_bonus*2]!","Training Box")
				else src<<output("Your ki has gained by [applycommas(exp_bonus)]!","Training Box")
			ki_max+=exp_bonus
			if("focus_buff" in buffs)ki_max+=exp_bonus
		if(ft_kidefence)
			if(ft_toggler)
				if("focus_buff" in buffs)src<<output("Your ki defense has gained by [exp_bonus*2]!","Training Box")
				else src<<output("Your ki defense has gained by [applycommas(exp_bonus)]!","Training Box")
			kidefense_max+=exp_bonus
			if("focus_buff" in buffs)kidefense_max+=exp_bonus
		stamina+=3.7
		return