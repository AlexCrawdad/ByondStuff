mob
	var
		tmp/locker=0
		witness_deaths=0
		arena_lose=0
		arena_win=0
		enraged=0
		gone_ssj=0
		sp_gainer=0
		gotut=0
		DSM = 0
		DS = 0
		LKM = 0
		KSM = 0
		KS = 0
		BMM = 0
		WI = 0

mob
	proc
		ResetSomeStats()
			thrown=0
			overlays-=icon('Techs.dmi',"galaticdonut")
			overlays-=icon('Techs.dmi',"demonshackle")
			overlays-=icon('Techs.dmi',"imprisonmentball")
			binded=0
			doing=0
			frozen=0
			boxing=0
			dualtrain=0
			finish_delay=0
			deflecting=0
			dodging=0
			blocking=0
			countering=0
			e_db_1=0
			e_db_2=0
			e_db_3=0
			e_db_4=0
			e_db_5=0
			e_db_6=0
			e_db_7=0
			n_db_1=0
			n_db_2=0
			n_db_3=0
			n_db_4=0
			n_db_5=0
			n_db_6=0
			n_db_7=0
			b_db_1=0
			b_db_2=0
			b_db_3=0
			b_db_4=0
			b_db_5=0
			b_db_6=0
			b_db_7=0
		Rage_Unleash()
			if(race=="Saiyan"&&rage_chromosome)
				if(witness_deaths>=1)
					if(!gone_ssj)
						gone_ssj=1
						for(var/mob/PC/M in oview(8))
							if(M!=src)
								M<<"\white <I>[src] stands there, their face twisted with rage..."
								spawn(10)M<<"\white <I>[src] clench their fists, as tears well in their eyes. Veins protrude from [src]'s hands and forehead as the ground rumbles."
						src<<"\white <I>You feel an uncontrollable rage burning in you as you remember the people who have died in front of you."
						sleep(10)
						src<<"\white <I>You clench your fists, as tears well in your eyes. Veins protrude from your hands and forehead as the ground rumbles."
						icon_state="enrage"
						sleep(10)
						view(8)<<"\white [src]: I WILL NOT LET IT HAPPEN ANYMORE!"
						dualtrain=0
						boxing=0
						rest=0
//						UnTraining()
//						FocusUnTraining()
						powerlevel=powerlevel_max
						contents+=new/obj/Transform/Transform
						contents+=new/obj/Transform/Revert
						spawn(0)HSaiyanTrans()
						Explode(new /Effect/BasicBoom(loc,1,4))
						icon_state=""
			if(race=="Half Saiyan"&&!gone_ssj2)
				if(witness_deaths>=1)
					if(!gone_ssj2)
						gone_ssj2=1
						for(var/mob/PC/M in oview(8))
							if(M!=src)
								M<<"\white <I>[src] stands there, their face twisted with rage..."
								spawn(10)M<<"\white <I>[src] clenches their fists, as tears well in their eyes. Veins protrude from [src]'s hands and forehead as the ground rumbles."
						src<<"\white <I>You feel an uncontrollable rage burning in you as you remember the people who have died infront of you."
						sleep(10)
						src<<"\white <I>You clenches your fists, as tears well in your eyes. Veins protrude from your hands and forehead as the ground rumbles."
						icon_state="enrage"
						sleep(10)
						view(8)<<"\white [src]: I must let it all go...I mustn't hold back...I may not be strong enough...but..."
						sleep(10)
						view(8)<<"\white [src]: I can't...give...UP! I WON'T GIVE UP!!"
						dualtrain=0
						boxing=0
						rest=0
						powerlevel=powerlevel_max
						form_1=1
						form_2=1
						form_3=0
//						UnTraining()
//						FocusUnTraining()
						gone_ssj2=1
						HalfSaiyanTrans()
						Explode(new/Effect/BasicBoom(loc,1,6))
						icon_state=""
mob/proc/DeathCheck()
	if(powerlevel<=0)..()
	view() << "[src.name] has been knocked out!"
	src.sight |= BLIND
	src.frozen = 1
	sleep(100)
	src.powerlevel = 0
	src.frozen = 0
	src.sight &= ~BLIND
	src << "You wake up!"

mob/Monster/DeathCheck(mob/PC/M)
	var/count=0
	if(powerlevel <= 0)
		var/bonus_exp=round(exp*5)
		if(M.weight>0)bonus_exp*=2
		if(istype(M,/mob/PC))
			if(M.in_party)
				count=0
				for(var/mob/M2 in world)
					if(M2.party_name==M.party_name)
						count++
						var/exp2=exp/count
						M2.exp+=exp2*M.EXPrebirthgain
						M2.exp+=exp2*M2.levelexp*M.EXPrebirthgain
						M2.zenni+=zenni/2/count
						if("zenni_buff" in M2.buffs)M2.zenni+=zenni/2/count
						M2<<"\white Zenni +[zenni]"
						M2<<"\white EXP +[exp2]"
						M2.Level_Up()
			else
				M.exp+=bonus_exp*M.EXPrebirthgain
				M.exp+=bonus_exp*M.levelexp*M.EXPrebirthgain
				M.zenni+=zenni/2
				if("zenni_buff" in M.buffs)M.zenni+=zenni/2
				M<<"\white Zenni +[zenni/2]"
				M<<"\white EXP +[bonus_exp]"
				M.Level_Up()
		if(race=="Saibaman"&&M.strength_test_start)M.green_kills+=1
		if(race=="Namekian Warrior"&&M.worst_enemy_start)M.NW_kills+=1
		if(race=="Henchman"&&M.guru_quest_start&&!M.guru_quest_complete)M.thug_kills+=1
		if(name=="{NPC}Planet Z Gaurd"&&M.RebelFriend_start&&!M.RebelFriend_finished)M.Gaurd_kills+=1
		if(race=="Namekian Warrior"&&M.frieza_quest_start&&!M.frieza_quest_complete)M.namek_kills+=1
		if(name=="{NPC}Green Saibaman"&&M.saiba_menace_quest&&!M.saiba_menace_completed)M.killed_saibas+=1
		if(name=="{NPC}Raditz"&&M.Past_Present_Future_quest&&!M.killed_raditz)M.killed_raditz=1
		if(name=="{NPC}Tuffle"&&M.korin_start)M.tuffle_kills+=1
		if(name=="{NPC}Tuffle"&&M.weg_quest_start)M.tuffle_kills+=1
		if(name=="{NPC}Cell"&&M.cell_fight_start&&!M.cell_kill)M.cell_kill=1
		if(name=="Apocalypse Zombie"&&apocalypse_on)M.zombie_kills+=1
		if(istype(src,/mob/Monster/Bat))
			M.random = rand(5,10)
			M.VP += M.random
			M<<"You have defeated a Monster and gained [M.random] VIP Points!"
			M.random2 = rand(1,4)
			M.Valiants += M.random2
			M<<"You have defeated a Monster and gained [M.random2] Valiants!"
			del(src)
			return
		if(istype(src,/mob/Monster/Cell))
			M.random = rand(5,10)
			M.VP += M.random
			M<<"You have defeated a Monster and gained [M.random] VIP Points!"
			M.random2 = rand(1,4)
			M.Valiants += M.random2
			M<<"You have defeated a Monster and gained [M.random2] Valiants!"
			del(src)
			return
		if(istype(src,/mob/Monster/Dragon))
			M.random = rand(5,10)
			M.VP += M.random
			M<<"You have defeated a Monster and gained [M.random] VIP Points!"
			M.random2 = rand(1,4)
			M.Valiants += M.random2
			M<<"You have defeated a Monster and gained [M.random2] Valiants!"
			del(src)

			var/obj/Equipment/TP_Drop/P=new
			P.loc = src.loc
			M.random = rand(5,10)
			M.VP += M.random
			M<<"You have defeated a Monster and gained [M.random] VIP Points!"
			M.random2 = rand(1,4)
			M.Valiants += M.random2
			M<<"You have defeated a Monster and gained [M.random2] Valiants!"
			del(src)
			return
		if(istype(src,/mob/Monster/TuffleVillager))
			M.random = rand(5,10)
			M.VP += M.random
			M<<"You have defeated a Monster and gained [M.random] VIP Points!"
			M.random2 = rand(1,4)
			M.Valiants += M.random2
			M<<"You have defeated a Monster and gained [M.random2] Valiants!"
			del(src)
			return
		if(istype(src,/mob/Monster/PlanetZRebel))
			M.random = rand(10,20)
			M.VP += M.random
			M<<"You have defeated a Monster and gained [M.random] VIP Points!"
			M.random2 = rand(1,15)
			M.Valiants += M.random2
			M<<"You have defeated a Monster and gained [M.random2] Valiants!"
			del(src)
			return
		if(istype(src,/mob/Monster/PlanetZGaurd))
			M.random = rand(10,20)
			M.VP += M.random
			M<<"You have defeated a Monster and gained [M.random] VIP Points!"
			M.random2 = rand(1,15)
			M.Valiants += M.random2
			M<<"You have defeated a Monster and gained [M.random2] Valiants!"
			del(src)
			return
		if(istype(src,/mob/Monster/Goon_3))
			M.random = rand(5,10)
			M.VP += M.random
			M<<"You have defeated a Monster and gained [M.random] VIP Points!"
			M.random2 = rand(1,4)
			M.Valiants += M.random2
			M<<"You have defeated a Monster and gained [M.random2] Valiants!"
			del(src)
			return
		if(istype(src,/mob/Monster/Goon_1))
			M.random = rand(5,10)
			M.VP += M.random
			M<<"You have defeated a Monster and gained [M.random] VIP Points!"
			M.random2 = rand(1,4)
			M.Valiants += M.random2
			M<<"You have defeated a Monster and gained [M.random2] Valiants!"
			del(src)
			return
		if(istype(src,/mob/Monster/Green_Saiba_Man))
			M.random = rand(5,10)
			M.VP += M.random
			M<<"You have defeated a Monster and gained [M.random] VIP Points!"
			M.random2 = rand(1,4)
			M.Valiants += M.random2
			M<<"You have defeated a Monster and gained [M.random2] Valiants!"
			del(src)
			return
		if(M.karma==karma)M.karma_rating-=1
		else
			M.karma_rating+=1
			if(M.karma_rating>99)M.karma_rating=100
			M.locker=1
			spawn(2)if(M)M.locker=0
		if(M.karma_rating<0)
			if(M.karma=="Good")
				M<<"<I>You feel an Evil inside of you begin to awaken..."
				M.karma="Evil"
				M.karma_rating=0
			else
				M<<"<I>You feel the Good inside of you begin to awaken..."
				M.karma="Good"
				M.karma_rating=0
		if(M.taking_quest&&!M.took_quest)
			M.enemies_killed++
			if(M.enemies_killed>=25)M.took_quest=1
		del(src)
		..()
mob/Simulation/DeathCheck(mob/PC/M)
	M.pvpkills++
	if(M.pvplvl&&M.pvpkills>=150&&!M.gotut)
		M<<"<u><font color=red>Trainin Information:</u></font> [M], you have now unlocked the Ultimate Transform command!</u></font>"
		M.contents+=new/obj/UT/UT
		M.gotut=1
	var/count=0
	if(powerlevel<=0)
		if(istype(M,/mob/PC))
			if(M.in_party)
				count=0
				for(var/mob/M2 in world)
					if(M2.party_name==M.party_name)
						count++
						var/exp2=exp/count
						M2.exp+=exp2*M.EXPrebirthgain
						M2.exp+=exp2*M.levelexp*M.EXPrebirthgain
						if(M2.weight>0)M2.exp+=exp2
						M2.zenni+=zenni/2/count
						if("zenni_buff" in M2.buffs)M2.zenni+=zenni/2/count
						if(M2.expbuff)exp2*=5
						M2<<"\white Zenni +[zenni/2/count]"
						M2<<"\white EXP +[exp2]"
						M2.Level_Up()
			else
				M.exp+=exp*M.EXPrebirthgain
				M.exp+=exp*M.levelexp*M.EXPrebirthgain
				if(M.weight>0)M.exp+=exp
				M.zenni+=zenni/2
				if("zenni_buff" in M.buffs)M.zenni+=zenni/2
				M<<"\white Zenni +[zenni/2]"
				M<<"\white EXP +[exp]"
				M.PK_LVLUP(CPS)
				M.Level_Up()
		if(istype(src,/mob/Simulation))Simulation_episode++
		if(M.taking_quest&&!M.took_quest)
			M.enemies_killed++
			if(M.enemies_killed>=25)M.took_quest=1
		if(name=="{Simulation}Android 16")M.android_16_killed=1
		if(name=="{Simulation}Android 17")M.android_17_killed=1
		if(name=="{Simulation}Android 18")M.android_18_killed=1
		if(name=="{Simulation}Shenron")
			if(M.doing_potara_quest&&!M.completed_potara_quest)
				M.completed_potara_quest=1
				M<<"You just completed Supreme Kai's quest!"
		if(!M.gero_quest_took&&M.gero_quest_taking)
			if(M.android_18_killed&&M.android_17_killed&&M.android_16_killed)
				M.gero_quest_took=1
				M<<"You just completed Dr. Gero's quest!"
		for(var/mob/C in world)
			if(C.onSimulations)
				if(src==M)C<<"<font color=green><u>Simulation Information:</font></u> <font color=red>[src]</font> has comitted suicide!"
				src<<output("<font color=green><u>Simulation Information:</font></u> <font color=red>[src]</font> has been defeated by <font color=green>[M]</font>!","SimulationPane")
		if(M.karma==karma)M.karma_rating -= 1
		else
			M.karma_rating += 1
			if(M.karma_rating>99)M.karma_rating=100
			M.locker=1
			spawn(2)if(M)M.locker=0
		if(M.karma_rating<0)
			if(M.karma=="Good")
				M<<"<I>You feel an Evil inside of you begin to awaken..."
				M.karma="Evil"
				M.karma_rating=0
			else
				M<<"<I>You feel the Good inside of you begin to awaken..."
				M.karma="Good"
				M.karma_rating=0
		del(src)
		..()
mob/PC/DeathCheck(mob/M,T)
	buku_lock=0
	wait_room=0
	if(M.taking_quest && !M.took_quest)
		M.enemies_killed ++
		if(M.enemies_killed>=25)M.took_quest=1
	if(M.guild_challenger==src&&guild_challenger==M)
		world<<"<font color=red><u>Guild Information:</u></font><font color=white> <font color=red>[src]</font> has been defeated by <font color=green>[M]</font>!"
		guild_challenge=0
		M.guild_challenge=0
		M.guild_challenge_rank ++
		guild_challenger=""
		M.guild_challenger=""
		M.guild_challenging=0
		guild_challenging=0
		M.loc=locate(167,194,1)
		loc=locate(167,194,1)
		return
	if(powerlevel<=0)
		for(var/turf/Floors/Safe_Zone/S in oview(1))
			if(S in view(1))
				if(powerlevel<1)powerlevel=1
				for(var/obj/Equipment/Consumable/Candy/C in oview(1,src))del(C)
				return
		if(fused&&follow==M.name)return
		for(var/turf/Floors/BudokaiZone/S in view(1,src))
			if(S in view(1,src))
				if(powerlevel<1)powerlevel=1
				return
		if(safe||insafezone)
			powerlevel=1
			return
		if(!T||T=="")T="<font color=red>Battle Information:<font color=white> <font color=red>[src]</font> died at the hands of <font color=green>[M]</font>!"
		if(T=="Infect")
			T="<font color=red>Battle Information:<font color=white> <font color=red>[src]</font> has been Infected by <font color=green>[M]</font>!"
			regen_dead=1
		if(T=="Absorb")
			T="<font color=red>Battle Information:<font color=white> <font color=red>[src]</font> has been Absorbed by <font color=green>[M]</font>!"
			regen_dead=1
		if(T=="Candy")
			T="<font color=red>Battle Information:<font color=white> <font color=red>[src]</font> has been turned to Candy by <font color=green>[M]</font>!"
			regen_dead=1
		if(T=="Life Drain")
			T="<font color=red>Battle Information:<font color=white> <font color=red>[src]</font> has been Life Drained by <font color=green>[M]</font>!"
			regen_dead=1
		M.pvpkills++
		if(M.pvplvl&&M.pvpkills>=150&&!M.gotut)
			M<<"<u><font color=red>Trainin Information:</u></font> [M], you have now unlocked the Ultimate Transform command!</u></font>"
			M.contents += new/obj/UT/UT
			M.gotut=1
		M.sp_gainer+=1
		if(M.sp_gainer>=10)
			M.sp_gainer=0
			M.skill_points+=2
			M<<"You has gained 2 skill points!"
		M.random = rand(10,20)
		M.VP += M.random
		M<<"You have Killed [src] and gained [M.random] AP!"
		M.attacker=""
		attacker=""
		talking=0
		using=0
		training=0
		dualtrain=0
//		UnTraining()
//		FocusUnTraining()
		for(var/mob/C in world)
			if(C.dtpartner==src)
				C.dualtrain=0
				C.dtpartner=null
				C.icon_state=""
				C.doing=0
		if(M.type==/mob/Monster/Simulator_NPC)spawn(35)if(M)del(M)
		spawn(10)
			for(var/mob/PC/M2 in oview(8))
				if(M2!=M&&M2!=src)
					if(M2.race=="Saiyan"||M2.race=="Half Saiyan")
						M2.witness_deaths ++
						M2.Rage_Unleash()
					M2<<"\red You feel your Rage Grow..."
					M2.rage+=round(rand(15,25))
					if(M2.rage>99)M2.rage=100
		ResetSomeStats()
		if(M.karma==karma)M.karma_rating-=1
		else
			M.karma_rating+=1
			if(M.karma_rating>99)M.karma_rating=100
			M.locker=1
			spawn(2)if(M)M.locker=0
		if(M.karma_rating<0)
			if(M.karma=="Good")
				M<<"<I>You feel an Evil inside of you begin to awaken..."
				M.karma="Evil"
				M.karma_rating=0
			else
				M<<"<I>You feel the Good inside of you begin to awaken..."
				M.karma="Good"
				M.karma_rating=0
		for(var/obj/Earth_Dragonballs/O1 in src)O1.loc=loc
		for(var/obj/Namek_Dragonballs/O2 in src)O2.loc=loc
		for(var/obj/Black_Dragonballs/O3 in src)O3.loc=loc
		GWUpdate()
		Power_Redefine()
		if(race=="Android")
			regen_dead=0
			if(M.name!=name)
				var/bonus_exp=round(add_exp+(M.level/2))*10
				if(istype(M,/mob/PC))
					if(M.expbuff)bonus_exp*=5
					if(M.weight>0)bonus_exp*=2
					bonus_exp*=M.levelexp
					M.exp+=bonus_exp*M.EXPrebirthgain
					M<<"\white EXP +[bonus_exp]"
					if(zenni>10)
						if(M!=src)
							var/zn=zenni
							M.zenni+=zn/2
							if("zenni_buff" in M.buffs)M.zenni+=zn/2
							M<<"\white Zenni +[round(zn/2)]"
							zenni-=zn/2
					var/cpnumber=(1+round(level/100))
					M.PK_LVLUP(cpnumber)
					M.Level_Up()
					if(Bounty.Find("Name: [src]([headvalue] Zenni)"))
						world<<"\white [M.name] has killed a wanted player!"
						M<<"\white You have killed a wanted player: Zenni +[headvalue]"
						Bounty.Remove("Name: [name]([headvalue] Zenni)")
						if("zenni_buff" in M.buffs)M.zenni+=headvalue
						M.zenni+=headvalue
						headvalue=0
						var/savefile/B=new("World Save Files/Bounty.sav")
						B["Bounty"]<<Bounty
			kiabsorb=0
			buku=0
			rest=0
			frozen=0
			boxing=0
			meditation=0
			focus_boxing=0
			it_lock=0
			doing=0
			icon_state=""
			density=1
			it_lock=1
			spawn(100)if(src)it_lock=0
			loc=locate(221,150,5)
			spawn(35)if(src)loc=locate(221,150,5)
			if(M.challenger==src&&challenger==M)
				world<<"\yellow Arena Battle: \white <font color=green>[M]</font> has won the challenge against <font color=red>[src]</font>!"
				M.arena_win+=1
				arena_lose+=1
				M.loc=locate(235,135,1)
				spawn(10)if(M)M.loc=locate(235,135,1)
				arena_on=0
				M.it_lock=0
				M.it_blocked=0
				M.challenger=""
				challenger=""
				M.challenge=0
				challenge=0
				var/amount=rand(1,7)
				amount=rand(1,7)
				spawn(50)if(M&&M.client.address!=client.address)
					while(amount>0)
						if(!M)return
						M.exp=M.tnl
						M.Level_Up()
						amount -= 1
						sleep(0.5)
			if(in_tourney)
				TourneyPeople.Remove(src)
				tourney_count--
			attack_lock=0
			ki_lock=0
			buku_lock=0
			it_blocked=1
			dead=0
			powerlevel=50
			KO=0
			rage=0
			sight&=~BLIND
			overlays-='Halo.dmi'
			deaths+=1
			M.kills+=1
			BudokaiResign(src)
			Ranking(M)
			if(tourny)
				tourny=0
				if(Entries.Find(src))Entries.Remove(src)
				if(Winners.Find(src))Winners.Remove(src)
				if(!Losers.Find(src))Losers.Add(src)
				wait_room=0
			if(babatourny)
				babatourny=0
				if(BabaTeamOne.Find(src))BabaTeamOne.Remove(src)
				if(BabaTeamTwo.Find(src))BabaTeamTwo.Remove(src)
				if(!BabaLosers.Find(src))BabaLosers.Add(src)
				wait_room=0
			if(guildtourny)
				guildtourny=0
				if(GuildTeamOne.Find(src))GuildTeamOne.Remove(src)
				if(GuildTeamTwo.Find(src))GuildTeamTwo.Remove(src)
				if(!GuildLosers.Find(src))GuildLosers.Add(src)
				wait_room=0
			if(jrtourny)
				jrtourny=0
				if(jrEntries.Find(src))jrEntries.Remove(src)
				if(jrWinners.Find(src))jrWinners.Remove(src)
				if(!jrLosers.Find(src))jrLosers.Add(src)
				wait_room=0
			if(rtourny)
				rtourny=0
				if(REntries.Find(src))REntries.Remove(src)
				if(RWinners.Find(src))RWinners.Remove(src)
				if(!RLosers.Find(src))RLosers.Add(src)
				wait_room=0
			if(src==M)
				world<<"<font color=red>Battle Information:<font color=white> <font color=red>[src]</font> has comitted suicide!"
				if(arena_on&& challenge)
					M.challenger:WinArena("[M.name]")
					challenge=0
			else world<<"[T]"
		if(race=="Majin")
			if(!regen_dead)
				icon_state="Dead"
				frozen=1
				boxing=0
				focus_boxing=0
				doing=1
				density=1
				attack_lock=1
				ki_lock=1
				it_lock=1
				regen_dead=1
				powerlevel=0
				dualtrain=0
				KO=0
				rage=0
				sight&=~BLIND
				return
			else
				if(M.name!=name)
					var/bonus_exp=round(add_exp+(M.level/2))*10
					if(istype(M,/mob/PC))
						if(M.expbuff)bonus_exp*=5
						if(M.weight>0)bonus_exp*=2
						bonus_exp*=M.levelexp
						M.exp+=bonus_exp*M.EXPrebirthgain
						M<<"\white EXP +[bonus_exp]"
						if(zenni>10)
							if(M!=src)
								var/zn=zenni
								M.zenni+=zn/2
								if("zenni_buff" in M.buffs)M.zenni+=zn/2
								M<<"\white Zenni +[round(zn/2)]"
								zenni-=zn/2
						var/cpnumber=(1+round(level/100))
						M.PK_LVLUP(cpnumber)
						M.Level_Up()
						if(Bounty.Find("Name: [src]([headvalue] Zenni)"))
							world<<"\white [M] has killed a wanted player!"
							M<<"\white You have killed a wanted player: Zenni +[headvalue]"
							Bounty.Remove("Name: [src]([headvalue] Zenni)")
							if("zenni_buff" in M.buffs)M.zenni+=headvalue
							M.zenni+=headvalue
							headvalue=0
							var/savefile/B=new("World Save Files/Bounty.sav")
							B["Bounty"]<<Bounty
				buku=0
				rest=0
				frozen=0
				boxing=0
				focus_boxing=0
				doing=0
				icon_state=""
				density=1
				regen_dead=0
				dualtrain=0
				meditation=0
				regen=0
				powerlevel=50
				loc=locate(41,311,5)
				spawn(35)if(src)loc = locate(41,311,5)
				if(M.challenger==src&&challenger==M)
					world<<"\yellow Arena Battle: \white <font color=green>[M]</font> has won the challenge against <font color=red>[src]</font>!"
					M.arena_win+=1
					arena_lose+=1
					M.loc=locate(235,135,1)
					spawn(10)if(M)M.loc=locate(235,135,1)
					arena_on=0
					M.it_lock=0
					M.it_blocked=0
					M.challenger=""
					challenger=""
					M.challenge=0
					challenge=0
					var/amount=rand(1,7)
					amount=rand(1,7)
					spawn(50)if(M&&M.client.address!=client.address)
						while(amount>0)
							if(!M)return
							M.exp=M.tnl
							M.Level_Up()
							amount-=1
							sleep(0.25)
				if(in_tourney)
					TourneyPeople.Remove(src)
					tourney_count--
				attack_lock=0
				ki_lock=0
				dead=1
				it_lock=0
				it_blocked=0
				regen_dead=0
				powerlevel=50
				KO=0
				rage=0
				sight&=~BLIND
				overlays+='Halo.dmi'
				deaths+=1
				M.kills+=1
				BudokaiResign(src)
				Ranking(M)
				src<<"Your body was completely destroyed!"
				if(tourny)
					tourny=0
					if(Entries.Find(src))Entries.Remove(src)
					if(Winners.Find(src))Winners.Remove(src)
					if(!Losers.Find(src))Losers.Add(src)
					wait_room=0
				if(babatourny)
					babatourny=0
					if(BabaTeamOne.Find(src))BabaTeamOne.Remove(src)
					if(BabaTeamTwo.Find(src))BabaTeamTwo.Remove(src)
					if(!BabaLosers.Find(src))BabaLosers.Add(src)
					wait_room=0
				if(guildtourny)
					guildtourny=0
					if(GuildTeamOne.Find(src))GuildTeamOne.Remove(src)
					if(GuildTeamTwo.Find(src))GuildTeamTwo.Remove(src)
					if(!GuildLosers.Find(src))GuildLosers.Add(src)
					wait_room=0
				if(jrtourny)
					jrtourny=0
					if(jrEntries.Find(src))jrEntries.Remove(src)
					if(jrWinners.Find(src))jrWinners.Remove(src)
					if(!jrLosers.Find(src))jrLosers.Add(src)
					wait_room=0
				if(rtourny)
					rtourny=0
					if(REntries.Find(src))REntries.Remove(src)
					if(RWinners.Find(src))RWinners.Remove(src)
					if(!RLosers.Find(src))RLosers.Add(src)
					wait_room=0
				if(src==M)
					world<<"<font color=red>Battle Information:<font color=white> <font color=red>[src]</font> has comitted suicide!"
					if(arena_on&&challenge)
						M.challenger:WinArena("[M.name]")
						challenge=0
				else world<<"[T]"
		else
			if(race!="Android")
				regen_dead=0
				if(M.name!=name)
					var/bonus_exp=round(add_exp+(M.level/2))*10
					if(istype(M,/mob/PC))
						if(M.expbuff)bonus_exp*=5
						if(M.weight>0)bonus_exp*=2
						bonus_exp*=M.levelexp
						M.exp+=bonus_exp*M.EXPrebirthgain
						M<<"\white EXP +[bonus_exp]"
						if(zenni>10)
							if(M!=src)
								var/zn=zenni
								M.zenni+=zn/2
								if("zenni_buff" in M.buffs)M.zenni+=zn/2
								M<<"\white Zenni +[round(zn/2)]"
								zenni-=zn/2
						var/cpnumber=(1+round(level/100))
						M.PK_LVLUP(cpnumber)
						M.Level_Up()
						if(Bounty.Find("Name: [src]([headvalue] Zenni)"))
							world<<"\white [M.name] has killed a wanted player!"
							M<<"\white You have killed a wanted player: Zenni +[headvalue]"
							Bounty.Remove("Name: [src]([headvalue] Zenni)")
							if("zenni_buff" in M.buffs)M.zenni+=headvalue
							M.zenni+=headvalue
							headvalue=0
							var/savefile/B=new("World Save Files/Bounty.sav")
							B["Bounty"]<<Bounty
				buku=0
				dead=1
				rest=0
				frozen=0
				boxing=0
				it_lock=0
				focus_boxing=0
				meditation=0
				dualtrain=0
				doing=0
				icon_state=""
				density=1
				if(prob(50)&&race=="Changeling")
					overlays+='Halo.dmi'
					dead=1
					it_lock=0
					it_blocked=0
					loc=locate(148,28,5)
					spawn(35)if(src)loc=locate(148,28,5)
				else
					overlays+='Halo.dmi'
					dead=1
					it_lock=0
					it_blocked=0
					loc=locate(41,311,5)
					spawn(35)if(src)loc=locate(41,311,5)
				if(M.challenger==src&&challenger==M)
					world<<"\yellow Arena Battle: \white <font color=green>[M]</font> has won the challenge against <font color=red>[src]</font>!"
					M.arena_win+=1
					arena_lose+=1
					M.loc=locate(235,135,1)
					spawn(10)if(M)M.loc=locate(235,135,1)
					arena_on=0
					M.it_lock=0
					M.it_blocked=0
					M.challenger=""
					challenger=""
					M.challenge=0
					challenge=0
					var/amount=rand(1,7)
					amount=rand(1,7)
					spawn(50)if(M&&M.client.address!=client.address)
						while(amount>0)
							if(!M)return
							M.exp=M.tnl
							M.Level_Up()
							amount-=1
							sleep(0.5)
				if(in_tourney)
					TourneyPeople.Remove(src)
					tourney_count--
				attack_lock=0
				ki_lock=0
				powerlevel=50
				KO=0
				rage=0
				sight&=~BLIND
				deaths+=1
				M.kills+=1
				BudokaiResign(src)
				Ranking(M)
				if(tourny)
					tourny=0
					if(Entries.Find(src))Entries.Remove(src)
					if(Winners.Find(src))Winners.Remove(src)
					if(!Losers.Find(src))Losers.Add(src)
					wait_room=0
				if(babatourny)
					babatourny=0
					if(BabaTeamOne.Find(src))BabaTeamOne.Remove(src)
					if(BabaTeamTwo.Find(src))BabaTeamTwo.Remove(src)
					if(!BabaLosers.Find(src))BabaLosers.Add(src)
					wait_room=0
				if(guildtourny)
					guildtourny=0
					if(GuildTeamOne.Find(src))GuildTeamOne.Remove(src)
					if(GuildTeamTwo.Find(src))GuildTeamTwo.Remove(src)
					if(!GuildLosers.Find(src))GuildLosers.Add(src)
					wait_room=0
				if(jrtourny)
					jrtourny=0
					if(jrEntries.Find(src))jrEntries.Remove(src)
					if(jrWinners.Find(src))jrWinners.Remove(src)
					if(!jrLosers.Find(src))jrLosers.Add(src)
					wait_room=0
				if(rtourny)
					rtourny=0
					if(REntries.Find(src))REntries.Remove(src)
					if(RWinners.Find(src))RWinners.Remove(src)
					if(!RLosers.Find(src))RLosers.Add(src)
					wait_room=0
				if(src==M)
					world<<"<font color=red>Battle Information:<font color=white> <font color=red>[src]</font> has comitted suicide!"
					if(arena_on&&challenge)
						M.challenger:WinArena("[M.name]")
						challenge=0
				else world<<"[T]"
				spawn(1)if(src)
					if(gravityfieldon)
						gravityfieldon=0
						GravityFieldCooldown()
				spawn(1)if(src)
					if(fused)
						for(var/mob/A in world)
							if(A.fused&&A.name==name)
								A.UnFuse()
								A.buku=0
								A.dead=1
								A.rest=0
								A.frozen=0
								A.boxing=0
								A.it_lock=0
								A.focus_boxing=0
								A.meditation=0
								A.dualtrain=0
								A.doing=0
								A.icon_state=""
								A.density=1
								UnFuse()
								buku=0
								dead=1
								rest=0
								frozen=0
								boxing=0
								it_lock=0
								focus_boxing=0
								meditation=0
								dualtrain=0
								doing=0
								icon_state=""
								density=1
mob
	proc
		DeathSacrifice()
			attacker=""
			for(var/mob/PC/M2 in oview(8))
				if(M2!=src)
					if(M2.race=="Saiyan"||M2.race=="Half Saiyan")
						M2.witness_deaths++
						if(!gone_ssj)spawn(1)M2.Rage_Unleash()
					M2<<"\red You feel your Rage Grow..."
					M2.rage+=round(rand(15,25))
					if(M2.rage>=100)M2.rage=100
			deflecting=0
			dodging=0
			blocking=0
			countering=0
			e_db_1=0
			e_db_2=0
			e_db_3=0
			e_db_4=0
			e_db_5=0
			e_db_6=0
			e_db_7=0
			n_db_1=0
			n_db_2=0
			n_db_3=0
			n_db_4=0
			n_db_5=0
			n_db_6=0
			n_db_7=0
			b_db_1=0
			b_db_2=0
			b_db_3=0
			b_db_4=0
			b_db_5=0
			b_db_6=0
			b_db_7=0
			for(var/obj/Earth_Dragonballs/O1 in src)O1.loc=loc
			for(var/obj/Namek_Dragonballs/O2 in src)O2.loc=loc
			for(var/obj/Black_Dragonballs/O3 in src)O3.loc=loc
			Power_Redefine()
			buku=0
			dead=1
			rest=0
			frozen=0
			meditation=0
			dualtrain=0
			boxing=0
			focus_boxing=0
			doing=0
			icon_state=""
			density=1
			loc=locate(41,311,5)
			spawn(35)if(src)loc=locate(41,311,5)
			if(in_tourney)
				TourneyPeople.Remove(src)
				tourney_count--
			attack_lock=0
			ki_lock=0
			it_lock=0
			it_blocked=0
			powerlevel=50
			KO=0
			rage=0
			sight&=~BLIND
			overlays+='Halo.dmi'
			world<<"<font color=red>Battle Information:<font color=white> <font color=red>[src]</font> has comitted suicide!"
			deaths+=1
			GWUpdate()
			BudokaiResign(src)
			spawn(1)if(src)
				if(tourny)
					tourny=0
					if(Entries.Find(src))Entries.Remove(src)
					if(Winners.Find(src))Winners.Remove(src)
					if(!Losers.Find(src))Losers.Add(src)
					wait_room=0
				if(babatourny)
					babatourny=0
					if(BabaTeamOne.Find(src))BabaTeamOne.Remove(src)
					if(BabaTeamTwo.Find(src))BabaTeamTwo.Remove(src)
					if(!BabaLosers.Find(src))BabaLosers.Add(src)
					wait_room=0
				if(guildtourny)
					guildtourny=0
					if(GuildTeamOne.Find(src))GuildTeamOne.Remove(src)
					if(GuildTeamTwo.Find(src))GuildTeamTwo.Remove(src)
					if(!GuildLosers.Find(src))GuildLosers.Add(src)
					wait_room=0
				if(jrtourny)
					jrtourny=0
					if(jrEntries.Find(src))jrEntries.Remove(src)
					if(jrWinners.Find(src))jrWinners.Remove(src)
					if(!jrLosers.Find(src))jrLosers.Add(src)
					wait_room=0
				if(rtourny)
					rtourny=0
					if(REntries.Find(src))REntries.Remove(src)
					if(RWinners.Find(src))RWinners.Remove(src)
					if(!RLosers.Find(src))RLosers.Add(src)
					wait_room=0
				if(fused)
					for(var/mob/M in world)
						if(M.fused&&M.name==name)
							M.UnFuse()
							M.buku=0
							M.dead=1
							M.rest=0
							M.frozen=0
							M.boxing=0
							M.it_lock=0
							M.focus_boxing=0
							M.meditation=0
							M.dualtrain=0
							M.doing=0
							M.icon_state=""
							M.density=1
							UnFuse()
							buku=0
							dead=1
							rest=0
							frozen=0
							boxing=0
							it_lock=0
							focus_boxing=0
							meditation=0
							dualtrain=0
							doing=0
							icon_state=""
							density=1
mob
	proc
		GRAVITYDeath()
			if(powerlevel<=0)
				world<<"<font color=red>Training Information:<font color=white> <font color=red>[src]</font> died while training!"
				grav=0
				deflecting=0
				dodging=0
				blocking=0
				countering=0
				wait_room=0
				src<<"Your body was crushed by the gravity."
				spawn(1)Power_Redefine()
				for(var/obj/Earth_Dragonballs/O1 in src)O1.loc=loc
				for(var/obj/Namek_Dragonballs/O2 in src)O2.loc=loc
				for(var/obj/Black_Dragonballs/O3 in src)O3.loc=loc
				if(race=="Android")
					kiabsorb=0
					buku=0
					rest=0
					frozen=0
					boxing=0
					focus_boxing=0
					dualtrain=0
					meditation=0
					doing=0
					icon_state=""
					density=1
					loc=locate(221,150,5)
					spawn(35)if(src)loc=locate(221,150,5)
					attack_lock=0
					ki_lock=0
					it_lock=1
					spawn(100)if(src)it_lock=0
					buku_lock=0
					it_blocked=1
					dead=0
					powerlevel=50
					KO=0
					rage=0
					deaths+=1
				else
					regen_dead=0
					regen=0
					buku=0
					dualtrain=0
					meditation=0
					rest=0
					frozen=0
					boxing=0
					focus_boxing=0
					doing=0
					icon_state=""
					density=1
					GoToKingCold()
					if(GoToKingCold()!=TRUE)
						overlays+='Halo.dmi'
						dead=1
						it_lock=0
						it_blocked=0
						loc=locate(41,311,5)
						spawn(35)if(src)loc=locate(41,311,5)
					attack_lock=0
					ki_lock=0
					buku_lock=0
					powerlevel=50
					KO=0
					rage=0
					sight&=~BLIND
					deaths+=1
					spawn(1)if(src)
						if(fused)
							for(var/mob/M in world)
								if(M.fused&&M.name==name)
									M.UnFuse()
									M.buku=0
									M.dead=1
									M.rest=0
									M.frozen=0
									M.boxing=0
									M.it_lock=0
									M.focus_boxing=0
									M.meditation=0
									M.dualtrain=0
									M.doing=0
									M.icon_state=""
									M.density=1
									UnFuse()
									buku=0
									dead=1
									rest=0
									frozen=0
									boxing=0
									it_lock=0
									focus_boxing=0
									meditation=0
									dualtrain=0
									doing=0
									icon_state=""
									density=1
				return