mob
	var
		potara_fused=0
		potara_using=0
obj/Technique/PotaraDance/verb
	Potara_Dance(mob/M in oview(1))
		set category="Combat"
		if(usr.race!="Saibaman"&&usr.race!="Saiyan"&&usr.race!="Kai"&&usr.race!="Half Saiyan"&&usr.race!="Human"&&usr.race!="Demon"&&usr.race!="Changeling"&&usr.race!="Galactic Warrior"&&usr.race!="Makyo")return
		if(usr.Oozaru)
			usr<<"Revert from Oozaru first."
			return
		if(usr.tourny||usr.babatourny||usr.guildtourny||usr.rtourny||usr.jrtourny)
			usr<<"You are in a tournament!"
			return
		if(usr.potara_fused||M.potara_fused||!usr.got_potara||!M.got_potara||!M||!usr||M==usr||M.fused||usr.fused)return
		if(M.tourny||M.babatourny||M.guildtourny||M.rtourny||M.jrtourny)
			usr<<"[M] are in a tournament!"
			return
		if(M.Oozaru)
			usr<<"[M] must revert from Oozaru first."
			return
		if(usr.dead)
			usr<<"You are dead."
			return
		if(M.dead)
			usr<<"[M] is dead."
			return
		if(usr.level<50000)
			usr<<"You must be at least level 50,000 or higher to use this!"
			return
		if(M.level<50000)
			usr<<"[M] must be at least level 50,000 or higher to use this!"
			return
		if(M.client.address==usr.client.address)
			usr<<"You cannot use your own alt for potara!"
			return
		if(usr.gone_mystic||usr.gero_converted||usr.gonemetal)
			usr<<"It looks like you already boosted from an extra booster!"
			return
		if(M.gone_mystic||M.gero_converted||M.gonemetal)
			usr<<"It looks like [M] already boosted from an extra booster!"
			return
		else
			if(!usr.asking_fuse||!M.asking_fuse)
				if(!usr.potara_fused)
					if(!M.potara_fused)
						if(istype(M,/mob/PC))
							if(!usr.doing)
								if(!M.doing)
									if(!M.talking&&!usr.talking)
										usr<<"<b>Asking [M] if they wants to fuse!"
										if(usr.doing||M.doing)return
										usr.asking_fuse=1
										M.asking_fuse=1
										switch(alert(M,"[usr] wants to perform the Potara with you!  Do you want to perform the Potara with [usr]?  This form of fusion will make you fused warrior, permanently! Fuse?","Fuse","Yes","No"))
											if("Yes")
												if(!usr||!M||usr.fused||M.fused||usr.doing||M.doing||M.potara_fused||usr.potara_fused)
													if(usr)usr.asking_fuse=0
													if(M)M.asking_fuse=0
													return
												if(!usr.got_potara||!M.got_potara)
													usr.asking_fuse=0
													M.asking_fuse=0
													return
												usr.potara_fused=1
												M.potara_fused=1
												if(!M||!usr)
													if(usr)usr.asking_fuse=0
													if(M)M.asking_fuse=0
													return
												usr.powerlevel_max+=M.powerlevel_max
												usr.ki_max+=M.ki_max
												usr.strength_max+=M.strength_max
												usr.defence_max+=M.defence_max
												usr.kidefense_max+=M.kidefense_max
												usr.powerlevel=usr.powerlevel_max
												usr.ki=usr.ki_max
												usr.strength=usr.strength_max
												usr.defence=usr.defence_max
												M.powerlevel_max=usr.powerlevel_max
												M.powerlevel=usr.powerlevel
												M.ki_max=usr.ki_max
												M.ki=usr.ki
												M.kidefense_max=usr.kidefense_max
												M.kidefense=usr.kidefense
												M.strength=usr.strength
												M.strength_max=usr.strength_max
												M.defence=usr.defence
												M.defence_max=usr.defence_max
												if(usr.race=="Makyo")usr.MakyoPotaraFuseForm()
												if(M.race=="Makyo")M.MakyoPotaraFuseForm()
												if(usr.race=="Galactic Warrior")usr.BojackPotaraFuseForm()
												if(M.race=="Galactic Warrior")M.BojackPotaraFuseForm()
												if(usr.race=="Saibaman")usr.SaibamanPotaraFuseForm()
												if(M.race=="Saibaman")M.SaibamanPotaraFuseForm()
												if(usr.race=="Saiyan")usr.SaiyanPotaraFuseForm()
												if(M.race=="Saiyan")M.SaiyanPotaraFuseForm()
												if(usr.race=="Changeling")usr.ChanglingPotaraFuseForm()
												if(M.race=="Changeling")M.ChanglingPotaraFuseForm()
												if(usr.race=="Demon")usr.DemonPotaraFuseForm()
												if(M.race=="Demon")M.DemonPotaraFuseForm()
												if(usr.race=="Kai")usr.KaiPotaraFuseForm()
												if(M.race=="Kai")M.KaiPotaraFuseForm()
												if(usr.race=="Half Saiyan")usr.HalfSaiyanPotaraFuseForm()
												if(M.race=="Half Saiyan")M.HalfSaiyanPotaraFuseForm()
												if(usr.race=="Human")usr.HumanPotaraFuseForm()
												if(M.race=="Human")M.HumanPotaraFuseForm()
												return
											if("No")
												usr<<"[M] doesn't want to fuse!"
												usr.asking_fuse=0
												M.asking_fuse=0
												return
									return