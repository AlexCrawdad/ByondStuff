obj/UT/UT
	verb
		UT()
			set category = "Combat"
			if(usr.KO||usr.doing||usr.spam_delay||usr.pvpkills<150||!usr.pvplvl||usr.isusingut)return
			if(usr.trans_delay)
				usr<<"Your body is still recovering from transforming!"
				return
			if(usr.race!="Saibaman"&&usr.race!="Saiyan"&&usr.race!="Kai"&&usr.race!="Half Saiyan"&&usr.race!="Human"&&usr.race!="Demon"&&usr.race!="Changeling"&&usr.race!="Galactic Warrior"&&usr.race!="Makyo"&&usr.race!="Dark Angel")
				if(!usr.permtpsboosted)
					usr<<"You need to be fully transed in order to be able to use this!"
					return
			usr.spam_delay=1
			spawn(12)if(usr)usr.spam_delay=0
			usr.icon_state = "enrage"
			usr.frozen=1
			if(usr.transetxt!="")view(8)<<"<font color=white>[usr]: [usr.transetxt]"
			usr.AllTranse()
			sleep(30)
			if(!usr)return
			if(usr.transebase!="")usr.icon=usr.transebase
			usr.overlays -= usr.hair_icon
			usr.Hair_Apply()
			usr.icon_state=""
			if(usr.transeaura!="")usr.overlays+=usr.transeaura
			usr.powerlevel=usr.powerlevel_max
			usr.ki=usr.ki_max
			usr.kidefense=usr.kidefense_max
			usr.strength=usr.strength_max
			usr.defence=usr.defence_max
			if(usr.race!="Saibaman"&&usr.race!="Saiyan"&&usr.race!="Kai"&&usr.race!="Half Saiyan"&&usr.race!="Human"&&usr.race!="Demon"&&usr.race!="Changeling"&&usr.race!="Galactic Warrior"&&usr.race!="Makyo"||usr.race=="Bardock"||usr.race=="Bojack"||usr.race=="Uubub"||usr.race=="Tenrai")
				usr.powerlevel*=usr.power_points*4
				usr.ki*=usr.ki_points*4
				usr.strength*=usr.str_points*4
				usr.defence*=usr.def_points*4
				usr.kidefense*= usr.kidef_points*4
				usr.TransformMasteryMultiplier()
				if(usr.race=="Android"||usr.race=="Majin"||usr.race=="Dragon"||usr.race=="Ultimate Hybrid"||usr.race=="Namekian"||usr.race=="Konat"||usr.race=="Bio Warrior"||usr.race=="Cooler"||usr.race=="Babidi"||usr.race=="Dark Angel"||usr.race=="Dark Namek"||usr.race=="Janemba"||usr.race=="Legendary")
					usr.powerlevel=usr.powerlevel_max
					usr.ki=usr.ki_max
					usr.kidefense=usr.kidefense_max
					usr.strength=usr.strength_max
					usr.defence=usr.defence_max
					usr.powerlevel*=usr.power_points*4.5
					usr.ki*=usr.ki_points*4.5
					usr.strength*=usr.str_points*4.5
					usr.defence*=usr.def_points*4.5
					usr.kidefense*=usr.kidef_points*4.5
					usr.TransformMasteryMultiplier()
			else
				usr.powerlevel*=usr.power_points*15
				usr.ki*=usr.ki_points*15
				usr.strength*=usr.str_points*15
				usr.defence*=usr.def_points*15
				usr.kidefense*=usr.kidef_points*15
				usr.TransformMasteryMultiplier()
			usr.block+=25
			usr.dodge+=25
			usr.critical+=25
			usr.reflect+=25
			usr.counter+=25
			usr.isusingut=1
			usr.Skills_Checker()
			if(usr.powerlevel<1)usr.powerlevel=usr.powerlevel_max
			if(usr.ki<1)usr.ki=usr.ki_max
			if(usr.strength<1)usr.strength=usr.strength_max
			if(usr.defence<1)usr.defence=usr.defence_max
			if(usr.kidefense<1)usr.kidefense=usr.kidefense_max
			usr.frozen=0
			usr.speed=1
			usr.speed_max=1
			usr.VarReset()
obj/Transform/Transform
	verb
		Transform()
			set category = "Combat"
			if(usr.KO||usr.spam_delay||usr.isusingut)return
			if(usr.doing)
				usr<<"You are already doing something!"
				return
			if(usr.trans_delay)
				usr<<"Your body is still recovering from transforming!"
				return
			usr.training=1
			usr.spam_delay=1
			spawn(12)if(usr)
				usr.training=0
				usr.spam_delay=0
			if(usr.race!="Namekian"||usr.race!="Majin"||usr.race!="Android")
				if(usr.kaioken && usr.form_1)
					usr<<"You relax your Kaioken state."
					usr.kaioken=0
					usr.Power_Redefine()
			if(usr.fused)
				if(usr.fused_using)return
				usr.powerlevel=usr.powerlevel_max
				usr.ki=usr.ki_max
				usr.kidefense=usr.kidefense_max
				usr.strength=usr.strength_max
				usr.defence=usr.defence_max
				switch(usr.race)
					if("Galactic Warrior")usr.BojackFuseForm()
					if("Makyo")usr.MakyoFuseForm()
					if("Saiyan")usr.SaiyanFuseForm()
					if("Changeling")usr.ChanglingFuseForm()
					if("Half Saiyan")usr.HalfSaiyanFuseForm()
					if("Demon")usr.DemonFuseForm()
					if("Human")usr.HumanFuseForm()
					if("Kai")usr.KaiFuseForm()
					if("Saibaman")usr.SaibamanFuseForm()
					if("Vampire")usr.VampFuseForm()
				usr.fused_using=1
				return
			if(usr.race=="Namekian")
				switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
					if("Yes")
						if(usr.trans_delay)return
						usr.NamekTrans()
					if("No")return
			if(usr.race=="Bio-Warrior")
				switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
					if("Yes")
						if(usr.trans_delay)return
						usr.BioWarriorTrans()
					if("No")return
			if(usr.race=="Dragon")
				switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
					if("Yes")
						if(usr.trans_delay)return
						usr.DragonTrans()
					if("No")return
			if(usr.race == "Android")
				if(usr.gene_model13)
					switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
						if("Yes")
							if(usr.trans_delay)
								return
							usr.trans_delay = 1
							usr.AndroidTrans()
						if("No")
							usr.spam_delay=0
							return
				if(usr.gene_model17)
					if(!usr.form_1)
						switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
							if("Yes")
								if(usr.trans_delay)
									return
								usr.spam_delay=0
								usr.Android17Trans()
							if("No")
								usr.spam_delay=0
								return
					else
						usr.spam_delay=0
						usr.Android17Trans()
			if(usr.race=="Majin")
				switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
					if("Yes")
						if(usr.trans_delay)return
						usr.MajinTrans()
					if("No")return
			if(usr.race=="Changeling")
				if(usr.potara_fused)usr.ChanglingPotaraFuseForm()
				if(usr.gonemetal)usr.ChanglingTransMetal()
				else usr.ChanglingTrans()
			if(usr.race=="Cooler")
				if(usr.potara_fused)usr.ChanglingCoolFuseForm()
				else usr.ChanglingCoolTrans()
			if(usr.race=="Saiyan")
				if(usr.potara_fused)usr.SaiyanPotaraFuseForm()
				else
					if(usr.god_chromosome)usr.GSaiyanTrans()
					if(usr.legendary_chromosome)usr.LSaiyanTrans()
					if(usr.train_chromosome)usr.PSaiyanTrans()
					if(usr.rage_chromosome)usr.HSaiyanTrans()
			if(usr.race=="Human")
				if(usr.potara_fused)usr.HumanPotaraFuseForm()
				else
					if(!usr.gero_converted)usr.HumanTrans()
					else usr.HumanCyborgTrans()
			if(usr.race=="Tuffle")
				if(!usr.form_2)
					switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
						if("Yes")
							if(usr.trans_delay)return
							usr.TuffleTrans()
						else return
				else usr.TuffleTrans()
			if(usr.race=="Bio-Android")
				if(!usr.form_2)
					switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
						if("Yes")
							if(usr.trans_delay)return
							usr.BioTrans()
						else return
				else usr.BioTrans()
			if(usr.race == "Demon")
				if(usr.gene_chaotic)
					usr.spam_delay=0
					usr.DemonTrans()
				if(usr.gene_angelic)
					usr.spam_delay=0
					usr.AngelicDemonTrans()
			if(usr.race=="Android")usr.AndroidTrans()
			if(usr.race=="Tenrai")usr.TenraiTrans()
			if(usr.race=="Legendary")usr.LegendaryTrans()
			if(usr.race=="Janemba")usr.JanembaTrans()
			if(usr.race=="Dark Namek")usr.DarkNamekTrans()
			if(usr.race=="Dark Angel")usr.DarkAngelTrans()
			if(usr.race=="Uubub")usr.UububTrans()
			if(usr.race=="Bojack")usr.BojackTrans()
			if(usr.race=="Bardock")usr.BardockTrans()
			if(usr.race=="Babidi")usr.BabidiTrans()
			if(usr.race=="Cooler")usr.ChanglingCoolTrans()
			if(usr.race=="Vampire")
				if(usr.potara_fused)usr.VampPotaraFuseForm()
				else usr.VampTrans()
			if(usr.race=="Half Saiyan")
				if(usr.potara_fused)usr.HalfSaiyanPotaraFuseForm()
				else usr.HalfSaiyanTrans()
			if(usr.race=="Saibaman")
				if(usr.potara_fused)usr.SaibamanPotaraFuseForm()
				else usr.SaibamanTrans()
			if(usr.race=="Kai")
				if(usr.potara_fused)usr.KaiPotaraFuseForm()
				else usr.KaiTrans()
			if(usr.race=="Makyo")
				if(usr.potara_fused)usr.MakyoPotaraFuseForm()
				else usr.MakyoTrans()
			if(usr.race=="Ultimate Hybrid")
				switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
					if("Yes")
						if(usr.trans_delay)return
						usr.HybridTrans()
					else return
			if(usr.race=="Galactic Warrior")
				if(usr.potara_fused)usr.BojackPotaraFuseForm()
				else usr.BojackTrans()
			usr.doing=0
			spawn(35)if(usr)usr.trans_delay=0
			return
obj/Transform/Revert
	verb
		Revert()
			set category = "Combat"
			if(usr.trans_delay||usr.KO||usr.doing)return
			if(usr.isusingut)
				usr.trans_delay=1
				usr.frozen=1
				usr.icon_state="enrage"
				sleep(10)
				if(!usr.UTrevert)usr.Skin_Apply()
				usr.doing=0
				usr.Power_Redefine()
				usr.powerlevel=usr.powerlevel_max
				usr.ki=usr.ki_max
				view() << sound('revert.wav')
				view(8)<<"[usr] has reverted from their transformed state."
				usr.icon_state=""
				usr.frozen=0
				usr.overlays-=usr.transeaura
				usr.isusingut=0
				usr.trans_delay=0
				return
			usr.trans_delay=1
			usr.doing=1
			usr.training=1
			spawn(12)if(usr)
				usr.training=0
				usr.doing=0
				usr.trans_delay=0
			if(usr.race=="Human")usr.HumanRevert()
			if(usr.race=="Half Saiyan")usr.HalfSaiyanRevert()
			if(usr.race=="Changeling")usr.ChanglingRevert()
			if(usr.race=="Saiyan")
				if(usr.legendary_chromosome)usr.LSaiyanRevert()
				if(usr.god_chromosome)usr.GSaiyanRevert()
				else usr.SaiyanRevert()
			if(usr.race=="Tuffle")usr.TuffleRevert()
			if(usr.race=="Bio-Android")usr.BioRevert()
			if(usr.race=="Demon")usr.DemonRevert()
			if(usr.race=="Saibaman")usr.SaibamanRevert()
			if(usr.race=="Kai")usr.KaiRevert()
			if(usr.race=="Galactic Warrior")usr.BojackRevert()
			if(usr.race=="Makyo")usr.MakyoRevert()
			if(usr.race=="Cooler")usr.ChanglingCoolRevert()
			if(usr.race=="Babidi")usr.BabidiRevert()
			if(usr.race=="Bardock")usr.BardockRevert()
			if(usr.race=="Bojack")usr.BojackRevert()
			if(usr.race=="Uubub")usr.UububRevert()
			if(usr.race=="Dark Angel")usr.DarkAngelRevert()
			if(usr.race=="Dark Namek")usr.DarkNamekRevert()
			if(usr.race=="Janemba")usr.JanembaRevert()
			if(usr.race=="Tenrai")usr.TenraiRevert()
			if(usr.race=="Legendary")usr.LegendaryRevert()
			if(usr.race=="Vampire")usr.VampRevert()
			usr.underlays-=usr.underlays
			usr.aura_on=0
			usr.fused_using=0
			return
mob
	var
		tmp/windeffect=0
	proc
		windeffect()
			set background=1
			spawn()
				while(src.windeffect)
					new /Explosion(new /Effect/MysticWind(src.loc,1,9))
					sleep(rand(10,15))
		Power_Redefine()
			if(powerlevel>powerlevel_max)powerlevel=powerlevel_max
			if(ki>ki_max)ki=ki_max
			kidefense=kidefense_max
			strength=strength_max
			defence=defence_max
			speed=speed_max
			critical=critical_max
			dodge=dodge_max
			reflect=reflect_max
			block=block_max
			counter=counter_max
			return
		AutoRevert()
			if(!src||fused||potara_fused)return
			if(race=="Human")HumanRevert()
			if(race=="Half Saiyan")HalfSaiyanRevert()
			if(race=="Changeling")ChanglingRevert()
			if(race=="Saiyan")
				if(legendary_chromosome)LSaiyanRevert()
				if(god_chromosome)GSaiyanRevert()
				else SaiyanRevert()
			if(race=="Tuffle")TuffleRevert()
			if(race=="Bio-Android")BioRevert()
			if(race=="Demon")DemonRevert()
			if(race=="Saibaman")SaibamanRevert()
			if(race=="Kai")KaiRevert()
			if(race=="Galactic Warrior")BojackRevert()
			if(race=="Makyo")MakyoRevert()
			if(race=="Cooler")ChanglingCoolRevert()
			if(race=="Babidi")BabidiRevert()
			if(race=="Bardock")BardockRevert()
			if(race=="Bojack")BojackRevert()
			if(race=="Uubub")UububRevert()
			if(race=="Dark Angel")DarkAngelRevert()
			if(race=="Dark Namek")DarkNamekRevert()
			if(race=="Janemba")JanembaRevert()
			if(race=="Tenrai")TenraiRevert()
			if(race=="Legendary")LegendaryRevert()
			if(race=="Vampire")usr.VampRevert()



