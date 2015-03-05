obj
	var
		tmp
			exploded=0
		canfuse=0
mob
	var
		kiuse=0.5
		kill=1
		tmp
			beaming=0
			binded=0
			tech_cooldown=0
			killer=""
	proc
		ThousandAttack()
			var/combocount=0
			icon_state="attack"
			comboagain
			for(var/mob/M in get_step(src,dir))
				if(!M)
					doing=0
					frozen=0
					icon_state=""
					return
				if(!M.pk)
					doing=0
					frozen=0
					icon_state=""
					return
				if(KO)
					doing=0
					frozen=0
					icon_state=""
					return
				if(dead)
					src<<"You are dead"
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.FuseFollower)
					doing=0
					frozen=0
					icon_state=""
					return
				if(FuseFollower)
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.safe)
					src<<"[M] is safe and cannot be attacked"
					doing=0
					frozen=0
					icon_state=""
					return

				if(M.dead)
					src<<"[M] is dead."
					doing=0
					frozen=0
					icon_state=""
					return
				step(M,dir)
				M.dir=get_dir(M,src)
				M.powerlevel-=strength_max/12
				if(M.damage_enabled)M<<"<font color=red>You took [strength_max/12] damage!"
				if(damage_enabled)src<<"<font color=red>You caused [strength_max/12] to [M]!"
				M.DeathCheck(src)
			sleep(2)
			for(var/mob/M in get_step(src,dir))
				if(!M)
					doing=0
					frozen=0
					icon_state=""
					return
				if(!M.pk)
					doing=0
					frozen=0
					icon_state=""
					return
				if(KO)
					doing=0
					frozen=0
					icon_state=""
					return
				if(dead)
					src<<"You are dead"
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.FuseFollower)
					doing=0
					frozen=0
					icon_state=""
					return
				if(FuseFollower)
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.safe)
					src<<"[M] is safe and cannot be attacked"
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.dead)
					src<<"[M] is dead."
					doing=0
					frozen=0
					icon_state=""
					return
				M.powerlevel-=strength_max/12
				if(M.damage_enabled)M<<"<font color=red>You took [strength_max/12] damage!"
				if(damage_enabled)src<<"<font color=red>You caused [strength_max/12] to [M]!"
				M.DeathCheck(src)
			sleep(2)
			for(var/mob/M in get_step(src,dir))
				if(!M)
					doing=0
					frozen=0
					icon_state=""
					return
				if(!M.pk)
					doing=0
					frozen=0
					icon_state=""
					return
				if(KO)
					doing=0
					frozen=0
					icon_state=""
					return
				if(dead)
					src<<"You are dead"
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.FuseFollower)
					doing=0
					frozen=0
					icon_state=""
					return
				if(FuseFollower)
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.safe)
					src<<"[M] is safe and cannot be attacked"
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.dead)
					src<<"[M] is dead."
					doing=0
					frozen=0
					icon_state=""
					return
				M.powerlevel-=strength_max/12
				if(M.damage_enabled)M<<"<font color=red>You took [strength_max/12] damage!"
				if(damage_enabled)src<<"<font color=red>You caused [strength_max/12] to [M]!"
				M.DeathCheck(src)
			sleep(2)
			for(var/mob/M in get_step(src,dir))
				if(!M)
					doing=0
					frozen=0
					icon_state=""
					return
				if(!M.pk)
					doing=0
					frozen=0
					icon_state=""
					return
				if(KO)
					doing=0
					frozen=0
					icon_state=""
					return
				if(dead)
					src<<"You are dead"
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.FuseFollower)
					doing=0
					frozen=0
					icon_state=""
					return
				if(FuseFollower)
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.safe)
					src<<"[M] is safe and cannot be attacked"
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.dead)
					src<<"[M] is dead."
					doing=0
					frozen=0
					icon_state=""
					return
				step(M,dir)
				M.dir=get_dir(M,src)
				M.powerlevel-=strength_max/12
				if(M.damage_enabled)M<<"<font color=red>You took [strength_max/12] damage!"
				if(src.damage_enabled)src<<"<font color=red>You caused [strength_max/12] to [M]!"
				M.DeathCheck(src)
			flick("IT",src)
			frozen=0
			step(src,dir)
			frozen=1
			sleep(2)
			for(var/mob/M in get_step(src,dir))
				if(!M)
					doing=0
					frozen=0
					icon_state=""
					return
				if(!M.pk)
					doing=0
					frozen=0
					icon_state=""
					return
				if(KO)
					doing=0
					frozen=0
					icon_state=""
					return
				if(dead)
					src<<"You are dead"
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.FuseFollower)
					doing=0
					frozen=0
					icon_state=""
					return
				if(FuseFollower)
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.safe)
					src<<"[M] is safe and cannot be attacked"
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.dead)
					src<<"[M] is dead."
					doing=0
					frozen=0
					icon_state=""
					return
				M.powerlevel-=strength_max/12
				if(M.damage_enabled)M<<"<font color=red>You took [strength_max/12] damage!"
				if(damage_enabled)src<<"<font color=red>You caused [strength_max/12] to [M]!"
				M.DeathCheck(src)
			sleep(2)
			for(var/mob/M in get_step(src,dir))
				if(!M)
					doing=0
					frozen=0
					icon_state=""
					return
				if(!M.pk)
					doing=0
					frozen=0
					icon_state=""
					return
				if(KO)
					doing=0
					frozen=0
					icon_state=""
					return
				if(dead)
					src<<"You are dead"
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.FuseFollower)
					doing=0
					frozen=0
					icon_state=""
					return
				if(FuseFollower)
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.safe)
					src<<"[M] is safe and cannot be attacked"
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.dead)
					src<<"[M] is dead."
					doing=0
					frozen=0
					icon_state=""
					return
				M.powerlevel-=strength_max/12
				if(M.damage_enabled)M<<"<font color=red>You took [strength_max/12] damage!"
				if(damage_enabled)src<<"<font color=red>You caused [strength_max/12] to [M]!"
				M.DeathCheck(src)
			sleep(2)
			combocount+=1
			if(combocount>1)
				icon_state="attack"
				sleep(20)
				doing=0
				frozen=0
				icon_state=""
				return
			else goto comboagain
		ThousandSlash()
			var/combocount=0
			icon_state="swordcombo"
			comboagain
			for(var/mob/M in get_step(src,dir))
				if(!M)
					doing=0
					frozen=0
					icon_state=""
					return
				if(!M.pk)
					doing=0
					frozen=0
					icon_state=""
					return
				if(KO)
					doing=0
					frozen=0
					icon_state=""
					return
				if(dead)
					src<<"You are dead"
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.FuseFollower)
					doing=0
					frozen=0
					icon_state=""
					return
				if(FuseFollower)
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.safe)
					src<<"[M] is safe and cannot be attacked"
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.dead)
					src<<"[M] is dead."
					doing=0
					frozen=0
					icon_state=""
					return
				step(M,dir)
				M.dir=get_dir(M,src)
				M.powerlevel-=strength_max/12
				if(M.damage_enabled)M<<"<font color=red>You took [strength_max/12] damage!"
				if(damage_enabled)src<<"<font color=red>You caused [strength_max/12] to [M]!"
				M.DeathCheck(src)
			sleep(2)
			for(var/mob/M in get_step(src,dir))
				if(!M)
					doing=0
					frozen=0
					icon_state=""
					return
				if(!M.pk)
					doing=0
					frozen=0
					icon_state=""
					return
				if(KO)
					doing=0
					frozen=0
					icon_state=""
					return
				if(dead)
					src<<"You are dead"
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.FuseFollower)
					doing=0
					frozen=0
					icon_state=""
					return
				if(FuseFollower)
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.safe)
					src<<"[M] is safe and cannot be attacked"
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.dead)
					src<<"[M] is dead."
					doing=0
					frozen=0
					icon_state=""
					return
				M.powerlevel-=strength_max/12
				if(M.damage_enabled)M<<"<font color=red>You took [strength_max/12] damage!"
				if(damage_enabled)src<<"<font color=red>You caused [strength_max/12] to [M]!"
				M.DeathCheck(src)
			sleep(2)
			for(var/mob/M in get_step(src,dir))
				if(!M)
					doing=0
					frozen=0
					icon_state=""
					return
				if(!M.pk)
					doing=0
					frozen=0
					icon_state=""
					return
				if(KO)
					doing=0
					frozen=0
					icon_state=""
					return
				if(dead)
					src<<"You are dead"
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.FuseFollower)
					doing=0
					frozen=0
					icon_state=""
					return
				if(FuseFollower)
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.safe)
					src<<"[M] is safe and cannot be attacked"
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.dead)
					src<<"[M] is dead."
					doing=0
					frozen=0
					icon_state=""
					return
				M.powerlevel-=strength_max/12
				if(M.damage_enabled)M<<"<font color=red>You took [strength_max/12] damage!"
				if(damage_enabled)src<<"<font color=red>You caused [strength_max/12] to [M]!"
				M.DeathCheck(src)
			sleep(2)
			for(var/mob/M in get_step(src,dir))
				if(!M)
					doing=0
					frozen=0
					icon_state=""
					return
				if(!M.pk)
					doing=0
					frozen=0
					icon_state=""
					return
				if(KO)
					doing=0
					frozen=0
					icon_state=""
					return
				if(dead)
					src<<"You are dead"
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.FuseFollower)
					doing=0
					frozen=0
					icon_state=""
					return
				if(FuseFollower)
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.safe)
					src<<"[M] is safe and cannot be attacked"
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.dead)
					src<<"[M] is dead."
					doing=0
					frozen=0
					icon_state=""
					return
				step(M,dir)
				M.dir=get_dir(M,src)
				M.powerlevel-=strength_max/12
				if(M.damage_enabled)M<<"<font color=red>You took [strength_max/12] damage!"
				if(damage_enabled)src<<"<font color=red>You caused [strength_max/12] to [M]!"
				M.DeathCheck(src)
			flick("IT",src)
			frozen=0
			step(src,dir)
			frozen=1
			sleep(2)
			for(var/mob/M in get_step(src,dir))
				if(!M)
					doing=0
					frozen=0
					icon_state=""
					return
				if(!M.pk)
					doing=0
					frozen=0
					icon_state=""
					return
				if(KO)
					doing=0
					frozen=0
					icon_state=""
					return
				if(dead)
					src<<"You are dead"
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.FuseFollower)
					doing=0
					frozen=0
					icon_state=""
					return
				if(FuseFollower)
					doing=0
					frozen=0
					icon_state=""
					return

				if(M.safe)
					src<<"[M] is safe and cannot be attacked"
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.dead)
					src<<"[M] is dead."
					doing=0
					frozen=0
					icon_state=""
					return
				M.powerlevel-=strength_max/12
				if(M.damage_enabled)M<<"<font color=red>You took [strength_max/12] damage!"
				if(damage_enabled)src<<"<font color=red>You caused [strength_max/12] to [M]!"
				M.DeathCheck(src)
			sleep(2)
			for(var/mob/M in get_step(src,dir))
				if(!M)
					doing=0
					frozen=0
					icon_state=""
					return
				if(!M.pk)
					doing=0
					frozen=0
					icon_state=""
					return
				if(KO)
					doing=0
					frozen=0
					icon_state=""
					return
				if(dead)
					src<<"You are dead"
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.FuseFollower)
					doing=0
					frozen=0
					icon_state=""
					return
				if(FuseFollower)
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.safe)
					src<<"[M] is safe and cannot be attacked"
					doing=0
					frozen=0
					icon_state=""
					return
				if(M.dead)
					src<<"[M] is dead."
					doing=0
					frozen=0
					icon_state=""
					return
				M.powerlevel-=strength_max/12
				if(M.damage_enabled)M<<"<font color=red>You took [strength_max/12] damage!"
				if(damage_enabled)src<<"<font color=red>You caused [strength_max/12] to [M]!"
				M.DeathCheck(src)
			sleep(2)
			combocount+=1
			if(combocount>1)
				icon_state="swordcombo6"
				sleep(20)
				doing=0
				frozen=0
				icon_state=""
				return
			else goto comboagain
obj
	var
		TargetList=list()
		setpower=500
		clashable=0
		clashing=0
		tmp
			clashrush=1
	Technique
		AngryBlast
			verb
				Angry_Blast()
					set category = "Techniques"
					set name = "Angry Blast"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<50000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						usr<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					src.setpower+=(usr.level*0.3+(usr.ki_skill/1.5))*(usr.kiuse/100)
					usr.frozen=1
					usr.icon_state="spirit bomb"
					var/obj/Tech/AngryBlast/A=new
					var/obj/Tech/AngryBlast/B=new
					var/obj/Tech/AngryBlast/C=new
					var/obj/Tech/AngryBlast/D=new
					var/obj/Tech/AngryBlast/E=new
					var/obj/Tech/AngryBlast/F=new
					var/obj/Tech/AngryBlast/G=new
					var/obj/Tech/AngryBlast/H=new
					var/obj/Tech/AngryBlast/I=new
					var/obj/Tech/AngryBlast/J=new
					var/obj/Tech/AngryBlast/K=new
					var/obj/Tech/AngryBlast/L=new
					var/obj/Tech/AngryBlast/M=new
					var/obj/Tech/AngryBlast/N=new
					var/obj/Tech/AngryBlast/O=new
					var/obj/Tech/AngryBlast/P=new
					var/obj/Tech/AngryBlast/Q=new
					var/obj/Tech/AngryBlast/R=new
					var/obj/Tech/AngryBlast/S=new
					var/obj/Tech/AngryBlast/T=new
					var/obj/Tech/AngryBlast/U=new
					var/obj/Tech/AngryBlast/V=new
					var/obj/Tech/AngryBlast/W=new
					var/obj/Tech/AngryBlast/X=new
					A.owner=usr
					B.owner=usr
					C.owner=usr
					D.owner=usr
					E.owner=usr
					F.owner=usr
					G.owner=usr
					H.owner=usr
					I.owner=usr
					J.owner=usr
					K.owner=usr
					L.owner=usr
					M.owner=usr
					N.owner=usr
					O.owner=usr
					P.owner=usr
					Q.owner=usr
					R.owner=usr
					S.owner=usr
					T.owner=usr
					U.owner=usr
					V.owner=usr
					W.owner=usr
					X.owner=usr
					view(8)<<"\white [usr]: HA!"
					A.loc=locate(usr.x-2,usr.y+7,usr.z)
					A.dir=WEST
					A.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					B.loc=locate(usr.x+1,usr.y+6,usr.z)
					B.dir=SOUTH
					B.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					C.loc=locate(usr.x-3,usr.y+8,usr.z)
					C.dir=NORTHWEST
					C.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					D.loc=locate(usr.x+1,usr.y+8,usr.z)
					D.dir=NORTH
					D.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					E.loc=locate(usr.x-1,usr.y+6,usr.z)
					E.dir=SOUTH
					E.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					F.loc=locate(usr.x-1,usr.y+8,usr.z)
					F.dir=NORTH
					F.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					G.loc=locate(usr.x+2,usr.y+7,usr.z)
					G.dir=EAST
					G.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					H.loc=locate(usr.x+3,usr.y+8,usr.z)
					H.dir=NORTHEAST
					H.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					I.loc=locate(usr.x,usr.y+5,usr.z)
					I.dir=SOUTHWEST
					I.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					J.loc=locate(usr.x-3,usr.y+6,usr.z)
					J.dir=SOUTHWEST
					J.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					K.loc=locate(usr.x+2,usr.y+5,usr.z)
					K.dir=SOUTHEAST
					K.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					L.loc=locate(usr.x+3,usr.y+6,usr.z)
					L.dir=SOUTHEAST
					L.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					M.loc=locate(usr.x-2,usr.y+5,usr.z)
					M.dir=SOUTHWEST
					M.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					N.loc=locate(usr.x,usr.y+7,usr.z)
					N.dir=SOUTHEAST
					N.power=usr.ki*usr.kiuse+src.setpower
					usr.ki-=usr.ki*usr.kiuse
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					O.loc=locate(usr.x-2,usr.y+3,usr.z)
					O.dir=SOUTHWEST
					O.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					P.loc=locate(usr.x+2,usr.y+3,usr.z)
					P.dir=SOUTHWEST
					P.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					Q.loc=locate(usr.x-3,usr.y+4,usr.z)
					Q.dir=SOUTHWEST
					Q.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					R.loc=locate(usr.x+3,usr.y+4,usr.z)
					R.dir=SOUTHWEST
					R.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					S.loc=locate(usr.x-4,usr.y+5,usr.z)
					S.dir=SOUTHWEST
					S.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					T.loc=locate(usr.x+4,usr.y+5,usr.z)
					T.dir=SOUTHWEST
					T.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					U.loc=locate(usr.x-1,usr.y+4,usr.z)
					U.dir=SOUTHWEST
					U.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					V.loc=locate(usr.x+1,usr.y+4,usr.z)
					V.dir=SOUTHWEST
					V.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					W.loc=locate(usr.x-4,usr.y+7,usr.z)
					W.dir=SOUTHWEST
					W.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					X.loc=locate(usr.x+4,usr.y+7,usr.z)
					X.dir=SOUTHWEST
					X.power=usr.ki*usr.kiuse+src.setpower
					sleep(15)
					usr.icon_state=""
					view(8)<<"\white [usr]: ANGRY BLAST... HHA!!!"
					spawn(10)
						if(usr)
							usr.frozen=0
							usr.doing=0
							usr.using=0
					spawn(50)if(usr)usr.tech_cooldown=0
		SGhostAttack
			verb
				Ghost_Attack()
					set category = "Techniques"
					set name = "Super Ghost Kamikaze Attack"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<50000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						usr<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					src.setpower+=(usr.level*0.3+(usr.ki_skill/1.5))*(usr.kiuse/100)
					usr.frozen=1
					usr.icon_state="spirit bomb"
					var/obj/Tech/SuperGhost/A=new
					var/obj/Tech/SuperGhost/B=new
					var/obj/Tech/SuperGhost/C=new
					var/obj/Tech/SuperGhost/D=new
					var/obj/Tech/SuperGhost/E=new
					var/obj/Tech/SuperGhost/F=new
					var/obj/Tech/SuperGhost/G=new
					var/obj/Tech/SuperGhost/H=new
					var/obj/Tech/SuperGhost/I=new
					var/obj/Tech/SuperGhost/J=new
					var/obj/Tech/SuperGhost/K=new
					var/obj/Tech/SuperGhost/L=new
					var/obj/Tech/SuperGhost/M=new
					var/obj/Tech/SuperGhost/N=new
					var/obj/Tech/SuperGhost/O=new
					var/obj/Tech/SuperGhost/P=new
					var/obj/Tech/SuperGhost/Q=new
					var/obj/Tech/SuperGhost/R=new
					var/obj/Tech/SuperGhost/S=new
					var/obj/Tech/SuperGhost/T=new
					var/obj/Tech/SuperGhost/U=new
					var/obj/Tech/SuperGhost/V=new
					var/obj/Tech/SuperGhost/W=new
					var/obj/Tech/SuperGhost/X=new
					A.owner=usr
					B.owner=usr
					C.owner=usr
					D.owner=usr
					E.owner=usr
					F.owner=usr
					G.owner=usr
					H.owner=usr
					I.owner=usr
					J.owner=usr
					K.owner=usr
					L.owner=usr
					M.owner=usr
					N.owner=usr
					O.owner=usr
					P.owner=usr
					Q.owner=usr
					R.owner=usr
					S.owner=usr
					T.owner=usr
					U.owner=usr
					V.owner=usr
					W.owner=usr
					X.owner=usr
					view(8)<<"\white [usr]: HA!"
					A.loc=locate(usr.x-2,usr.y+7,usr.z)
					A.dir=WEST
					A.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					B.loc=locate(usr.x+1,usr.y+6,usr.z)
					B.dir=SOUTH
					B.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					C.loc=locate(usr.x-3,usr.y+8,usr.z)
					C.dir=NORTHWEST
					C.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					D.loc=locate(usr.x+1,usr.y+8,usr.z)
					D.dir=NORTH
					D.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					E.loc=locate(usr.x-1,usr.y+6,usr.z)
					E.dir=SOUTH
					E.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					F.loc=locate(usr.x-1,usr.y+8,usr.z)
					F.dir=NORTH
					F.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					G.loc=locate(usr.x+2,usr.y+7,usr.z)
					G.dir=EAST
					G.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					H.loc=locate(usr.x+3,usr.y+8,usr.z)
					H.dir=NORTHEAST
					H.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					I.loc=locate(usr.x,usr.y+5,usr.z)
					I.dir=SOUTHWEST
					I.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					J.loc=locate(usr.x-3,usr.y+6,usr.z)
					J.dir=SOUTHWEST
					J.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					K.loc=locate(usr.x+2,usr.y+5,usr.z)
					K.dir=SOUTHEAST
					K.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					L.loc=locate(usr.x+3,usr.y+6,usr.z)
					L.dir=SOUTHEAST
					L.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					M.loc=locate(usr.x-2,usr.y+5,usr.z)
					M.dir=SOUTHWEST
					M.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					N.loc=locate(usr.x,usr.y+7,usr.z)
					N.dir=SOUTHEAST
					N.power=usr.ki*usr.kiuse+src.setpower
					usr.ki-=usr.ki*usr.kiuse
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					O.loc=locate(usr.x-2,usr.y+3,usr.z)
					O.dir=SOUTHWEST
					O.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					P.loc=locate(usr.x+2,usr.y+3,usr.z)
					P.dir=SOUTHWEST
					P.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					Q.loc=locate(usr.x-3,usr.y+4,usr.z)
					Q.dir=SOUTHWEST
					Q.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					R.loc=locate(usr.x+3,usr.y+4,usr.z)
					R.dir=SOUTHWEST
					R.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					S.loc=locate(usr.x-4,usr.y+5,usr.z)
					S.dir=SOUTHWEST
					S.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					T.loc=locate(usr.x+4,usr.y+5,usr.z)
					T.dir=SOUTHWEST
					T.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					U.loc=locate(usr.x-1,usr.y+4,usr.z)
					U.dir=SOUTHWEST
					U.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					V.loc=locate(usr.x+1,usr.y+4,usr.z)
					V.dir=SOUTHWEST
					V.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					W.loc=locate(usr.x-4,usr.y+7,usr.z)
					W.dir=SOUTHWEST
					W.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					X.loc=locate(usr.x+4,usr.y+7,usr.z)
					X.dir=SOUTHWEST
					X.power=usr.ki*usr.kiuse+src.setpower
					sleep(15)
					usr.icon_state=""
					view(8)<<"\white [usr]: Super Ghost Kamikaze Attack!"
					spawn(10)
						if(usr)
							usr.frozen=0
							usr.doing=0
							usr.using=0
					spawn(50)if(usr)usr.tech_cooldown=0
		StarShower
			verb
				Star_Shower()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<50000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						usr<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					src.setpower+=(usr.level*0.3+(usr.ki_skill/1.5))*(usr.kiuse/100)
					usr.frozen=1
					usr.icon_state="spirit bomb"
					var/obj/Tech/StarShower/A=new
					var/obj/Tech/StarShower/B=new
					var/obj/Tech/StarShower/C=new
					var/obj/Tech/StarShower/D=new
					var/obj/Tech/StarShower/E=new
					var/obj/Tech/StarShower/F=new
					var/obj/Tech/StarShower/G=new
					var/obj/Tech/StarShower/H=new
					var/obj/Tech/StarShower/I=new
					var/obj/Tech/StarShower/J=new
					var/obj/Tech/StarShower/K=new
					var/obj/Tech/StarShower/L=new
					var/obj/Tech/StarShower/M=new
					var/obj/Tech/StarShower/N=new
					var/obj/Tech/StarShower/O=new
					var/obj/Tech/StarShower/P=new
					var/obj/Tech/StarShower/Q=new
					var/obj/Tech/StarShower/R=new
					var/obj/Tech/StarShower/S=new
					var/obj/Tech/StarShower/T=new
					var/obj/Tech/StarShower/U=new
					var/obj/Tech/StarShower/V=new
					var/obj/Tech/StarShower/W=new
					var/obj/Tech/StarShower/X=new
					A.owner=usr
					B.owner=usr
					C.owner=usr
					D.owner=usr
					E.owner=usr
					F.owner=usr
					G.owner=usr
					H.owner=usr
					I.owner=usr
					J.owner=usr
					K.owner=usr
					L.owner=usr
					M.owner=usr
					N.owner=usr
					O.owner=usr
					P.owner=usr
					Q.owner=usr
					R.owner=usr
					S.owner=usr
					T.owner=usr
					U.owner=usr
					V.owner=usr
					W.owner=usr
					X.owner=usr
					view(8)<<"\white [usr]: HA!"
					A.loc=locate(usr.x-2,usr.y+7,usr.z)
					A.dir=WEST
					A.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					B.loc=locate(usr.x+1,usr.y+6,usr.z)
					B.dir=SOUTH
					B.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					C.loc=locate(usr.x-3,usr.y+8,usr.z)
					C.dir=NORTHWEST
					C.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					D.loc=locate(usr.x+1,usr.y+8,usr.z)
					D.dir=NORTH
					D.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					E.loc=locate(usr.x-1,usr.y+6,usr.z)
					E.dir=SOUTH
					E.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					F.loc=locate(usr.x-1,usr.y+8,usr.z)
					F.dir=NORTH
					F.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					G.loc=locate(usr.x+2,usr.y+7,usr.z)
					G.dir=EAST
					G.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					H.loc=locate(usr.x+3,usr.y+8,usr.z)
					H.dir=NORTHEAST
					H.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					I.loc=locate(usr.x,usr.y+5,usr.z)
					I.dir=SOUTHWEST
					I.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					J.loc=locate(usr.x-3,usr.y+6,usr.z)
					J.dir=SOUTHWEST
					J.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					K.loc=locate(usr.x+2,usr.y+5,usr.z)
					K.dir=SOUTHEAST
					K.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					L.loc=locate(usr.x+3,usr.y+6,usr.z)
					L.dir=SOUTHEAST
					L.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					M.loc=locate(usr.x-2,usr.y+5,usr.z)
					M.dir=SOUTHWEST
					M.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					N.loc=locate(usr.x,usr.y+7,usr.z)
					N.dir=SOUTHEAST
					N.power=usr.ki*usr.kiuse+src.setpower
					usr.ki-=usr.ki*usr.kiuse
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					O.loc=locate(usr.x-2,usr.y+3,usr.z)
					O.dir=SOUTHWEST
					O.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					P.loc=locate(usr.x+2,usr.y+3,usr.z)
					P.dir=SOUTHWEST
					P.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					Q.loc=locate(usr.x-3,usr.y+4,usr.z)
					Q.dir=SOUTHWEST
					Q.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					R.loc=locate(usr.x+3,usr.y+4,usr.z)
					R.dir=SOUTHWEST
					R.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					S.loc=locate(usr.x-4,usr.y+5,usr.z)
					S.dir=SOUTHWEST
					S.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					T.loc=locate(usr.x+4,usr.y+5,usr.z)
					T.dir=SOUTHWEST
					T.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					U.loc=locate(usr.x-1,usr.y+4,usr.z)
					U.dir=SOUTHWEST
					U.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					V.loc=locate(usr.x+1,usr.y+4,usr.z)
					V.dir=SOUTHWEST
					V.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					W.loc=locate(usr.x-4,usr.y+7,usr.z)
					W.dir=SOUTHWEST
					W.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					X.loc=locate(usr.x+4,usr.y+7,usr.z)
					X.dir=SOUTHWEST
					X.power=usr.ki*usr.kiuse+src.setpower
					sleep(15)
					usr.icon_state=""
					view(8)<<"\white [usr]: Star Shower!"
					spawn(10)
						if(usr)
							usr.using=0
							usr.frozen=0
							usr.doing=0
					spawn(50)if(usr)usr.tech_cooldown=0
		ThousandSwordSlash
			verb
				Thousand_Sword_Slash()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<usr.ki_max)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.ki=0
					usr.using=1
					spawn(15)if(usr)usr.using=0
					usr.doing=1
					usr.frozen=1
					spawn(30)
						if(usr)
							usr.doing=0
							usr.frozen=0
					usr.ThousandSlash()
		ThousandAttackSlash
			verb
				Thousand_Attack_Slash()
					set category = "Techniques"
					set src in usr.contents
					set name="Quad Barrage"
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<usr.ki_max)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.ki=0
					usr.using=1
					spawn(15)if(usr)usr.using=0
					usr.doing=1
					usr.frozen=1
					spawn(30)
						if(usr)
							usr.doing=0
							usr.frozen=0
					usr.ThousandAttack()
		GalickGun
			canfuse=1
			verb
				Galick_Gun()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Pink.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: GALICK..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: GUN..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.icon_state="ki3"
					usr.frozen=1
					usr.overlays-='Charge Pink.dmi'
					usr.tech_cooldown=1
					spawn(40)
						if(usr)
							usr.tech_cooldown=0
							usr.using=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.4+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Galick Gun",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"galickgun","galickgunt",0)
		LightningRain
			canfuse=1
			verb
				Lightning_Rain()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<55000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Blue.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: Lightning..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: Rain..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: Fire!"
					usr.icon_state="ki3"
					usr.frozen=1
					usr.overlays-='Charge Blue.dmi'
					usr.tech_cooldown=1
					spawn(40)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.4+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Lightning Rain",usr.ki*usr.kiuse+src.setpower,'LSR.dmi',"lr","trail",0)
		BurningStorm
			canfuse=1
			verb
				Burning_Storm()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Red.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: Ice Kameh..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: Hamee..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.icon_state="ki3"
					usr.frozen=1
					usr.overlays-='Charge Red.dmi'
					usr.tech_cooldown=1
					spawn(40)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.4+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Burning Storm",usr.ki*usr.kiuse+src.setpower,'burning storm.dmi',"bs","trail",0)
		FinishBuster
			canfuse=1
			verb
				Finish_Buster()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<10000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Blue.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: FINISH..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: BUSTER..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Blue.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(30)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.4+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Finish Buster",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"finishbuster","finishbustert",0)
		FinalDeathKamehameha
			canfuse=1
			verb
				Final_Death_Kamehameha()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					usr.frozen=1
					var/chargedelay=round(usr.ki_skill/6100/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: FINAL..."
					usr.icon_state="ff1"
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: KAMEHAME..."
					usr.icon_state="ff2"
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: HAAAA!"
					usr.icon_state="ff3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)if(usr)
						usr.tech_cooldown=0
						usr.using=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.42+(usr.ki_skill/1.5))*(usr.kiuse/30)
					A.TechAttackBeam(usr,"Final Kamehameha",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"finalflash","finalflasht",0)
		FinalFlash
			canfuse=1
			verb
				Final_Flash()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					usr.frozen=1
					var/chargedelay=round(usr.ki_skill/6100/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: FINAL..."
					usr.icon_state="ff1"
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: FLASH..."
					usr.icon_state="ff2"
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.icon_state="ff3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)if(usr)
						usr.tech_cooldown=0
						usr.using=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.42+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Final Flash",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"finalflash","finalflasht",0)
		FlameBlast
			canfuse=1
			verb
				Hell_Blaze()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.frozen=1
					usr.using=1
					usr.overlays+='Charge Black.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: HELL..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: BLAZE..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Black.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Hell Blaze",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"hellblaze","hellblazet",0)
		FinalShine
			verb
				Final_Shine()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Green.dmi'
					var/chargedelay=round(usr.ki_skill/6100/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: FINAL..."
					usr.icon_state="ff1"
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: SHINE..."
					usr.icon_state="ff2"
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.icon_state="ff3"
					usr.overlays-='Charge Green.dmi'
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(50)if(usr)
						usr.tech_cooldown=0
						usr.using=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.43+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Final Shine",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"finalshine","finalshinet",0)
		OneHandKi
			verb
				One_Hand_Ki()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					usr.frozen=1
					usr.overlays+='charge bun.dmi'
					var/chargedelay=round(usr.ki_skill/6100/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: One Hand..."
					usr.icon_state="ff1"
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: KI..."
					usr.icon_state="ff2"
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: Attack!"
					usr.icon_state="ff3"
					usr.overlays-='charge bun.dmi'
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(50)if(usr)
						usr.tech_cooldown=0
						usr.using=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.43+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Final Shine",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"finalshine","finalshinet",0)
		FireBeam
			verb
				Fire_Beam()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Green.dmi'
					var/chargedelay=round(usr.ki_skill/6100/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: Fire..."
					usr.icon_state="ff1"
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: Beam..."
					usr.icon_state="ff2"
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.icon_state="ff3"
					usr.overlays-='Charge Green.dmi'
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(50)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.43+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Fire Beam",usr.ki*usr.kiuse+src.setpower,'fire beam.dmi',"fb","trail",0)

		DeathBeam
			verb
				Death_Beam()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: DEATH..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: BEAM..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.icon_state="attack"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(40)if(usr)
						usr.tech_cooldown=0
						usr.using=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.42+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Death Beam",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"deathbeam","deathbeamt",0)
		FireCut
			verb
				Fire_Cut()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<50000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: Fire..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: CUT..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.icon_state="attack"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(40)if(usr)
						usr.tech_cooldown=0
						usr.using=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.45+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Fire Cut",usr.ki*usr.kiuse+src.setpower,'38.dmi',"38",0)
		DeathWave
			verb
				Death_Wave()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					usr.overlays+='Charge Pink.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: DEATH..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: WAVE..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Pink.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(40)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					spawn(15)if(usr)
						usr.icon_state=""
						usr.doing=0
						usr.frozen=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.38+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackStraight(usr,"Death Wave",usr.ki*usr.kiuse+src.setpower,'Techs.dmi',"deathwave",0)
		SpecialBeamCannon
			verb
				Special_Beam_Cannon()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					usr.frozen=1
					var/chargedelay=round(usr.ki_skill/6000/3)
					if(chargedelay>6)
						chargedelay=6
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="sbc1"
					spawn(2)
						usr.icon_state="sbc2"
					view(8)<<"\white [usr]: SPECIAL..."
					sleep(7-chargedelay)
					view(8)<<"\white [usr]: BEAM..."
					sleep(7-chargedelay)
					view(8)<<"\white [usr]: CANNON..."
					sleep(7-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.icon_state="sbc3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)if(usr)
						usr.tech_cooldown=0
						usr.using=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.43+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Special Beam Cannon",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"specialbeamcannon","specialbeamcannont","Critical")
		Masenko
			canfuse=1
			verb
				Masenko()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.frozen=1
					usr.using=1
					usr.overlays+='Charge Orange.dmi'
					var/chargedelay=round(usr.ki_skill/6000)
					if(chargedelay>13)
						chargedelay=13
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: MASENKO..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Orange.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(40)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					spawn(15)if(usr)
						usr.icon_state=""
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.4+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Masenko",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"masenko","masenkot",0)
		Dodonpa
			verb
				Dodonpa()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.using=1
					usr.frozen=1
					usr.overlays+='Charge Yellow.dmi'
					var/chargedelay=round(usr.ki_skill/6000)
					if(chargedelay>13)
						chargedelay=13
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(4)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: DODONPA..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Yellow.dmi'
					usr.icon_state="ki3"
					usr.tech_cooldown=1
					spawn(40)if(usr)
						usr.frozen=0
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.4+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Dodonpa",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"dodonpa","dodonpat",0)
		CandyRay
			verb
				Candy_Ray()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: CANDY..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: RAY..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)if(usr)
						usr.tech_cooldown=0
						usr.using=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.32+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Candy Ray",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"candyray","candyrayt","Candy")
		DragonFist
			verb
				Dragon_Fist()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<50000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.using=1
					usr.overlays+='Fist Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: DRAGON..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: FIST..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: HA!"
					flick("attack",usr)
					usr.overlays-='Fist Charge.dmi'
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(55)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.5+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Dragon Fist",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"dragonfist","dragonfistt","Critical")
		TriBeam
			verb
				Tri_Beam()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.using=1
					usr.frozen=1
					usr.overlays+='Charge Yellow.dmi'
					var/chargedelay=round(usr.ki_skill/6000)
					if(chargedelay>13)
						chargedelay=13
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(4)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: TRIBEAM..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Yellow.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(40)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.43+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Tri Beam",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"tribeam","tribeamt",0)
		LightningBuster
			verb
				Lightning_Buster()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<50000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.using=1
					usr.frozen=1
					usr.overlays+='Charge Yellow.dmi'
					var/chargedelay=round(usr.ki_skill/6500)
					if(chargedelay>13)
						chargedelay=13
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(4)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: Burning Buster..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Yellow.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(40)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.43+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Burning Buster",usr.ki*usr.kiuse+src.setpower,'BurningBuster.dmi',"bb",0)
		LightGrenade
			verb
				Light_Grenade()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<500)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Yellow.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: LIGHT..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: GRENADE..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Yellow.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					spawn(10)if(usr)
						usr.icon_state=""
						usr.frozen=0
						usr.doing=0
					spawn(35)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.33+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackStraight(usr,"Light Grenade",usr.ki*usr.kiuse+src.setpower,'Techs.dmi',"lightgrenade",0)
		BuuBlast
			verb
				Buu_Blast()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<10000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Yellow.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: Buu..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: Blast..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Yellow.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					spawn(10)if(usr)
						usr.icon_state=""
						usr.frozen=0
						usr.doing=0
					spawn(35)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.35+(usr.ki_skill/2.1))*(usr.kiuse/1000)
					A.TechAttackStraight(usr,"Buu Blast",usr.ki*usr.kiuse+src.setpower,'BuuBlast.dmi',"bb",0)
		UltraKame
			verb
				UltraKame()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<500)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='GokuShhot.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: Kame..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: Hamee..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='GokuShhot.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					spawn(10)
						usr.icon_state=""
						usr.frozen=0
						usr.doing=0
					spawn(35)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.33+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackStraight(usr,"Ultra Kame",usr.ki*usr.kiuse+src.setpower,'FSKamehameha.dmi',,0)

		WhirlWindSpin
			verb
				Whirlwind_Spin()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<500)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					usr.overlays+=icon('Techs.dmi',"whirlwindspin")
					var/chargedelay=round(usr.ki_skill/6000)
					if(chargedelay>4)
						chargedelay=4
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: WHIRLWIND SPIN..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-=icon('Techs.dmi',"whirlwindspin")
					usr.frozen=1
					spawn(10)if(usr)
						usr.using=0
						usr.frozen=0
						usr.doing=0
					spawn(25)if(usr)usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.4+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackStraight(usr,"Whirlwind Spin",usr.ki*usr.kiuse+src.setpower,'Techs.dmi',"whirlwindspin",0)
		AcidHail
			verb
				Acid_Hail()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.overlays+='Charge Black.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>4)
						chargedelay=4
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: Acid..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: Hail..."
					sleep(17-chargedelay)
					view(8)<<"\white [usr]: Fire!"
					usr.overlays-='Charge Black.dmi'
					usr.frozen=1
					spawn(10)
						usr.frozen=0
						usr.doing=0
					spawn(45)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.1+(usr.ki_skill/4))*(usr.kiuse/100)
					A.TechAttackHoming(usr,"Acid Hail",usr.ki*(1+usr.kiuse/3)+src.setpower,'Acid Hail.dmi',"",0)
		FlameSpike
			verb
				Flame_Spike()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						usr<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(1)
						usr.frozen=0
						usr.doing=0
					spawn(8)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/100)
					if(usr.legendary_chromosome)A.TechAttackStraight(usr,"Flame Spike",usr.ki*usr.kiuse+src.setpower,'Techs.dmi',"lblast",0)
					else A.TechAttackStraight(usr,"Flame Spike",usr.ki*usr.kiuse+src.setpower,'newkis.dmi',"fire tornado",0)
		DeathBomb
			verb
				Death_Bomb()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						usr<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					view(6) << sound('db_charge.wav')
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(1)
						usr.frozen=0
						usr.doing=0
					spawn(8)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/100)
					if(usr.legendary_chromosome)A.TechAttackStraight(usr,"Death Bomb",usr.ki*usr.kiuse+src.setpower,'Techs.dmi',"lblast",0)
					else A.TechAttackStraight(usr,"Death Bomb",usr.ki*usr.kiuse+src.setpower,'newkis.dmi',"android death ball",0)
		PlasmaGun
			verb
				Plasma_Gun()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						usr<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(1)
						usr.frozen=0
						usr.doing=0
					spawn(8)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/100)
					if(usr.legendary_chromosome)A.TechAttackStraight(usr,"Plasma Gun",usr.ki*usr.kiuse+src.setpower,'Techs.dmi',"lblast",0)
					else A.TechAttackStraight(usr,"Plasma Gun",usr.ki*usr.kiuse+src.setpower,'newkis.dmi',"green blast",0)
		BuuBlitz
			verb
				Buu_Blitz()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						usr<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(1)
						usr.frozen=0
						usr.doing=0
					spawn(8)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/100)
					if(usr.legendary_chromosome)A.TechAttackStraight(usr,"Buu Blitz",usr.ki*usr.kiuse+src.setpower,'Techs.dmi',"lblast",0)
					else A.TechAttackStraight(usr,"Buu Blitz",usr.ki*usr.kiuse+src.setpower,'BuuBlitz.dmi',"bb",0)
		FlameBullet
			verb
				Hell_Blitz()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<500)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(1)
						usr.frozen=0
						usr.doing=0
					spawn(8)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackStraight(usr,"Hell Blitz",usr.ki*usr.kiuse+src.setpower,'Techs.dmi',"blastd",0)
		CrazyGun
			verb
				Crazy_Gun()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<500)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(1)
						usr.frozen=0
						usr.doing=0
					spawn(8)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackStraight(usr,"Crazy Gun",usr.ki*usr.kiuse+src.setpower,'GG.dmi',"gg",0)
		CelticBlitz
			verb
				Celtic_Blitz()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<9000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(1)
						usr.frozen=0
						usr.doing=0
					spawn(8)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackStraight(usr,"Celtic Blitz",usr.ki*usr.kiuse+src.setpower,'CelticB.dmi',"cb",0)
		KiBlast
			verb
				Ki_Blast()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<500)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						usr<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					view() << sound('kiblast.wav')
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(1)
						usr.frozen=0
						usr.doing=0
					spawn(8)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/100)
					if(usr.legendary_chromosome)A.TechAttackStraight(usr,"Ki Blast",usr.ki*usr.kiuse+src.setpower,'Techs.dmi',"lblast",0)
					else A.TechAttackStraight(usr,"Ki Blast",usr.ki*usr.kiuse+src.setpower,'Techs.dmi',"blast",0)
		DistructoDisk
			verb
				Distructo_Disk()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.tech_cooldown=1
					usr.overlays+=icon('Techs.dmi',"distructodisko")
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>4)
						chargedelay=4
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: DISTRUCTO..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: DISK..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-=icon('Techs.dmi',"distructodisko")
					usr.frozen=1
					spawn(5)if(usr)
						usr.frozen=0
						usr.doing=0
					spawn(40)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.25+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackStraight(usr,"Distructo Disk",usr.ki*usr.kiuse+src.setpower,'Techs.dmi',"distructodisk","Critical")
		PlasmaSlicer
			verb
				Plasma_Slicer()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<50000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.tech_cooldown=1
					usr.overlays+=icon('Techs.dmi',"distructodisko")
					var/chargedelay=round(usr.ki_skill/9000/2)
					if(chargedelay>5)
						chargedelay=5
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: Plasma..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: Slicer..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-=icon('Techs.dmi',"distructodisko")
					usr.frozen=1
					spawn(5)if(usr)
						usr.frozen=0
						usr.doing=0
					spawn(40)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.28+(usr.ki_skill/1.7))*(usr.kiuse/110)
					A.TechAttackStraight(usr,"Plasma Slicer",usr.ki*usr.kiuse+src.setpower,'DSlicer.dmi',"ds","Critical")
		ShurikenBlast
			verb
				Shuriken_Blast()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.tech_cooldown=1
					usr.overlays+=icon('BlastKiShuriken.dmi',"bs")
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>4)
						chargedelay=4
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: Shuriken..."
					sleep(16-chargedelay)
					view(8)<<"\white [usr]: Blast..."
					sleep(16-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-=icon('BlastKiShuriken.dmi',"bs")
					usr.frozen=1
					spawn(5)if(usr)
						usr.frozen=0
						usr.doing=0
					spawn(40)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.25+(usr.ki_skill/1.7))*(usr.kiuse/100)
					A.TechAttackStraight(usr,"Shuriken Blast",usr.ki*usr.kiuse+src.setpower,'BlastKiShuriken.dmi',"bs","Critical")
		KienzanDisk
			verb
				Kienzan_Disk()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.using=1
					usr.tech_cooldown=1
					usr.overlays+=icon('Techs.dmi',"kienzandisko")
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>4)
						chargedelay=4
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: KIENZAN..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: DISK..."
					sleep(17-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-=icon('Techs.dmi',"kienzandisko")
					usr.frozen=1
					spawn(5)if(usr)
						usr.frozen=0
						usr.doing=0
					spawn(60)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.23+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackHoming(usr,"Kienzan Disk",usr.ki*usr.kiuse+src.setpower,'Techs.dmi',"kienzandisk","Critical")
		UltraDisk
			verb
				Ultra_Disk()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.using=1
					usr.tech_cooldown=1
					usr.overlays+=icon('BlastDestructoDisk.dmi',"ultradisk")
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>4)
						chargedelay=4
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: Ultra..."
					for(var/turf/T in view(src,4))
						var/chance = roll(1,20)
						if(chance == 15)
							missile(new/obj/YellowPU, T, src)
					view(6) << sound('krillindestructodisc.wav')
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: DISK..."
					sleep(17-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-=icon('BlastDestructoDisk.dmi',"ultradisk")
					usr.frozen=1
					spawn(5)if(usr)
						usr.frozen=0
						usr.doing=0
					spawn(60)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.23+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackHoming(usr,"Ultra Disk",usr.ki*usr.kiuse+src.setpower,'BlastDestructoDisk.dmi',"ultradisk","Critical")
		PlasmaComet
			verb
				Plasma_Comet()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.using=1
					usr.tech_cooldown=1
					usr.overlays+='Charge Black.dmi'
					var/chargedelay=round(usr.ki_skill/60000)
					if(chargedelay>4)
						chargedelay=4
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: Plasma Comet..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Black.dmi'
					usr.frozen=1
					spawn(10)if(usr)
						usr.frozen=0
						usr.doing=0
					spawn(45)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.9+(usr.ki_skill/3))*(usr.kiuse/1000)
					A.TechAttackHoming(usr,"Plasma Comet",usr.ki*(1+usr.kiuse/4)+src.setpower,'DComet.dmi',"dc",0)
		SSDeadlyBomber
			verb
				SS_Deadly_Bomber()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.using=1
					usr.tech_cooldown=1
					usr.overlays+='Charge Black.dmi'
					var/chargedelay=round(usr.ki_skill/6000)
					if(chargedelay>4)
						chargedelay=4
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: SS DEADLY BOMBER..."
					view(6) << sound('sbomb.wav')
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Black.dmi'
					usr.frozen=1
					spawn(10)if(usr)
						usr.frozen=0
						usr.doing=0
					spawn(45)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.1+(usr.ki_skill/2))*(usr.kiuse/100)
					A.TechAttackHoming(usr,"SS Deadly Bomber",usr.ki*(1+usr.kiuse/3)+src.setpower,'Techs.dmi',"ssdeadlybomber",0)
		DualFire
			verb
				Dual_Fire()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.using=1
					usr.tech_cooldown=1
					usr.overlays+='Charge Black.dmi'
					var/chargedelay=round(usr.ki_skill/6000)
					if(chargedelay>4)
						chargedelay=4
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: Dual Fire Blast..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Black.dmi'
					usr.frozen=1
					spawn(10)if(usr)
						usr.frozen=0
						usr.doing=0
					spawn(45)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.1+(usr.ki_skill/2))*(usr.kiuse/100)
					A.TechAttackHoming(usr,"Dual Fire",usr.ki*(1+usr.kiuse/3)+src.setpower,'BlastDualFireBlast.dmi',"dualfire",0)
		KarmaBomb
			verb
				Negative_Karma_Bomb()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					usr.tech_cooldown=1
					usr.overlays+='Charge Black.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>4)
						chargedelay=4
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: NEGATIVE..."
					view(6) << sound('db_charge.wav')
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: KARMA BOMB..."
					sleep(17-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Black.dmi'
					usr.frozen=1
					spawn(10)if(usr)
						usr.frozen=0
						usr.doing=0
					spawn(45)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.1+(usr.ki_skill/4))*(usr.kiuse/100)
					A.TechAttackHoming(usr,"Karma Bomb",usr.ki*(1+usr.kiuse/3)+src.setpower,'Techs.dmi',"ssdeadlybomber",0)
		FuryBlast
			verb
				Fury_Blast()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					usr.tech_cooldown=1
					usr.overlays+='Charge Green.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>4)
						chargedelay=4
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: Fury..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: Blast..."
					sleep(17-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Green.dmi'
					usr.frozen=1
					spawn(10)if(usr)
						usr.frozen=0
						usr.doing=0
					spawn(45)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.1+(usr.ki_skill/4))*(usr.kiuse/100)
					A.TechAttackHoming(usr,"Fury Blast",usr.ki*(1+usr.kiuse/3)+src.setpower,'Galactic Buster.dmi',"gb",0)
		SunEruptionBlast
			verb
				Sun_Eruption_Blast()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<500000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					usr.tech_cooldown=1
					usr.overlays+='Charge1.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>4)
						chargedelay=4
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: Sun ..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: Eruption Blast..."
					sleep(17-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge1.dmi'
					usr.frozen=1
					spawn(10)if(usr)
						usr.frozen=0
						usr.doing=0
					spawn(45)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.2+(usr.ki_skill/4))*(usr.kiuse/100)
					A.TechAttackHoming(usr,"Sun Eruption Blast",usr.ki*(1+usr.kiuse/3)+src.setpower,'sunblast.dmi',"sb",0)
		ImprisonmentBall
			verb
				Imprisonment_Ball()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.using=1
					usr.frozen=1
					usr.tech_cooldown=1
					view(6) << "[usr]: Imprisonment..."
					view(6) << sound('sbomb.wav')
					sleep(10)
					view(6) << "[usr]: BALL! HAAA!!!"
					spawn(15)if(usr)
						usr.frozen=0
						usr.doing=0
					spawn(70)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BindTech/A=new
					src.setpower+=(usr.level*0.02+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.BindAttack("Imprisonment Ball",'Techs.dmi',"imprisonmentball",usr.ki*usr.kiuse+src.setpower,usr,"Critical")
		PowerBind
			verb
				Power_Bind()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.using=1
					usr.frozen=1
					usr.tech_cooldown=1
					view(6) << "[usr]: Power..."
					sleep(10)
					view(6) << "[usr]: Bind! You WILL DIE!!!"
					spawn(15)if(usr)
						usr.frozen=0
						usr.doing=0
					spawn(70)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BindTech/A=new
					src.setpower+=(usr.level*0.02+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.BindAttack("Power Bind",'Fury Blast.dmi',"fb",usr.ki*usr.kiuse+src.setpower,usr,"Critical")

		GalacticBlast
			canfuse=1
			verb
				Galactic_Blast()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='charge bun.dmi'
					var/chargedelay=round(usr.ki_skill/8000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Galactic..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Blast..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack!"
					usr.overlays-='charge bun.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Galactic Blast",usr.ki*usr.kiuse+src.setpower,'galacticgun.dmi',"head","tail",0)
		BlastCanon
			canfuse=1
			verb
				Blast_Canon()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='charge bun.dmi'
					var/chargedelay=round(usr.ki_skill/8000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="charge"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Blast..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Canon..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack!"
					usr.overlays-='charge bun.dmi'
					usr.icon_state="charge"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Blast Canon",usr.ki*usr.kiuse+src.setpower,'BlastCannon.dmi',"bc",0)
		GalacticDonut
			verb
				Galactic_Donut()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.using=1
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(15)if(usr)
						usr.frozen=0
						usr.doing=0
					spawn(25)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BindTech/A=new
					src.setpower+=(usr.level*0.02+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.BindAttack("Galactic Donut",'Techs.dmi',"galaticdonut",usr.ki*usr.kiuse+src.setpower,usr,0)
		DemonShackle
			verb
				Demon_Shackle()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.frozen=1
					usr.using=1
					usr.tech_cooldown=1
					spawn(15)if(usr)
						usr.frozen=0
						usr.doing=0
					spawn(25)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BindTech/A=new
					src.setpower+=(usr.level*0.02+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.BindAttack("Demon Shackle",'Techs.dmi',"demonshackle",usr.ki*usr.kiuse+src.setpower,usr,0)
		FatWrap
			verb
				Fat_Wrap()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.frozen=1
					usr.using=1
					usr.tech_cooldown=1
					spawn(5)if(usr)
						usr.frozen=0
						usr.doing=0
					spawn(25)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BindTech/A=new
					src.setpower+=(usr.level*0.02+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.BindAttack("Fat Wrap",'Techs.dmi',"fatwrap",usr.ki*usr.kiuse+src.setpower,usr,0)
		RapidBlast
			verb
				Rapid_Blast()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<1000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						usr<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.frozen=1
					usr.using=1
					usr.tech_cooldown=1
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/100)
					spawn(17)if(usr)
						usr.frozen=0
						usr.doing=0
					usr.overlays+='Charge Blue.dmi'
					view(8)<<"\white [usr]: RAPID BLAST!"
					sleep(15)
					usr.overlays-='Charge Blue.dmi'
					var/obj/Tech/KiMissile/A=new
					view(8)<<"\white [usr]: HA!"
					A.icon_state="blastr"
					A.loc=usr.loc
					A.power=usr.ki*0.2+src.setpower
					usr.ki-=usr.ki*0.2
					A.owner=usr
					A.dir=usr.dir
					sleep(5)
					var/obj/Tech/KiMissile/B=new
					view(8)<<"\white [usr]: HA!"
					B.icon_state="blastr"
					B.loc=usr.loc
					B.power=usr.ki*0.2+src.setpower
					usr.ki-=usr.ki*0.2
					B.owner=usr
					B.dir=usr.dir
					sleep(5)
					var/obj/Tech/KiMissile/C=new
					view(8)<<"\white [usr]: HA!"
					C.icon_state="blastr"
					C.loc=usr.loc
					C.power=usr.ki*0.2+src.setpower
					usr.ki-=usr.ki*0.2
					C.owner=usr
					C.dir=usr.dir
					if(usr.level>500)
						sleep(5)
						var/obj/Tech/KiMissile/D=new
						view(8)<<"\white [usr]: HA!"
						D.icon_state="blastr"
						D.loc=usr.loc
						D.power=usr.ki*0.2+src.setpower
						usr.ki-=usr.ki*0.2
						D.owner=usr
						D.dir=usr.dir
					if(usr.level>750)
						sleep(5)
						var/obj/Tech/KiMissile/E=new
						view(8)<<"\white [usr]: HA!"
						E.icon_state="blastr"
						E.loc=usr.loc
						E.power=usr.ki*0.2+src.setpower
						usr.ki-=usr.ki*0.2
						E.owner=usr
						E.dir=usr.dir
					if(usr.level>1000)
						sleep(5)
						var/obj/Tech/KiMissile/F=new
						view(8)<<"\white [usr]: HA!"
						F.icon_state="blastr"
						F.loc=usr.loc
						F.power=usr.ki*0.2+src.setpower
						usr.ki-=usr.ki*0.2
						F.owner=usr
						F.dir=usr.dir
					spawn(5)if(usr)usr.doing=0
					spawn(30)if(usr)
						usr.tech_cooldown=0
						usr.using=0
		ShineMissile
			verb
				Shine_Missile()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<30000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						usr<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.using=1
					usr.tech_cooldown=1
					src.setpower+=(usr.level*0.023+(usr.ki_skill/1.5))*(usr.kiuse/100)
					usr.overlays+='Charge Yellow.dmi'
					view(8)<<"\white [usr]: SHINE..."
					sleep(10)
					view(8)<<"\white [usr]: SHINE..."
					sleep(13)
					view(8)<<"\white [usr]: MISSILE!"
					sleep(10)
					usr.overlays-='Charge Yellow.dmi'
					var/obj/Tech/KiMissile/A=new
					view(8)<<"\white [usr]: HA!"
					A.loc=usr.loc
					A.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					A.owner=usr
					A.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/B=new
					view(8)<<"\white [usr]: HA!"
					B.loc=usr.loc
					B.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					B.owner=usr
					B.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/C=new
					view(8)<<"\white [usr]: HA!"
					C.loc=usr.loc
					C.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					C.owner=usr
					C.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/D=new
					view(8)<<"\white [usr]: HA!"
					D.loc=usr.loc
					D.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					D.owner=usr
					D.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/E=new
					view(8)<<"\white [usr]: HA!"
					E.loc=usr.loc
					E.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					E.owner=usr
					E.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/F=new
					view(8)<<"\white [usr]: HA!"
					F.loc=usr.loc
					F.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					F.owner=usr
					F.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/G=new
					view(8)<<"\white [usr]: HA!"
					G.loc=usr.loc
					G.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					G.owner=usr
					G.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/H=new
					view(8)<<"\white [usr]: HA!"
					H.loc=usr.loc
					H.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					H.owner=usr
					H.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/I=new
					view(8)<<"\white [usr]: HA!"
					I.loc=usr.loc
					I.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					I.owner=usr
					I.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/J=new
					view(8)<<"\white [usr]: HA!"
					J.loc=usr.loc
					J.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					J.owner=usr
					J.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/K=new
					view(8)<<"\white [usr]: HA!"
					K.loc=usr.loc
					K.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					K.owner=usr
					K.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/L=new
					view(8)<<"\white [usr]: HA!"
					L.loc=usr.loc
					L.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					L.owner=usr
					L.dir=usr.dir
					spawn(5)if(usr)usr.doing=0
					spawn(40)if(usr)
						usr.tech_cooldown=0
						usr.using=0
		KiShower
			verb
				Ki_Shower()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<30000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						usr<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.tech_cooldown=1
					usr.using=1
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/100)
					usr.overlays+='Charge Yellow.dmi'
					view(8)<<"\white [usr]: KI..."
					sleep(10)
					view(8)<<"\white [usr]: SHOWER!"
					sleep(13)
					usr.overlays-='Charge Yellow.dmi'
					var/obj/Tech/KiMissile/A=new
					view(8)<<"\white [usr]: HA!"
					A.loc=usr.loc
					A.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					A.owner=usr
					A.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/B=new
					view(8)<<"\white [usr]: HA!"
					B.loc=usr.loc
					B.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					B.owner=usr
					B.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/C=new
					view(8)<<"\white [usr]: HA!"
					C.loc=usr.loc
					C.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					C.owner=usr
					C.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/D=new
					view(8)<<"\white [usr]: HA!"
					D.loc=usr.loc
					D.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					D.owner=usr
					D.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/E=new
					view(8)<<"\white [usr]: HA!"
					E.loc=usr.loc
					E.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					E.owner=usr
					E.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/F=new
					view(8)<<"\white [usr]: HA!"
					F.loc=usr.loc
					F.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					F.owner=usr
					F.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/G=new
					view(8)<<"\white [usr]: HA!"
					G.loc=usr.loc
					G.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					G.owner=usr
					G.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/H=new
					view(8)<<"\white [usr]: HA!"
					H.loc=usr.loc
					H.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					H.owner=usr
					H.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/I=new
					view(8)<<"\white [usr]: HA!"
					I.loc=usr.loc
					I.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					I.owner=usr
					I.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/J=new
					view(8)<<"\white [usr]: HA!"
					J.loc=usr.loc
					J.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					J.owner=usr
					J.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/K=new
					view(8)<<"\white [usr]: HA!"
					K.loc=usr.loc
					K.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					K.owner=usr
					K.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/L=new
					view(8)<<"\white [usr]: HA!"
					L.loc=usr.loc
					L.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					L.owner=usr
					L.dir=usr.dir
					spawn(5)if(usr)usr.doing=0
					spawn(40)if(usr)
						usr.tech_cooldown=0
						usr.using=0
		FlameShower
			verb
				Flame_Shower()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<30000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						usr<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.tech_cooldown=1
					usr.using=1
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/100)
					usr.overlays+='Charge Yellow.dmi'
					view(8)<<"\white [usr]: FLAME..."
					sleep(10)
					view(8)<<"\white [usr]: SHOWER!"
					sleep(13)
					usr.overlays-='Charge Yellow.dmi'
					var/obj/Tech/KiMissile/A=new
					A.icon_state="blastf"
					view(8)<<"\white [usr]: HA!"
					A.loc=usr.loc
					A.power=usr.ki*0.2+src.setpower
					usr.ki-=usr.ki*0.2
					A.owner=usr
					A.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/B=new
					B.icon_state="blastf"
					view(8)<<"\white [usr]: HA!"
					B.loc=usr.loc
					B.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					B.owner=usr
					B.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/C=new
					C.icon_state="blastf"
					view(8)<<"\white [usr]: HA!"
					C.loc=usr.loc
					C.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					C.owner=usr
					C.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/D=new
					D.icon_state="blastf"
					view(8)<<"\white [usr]: HA!"
					D.loc=usr.loc
					D.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					D.owner=usr
					D.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/E=new
					E.icon_state="blastf"
					view(8)<<"\white [usr]: HA!"
					E.loc=usr.loc
					E.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					E.owner=usr
					E.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/F=new
					F.icon_state="blastf"
					view(8)<<"\white [usr]: HA!"
					F.loc=usr.loc
					F.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					F.owner=usr
					F.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/G=new
					G.icon_state="blastf"
					view(8)<<"\white [usr]: HA!"
					G.loc=usr.loc
					G.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					G.owner=usr
					G.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/H=new
					H.icon_state="blastf"
					view(8)<<"\white [usr]: HA!"
					H.loc=usr.loc
					H.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					H.owner=usr
					H.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/I=new
					I.icon_state="blastf"
					view(8)<<"\white [usr]: HA!"
					I.loc=usr.loc
					I.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					I.owner=usr
					I.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/J=new
					J.icon_state="blastf"
					view(8)<<"\white [usr]: HA!"
					J.loc=usr.loc
					J.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					J.owner=usr
					J.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/K=new
					K.icon_state="blastf"
					view(8)<<"\white [usr]: HA!"
					K.loc=usr.loc
					K.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					K.owner=usr
					K.dir=usr.dir
					sleep(2)
					var/obj/Tech/KiMissile/L=new
					L.icon_state="blastf"
					view(8)<<"\white [usr]: HA!"
					L.loc=usr.loc
					L.power=usr.ki*0.8+src.setpower
					usr.ki-=usr.ki*0.2
					L.owner=usr
					L.dir=usr.dir
					spawn(5)if(usr)usr.doing=0
					spawn(40)if(usr)
						usr.tech_cooldown=0
						usr.using=0
		HellZoneGrenade
			verb
				Hell_Zone_Grenade()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<50000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						usr<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.using=1
					usr.tech_cooldown=1
					src.setpower+=(usr.level*0.3+(usr.ki_skill/1.5))*(usr.kiuse/100)
					usr.frozen=1
					usr.icon_state="spirit bomb"
					var/obj/Tech/ScatterBlast/A=new
					var/obj/Tech/ScatterBlast/B=new
					var/obj/Tech/ScatterBlast/C=new
					var/obj/Tech/ScatterBlast/D=new
					var/obj/Tech/ScatterBlast/E=new
					var/obj/Tech/ScatterBlast/F=new
					var/obj/Tech/ScatterBlast/G=new
					var/obj/Tech/ScatterBlast/H=new
					var/obj/Tech/ScatterBlast/I=new
					var/obj/Tech/ScatterBlast/J=new
					var/obj/Tech/ScatterBlast/K=new
					var/obj/Tech/ScatterBlast/L=new
					var/obj/Tech/ScatterBlast/M=new
					var/obj/Tech/ScatterBlast/N=new
					var/obj/Tech/ScatterBlast/O=new
					var/obj/Tech/ScatterBlast/P=new
					var/obj/Tech/ScatterBlast/Q=new
					var/obj/Tech/ScatterBlast/R=new
					var/obj/Tech/ScatterBlast/S=new
					var/obj/Tech/ScatterBlast/T=new
					var/obj/Tech/ScatterBlast/U=new
					var/obj/Tech/ScatterBlast/V=new
					var/obj/Tech/ScatterBlast/W=new
					var/obj/Tech/ScatterBlast/X=new
					A.owner=usr
					B.owner=usr
					C.owner=usr
					D.owner=usr
					E.owner=usr
					F.owner=usr
					G.owner=usr
					H.owner=usr
					I.owner=usr
					J.owner=usr
					K.owner=usr
					L.owner=usr
					M.owner=usr
					N.owner=usr
					O.owner=usr
					P.owner=usr
					Q.owner=usr
					R.owner=usr
					S.owner=usr
					T.owner=usr
					U.owner=usr
					V.owner=usr
					W.owner=usr
					X.owner=usr
					view(8)<<"\white [usr]: HA!"
					A.loc=locate(usr.x-4,usr.y+3,usr.z)
					A.dir=NORTHWEST
					A.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					B.loc=locate(usr.x+2,usr.y+5,usr.z)
					B.dir=NORTHEAST
					B.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					C.loc=locate(usr.x,usr.y+2,usr.z)
					C.dir=NORTH
					C.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					D.loc=locate(usr.x-2,usr.y+5,usr.z)
					D.dir=NORTHWEST
					D.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					E.loc=locate(usr.x+4,usr.y+3,usr.z)
					E.dir=NORTHEAST
					E.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					F.loc=locate(usr.x-2,usr.y-2,usr.z)
					F.dir=SOUTHWEST
					F.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					G.loc=locate(usr.x+2,usr.y-5,usr.z)
					G.dir=SOUTHEAST
					G.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					H.loc=locate(usr.x+4,usr.y,usr.z)
					H.dir=EAST
					H.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					I.loc=locate(usr.x-4,usr.y,usr.z)
					I.dir=WEST
					I.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					J.loc=locate(usr.x-2,usr.y-5,usr.z)
					J.dir=SOUTHWEST
					J.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					K.loc=locate(usr.x,usr.y+4,usr.z)
					K.dir=NORTH
					K.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					L.loc=locate(usr.x+2,usr.y-2,usr.z)
					L.dir=SOUTHEAST
					L.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					M.loc=locate(usr.x-2,usr.y+2,usr.z)
					M.dir=NORTHWEST
					M.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					N.loc=locate(usr.x,usr.y-4,usr.z)
					N.dir=SOUTH
					N.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					O.loc=locate(usr.x+2,usr.y+2,usr.z)
					O.dir=NORTHEAST
					O.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					P.loc=locate(usr.x,usr.y-2,usr.z)
					P.dir=SOUTH
					P.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					Q.loc=locate(usr.x-2,usr.y,usr.z)
					Q.dir=WEST
					Q.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					R.loc=locate(usr.x+2,usr.y,usr.z)
					R.dir=EAST
					R.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					S.loc=locate(usr.x+4,usr.y-3,usr.z)
					S.dir=SOUTHEAST
					S.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					T.loc=locate(usr.x-4,usr.y-3,usr.z)
					T.dir=SOUTHWEST
					T.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					U.loc=locate(usr.x,usr.y+6,usr.z)
					U.dir=NORTH
					U.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					V.loc=locate(usr.x-6,usr.y,usr.z)
					V.dir=WEST
					V.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					W.loc=locate(usr.x+6,usr.y,usr.z)
					W.dir=EAST
					W.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					X.loc=locate(usr.x,usr.y-6,usr.z)
					X.dir=SOUTH
					X.power=usr.ki*usr.kiuse+src.setpower
					usr.ki-=usr.ki*usr.kiuse
					sleep(15)
					view(8)<<"\white [usr]: SCATTER!"
					spawn(10)if(usr)
						usr.icon_state=""
						usr.frozen=0
						usr.doing=0
					spawn(50)if(usr)
						usr.tech_cooldown=0
						usr.using=0
		GenocideAttack
			verb
				GenocideAttack()
					set category = "Techniques"
					set name = "Genocide Attack"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<50000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						usr<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.using=1
					usr.tech_cooldown=1
					src.setpower+=(usr.level*0.3+(usr.ki_skill/1.5))*(usr.kiuse/100)
					usr.frozen=1
					view(6) << sound('db_charge.wav')
					usr.icon_state="spirit bomb"
					var/obj/Tech/GenocideBlast/A=new
					var/obj/Tech/GenocideBlast/B=new
					var/obj/Tech/GenocideBlast/C=new
					var/obj/Tech/GenocideBlast/D=new
					var/obj/Tech/GenocideBlast/E=new
					var/obj/Tech/GenocideBlast/F=new
					var/obj/Tech/GenocideBlast/G=new
					var/obj/Tech/GenocideBlast/H=new
					var/obj/Tech/GenocideBlast/I=new
					var/obj/Tech/GenocideBlast/J=new
					var/obj/Tech/GenocideBlast/K=new
					var/obj/Tech/GenocideBlast/L=new
					var/obj/Tech/GenocideBlast/M=new
					var/obj/Tech/GenocideBlast/N=new
					var/obj/Tech/GenocideBlast/O=new
					var/obj/Tech/GenocideBlast/P=new
					var/obj/Tech/GenocideBlast/Q=new
					var/obj/Tech/GenocideBlast/R=new
					var/obj/Tech/GenocideBlast/S=new
					var/obj/Tech/GenocideBlast/T=new
					var/obj/Tech/GenocideBlast/U=new
					var/obj/Tech/GenocideBlast/V=new
					var/obj/Tech/GenocideBlast/W=new
					var/obj/Tech/GenocideBlast/X=new
					A.owner=usr
					B.owner=usr
					C.owner=usr
					D.owner=usr
					E.owner=usr
					F.owner=usr
					G.owner=usr
					H.owner=usr
					I.owner=usr
					J.owner=usr
					K.owner=usr
					L.owner=usr
					M.owner=usr
					N.owner=usr
					O.owner=usr
					P.owner=usr
					Q.owner=usr
					R.owner=usr
					S.owner=usr
					T.owner=usr
					U.owner=usr
					V.owner=usr
					W.owner=usr
					X.owner=usr
					view(8)<<"\white [usr]: HA!"
					A.loc=locate(usr.x-2,usr.y+7,usr.z)
					A.dir=WEST
					A.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					B.loc=locate(usr.x+1,usr.y+6,usr.z)
					B.dir=SOUTH
					B.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					C.loc=locate(usr.x-3,usr.y+8,usr.z)
					C.dir=NORTHWEST
					C.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					D.loc=locate(usr.x+1,usr.y+8,usr.z)
					D.dir=NORTH
					D.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					E.loc=locate(usr.x-1,usr.y+6,usr.z)
					E.dir=SOUTH
					E.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					F.loc=locate(usr.x-1,usr.y+8,usr.z)
					F.dir=NORTH
					F.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					G.loc=locate(usr.x+2,usr.y+7,usr.z)
					G.dir=EAST
					G.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					H.loc=locate(usr.x+3,usr.y+8,usr.z)
					H.dir=NORTHEAST
					H.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					I.loc=locate(usr.x,usr.y+5,usr.z)
					I.dir=SOUTHWEST
					I.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					J.loc=locate(usr.x-3,usr.y+6,usr.z)
					J.dir=SOUTHWEST
					J.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					K.loc=locate(usr.x+2,usr.y+5,usr.z)
					K.dir=SOUTHEAST
					K.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					L.loc=locate(usr.x+3,usr.y+6,usr.z)
					L.dir=SOUTHEAST
					L.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					M.loc=locate(usr.x-2,usr.y+5,usr.z)
					M.dir=SOUTHWEST
					M.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					N.loc=locate(usr.x,usr.y+7,usr.z)
					N.dir=SOUTHEAST
					N.power=usr.ki*usr.kiuse+src.setpower
					usr.ki-=usr.ki*usr.kiuse
					sleep(2)
					O.loc=locate(usr.x-2,usr.y+3,usr.z)
					O.dir=SOUTHWEST
					O.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					P.loc=locate(usr.x+2,usr.y+3,usr.z)
					P.dir=SOUTHWEST
					P.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					Q.loc=locate(usr.x-3,usr.y+4,usr.z)
					Q.dir=SOUTHWEST
					Q.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					R.loc=locate(usr.x+3,usr.y+4,usr.z)
					R.dir=SOUTHWEST
					R.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					S.loc=locate(usr.x-4,usr.y+5,usr.z)
					S.dir=SOUTHWEST
					S.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					T.loc=locate(usr.x+4,usr.y+5,usr.z)
					T.dir=SOUTHWEST
					T.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					U.loc=locate(usr.x-1,usr.y+4,usr.z)
					U.dir=SOUTHWEST
					U.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					V.loc=locate(usr.x+1,usr.y+4,usr.z)
					V.dir=SOUTHWEST
					V.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					W.loc=locate(usr.x-4,usr.y+7,usr.z)
					W.dir=SOUTHWEST
					W.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					X.loc=locate(usr.x+4,usr.y+7,usr.z)
					X.dir=SOUTHWEST
					X.power=usr.ki*usr.kiuse+src.setpower
					sleep(15)
					usr.icon_state=""
					view(8)<<"\white [usr]: GENOCIDE ATTACK!"
					spawn(10)if(usr)
						usr.frozen=0
						usr.doing=0
					spawn(50)if(usr)
						usr.tech_cooldown=0
						usr.using=0
		AcidRain
			verb
				Acid_Rain()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<50000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						usr<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.tech_cooldown=1
					usr.using=1
					src.setpower+=(usr.level*0.3+(usr.ki_skill/1.5))*(usr.kiuse/100)
					usr.frozen=1
					usr.icon_state="spirit bomb"
					var/obj/Tech/AcidBlast/A=new
					var/obj/Tech/AcidBlast/B=new
					var/obj/Tech/AcidBlast/C=new
					var/obj/Tech/AcidBlast/D=new
					var/obj/Tech/AcidBlast/E=new
					var/obj/Tech/AcidBlast/F=new
					var/obj/Tech/AcidBlast/G=new
					var/obj/Tech/AcidBlast/H=new
					var/obj/Tech/AcidBlast/I=new
					var/obj/Tech/AcidBlast/J=new
					var/obj/Tech/AcidBlast/K=new
					var/obj/Tech/AcidBlast/L=new
					var/obj/Tech/AcidBlast/M=new
					var/obj/Tech/AcidBlast/N=new
					var/obj/Tech/AcidBlast/O=new
					var/obj/Tech/AcidBlast/P=new
					var/obj/Tech/AcidBlast/Q=new
					var/obj/Tech/AcidBlast/R=new
					var/obj/Tech/AcidBlast/S=new
					var/obj/Tech/AcidBlast/T=new
					var/obj/Tech/AcidBlast/U=new
					var/obj/Tech/AcidBlast/V=new
					var/obj/Tech/AcidBlast/W=new
					var/obj/Tech/AcidBlast/X=new
					A.owner=usr
					B.owner=usr
					C.owner=usr
					D.owner=usr
					E.owner=usr
					F.owner=usr
					G.owner=usr
					H.owner=usr
					I.owner=usr
					J.owner=usr
					K.owner=usr
					L.owner=usr
					M.owner=usr
					N.owner=usr
					O.owner=usr
					P.owner=usr
					Q.owner=usr
					R.owner=usr
					S.owner=usr
					T.owner=usr
					U.owner=usr
					V.owner=usr
					W.owner=usr
					X.owner=usr
					view(8)<<"\white [usr]: HA!"
					A.loc=locate(usr.x-2,usr.y+7,usr.z)
					A.dir=WEST
					A.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					B.loc=locate(usr.x+1,usr.y+6,usr.z)
					B.dir=SOUTH
					B.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					C.loc=locate(usr.x-3,usr.y+8,usr.z)
					C.dir=NORTHWEST
					C.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					D.loc=locate(usr.x+1,usr.y+8,usr.z)
					D.dir=NORTH
					D.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					E.loc=locate(usr.x-1,usr.y+6,usr.z)
					E.dir=SOUTH
					E.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					F.loc=locate(usr.x-1,usr.y+8,usr.z)
					F.dir=NORTH
					F.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					G.loc=locate(usr.x+2,usr.y+7,usr.z)
					G.dir=EAST
					G.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					H.loc=locate(usr.x+3,usr.y+8,usr.z)
					H.dir=NORTHEAST
					H.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					I.loc=locate(usr.x,usr.y+5,usr.z)
					I.dir=SOUTHWEST
					I.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					J.loc=locate(usr.x-3,usr.y+6,usr.z)
					J.dir=SOUTHWEST
					J.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					K.loc=locate(usr.x+2,usr.y+5,usr.z)
					K.dir=SOUTHEAST
					K.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					L.loc=locate(usr.x+3,usr.y+6,usr.z)
					L.dir=SOUTHEAST
					L.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					M.loc=locate(usr.x-2,usr.y+5,usr.z)
					M.dir=SOUTHWEST
					M.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					N.loc=locate(usr.x,usr.y+7,usr.z)
					N.dir=SOUTHEAST
					N.power=usr.ki*usr.kiuse+src.setpower
					usr.ki-=usr.ki*usr.kiuse
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					O.loc=locate(usr.x-2,usr.y+3,usr.z)
					O.dir=SOUTHWEST
					O.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					P.loc=locate(usr.x+2,usr.y+3,usr.z)
					P.dir=SOUTHWEST
					P.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					Q.loc=locate(usr.x-3,usr.y+4,usr.z)
					Q.dir=SOUTHWEST
					Q.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					R.loc=locate(usr.x+3,usr.y+4,usr.z)
					R.dir=SOUTHWEST
					R.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					S.loc=locate(usr.x-4,usr.y+5,usr.z)
					S.dir=SOUTHWEST
					S.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					T.loc=locate(usr.x+4,usr.y+5,usr.z)
					T.dir=SOUTHWEST
					T.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					U.loc=locate(usr.x-1,usr.y+4,usr.z)
					U.dir=SOUTHWEST
					U.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					V.loc=locate(usr.x+1,usr.y+4,usr.z)
					V.dir=SOUTHWEST
					V.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					W.loc=locate(usr.x-4,usr.y+7,usr.z)
					W.dir=SOUTHWEST
					W.power=usr.ki*usr.kiuse+src.setpower
					sleep(2)
					view(8)<<"\white [usr]: HA!"
					X.loc=locate(usr.x+4,usr.y+7,usr.z)
					X.dir=SOUTHWEST
					X.power=usr.ki*usr.kiuse+src.setpower
					sleep(15)
					usr.icon_state=""
					view(8)<<"\white [usr]: ACID RAIN!"
					spawn(10)if(usr)
						usr.frozen=0
						usr.doing=0
					spawn(50)if(usr)
						usr.tech_cooldown=0
						usr.using=0
					return
		BurningAttack
			verb
				BurningAttack()
					set category = "Techniques"
					set name = "Burning Attack"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<10000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.tech_cooldown=1
					usr.frozen=1
					usr.using=1
					usr.overlays+='Charge Yellow.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>9)
						chargedelay=9
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: BURNING..."
					view(6) << sound('burning.wav')
					for(var/turf/T in view(src,4))
						var/chance = roll(1,20)
						if(chance == 15)
							missile(new/obj/YellowPU, T, src)
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: ATTACK..."
					sleep(12-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Yellow.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					spawn(10)if(usr)
						usr.icon_state=""
						usr.frozen=0
						usr.doing=0
					usr.tech_cooldown=1
					spawn(50)if(usr)
						usr.tech_cooldown=0
						usr.using=0
					var/obj/Tech/BeamH/BangC/C=new
					var/obj/Tech/BeamH/BangTL/TL=new
					var/obj/Tech/BeamH/BangT/T=new
					var/obj/Tech/BeamH/BangTR/TR=new
					var/obj/Tech/BeamH/BangL/L=new
					var/obj/Tech/BeamH/BangR/R=new
					var/obj/Tech/BeamH/BangBL/BL=new
					var/obj/Tech/BeamH/BangB/B=new
					var/obj/Tech/BeamH/BangBR/BR=new
					C.name="Burning Attack"
					TL.name="Burning Attack"
					T.name="Burning Attack"
					TR.name="Burning Attack"
					L.name="Burning Attack"
					R.name="Burning Attack"
					BL.name="Burning Attack"
					B.name="Burning Attack"
					BR.name="Burning Attack"
					C.owner=usr
					C.loc=usr.loc
					TL.owner=usr
					TL.loc=usr.loc
					T.owner=usr
					T.loc=usr.loc
					TR.owner=usr
					TR.loc=usr.loc
					L.owner=usr
					L.loc=usr.loc
					R.owner=usr
					R.loc=usr.loc
					BL.owner=usr
					BL.loc=usr.loc
					B.owner=usr
					B.loc=usr.loc
					BR.owner=usr
					BR.loc=usr.loc
					C.power=usr.ki*usr.kiuse+src.setpower
					TL.power=usr.ki*usr.kiuse+src.setpower
					T.power=usr.ki*usr.kiuse+src.setpower
					TR.power=usr.ki*usr.kiuse+src.setpower
					L.power=usr.ki*usr.kiuse+src.setpower
					R.power=usr.ki*usr.kiuse+src.setpower
					BL.power=usr.ki*usr.kiuse+src.setpower
					B.power=usr.ki*usr.kiuse+src.setpower
					BR.power=usr.ki*usr.kiuse+src.setpower
					spawn(0)C.UpdateBombTrails()
					src.setpower+=(usr.level*0.75+(usr.ki_skill/1.5))*(usr.kiuse/100)
		BigBangAttack
			verb
				BigBangAttack()
					set category = "Techniques"
					set name = "Big Bang Attack"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<10000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.frozen=1
					usr.using=1
					usr.tech_cooldown=1
					usr.overlays+='Charge Blue.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>9)
						chargedelay=9
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: BIG BANG..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: ATTACK..."
					sleep(12-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Blue.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					spawn(10)if(usr)
						usr.icon_state=""
						usr.frozen=0
						usr.doing=0
					usr.tech_cooldown=1
					spawn(50)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/BangC/C=new
					var/obj/Tech/BeamH/BangTL/TL=new
					var/obj/Tech/BeamH/BangT/T=new
					var/obj/Tech/BeamH/BangTR/TR=new
					var/obj/Tech/BeamH/BangL/L=new
					var/obj/Tech/BeamH/BangR/R=new
					var/obj/Tech/BeamH/BangBL/BL=new
					var/obj/Tech/BeamH/BangB/B=new
					var/obj/Tech/BeamH/BangBR/BR=new
					C.icon_state="bb c"
					TL.icon_state="bb tl"
					T.icon_state="bb t"
					TR.icon_state="bb tr"
					L.icon_state="bb l"
					R.icon_state="bb r"
					BL.icon_state="bb bl"
					B.icon_state="bb b"
					BR.icon_state="bb br"
					C.name="Big Bang Attack"
					TL.name="Big Bang Attack"
					T.name="Big Bang Attack"
					TR.name="Big Bang Attack"
					L.name="Big Bang Attack"
					R.name="Big Bang Attack"
					BL.name="Big Bang Attack"
					B.name="Big Bang Attack"
					BR.name="Big Bang Attack"
					C.owner=usr
					C.loc=usr.loc
					TL.owner=usr
					TL.loc=usr.loc
					T.owner=usr
					T.loc=usr.loc
					TR.owner=usr
					TR.loc=usr.loc
					L.owner=usr
					L.loc=usr.loc
					R.owner=usr
					R.loc=usr.loc
					BL.owner=usr
					BL.loc=usr.loc
					B.owner=usr
					B.loc=usr.loc
					BR.owner=usr
					BR.loc=usr.loc
					C.power=usr.ki*usr.kiuse+src.setpower
					TL.power=usr.ki*usr.kiuse+src.setpower
					T.power=usr.ki*usr.kiuse+src.setpower
					TR.power=usr.ki*usr.kiuse+src.setpower
					L.power=usr.ki*usr.kiuse+src.setpower
					R.power=usr.ki*usr.kiuse+src.setpower
					BL.power=usr.ki*usr.kiuse+src.setpower
					B.power=usr.ki*usr.kiuse+src.setpower
					BR.power=usr.ki*usr.kiuse+src.setpower
					spawn(0)C.UpdateBombTrails()
					src.setpower+=(usr.level*0.75+(usr.ki_skill/1.5))*(usr.kiuse/100)
		BlasterShell
			verb
				BlasterShell()
					set category = "Techniques"
					set name = "Blaster Shell"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<10000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.frozen=1
					usr.using=1
					usr.overlays+='Charge Blue.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>9)
						chargedelay=9
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: BLASTER..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: SHELL..."
					sleep(12-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Blue.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					spawn(10)if(usr)
						usr.icon_state=""
						usr.frozen=0
						usr.doing=0
					usr.tech_cooldown=1
					spawn(50)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/BangC/C=new
					var/obj/Tech/BeamH/BangTL/TL=new
					var/obj/Tech/BeamH/BangT/T=new
					var/obj/Tech/BeamH/BangTR/TR=new
					var/obj/Tech/BeamH/BangL/L=new
					var/obj/Tech/BeamH/BangR/R=new
					var/obj/Tech/BeamH/BangBL/BL=new
					var/obj/Tech/BeamH/BangB/B=new
					var/obj/Tech/BeamH/BangBR/BR=new
					C.icon_state="bs c"
					TL.icon_state="bs tl"
					T.icon_state="bs t"
					TR.icon_state="bs tr"
					L.icon_state="bs l"
					R.icon_state="bs r"
					BL.icon_state="bs bl"
					B.icon_state="bs b"
					BR.icon_state="bs br"
					C.name="Blaster Shell"
					TL.name="Blaster Shell"
					T.name="Blaster Shell"
					TR.name="Blaster Shell"
					L.name="Blaster Shell"
					R.name="Blaster Shell"
					BL.name="Blaster Shell"
					B.name="Blaster Shell"
					BR.name="Blaster Shell"
					C.owner=usr
					C.loc=usr.loc
					TL.owner=usr
					TL.loc=usr.loc
					T.owner=usr
					T.loc=usr.loc
					TR.owner=usr
					TR.loc=usr.loc
					L.owner=usr
					L.loc=usr.loc
					R.owner=usr
					R.loc=usr.loc
					BL.owner=usr
					BL.loc=usr.loc
					B.owner=usr
					B.loc=usr.loc
					BR.owner=usr
					BR.loc=usr.loc
					C.power=usr.ki*usr.kiuse+src.setpower
					TL.power=usr.ki*usr.kiuse+src.setpower
					T.power=usr.ki*usr.kiuse+src.setpower
					TR.power=usr.ki*usr.kiuse+src.setpower
					L.power=usr.ki*usr.kiuse+src.setpower
					R.power=usr.ki*usr.kiuse+src.setpower
					BL.power=usr.ki*usr.kiuse+src.setpower
					B.power=usr.ki*usr.kiuse+src.setpower
					BR.power=usr.ki*usr.kiuse+src.setpower
					spawn(0)C.UpdateBombTrails()
					src.setpower+=(usr.level*0.75+(usr.ki_skill/1.5))*(usr.kiuse/100)
		RevengeDeathBall
			verb
				Revenge_Death_Ball()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<10000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.frozen=1
					usr.using=1
					usr.overlays+='Charge Black.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>9)
						chargedelay=9
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: REVENGE..."
					view(6) << sound('db_charge.wav')
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: DEATH BALL..."
					sleep(12-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Black.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					spawn(10)if(usr)
						usr.icon_state=""
						usr.frozen=0
						usr.doing=0
					usr.tech_cooldown=1
					spawn(50)if(usr)
						usr.tech_cooldown=0
						usr.using=0
					var/obj/Tech/BeamH/BangC/C=new
					var/obj/Tech/BeamH/BangTL/TL=new
					var/obj/Tech/BeamH/BangT/T=new
					var/obj/Tech/BeamH/BangTR/TR=new
					var/obj/Tech/BeamH/BangL/L=new
					var/obj/Tech/BeamH/BangR/R=new
					var/obj/Tech/BeamH/BangBL/BL=new
					var/obj/Tech/BeamH/BangB/B=new
					var/obj/Tech/BeamH/BangBR/BR=new
					C.icon_state="rb c"
					TL.icon_state="rb tl"
					T.icon_state="rb t"
					TR.icon_state="rb tr"
					L.icon_state="rb l"
					R.icon_state="rb r"
					BL.icon_state="rb bl"
					B.icon_state="rb b"
					BR.icon_state="rb br"
					C.name="Revenge Death Ball"
					TL.name="Revenge Death Ball"
					T.name="Revenge Death Ball"
					TR.name="Revenge Death Ball"
					L.name="Revenge Death Ball"
					R.name="Revenge Death Ball"
					BL.name="Revenge Death Ball"
					B.name="Revenge Death Ball"
					BR.name="Revenge Death Ball"
					C.owner=usr
					C.loc=usr.loc
					TL.owner=usr
					TL.loc=usr.loc
					T.owner=usr
					T.loc=usr.loc
					TR.owner=usr
					TR.loc=usr.loc
					L.owner=usr
					L.loc=usr.loc
					R.owner=usr
					R.loc=usr.loc
					BL.owner=usr
					BL.loc=usr.loc
					B.owner=usr
					B.loc=usr.loc
					BR.owner=usr
					BR.loc=usr.loc
					C.power=usr.ki*usr.kiuse+src.setpower
					TL.power=usr.ki*usr.kiuse+src.setpower
					T.power=usr.ki*usr.kiuse+src.setpower
					TR.power=usr.ki*usr.kiuse+src.setpower
					L.power=usr.ki*usr.kiuse+src.setpower
					R.power=usr.ki*usr.kiuse+src.setpower
					BL.power=usr.ki*usr.kiuse+src.setpower
					B.power=usr.ki*usr.kiuse+src.setpower
					BR.power=usr.ki*usr.kiuse+src.setpower
					spawn(0)C.UpdateBombTrails()
					src.setpower+=(usr.level*0.75+(usr.ki_skill/1.5))*(usr.kiuse/100)
		DimensionSwordAttack
			verb
				Dimension_Sword_Attack()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<10000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.using=1
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>4)
						chargedelay=4
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: DIMENSION..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: SWORD ATTACK..."
					sleep(20-chargedelay)
					view(8)<<"\white [usr]: HA!"
					flick("attack",usr)
					usr.frozen=1
					spawn(5)if(usr)
						usr.frozen=0
						usr.doing=0
					usr.tech_cooldown=1
					spawn(40)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/SwordL/L=new
					var/obj/Tech/BeamH/SwordC/C=new
					var/obj/Tech/BeamH/SwordR/R=new
					L.owner=usr
					C.owner=usr
					R.owner=usr
					L.power=usr.ki*usr.kiuse+usr.ki*0.2
					C.power=usr.ki*usr.kiuse+usr.ki*0.2
					R.power=usr.ki*usr.kiuse+usr.ki*0.2
					L.dir=usr.dir
					L.loc=usr.loc
					C.dir=usr.dir
					C.loc=usr.loc
					R.dir=usr.dir
					R.loc=usr.loc
					switch(usr.dir)
						if(NORTHWEST)
							C.dir = NORTH
							C.loc=locate(usr.x,usr.y+1,usr.z)
						if(SOUTHWEST)
							C.dir = SOUTH
							C.loc=locate(usr.x,usr.y-1,usr.z)
						if(NORTHEAST)
							C.dir = NORTH
							C.loc=locate(usr.x,usr.y+1,usr.z)
						if(SOUTHEAST)
							C.dir = SOUTH
							C.loc=locate(usr.x,usr.y-1,usr.z)
						if(WEST)
							C.dir = WEST
							C.loc=locate(usr.x-1,usr.y,usr.z)
						if(EAST)
							C.dir = EAST
							C.loc=locate(usr.x+1,usr.y,usr.z)
						if(NORTH)
							C.dir = NORTH
							C.loc=locate(usr.x,usr.y+1,usr.z)
						if(SOUTH)
							C.dir = SOUTH
							C.loc=locate(usr.x,usr.y-1,usr.z)
					if(C.dir==NORTH)
						L.loc=locate(C.x-1,C.y,C.z)
						R.loc=locate(C.x+1,C.y,C.z)
					if(C.dir==SOUTH)
						L.loc=locate(C.x+1,C.y,C.z)
						R.loc=locate(C.x-1,C.y,C.z)
					if(C.dir==EAST)
						L.loc=locate(C.x,C.y+1,C.z)
						R.loc=locate(C.x,C.y-1,C.z)
					if(C.dir==WEST)
						L.loc=locate(C.x,C.y-1,C.z)
						R.loc=locate(C.x,C.y+1,C.z)
		SwordSlash
			verb
				SwordSlash()
					set category = "Techniques"
					set name = "Sword Slash"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.frozen=1
					usr.tech_cooldown=1
					usr.using=1
					spawn(5)if(usr)
						usr.frozen=0
						usr.doing=0
						usr.using=0
					spawn((usr.speed/1000)*2)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/LSword/L=new
					L.owner=usr
					L.power=(usr.ki*usr.kiuse)+usr.strength*0.05
					L.dir=usr.dir
					switch(usr.dir)
						if(NORTHWEST)
							L.dir = NORTH
							L.loc=locate(usr.x,usr.y+1,usr.z)
						if(SOUTHWEST)
							L.dir = SOUTH
							L.loc=locate(usr.x,usr.y-1,usr.z)
						if(NORTHEAST)
							L.dir = NORTH
							L.loc=locate(usr.x,usr.y+1,usr.z)
						if(SOUTHEAST)
							L.dir = SOUTH
							L.loc=locate(usr.x,usr.y-1,usr.z)
						if(WEST)
							L.dir = WEST
							L.loc=locate(usr.x-1,usr.y,usr.z)
						if(EAST)
							L.dir = EAST
							L.loc=locate(usr.x+1,usr.y,usr.z)
						if(NORTH)
							L.dir = NORTH
							L.loc=locate(usr.x,usr.y+1,usr.z)
						if(SOUTH)
							L.dir = SOUTH
							L.loc=locate(usr.x,usr.y-1,usr.z)
					flick("attack",usr)

///////////////////////////////
/////////VALIANT ATTACKS///////
///////////////////////////////
		Fistshot
			verb
				Fist_Attack()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<500)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						usr<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					view() << sound('kiblast.wav')
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(1)
						usr.frozen=0
						usr.doing=0
					spawn(8)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.1))*(usr.kiuse/100)
					A.TechAttackStraight(usr,"Fist Attack",usr.ki*usr.kiuse+src.setpower,'Techs.dmi',"blast",0)

obj
	Tech
		BeamH
			LSword
				controldisabled=1
				icon='Techs.dmi'
				icon_state="swordslash"
				layer=150
				New()
					..()
					spawn(0)SwordAttack("Sword Slash",power,owner)
			SwordL
				controldisabled=1
				icon='Dimension Sword Attack.dmi'
				icon_state="l"
				layer=150
				New()
					..()
					spawn(0)SwordAttack("Dimension Sword Attack",power,owner)
			SwordC
				controldisabled=1
				icon='Dimension Sword Attack.dmi'
				icon_state="c"
				layer=150
				New()
					..()
					spawn(0)SwordAttack("Dimension Sword Attack",power,owner)
			SwordR
				controldisabled=1
				icon='Dimension Sword Attack.dmi'
				icon_state="r"
				layer=150
				New()
					..()
					spawn(0)SwordAttack("Dimension Sword Attack",power,owner)
			BangTL
				controldisabled=1
				icon='Burning Attack.dmi'
				icon_state="ba tl"
				layer=150
				New()
					..()
					spawn(0)BangAttack2(name,power,owner)
			BangT
				controldisabled=1
				icon='Burning Attack.dmi'
				icon_state="ba t"
				layer=150
				New()
					..()
					spawn(0)BangAttack2(name,power,owner)
			BangTR
				controldisabled=1
				icon='Burning Attack.dmi'
				icon_state="ba tr"
				layer=150
				New()
					..()
					spawn(0)BangAttack2(name,power,owner)
			BangL
				controldisabled=1
				icon='Burning Attack.dmi'
				icon_state="ba l"
				layer=150
				New()
					..()
					spawn(0)BangAttack2(name,power,owner)
			BangC
				controldisabled=1
				icon='Burning Attack.dmi'
				icon_state="ba c"
				layer=150
				New()
					..()
					spawn(0)BangAttack(name,power,owner)
			BangR
				controldisabled=1
				icon='Burning Attack.dmi'
				icon_state="ba r"
				layer=150
				New()
					..()
					spawn(0)BangAttack2(name,power,owner)
			BangBL
				controldisabled=1
				icon='Burning Attack.dmi'
				icon_state="ba bl"
				layer=150
				New()
					..()
					spawn(0)BangAttack2(name,power,owner)
			BangB
				controldisabled=1
				icon='Burning Attack.dmi'
				icon_state="ba b"
				layer=150
				New()
					..()
					spawn(0)BangAttack2(name,power,owner)
			BangBR
				controldisabled=1
				icon='Burning Attack.dmi'
				icon_state="ba br"
				layer=150
				New()
					..()
					spawn(0)BangAttack2(name,power,owner)
		ScatterBlast
			controldisabled=1
			icon='Techs.dmi'
			icon_state="scatter"
			name="Scatter Shot"
			New()
				..()
				spawn(63)
					if(!owner)
						del(src)
						return
					Scatter(owner)
		KiMissile
			controldisabled=1
			icon='Techs.dmi'
			icon_state="blast"
			name="Ki Missile"
			New()
				..()
				spawn(1)
					if(!owner)
						del(src)
						return
					Scatter(owner)
		GenocideBlast
			controldisabled=1
			icon='Techs.dmi'
			icon_state="genocide"
			name="Genocide Attack"
			New()
				..()
				spawn(63)
					if(!owner)
						del(src)
						return
					Scatter(owner)
		AngryBlast
			controldisabled=1
			icon='Angry Blast.dmi'
			name="Angry Blast"
			New()
				..()
				spawn(63)
					if(!owner)
						del(src)
						return
					Scatter(owner)
		SuperGhost
			controldisabled=1
			icon='Ghost.dmi'
			name="Super Ghost"
			New()
				..()
				spawn(63)
					if(!owner)
						del(src)
						return
					Scatter(owner)
		StarShower
			controldisabled=1
			icon='Techs.dmi'
			icon_state="Star"
			name="Star Shower"
			New()
				..()
				spawn(63)
					if(!owner)
						del(src)
						return
					Scatter(owner)
		AcidBlast
			controldisabled=1
			icon='Techs.dmi'
			icon_state="acid"
			name="Acid Rain"
			New()
				..()
				spawn(63)
					if(!owner)
						del(src)
						return
					Scatter(owner)
	proc
		ExplodeDamage(mob/M,Range,Damage)
			var/mob/O=src.owner
			if(!O)return
			if(exploded)return
			exploded=1
			for(var/mob/Y in oview(Range,src))
				if(M)if(Y==M)continue
				if(Y.pk&&!Y.safe&&!Y.FuseFollower&&!Y.dead)
					if(!Y||!O)return
					var/chance1 = rand(1,100)
					var/chance2= rand(1,100)
					var/damage=(Damage*chance1*0.01)-(Y.kidefense*chance2*0.01)
					if(damage < 0)damage = ((Damage*0.0001))*chance1
					if(damage < 1)damage = 1
					Y.powerlevel-=damage
					if(Y.damage_enabled)Y<<"<font color=red>[O]'s [src]'s explosion damages you!"
					if(O.damage_enabled)O<<"<font color=red>You caused [damage] to [Y]!"
					if(O.kill)Y.DeathCheck(O)
					else spawn(0)Y.KO()
		Scatter(mob/O)
			if(!O)
				del(src)
				return
			owner=O
			range=0
			while(src)
				if(!owner)
					del(src)
					break
				target=O.target
				range+=1
				var/Found=FALSE
				var/hastarget=0
				for(var/mob/ST in view(8,src))
					if(istype(ST,/mob/NPC))continue
					if(ST.FuseFollower)continue
					if(ST==target)if(ST.pk&&ST!=O)hastarget=1
				for(var/mob/M in view(8,src))
					if(istype(M,/mob/NPC))continue
					if(M.FuseFollower)continue
					if(hastarget)
						step_towards(src,target)
						Found=TRUE
					if(!hastarget)
						if(M==O)continue
						if(istype(M,/mob/PC))
							if(O.in_guild&&!O.attackguild&&M.guild==O.guild)Found=FALSE
							else
								if(O.in_party&&!O.attackparty&&M.party_name==O.party_name)Found=FALSE
								else
									step_towards(src,M)
									Found=TRUE
						else
							step_towards(src,M)
							Found=TRUE
					break
				if(Found!=TRUE)step(src,dir)
				var/turf/T=loc
				if(!T||T==null)return
				if(!T.density&&power>=50000000)
					if(istype(src,/turf/Earth/Island_Edge_005))
						T.overlays+='Dirt.dmi'
						T.RemoveDirt(100)
				for(var/mob/M in T)
					if(M.FuseFollower)continue
					if(M!=O||M==O&&range>=15)
						spawn(1)del(src)
						if(M.pk&&!M.safe&&!M.FuseFollower&&!M.dead)
							if(M.kiabsorb)
								var/absorbpower=M.kidefense*0.5+M.ki*0.15
								var/absorbdamage=power-absorbpower
								if(absorbpower>=power)
									M.ki+=power
									if(M.ki>M.ki_max*2)
										M<<"Your body can't handle anymore ki!"
										M.powerlevel=0
										M.DeathCheck(O)
								else
									M.powerlevel-=absorbdamage
									if(M.damage_enabled)M<<"<font color=red>You took [absorbdamage] damage!"
									if(O.damage_enabled)O<<"<font color=red>You caused [absorbdamage] to [M]!"
									M<<"<font color=red>[O]'s [src] hits you!"
									O<<"<font color=red>Your [src] hits [M]!"
									if(O.kill)M.DeathCheck(O)
									else spawn(0)M.KO()
							else
								if(M.Dodge_Attack(owner)==TRUE)
									flick("IT",M)
									switch(dir)
										if(WEST)
											if(prob(50))M.loc=locate(M.x,M.y+2,M.z)
											else M.loc=locate(M.x,M.y-2,M.z)
										if(EAST)
											if(prob(50))M.loc=locate(M.x,M.y+2,M.z)
											else M.loc=locate(M.x,M.y-2,M.z)
										if(NORTH)
											if(prob(50))M.loc=locate(M.x+2,M.y,M.z)
											else M.loc=locate(M.x-2,M.y,M.z)
										if(SOUTH)
											if(prob(50))M.loc=locate(M.x+2,M.y,M.z)
											else M.loc=locate(M.x-2,M.y,M.z)
										if(NORTHWEST)
											if(prob(50))M.loc=locate(M.x,M.y+2,M.z)
											else M.loc=locate(M.x,M.y-2,M.z)
										if(NORTHEAST)
											if(prob(50))M.loc=locate(M.x,M.y+2,M.z)
											else M.loc=locate(M.x,M.y-2,M.z)
										if(SOUTHEAST)
											if(prob(50))M.loc=locate(M.x+2,M.y,M.z)
											else M.loc=locate(M.x-2,M.y,M.z)
										if(SOUTHWEST)
											if(prob(50))M.loc=locate(M.x+2,M.y,M.z)
											else M.loc=locate(M.x-2,M.y,M.z)
								else
									var/chance1 = rand(1,100)
									var/chance2= rand(1,100)
									var/damage=(power*chance1*0.01)-(M.kidefense*chance2*0.01)
									if(damage < 0)damage = ((power*0.0001))*chance1
									if(damage < 1)damage = 1
									M.powerlevel-=damage
									if(M.damage_enabled)M<<"<font color=red>You took [damage] damage!"
									if(O.damage_enabled)O<<"<font color=red>You caused [damage] to [M]!"
									M<<"<font color=red>[O]'s [src] hits you!"
									O<<"<font color=red>Your [src] hits [M]!"
									if(O.kill)M.DeathCheck(O)
									else spawn(0)M.KO()
							if(power>=20000000)
								var/obj/techs/Overlays/Crater_Center/C=new
								C.loc=loc
							else
								if(power>=8000000)
									var/obj/techs/Overlays/Crater_Small/C=new
									C.loc=loc
						var/drange=1
						if(power>=10000000)drange=2
						if(power>=20000000)drange=3
						if(power>=30000000)drange=4
						if(power>=40000000)drange=5
						if(power>=50000000)drange=6
						if(power>=60000000)drange=7
						if(power>=70000000)drange=8
						for(var/obj/Buildings/DE in oview(drange,src))
							DE.hp-=power/(1+get_dist(src,DE))
							spawn(0)DE.DestroyIt()
						ExplodeDamage(M,drange,power)
					break
				for(var/obj/Buildings/DE in T)
					var/mob/DEO=owner
					if(!DEO.see_invisible)if(istype(DE,/obj/Buildings)&&DE.invisibility)continue
					DE.hp-=power
					if(DE.DestroyIt()==TRUE)
						var/drange=1
						if(power>=10000000)drange=2
						if(power>=20000000)drange=3
						if(power>=30000000)drange=4
						if(power>=40000000)drange=5
						if(power>=50000000)drange=6
						if(power>=60000000)drange=7
						if(power>=70000000)drange=8
						for(var/obj/Buildings/DE2 in oview(drange,DE))
							DE2.hp-=power/(1+get_dist(src,DE2))
							spawn(0)DE2.DestroyIt()
						ExplodeDamage(0,drange,power)
						DEO.frozen=0
						DEO.doing=0
						DEO.icon_state=""
						TrailDelete()
						break
				if(range>=25)
					if(power>=20000000)
						var/obj/techs/Overlays/Crater_Center/C=new
						C.loc=loc
					else
						if(src.power>=8000000)
							var/obj/techs/Overlays/Crater_Small/C=new
							C.loc=loc
					var/drange=1
					if(power>=10000000)drange=2
					if(power>=20000000)drange=3
					if(power>=30000000)drange=4
					if(power>=40000000)drange=5
					if(power>=50000000)drange=6
					if(power>=60000000)drange=7
					if(power>=70000000)drange=8
					for(var/obj/Buildings/DE in oview(drange,src))
						DE.hp-=power/(1+get_dist(src,DE))
						spawn(0)DE.DestroyIt()
					ExplodeDamage(0,drange,power)
					del(src)
					break
				sleep(1)
		BindAttack(Z=0,I=0,IS=0,Power=0,mob/O,Effect=0)
			owner=O
			O.ki-=O.ki*O.kiuse
			power=Power
			icon=I
			icon_state=IS
			range=0
			name=Z
			dir=O.dir
			loc=O.loc
			while(src)
				if(!owner)
					del(src)
					break
				target=O.target
				range+=1
				step(src,dir)
				var/turf/T=loc
				for(var/mob/M in T)
					if(M.FuseFollower)continue
					spawn(1)
						del(src)
						break
					if(M.pk&&!M.safe&&!M.dead&&!M.binded)
						view(8)<<"\white [O] has binded [M]!"
						M.binded=1
						M.doing=1
						if(Z=="Imprisonment Ball")M.overlays+=icon('Techs.dmi',"imprisonmentball")
						if(Z=="Galactic Donut")M.overlays+=icon('Techs.dmi',"galaticdonut")
						if(Z=="Demon Shackle")M.overlays+=icon('Techs.dmi',"demonshackle")
						var/chance1 = rand(1,100)
						var/chance2= rand(1,100)
						var/damage=(power*chance1*0.01)-((M.kidefense*chance2*0.01)+((M.strength*0.2+M.ki*0.1)*chance1))
						if(damage < 0)damage = ((power*0.000001))*chance1
						if(damage < 1)damage = 1
						if(Effect=="Critical")
							if(prob(40))damage=((power*2*chance1)-(M.kidefense+M.strength*0.2+M.ki*0.1))
							if(damage < 1)damage = (power*2*0.0001*chance1)
							if(damage < 1) damage = 1
						if(damage<=0)
							damage=0
							flick("enrage",M)
							M.overlays-=icon('Techs.dmi',"imprisonmentball")
							spawn(10)if(M)M.overlays-=icon('Techs.dmi',"imprisonmentball")
							M.overlays-=icon('Techs.dmi',"galaticdonut")
							spawn(10)if(M)M.overlays-=icon('Techs.dmi',"galaticdonut")
							M.overlays-=icon('Techs.dmi',"demonshackle")
							spawn(10)if(M)M.overlays-=icon('Techs.dmi',"demonshackle")
							view(8)<<"\white [M] has broken free!"
							M.binded=0
							M.doing=0
						else
							var/timer=100
							if(damage<M.strength*0.9)timer=80
							if(damage<M.strength*0.7)timer=60
							if(damage<M.strength*0.5)timer=40
							if(damage<M.strength*0.3)timer=20
							if(damage<M.strength*0.1)timer=10
							if(Z=="Imprisonment Ball")spawn(0)M.BindTimer(O,timer,damage/3)
							else spawn(0)M.BindTimer(O,timer,0)
				if(range>=20)
					del(src)
					break
				sleep(1)
		BangAttack(Z=0,Power=0,mob/O)
			clashable=0
			owner=O
			power=Power
			range=0
			name=Z
			O.ki-=O.ki*O.kiuse
			dir=O.dir
			loc=O.loc
			switch(O.dir)
				if(NORTHWEST)
					dir=NORTH
					loc=locate(O.x,O.y+1,O.z)
				if(SOUTHWEST)
					dir=SOUTH
					loc=locate(O.x,O.y-1,O.z)
				if(NORTHEAST)
					dir=NORTH
					loc=locate(O.x,O.y+1,O.z)
				if(SOUTHEAST)
					dir=SOUTH
					loc=locate(O.x,O.y-1,O.z)
				if(WEST)
					dir=WEST
					loc=locate(O.x-1,O.y,O.z)
				if(EAST)
					dir=EAST
					loc=locate(O.x+1,O.y,O.z)
				if(NORTH)
					dir=NORTH
					loc=locate(O.x,O.y+1,O.z)
				if(SOUTH)
					dir=SOUTH
					loc=locate(O.x,O.y-1,O.z)
			while(src)
				if(src)
					if(!owner)
						TrailDelete()
						del(src)
						break
					range+=1
					var/turf/T=loc
					if(!T||!src)return
					if(!T.density)
						T.overlays+='Dirt.dmi'
						T.RemoveDirt(100)
					for(var/mob/M in T)
						if(M.FuseFollower)continue
						var/mob/OW=owner
						if(M.pk&&!M.safe&&!M.FuseFollower&&!M.dead)
							var/chance1 = rand(1,100)
							var/chance2= rand(1,100)
							var/damage=(src.power*chance1*0.01)-(M.kidefense*chance2*0.01)
							if(damage < 0)damage = ((power*0.0001))*chance1
							if(damage < 1)damage = 1
							var/apower=power
							power-=M.powerlevel
							M.powerlevel-=damage
							if(M.damage_enabled)M<<"<font color=red>You took [damage] damage!"
							if(O.damage_enabled)O<<"<font color=red>You caused [damage] to [M]!"
							M<<"<font color=red>[OW]'s [src] hits you!"
							OW<<"<font color=red>Your [src] hits [M]!"
							if(O.kill)M.DeathCheck(OW)
							else spawn(0)M.KO()
							if(apower>=20000000)
								var/obj/techs/Overlays/Crater_Center/C=new
								C.loc=loc
							else
								if(power>=8000000)
									var/obj/techs/Overlays/Crater_Small/C=new
									C.loc=loc
							var/drange=1
							if(apower>=10000000)drange=2
							if(apower>=20000000)drange=3
							if(apower>=30000000)drange=4
							if(apower>=40000000)drange=5
							if(apower>=50000000)drange=6
							if(apower>=60000000)drange=7
							if(apower>=70000000)drange=8
							ExplodeDamage(M,drange,apower)
							if(power<=0)
								TrailDelete()
								break
						else
							TrailDelete()
							break
					for(var/obj/Buildings/DE in T)
						var/mob/DEO=owner
						if(!DEO.see_invisible)if(istype(DE,/obj/Buildings)&&DE.invisibility)continue
						DE.hp-=power
						if(DE.DestroyIt()==TRUE)
							var/drange=1
							if(power>=10000000)drange=2
							if(power>=20000000)drange=3
							if(power>=30000000)drange=4
							if(power>=40000000)drange=5
							if(power>=50000000)drange=6
							if(power>=60000000)drange=7
							if(power>=70000000)drange=8
							for(var/obj/Buildings/DE2 in oview(drange,DE))
								DE2.hp-=power/(1+get_dist(src,DE2))
								spawn(0)DE2.DestroyIt()
							ExplodeDamage(0,drange,power)
							DEO.frozen=0
							DEO.doing=0
							DEO.icon_state=""
							TrailDelete()
							break
					if(power<=0)
						TrailDelete()
						break
					if(range>=20)
						if(power>=20000000)
							var/obj/techs/Overlays/Crater_Center/C=new
							C.loc=loc
						else
							if(power>=8000000)
								var/obj/techs/Overlays/Crater_Small/C=new
								C.loc=loc
						var/drange=1
						if(power>=10000000)drange=2
						if(power>=20000000)drange=3
						if(power>=30000000)drange=4
						if(power>=40000000)drange=5
						if(power>=50000000)drange=6
						if(power>=60000000)drange=7
						if(power>=70000000)drange=8
						for(var/obj/Buildings/DE2 in oview(drange,src))
							DE2.hp-=power/(1+get_dist(src,DE2))
							spawn(0)DE2.DestroyIt()
						ExplodeDamage(0,drange,power)
						TrailDelete()
						break
					step(src,dir)
					sleep(1)
		BangAttack2(Z=0,Power=0,mob/O)
			clashable=0
			owner=O
			power=Power
			range=0
			name=Z
			dir=O.dir
			loc=O.loc
			switch(O.dir)
				if(NORTHWEST)
					dir=NORTH
					loc=locate(O.x,O.y+1,O.z)
				if(SOUTHWEST)
					dir=SOUTH
					loc=locate(O.x,O.y-1,O.z)
				if(NORTHEAST)
					dir=NORTH
					loc=locate(O.x,O.y+1,O.z)
				if(SOUTHEAST)
					dir=SOUTH
					loc=locate(O.x,O.y-1,O.z)
				if(WEST)
					dir=WEST
					loc=locate(O.x-1,O.y,O.z)
				if(EAST)
					dir=EAST
					loc=locate(O.x+1,O.y,O.z)
				if(NORTH)
					dir=NORTH
					loc=locate(O.x,O.y+1,O.z)
				if(SOUTH)
					dir=SOUTH
					loc=locate(O.x,O.y-1,O.z)
			while(src)
				if(!owner)
					TrailDelete()
					del(src)
					break
				range+=1
				var/turf/T=loc
				if(!T)return
				if(!T.density)
					T.overlays+='Dirt.dmi'
					T.RemoveDirt(100)
				for(var/mob/M in T)
					if(M.FuseFollower)continue
					var/mob/OW=owner
					if(M.pk&&!M.safe&&!M.FuseFollower&&!M.dead)
						var/chance1 = rand(1,100)
						var/chance2= rand(1,100)
						var/damage=(power*chance1*0.01)-(M.kidefense*chance2*0.01)
						if(damage < 0)damage = ((power*0.0001))*chance1
						if(damage < 1)damage = 1
						var/apower=power
						power-=M.powerlevel
						M.powerlevel-=damage
						if(M.damage_enabled)M<<"<font color=red>You took [damage] damage!"
						if(OW.damage_enabled)OW<<"<font color=red>You caused [damage] to [M]!"
						M<<"<font color=red>[OW]'s [src] hits you!"
						OW<<"<font color=red>Your [src] hits [M]!"
						if(O.kill)M.DeathCheck(OW)
						else spawn(0)M.KO()
						if(apower>=20000000)
							var/obj/techs/Overlays/Crater_Center/C=new
							C.loc=loc
						else
							if(src.power>=8000000)
								var/obj/techs/Overlays/Crater_Small/C=new
								C.loc=loc
						var/drange=1
						if(apower>=10000000)drange=2
						if(apower>=20000000)drange=3
						if(apower>=30000000)drange=4
						if(apower>=40000000)drange=5
						if(apower>=50000000)drange=6
						if(apower>=60000000)drange=7
						if(apower>=70000000)drange=8
						ExplodeDamage(M,drange,apower)
						if(power<=0)
							TrailDelete()
							break
					else
						TrailDelete()
						break
				for(var/obj/Buildings/DE in T)
					var/mob/DEO=owner
					if(!DEO.see_invisible)if(istype(DE,/obj/Buildings)&&DE.invisibility)continue
					DE.hp-=power
					if(DE.DestroyIt()==TRUE)
						var/drange=1
						if(power>=10000000)drange=2
						if(power>=20000000)drange=3
						if(power>=30000000)drange=4
						if(power>=40000000)drange=5
						if(power>=50000000)drange=6
						if(power>=60000000)drange=7
						if(power>=70000000)drange=8
						for(var/obj/Buildings/DE2 in oview(drange,DE))
							DE2.hp-=power/(1+get_dist(src,DE2))
							spawn(0)DE2.DestroyIt()
						ExplodeDamage(0,drange,power)
						DEO.frozen=0
						DEO.doing=0
						DEO.icon_state=""
						TrailDelete()
						break
				for(var/mob/N as mob in get_step(src,dir))
					if(N.kiabsorb)
						var/mob/OW=owner
						var/absorbpower=N.kidefense*0.5+N.ki*0.15
						var/absorbdamage=power-absorbpower
						if(absorbpower>=power)
							N.ki+=power
							if(N.ki>N.ki_max*2)
								N<<"Your body can't handle anymore ki!"
								N.powerlevel=0
								N.DeathCheck(O)
						else
							N.powerlevel-=absorbdamage
							if(N.damage_enabled)N<<"<font color=red>You took [absorbdamage] damage!"
							if(OW.damage_enabled)OW<<"<font color=red>You caused [absorbdamage] to [N]!"
							N<<"<font color=red>[OW]'s [src] hits you!"
							OW<<"<font color=red>Your [src] hits [N]!"
							if(O.kill)N.DeathCheck(OW)
							else spawn(0)N.KO()
						TrailDelete()
						break
					else
						if(N.Dodge_Attack(owner)==TRUE)
							flick("IT",N)
							switch(dir)
								if(WEST)
									if(prob(50))N.loc=locate(N.x,N.y+2,N.z)
									else N.loc=locate(N.x,N.y-2,N.z)
								if(EAST)
									if(prob(50))N.loc=locate(N.x,N.y+2,N.z)
									else N.loc=locate(N.x,N.y-2,N.z)
								if(NORTH)
									if(prob(50))N.loc=locate(N.x+2,N.y,N.z)
									else N.loc=locate(N.x-2,N.y,N.z)
								if(SOUTH)
									if(prob(50))N.loc=locate(N.x+2,N.y,N.z)
									else N.loc=locate(N.x-2,N.y,N.z)
				for(var/obj/Tech/BeamH/C in get_step(src,dir))
					if(power<C.power)
						if(power>=20000000)
							var/obj/techs/Overlays/Crater_Center/CR=new
							CR.loc=loc
						else
							if(power>=8000000)
								var/obj/techs/Overlays/Crater_Small/CR=new
								CR.loc=loc
						var/drange=1
						var/explosion=src.power+(C.power-power)
						if(explosion>=10000000)drange=2
						if(explosion>=20000000)drange=3
						if(explosion>=30000000)drange=4
						if(explosion>=40000000)drange=5
						if(explosion>=50000000)drange=6
						if(explosion>=60000000)drange=7
						if(explosion>=70000000)drange=8
						C.power-=power
						ExplodeDamage(0,drange,power)
						TrailDelete()
						break
				if(power<=0)
					TrailDelete()
					break
				if(range>=20)
					TrailDelete()
					break
				step(src,dir)
				sleep(1)
		SwordAttack(Z=0,Power=0,mob/O)
			clashable=0
			owner=O
			power=Power
			range=0
			name=Z
			O.ki-=O.ki*O.kiuse
			dir=O.dir
			while(src)
				if(!owner)
					TrailDelete()
					del(src)
					break
				range+=1
				var/turf/T=loc
				if(!T.density&&power>50000000)
					if(istype(src,/turf/Earth/Island_Edge_005))
						T.overlays+='Dirt.dmi'
						T.RemoveDirt(100)
				for(var/mob/M in T)
					if(M.FuseFollower)continue
					var/mob/OW=owner
					if(M.pk&&!M.safe&&!M.FuseFollower&&!M.dead)
						var/chance1 = rand(1,100)
						var/chance2= rand(1,100)
						var/damage=(power*chance1*0.01)-(M.kidefense*chance2*0.01)
						if(damage < 0)damage = ((power*0.0001))*chance1
						if(damage < 1)damage = 1
						power-=M.powerlevel
						M.powerlevel-=damage
						if(M.damage_enabled)M<<"<font color=red>You took [damage] damage!"
						if(OW.damage_enabled)OW<<"<font color=red>You caused [damage] to [M]!"
						M<<"<font color=red>[OW]'s [src] hits you!"
						OW<<"<font color=red>Your [src] hits [M]!"
						if(O.kill)M.DeathCheck(OW)
						else spawn(0)M.KO()
						if(power<=0)
							TrailDelete()
							break
					else
						TrailDelete()
						break
				for(var/obj/Buildings/DE in T)
					var/mob/DEO=owner
					if(!DEO.see_invisible)if(istype(DE,/obj/Buildings)&&DE.invisibility)continue
					DE.hp-=power
					if(DE.DestroyIt()==TRUE)
						var/drange=1
						if(power>=10000000)drange=2
						if(power>=20000000)drange=3
						if(power>=30000000)drange=4
						if(power>=40000000)drange=5
						if(power>=50000000)drange=6
						if(power>=60000000)drange=7
						if(power>=70000000)drange=8
						for(var/obj/Buildings/DE2 in oview(drange,DE))
							DE2.hp-=power/(1+get_dist(src,DE2))
							spawn(0)DE2.DestroyIt()
						ExplodeDamage(0,drange,power)
						DEO.frozen=0
						DEO.doing=0
						DEO.icon_state=""
						TrailDelete()
						break
				for(var/mob/N as mob in get_step(src,dir))
					if(N.Dodge_Attack(owner)==TRUE)
						flick("IT",N)
						switch(dir)
							if(WEST)
								if(prob(50))N.loc=locate(N.x,N.y+2,N.z)
								else N.loc=locate(N.x,N.y-2,N.z)
							if(EAST)
								if(prob(50))N.loc=locate(N.x,N.y+2,N.z)
								else N.loc=locate(N.x,N.y-2,N.z)
							if(NORTH)
								if(prob(50))N.loc=locate(N.x+2,N.y,N.z)
								else N.loc=locate(N.x-2,N.y,N.z)
							if(SOUTH)
								if(prob(50))N.loc=locate(N.x+2,N.y,N.z)
								else N.loc=locate(N.x-2,N.y,N.z)
				for(var/obj/Tech/BeamH/C in get_step(src,dir))
					if(power<C.power)
						C.power-=power
						TrailDelete()
						break
				if(power<=0)
					TrailDelete()
					break
				if(range>=20)
					TrailDelete()
					break
				step(src,dir)
				sleep(1)
obj
	proc
		UpdateBombTrails()
			for(var/obj/Tech/BeamH/BangTL/TL in world)
				if(TL.owner==owner)TL.loc=locate(x-1,y+1,z)
			for(var/obj/Tech/BeamH/BangT/T in world)
				if(T.owner==owner)T.loc=locate(x,y+1,z)
			for(var/obj/Tech/BeamH/BangTR/TR in world)
				if(TR.owner==owner)TR.loc=locate(x+1,y+1,z)
			for(var/obj/Tech/BeamH/BangL/L in world)
				if(L.owner==owner)L.loc=locate(x-1,y,z)
			for(var/obj/Tech/BeamH/BangR/R in world)
				if(R.owner==owner)R.loc=locate(x+1,y,z)
			for(var/obj/Tech/BeamH/BangBL/BL in world)
				if(BL.owner==owner)BL.loc=locate(x-1,y-1,z)
			for(var/obj/Tech/BeamH/BangB/B in world)
				if(B.owner==owner)B.loc=locate(x,y-1,z)
			for(var/obj/Tech/BeamH/BangBR/BR in world)
				if(BR.owner==owner)BR.loc=locate(x+1,y-1,z)
			spawn(10)UpdateBombTrails()
		TrailDelete()
			spawn(0)del(src)
			var/mob/M=owner
			if(!M)return
			M.beaming=0
mob
	proc
		UnFreeze(T)
			sleep(T)
			beaming=0
			frozen=0
			doing=0
			if(istype(src,/mob/PC))icon_state=""
		DeleteTrails()
			sleep(10)
			overlays-=icon('Techs.dmi',"kamehamehaki")
			overlays-=icon('Techs.dmi',"kamehameha10ki")
			overlays-=icon('Techs.dmi',"finishbusterki")
			overlays-=icon('Techs.dmi',"galickgunki")
			overlays-=icon('Techs.dmi',"finalflashki")
			overlays-=icon('Techs.dmi',"finalshineki")
			overlays-=icon('Techs.dmi',"masenkoki")
			overlays-=icon('Techs.dmi',"hellblazeki")
			overlays-=icon('Techs.dmi',"tribeamki")
			overlays-=icon('Techs.dmi',"specialbeamcannonki")
			overlays-=icon('Techs.dmi',"fakemoono")
			beaming=0
			if(istype(src,/mob/PC))icon_state=""
			for(var/obj/Tech/BeamT/BT in world)if(BT.owner==src)del(BT)
		TrailDelete2()
			sleep(0)
			overlays-=icon('Techs.dmi',"kamehamehaki")
			overlays-=icon('Techs.dmi',"kamehameha10ki")
			overlays-=icon('Techs.dmi',"finishbusterki")
			overlays-=icon('Techs.dmi',"galickgunki")
			overlays-=icon('Techs.dmi',"finalflashki")
			overlays-=icon('Techs.dmi',"finalshineki")
			overlays-=icon('Techs.dmi',"masenkoki")
			overlays-=icon('Techs.dmi',"hellblazeki")
			overlays-=icon('Techs.dmi',"tribeamki")
			overlays-=icon('Techs.dmi',"specialbeamcannonki")
			overlays-=icon('Techs.dmi',"fakemoono")
			beaming=0
			if(istype(src,/mob/PC))icon_state=""
			for(var/obj/Tech/T1 in world)if(T1.owner==src)del(T1)
obj/Equipment/Consumable/Candy
	layer=100
	New()
		..()
		for(var/turf/Floors/Safe_Zone/S in view(8))if(S in oview(8))del(src)
obj
	Tech
		icon='Techs.dmi'
		ScatterBlast
			controldisabled=1
			layer=100
			New()
				..()
				spawn(70)del(src)
		BeamH
			controldisabled=1
			layer=49
			New()
				..()
				spawn(70)del(src)
		BeamT
			controldisabled=1
			layer=48
			New()
				..()
				spawn(70)del(src)
		BindTech
			layer=100
			New()
				..()
				spawn(600)del(src)
		BeamC
			controldisabled=1
			layer=40
			New()
				..()
				spawn(70)del(src)
turf
	proc
		RemoveDirt(T)
			spawn(T)overlays-='Dirt.dmi'
obj/Technique/SolarFlare
	verb
		Solar_Flare()
			set category = "Techniques"
			if(usr.tech_cooldown)
				usr<<"You must cooldown."
				return
			if(usr.doing)
				usr<<"You are already doing something."
				return
			if(usr.dead||usr.ki_lock)return
			if(!usr.pk)
				usr<<"You are not a combatant!"
				return
			if(usr.ki < 50000)
				usr<<"Your ki is too low."
				return
			var/damage=usr.ki*usr.kiuse/2
			usr.ki -= damage
			usr.frozen = 1
			usr.doing = 1
			usr.tech_cooldown=1
			view(8) << "<font color=white>[usr]:</font> SOLAR..."
			view(6) << sound('solarflare.wav')
			sleep(20)
			view(8) << "<font color=white>[usr]:</font> FLARE!"
			usr.frozen = 0
			spawn(25)if(usr)usr.doing = 0
			for(var/mob/M in view(8))
				if(M.pk && !M.dead)
					if(M != usr)
						if((M.ki/3) < damage)
							M << "[usr] has blinded you!"
							M.sight |= BLIND
							sleep(50)
							if(!M)return
							M.sight &= ~BLIND
			spawn(35)if(usr)usr.tech_cooldown=0
obj/Technique/DeathBall
	verb/Death_Ball()
		set category = "Techniques"
		if(usr.karma=="Good")
			src<<"You must be Evil to use the Spirit Bomb technique"
			return
		var/db_damage = usr.ki*0.45
		if(db_damage < 0)db_damage = 100
		for(var/turf/Floors/Safe_Zone/S in view(8))
			if(S in view(8))
				usr<<"Safe Zone!"
				return
		if(usr.dead)
			usr<<"You are dead."
			return
		if(usr.tech_cooldown)
			usr<<"You must cooldown."
			return
		if(usr.doing)
			usr<<"You are doing something."
			return
		if(usr.frozen)
			usr<<"You can't move right now."
			return
		if(usr.ki<50000)
			usr<<"Your ki is too low."
			return
		if(usr.ki_lock)
			usr<<"You can't use ki right now."
			return
		if(usr.safe)
			usr<<"You can't attack right now."
			return
		if(!usr.pk)
			usr<<"You are not a combatant!"
			return
		if(db_damage > 0)
			view(6) << sound('db_charge.wav')
			usr<<"<font size = -1><B>You begin to concentrate your energy into a Death Ball!"
			usr.ki-=db_damage
			usr.frozen = 1
			usr.doing = 1
			usr.icon_state = "spirit bomb"
			var/obj/techs/small_death_ball/O=new
			O.owner=usr
			O.power=1
			O.loc=usr.loc
			usr.charging = 1
			usr.training=1
			sleep(15)
			while(usr.charging)
				switch(alert(usr,"Continue Charging the Death Ball?","","Yes","No"))
					if("Yes")
						if(usr.dead)
							del(O)
							for(var/obj/techs/small_death_ball/O2 in world)if(O2.owner==usr)del(O2)
							usr.charging=0
							usr.frozen=0
							usr.doing=0
							usr.icon_state=""
							break
						if(usr.ki<=usr.ki_max*0.075)
							usr<<"Your ki is too low."
							for(var/obj/techs/small_death_ball/O2 in world)if(O2.owner==usr)del(O2)
							usr.charging=0
							usr.frozen=0
							usr.doing=0
							usr.icon_state=""
							break
						else
							db_damage+=usr.ki_max*0.07
							usr.ki-=usr.ki_max*0.07
							if(usr.ki<=50000)
								usr<<"Your ki is too low."
								for(var/obj/techs/small_death_ball/O2 in world)if(O2.owner==usr)del(O2)
								usr.charging=0
								usr.frozen=0
								usr.doing=0
								usr.icon_state=""
								break
							for(var/turf/T in oview(src,8))
								var/chance = rand(1,8)
								if(chance == 6)
									missile('Death Ball Energy.dmi', T, src)
									db_damage += usr.ki_max * 0.05
					else
						if(!O||!usr)return
						if(usr.dead)
							del(O)
							for(var/obj/techs/small_death_ball/O2 in world)if(O2.owner==usr)del(O2)
							usr.charging=0
							usr.frozen=0
							usr.doing=0
							usr.icon_state=""
							break
						db_damage+=O.power
						del(O)
						usr.charging=0
						usr.firing_bomb=1
						usr.training=0
						usr<<"<font size = -1><B>Your Death Ball is complete!"
						var/obj/techs/Overlays/Death_Ball_Center/S=new
						S.name="Death Ball"
						S.loc=locate(usr.x,usr.y+2,usr.z)
						S.range=0
						S.owner=usr
						S.dir=NORTH
						S.power=db_damage
						spawn(5)S.BombShot()
				if(usr.dead)
					del(O)
					for(var/obj/techs/small_death_ball/O2 in world)if(O2.owner==usr)del(O2)
					usr.charging=0
					usr.frozen=0
					usr.doing=0
					usr.icon_state=""
					break
				sleep(45)
obj/Technique/SpiritBomb
	verb/Spirit_Bomb()
		set category = "Techniques"
		if(usr.karma == "Evil")
			src<<"You must be Good to use the Spirit Bomb technique"
			return
		var/db_damage = usr.ki*0.45
		if(db_damage < 0)db_damage = 100
		for(var/turf/Floors/Safe_Zone/S in view(8))
			if(S in view(8))
				usr<<"Safe Zone!"
				return
		if(usr.dead)
			usr<<"You are dead."
			return
		if(usr.tech_cooldown)
			usr<<"You must cooldown."
			return
		if(usr.doing)
			usr<<"You are doing something."
			return
		if(usr.frozen)
			usr<<"You can't move right now."
			return
		if(usr.ki<50000)
			usr<<"Your ki is too low."
			return
		if(usr.ki_lock)
			usr<<"You can't use ki right now."
			return
		if(usr.safe)
			usr<<"You can't attack right now."
			return
		if(!usr.pk)
			usr<<"You are not a combatant!"
			return
		if(db_damage > 0)
			usr.training=1
			view(8) << sound('human_spiritbombcharge.wav')
			usr<<"<font size = -1><B>You begin to concentrate your energy into a Spirit Bomb!"
			usr.ki-=db_damage
			usr.frozen = 1
			usr.doing = 1
			usr.icon_state = "spirit bomb"
			var/obj/techs/small_spirit_bomb/O=new
			O.owner=usr
			O.power=1
			O.loc=usr.loc
			usr.charging = 1
			sleep(15)
			while(usr.charging&&usr)
				switch(alert(usr,"Continue Charging the Spirit Bomb?","","Yes","No"))
					if("Yes")
						if(!O||!usr)return
						if(usr.dead)
							del(O)
							for(var/obj/techs/small_spirit_bomb/O2 in world)if(O2.owner==usr)del(O2)
							usr.charging=0
							usr.frozen=0
							usr.doing=0
							usr.icon_state=""
							break
						if(usr.ki<=usr.ki_max*0.075)
							usr<<"Your ki is too low."
							for(var/obj/techs/small_spirit_bomb/O2 in world)if(O2.owner==usr)del(O2)
							usr.charging=0
							usr.frozen=0
							usr.doing=0
							usr.icon_state=""
							break
						else
							if(!O||!usr)return
							db_damage+=usr.ki_max*0.07
							usr.ki-=usr.ki_max*0.07
							if(usr.ki<=50000)
								usr<<"Your ki is too low."
								for(var/obj/techs/small_spirit_bomb/O2 in world)if(O2.owner==usr)del(O2)
								usr.charging=0
								usr.frozen=0
								usr.doing=0
								usr.icon_state=""
								break
							for(var/turf/T in oview(src,8))
								var/chance = rand(1,8)
								if(chance == 6)
									missile('Spirit Bomb Energy.dmi', T, src)
									db_damage += usr.ki_max * 0.05
					else
						if(!O||!usr)return
						if(usr.dead)
							del(O)
							for(var/obj/techs/small_spirit_bomb/O2 in world)if(O2.owner==usr)del(O2)
							usr.charging=0
							usr.frozen=0
							usr.doing=0
							usr.icon_state=""
							break
						db_damage+=O.power
						del(O)
						usr.charging=0
						usr.firing_bomb=1
						usr<<"<font size = -1><B>Your Spirit Bomb is complete!"
						usr.training=0
						var/obj/techs/Overlays/Spirit_Bomb_Center/S=new
						S.name="Spirit Bomb"
						S.loc=locate(usr.x,usr.y+2,usr.z)
						S.range=0
						S.owner=usr
						S.dir=NORTH
						S.power=db_damage
						spawn(5)S.BombShot()
				if(usr.dead)
					del(O)
					for(var/obj/techs/small_spirit_bomb/O2 in world)if(O2.owner==usr)del(O2)
					usr.charging=0
					usr.frozen=0
					usr.doing=0
					usr.icon_state=""
					break
				sleep(45)
obj/Technique/SuperNova
	verb/Super_Nova()
		set category = "Techniques"
		var/db_damage = usr.ki*0.45
		if(db_damage < 0)db_damage = 100
		for(var/turf/Floors/Safe_Zone/S in view(8))
			if(S in view(8))
				usr<<"Safe Zone!"
				return
		if(usr.tech_cooldown)
			usr<<"You must cooldown."
			return
		if(usr.doing)
			usr<<"You are doing something."
			return
		if(usr.frozen)
			usr<<"You can't move right now."
			return
		if(usr.ki<50000)
			usr<<"Your ki is too low."
			return
		if(usr.ki_lock)
			usr<<"You can't use ki right now."
			return
		if(usr.safe)
			usr<<"You can't attack right now."
			return
		if(!usr.pk)
			usr<<"You are not a combatant!"
			return
		if(usr.dead)
			usr<<"You are dead."
			return
		if(db_damage > 0)
			usr<<"<font size = -1><B>You begin to concentrate your energy into a Super Nova!"
			usr.ki-=db_damage
			usr.frozen = 1
			usr.doing = 1
			usr.icon_state = "spirit bomb"
			var/obj/techs/small_super_nova/O=new
			O.owner=usr
			O.power=1
			O.loc=usr.loc
			usr.charging = 1
			sleep(15)
			while(usr.charging)
				switch(alert(usr,"Continue Charging the Super Nova?","","Yes","No"))
					if("Yes")
						if(!usr||!O)return
						if(usr.dead)
							del(O)
							for(var/obj/techs/small_super_nova/O2 in world)if(O2.owner==usr)del(O2)
							usr.charging=0
							usr.frozen=0
							usr.doing=0
							usr.icon_state=""
							break
						if(usr.ki<=usr.ki_max*0.075)
							usr<<"Your ki is too low."
							for(var/obj/techs/small_super_nova/O2 in world)if(O2.owner==usr)del(O2)
							usr.charging=0
							usr.frozen=0
							usr.doing=0
							usr.icon_state=""
							break
						else
							if(!usr||!O)return
							db_damage+=usr.ki_max*0.07
							usr.ki-=usr.ki_max*0.07
							if(usr.ki<=50000)
								usr<<"Your ki is too low."
								for(var/obj/techs/small_super_nova/O2 in world)if(O2.owner==usr)del(O2)
								usr.charging=0
								usr.frozen=0
								usr.doing=0
								usr.icon_state=""
								break
							for(var/turf/T in oview(src,8))
								var/chance = rand(1,8)
								if(chance == 6)
									missile('Super Nova Energy.dmi', T, src)
									db_damage += usr.ki_max * 0.05
					else
						if(!usr||!O)return
						if(usr.dead)
							del(O)
							for(var/obj/techs/small_super_nova/O2 in world)if(O2.owner==usr)del(O2)
							usr.charging=0
							usr.frozen=0
							usr.doing=0
							usr.icon_state=""
							break
						db_damage+=O.power
						del(O)
						usr.charging=0
						usr.firing_bomb=1
						usr<<"<font size = -1><B>Your Super Nova is complete!"
						var/obj/techs/Overlays/Super_Nova_Center/S=new
						S.name="Super Nova"
						S.loc=locate(usr.x,usr.y+2,usr.z)
						S.range=0
						S.owner=usr
						S.dir=NORTH
						S.power=db_damage
						spawn(5)S.BombShot()
				if(usr.dead)
					del(O)
					for(var/obj/techs/small_super_nova/O2 in world)if(O2.owner==usr)del(O2)
					usr.charging=0
					usr.frozen=0
					usr.doing=0
					usr.icon_state=""
					break
				sleep(45)
obj/Technique/AcidBomb
	verb/Acid_Bomb()
		set category = "Techniques"
		var/db_damage = usr.ki*0.55
		if(db_damage < 0)db_damage = 100
		for(var/turf/Floors/Safe_Zone/S in view(8))
			if(S in view(8))
				usr<<"Safe Zone!"
				return
		if(usr.dead)
			usr<<"You are dead."
			return
		if(usr.tech_cooldown)
			usr<<"You must cooldown."
			return
		if(usr.doing)
			usr<<"You are doing something."
			return
		if(usr.frozen)
			usr<<"You can't move right now."
			return
		if(usr.ki<50000)
			usr<<"Your ki is too low."
			return
		if(usr.ki_lock)
			usr<<"You can't use ki right now."
			return
		if(usr.safe)
			usr<<"You can't attack right now."
			return
		if(!usr.pk)
			usr<<"You are not a combatant!"
			return
		if(db_damage > 0)
			usr<<"<font size = -1><B>You begin to concentrate your energy into an Acid Bomb!"
			usr.ki-=db_damage
			usr.frozen = 1
			usr.doing = 1
			usr.icon_state = "spirit bomb"
			var/obj/techs/small_acid_bomb/O=new
			O.owner=usr
			O.power=1
			O.loc=usr.loc
			usr.charging = 1
			sleep(15)
			while(usr.charging)
				switch(alert(usr,"Continue Charging the Acid Bomb?","","Yes","No"))
					if("Yes")
						if(usr.dead)
							del(O)
							for(var/obj/techs/small_acid_bomb/O2 in world)if(O2.owner==usr)del(O2)
							usr.charging=0
							usr.frozen=0
							usr.doing=0
							usr.icon_state=""
							break
						if(usr.ki<=usr.ki_max*0.075)
							usr<<"Your ki is too low."
							for(var/obj/techs/small_acid_bomb/O2 in world)if(O2.owner==usr)del(O2)
							usr.charging=0
							usr.frozen=0
							usr.doing=0
							usr.icon_state=""
							break
						else
							db_damage+=usr.ki_max*0.07
							usr.ki-=usr.ki_max*0.07
							if(usr.ki<=50000)
								usr<<"Your ki is too low."
								for(var/obj/techs/small_acid_bomb/O2 in world)if(O2.owner==usr)del(O2)
								usr.charging=0
								usr.frozen=0
								usr.doing=0
								usr.icon_state=""
								break
							for(var/turf/T in oview(src,8))
								var/chance = rand(1,8)
								if(chance == 6)
									missile('Acid Bomb Energy.dmi', T, src)
									db_damage += usr.ki_max * 0.05
					else
						if(!O||!usr)break
						if(usr.dead)
							del(O)
							for(var/obj/techs/small_acid_bomb/O2 in world)if(O2.owner==usr)del(O2)
							usr.charging=0
							usr.frozen=0
							usr.doing=0
							usr.icon_state=""
							break
						db_damage+=O.power
						del(O)
						usr.charging=0
						usr.firing_bomb=1
						usr<<"<font size = -1><B>Your Acid Bomb is complete!"
						var/obj/techs/Overlays/Acid_Bomb_Center/S=new
						S.name="Acid Bomb"
						S.loc=locate(usr.x,usr.y+2,usr.z)
						S.range=0
						S.owner=usr
						S.dir=NORTH
						S.power=db_damage
						spawn(5)S.BombShot()
				if(usr.dead)
					del(O)
					for(var/obj/techs/small_acid_bomb/O2 in world)if(O2.owner==usr)del(O2)
					usr.charging=0
					usr.frozen=0
					usr.doing=0
					usr.icon_state=""
					break
				sleep(45)
obj/Technique/SpiritBall
	verb/Spirit_Ball()
		set category = "Techniques"
		for(var/turf/Floors/Safe_Zone/S in view(8))
			if(S in view(8))
				usr<<"Safe Zone!"
				return
		if(usr.tech_cooldown)
			usr<<"You must cooldown."
			return
		if(usr.dead)
			usr<<"You are dead."
			return
		if(usr.doing)
			usr<<"You are doing something."
			return
		if(usr.frozen)
			usr<<"You can't move right now."
			return
		if(usr.ki<20000)
			usr<<"Your ki is too low."
			return
		if(usr.ki_lock)
			usr<<"You can't use ki right now."
			return
		if(usr.safe)
			usr<<"You can't attack right now."
			return
		if(!usr.pk)
			usr<<"You are not a combatant!"
			return
		var/db_damage=usr.ki*0.3
		if(db_damage>0)
			usr<<"<font size = -1><B>You begin to concentrate your energy into a Spirit Ball!"
			usr.ki-=usr.ki*0.3
			view(6) << sound('sbomb.wav')
			for(var/turf/T in view(usr,4))
				var/chance = roll(1,20)
				if(chance == 15)
					missile(new/obj/BluePU, T, usr)
			usr.frozen=1
			usr.doing=1
			usr.icon_state="attack"
			usr.overlays+=icon('Techs.dmi',"spiritballo")
			usr.charging = 1
			sleep(15)
			while(usr.charging)
				switch(alert(usr,"Continue charging your Spirit Ball?","","Yes","No"))
					if("Yes")
						if(usr.dead)
							usr.overlays-=icon('Techs.dmi',"spiritballo")
							usr.charging=0
							usr.frozen=0
							usr.doing=0
							usr.icon_state=""
							break
						if(usr.ki<=usr.ki_max*0.055)
							usr<<"Your ki is too low."
							usr.overlays-=icon('Techs.dmi',"spiritballo")
							usr.charging=0
							usr.frozen=0
							usr.doing=0
							usr.icon_state=""
							break
						else
							db_damage+=usr.ki_max*0.05
							usr.ki-=usr.ki_max*0.07
							if(usr.ki<=20000)
								usr<<"Your ki is too low."
								usr.overlays -= icon('Techs.dmi',"spiritballo")
								usr.charging=0
								usr.frozen=0
								usr.doing=0
								usr.icon_state=""
								break
							for(var/turf/T in oview(src,8))
								var/chance = rand(1,6)
								if(chance == 6)
									missile('Spirit Bomb Energy.dmi',T,src)
									db_damage += usr.ki_max * 0.05
					else
						if(usr.dead)
							usr.overlays-=icon('Techs.dmi',"spiritballo")
							usr.charging=0
							usr.frozen=0
							usr.doing=0
							usr.icon_state=""
							break
						usr.overlays-=icon('Techs.dmi',"spiritballo")
						usr.charging=0
						usr.firing_bomb=1
						var/obj/Tech/BeamH/S=new
						S.icon='Techs.dmi'
						S.icon_state="spiritball"
						S.name="Spirit Ball"
						S.range=0
						S.owner=usr
						S.dir=usr.dir
						S.power=db_damage
						S.loc=usr.loc
						spawn(1)S.BombShot()
				if(usr.dead)
					usr.overlays-=icon('Techs.dmi',"spiritballo")
					usr.charging=0
					usr.frozen=0
					usr.doing=0
					usr.icon_state=""
					break
				sleep(35)
obj
	proc
		BombShot()
			var/mob/OW=owner
			var/oldeye=OW.client.eye
			OW.client.perspective=EYE_PERSPECTIVE
			OW.client.eye=src
			var/maxrange=50
			if(power>=30000000)maxrange=100
			if(power>=75000000)maxrange=150
			if(power>=100000000)maxrange=200
			if(power>=130000000)maxrange=250
			if(power>=180000000)maxrange=300
			while(src)
				range+=1
				step(src,dir)
				for(var/mob/M in oview(1,src))
					if(M.safe)continue
					if(M.FuseFollower)continue
					if(M.dead)continue
					if(!OW)return
					if(M!=OW||M==OW&&range>=10)
						OW.client.perspective=EDGE_PERSPECTIVE
						OW.client.eye=oldeye
						spawn(1)del(src)
						if(M.pk)
							OW.doing=0
							OW.frozen=0
							OW.icon_state = ""
							OW.tech_cooldown=0
							var/chance1 = rand(1,100)
							var/chance2= rand(1,100)
							var/damage=(power*chance1*0.01)-(M.kidefense*chance2*0.01)
							if(damage < 0)damage = ((power*0.0001))*chance1
							if(damage < 1)damage = 1
							M.powerlevel-=damage
							M<<"<font color=red>[OW]'s [src] hits you!"
							OW<<"<font color=red>Your [src] hits [M]!"
							M<<"<font color=red>You took [damage] damage!"
							OW<<"<font color=red>You caused [damage] to [M]!"
							M.DeathCheck(OW)
							var/obj/techs/Overlays/Crater_Center/C=new
							C.loc=loc
							var/drange=1
							if(power>=10000000)drange=2
							if(power>=20000000)drange=3
							if(power>=30000000)drange=4
							if(power>=40000000)drange=5
							if(power>=50000000)drange=6
							if(power>=60000000)drange=7
							if(power>=70000000)drange=8
							for(var/mob/Y in oview(src,drange))
								if(Y!=M)
									if(Y.pk&&!Y.safe&&!Y.FuseFollower&&!Y.dead)
										if(!src)return
										var/chance3 = rand(1,100)
										var/chance4= rand(1,100)
										var/damage2=((power*chance3*0.01)-(Y.kidefense*chance4*0.01))/get_dist(src,Y)
										if(damage2 < 0)damage2 = (((power*0.0001))*chance3)/get_dist(src,Y)
										if(damage2 < 1)damage2 = 1
										Y.powerlevel-=damage2
										Y<<"<font color=red>You took [damage2] damage!"
										OW<<"<font color=red>You caused [damage2] to [Y]!"
										Y<<"<font color=red>[OW]'s [src]'s explosion damages you!"
										Y.DeathCheck(OW)
							for(var/obj/techs/Overlays/B in world)if(B.owner==OW)del(B)
						else
							OW.doing=0
							OW.frozen=0
							OW.icon_state = ""
							OW.tech_cooldown=0
							for(var/obj/techs/Overlays/B in world)if(B.owner==OW)del(B)
						break
				if(range>=maxrange)
					if(!OW)return
					OW.client.perspective=EDGE_PERSPECTIVE
					OW.client.eye=oldeye
					OW.doing=0
					OW.frozen=0
					OW.icon_state = ""
					OW.tech_cooldown=0
					if(power>=20000000)
						var/obj/techs/Overlays/Crater_Center/C=new
						C.loc=loc
					else
						if(power>=8000000)
							var/obj/techs/Overlays/Crater_Small/C=new
							C.loc=loc
					var/drange=1
					if(power>=10000000)drange=2
					if(power>=20000000)drange=3
					if(power>=30000000)drange=4
					if(power>=40000000)drange=5
					if(power>=50000000)drange=6
					if(power>=60000000)drange=7
					if(power>=70000000)drange=8
					for(var/mob/Y in oview(src,drange))
						if(Y.pk&&!Y.safe&&!Y.FuseFollower&&!Y.dead)
							var/chance1 = rand(1,100)
							var/chance2= rand(1,100)
							var/damage=((power*chance1*0.01)-(Y.kidefense*chance2*0.01))/get_dist(src,Y)
							if(damage < 0)damage = ((power*0.0001)*chance1)/get_dist(src,Y)
							if(damage < 1)damage = 1
							Y.powerlevel-=damage
							Y<<"<font color=red>[OW]'s [src]'s explosion damages you!"
							Y<<"<font color=red>You took [damage] damage!"
							OW<<"<font color=red>You caused [damage] to [Y]!"
							if(OW.kill)Y.DeathCheck(OW)
							else spawn(0)Y.KO()
					del(src)
					for(var/obj/techs/Overlays/B in world)if(B.owner==OW)del(B)
					break
				sleep(1)
mob/var/tmp/clasharrow=""
mob/var/sauzer_blade=0
mob/var/sword_power=0
mob/var/demon_sword=0
mob/var/regen=0
obj/Technique/SauzerBlade
	verb
		Sauzer_Blade()
			set category = "Techniques"
			var/ki_cost = usr.ki_max * 0.15
			usr.sword_power = usr.strength_max * 1.3
			if(usr.doing)
				src<<"You are already doing something!"
				return
			if(usr.buku)
				return
			if(usr.ki_lock)
				usr<<"Cannot use this technique at this time."
				return
			if(!usr.sauzer_blade)
				if(usr.ki < ki_cost)
					usr<<"You do not have enough Ki to sustain the Sauzer Blade."
					return
				usr<<"You wear your Sauzer Blade."
				usr.overlays += 'Sauzer Blade.dmi'
				usr.sauzer_blade = 1
				usr.strength += usr.sword_power
				spawn(1)usr.Sauzer_Cost()
			else
				usr<<"You stop using your Sauzer Blade."
				usr.overlays -= 'Sauzer Blade.dmi'
				usr.strength -= usr.sword_power
				usr.sauzer_blade = 0
				return
mob
	proc/Sauzer_Cost()
		var/ki_cost=round(ki_max * 0.07)
		if(ki_cost<=0)ki_cost=1
		if(sauzer_blade)
			if(ki>=ki_cost)
				ki-=ki_cost
				sleep(50)
				Sauzer_Cost()
			else
				src<<"You do not have enough Ki to sustain the Sauzer Blade."
				overlays-='Sauzer Blade.dmi'
				strength-=sword_power
				sauzer_blade=0
				return
obj/Technique/DemonSword
	verb
		Demon_Sword()
			set category = "Techniques"
			var/ki_cost = round(usr.ki_max * 0.15)
			if(usr.doing)
				usr<<"You are already doing something!"
				return
			if(usr.buku)
				return
			if(usr.ki_lock)
				usr<<"Cannot use this technique at this time."
				return
			if(!usr.demon_sword)
				if(usr.ki < ki_cost)
					usr<<"You do not have enough Ki to sustain the Demon Sword."
					return
				usr<<"You wear your Demon Sword."
				usr.sword_power = usr.strength_max * 1.3
				if(usr.learn_dimensionsword)
					usr.contents += new/obj/Technique/DimensionSwordAttack
				usr.overlays += 'Demon Sword.dmi'
				usr.demon_sword = 1
				usr.strength += usr.sword_power
				spawn(1)usr.DSword_Cost()
			else
				for(var/obj/Technique/DimensionSwordAttack/D in usr)del(D)
				usr<<"You stop using your Demon Sword."
				usr.overlays -= 'Demon Sword.dmi'
				usr.strength -= usr.sword_power
				usr.demon_sword = 0
				return
mob
	proc/DSword_Cost()
		var/ki_cost=round(ki_max * 0.07)
		if(ki_cost<=0)ki_cost=1
		if(demon_sword)
			if(ki>=ki_cost)
				ki-=ki_cost
				spawn(50)if(src)DSword_Cost()
			else
				for(var/obj/Technique/DimensionSwordAttack/D in src)del(D)
				src<<"You do not have enough Ki to sustain the Demon Sword."
				overlays-='Demon Sword.dmi'
				strength-=sword_power
				tech_cooldown=0
				demon_sword=0
				return
obj/Technique/KiAbsorb
	verb/Ki_Absorb()
		set category = "Combat"
		if(usr.tech_cooldown)return
		usr.tech_cooldown=1
		spawn((usr.speed/1000)+3)if(usr)usr.tech_cooldown=0
		if(usr.kiabsorb)
			if(usr.buku || usr.boxing || usr.dualtrain || usr.rest)
				usr<<"You're already doing something!"
				return
			usr<<"You stop absorbing ki."
			usr.kiabsorb=0
			usr.doing=0
			usr.frozen=0
			usr.icon_state=""
			return
		else
			if(usr.buku || usr.boxing || usr.dualtrain || usr.rest || usr.doing)
				usr<<"You're already doing something!"
				return
			usr<<"You start absorbing ki."
			usr.kiabsorb=1
			usr.doing=1
			usr.frozen=1
			usr.icon_state="attack"
			return
obj
	Technique
		Kamehameha
			canfuse=1
			verb
				TestThis()
					set category = "Techniques"
					set name = "Kamehameha Wave"
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.using=1
					usr.doing=1
					usr.frozen=1
					if((usr.ki*usr.ki)+src.setpower>=100000000)
						src.setpower+=(usr.level*0.1+(usr.ki_skill/4))
						if(usr.race=="Saiyan"&&usr.form_5&&usr.rage_chromosome)
							usr.overlays+='Charge Red.dmi'
						else
							usr.overlays+='Charge Blue.dmi'
					else
						usr.overlays+='Charge Blue.dmi'
					var/chargedelay=round(usr.ki_skill/6000/4)
					if(chargedelay>4)
						chargedelay=4
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: KA..."
					sleep(5-chargedelay)
					view(8)<<"\white [usr]: ME..."
					sleep(5-chargedelay)
					view(8)<<"\white [usr]: HA..."
					sleep(5-chargedelay)
					view(8)<<"\white [usr]: ME..."
					sleep(5-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.icon_state="ki3"
					usr.overlays-='Charge Blue.dmi'
					usr.overlays-='Charge Red.dmi'
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(40)if(usr)
						usr.tech_cooldown=0
						usr.using=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.4+(usr.ki_skill/1.5))*(usr.kiuse/100)
					if((usr.ki*usr.ki)+src.setpower>=100000000)
						if(usr.race=="Saiyan"&&usr.form_5&&usr.rage_chromosome)
							src.setpower+=(usr.level*0.1+(usr.ki_skill/10))
							A.TechAttackBeam(usr,"Kamehameha",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"kamehameha10","kamehameha10t",0)
						else
							A.TechAttackBeam(usr,"Kamehameha",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"kamehameha","kamehamehat",0)
					else
						A.TechAttackBeam(usr,"Kamehameha",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"kamehameha","kamehamehat",0)
obj/Technique/Regenerate
	verb/Regenerate()
		set category = "Techniques"
		if(usr.race=="Majin")
			if(usr.dead)
				usr<<"Your body was completely destroyed. You cannot regenerate it!"
				return
			if(usr.regen_delay)return
			usr.regen_delay = 1
			if(usr.regen_dead)
				spawn(1)usr.Regenerate()
				usr.overlays -= 'Halo.dmi'
			else
				usr<<"You are not dead, there is no reason to regenerate!"
				spawn(25)if(usr)usr.regen_delay=0
		if(usr.race=="Namekian"||usr.race=="Bio-Android")
			if(usr.regen_delay)
				return
			usr.regen_delay = 1
			if(usr.regen)
				usr<<"You stop Regenerating."
				usr.regen = 0
				spawn(25)if(usr)usr.regen_delay=0
			else
				if(!usr.regen)
					usr<<"You allow your body to Regenerate."
					usr.regen = 1
					spawn(25)if(usr)usr.regen_delay=0
					spawn(1)usr.Regenerate()
mob
	var
		tmp/kiabsorb=0
	proc
		BindTimer(var/mob/M,var/T,var/D)
			sleep(T)
			if(!binded)return
			flick("enrage",src)
			overlays-=icon('Techs.dmi',"galaticdonut")
			overlays-=icon('Techs.dmi',"demonshackle")
			overlays-=icon('Techs.dmi',"imprisonmentball")
			binded=0
			doing=0
			frozen=0
			boxing=0
			dualtrain=0
			view(8)<<"\white [src] has broken free!"
			if(D>=0)
				if(!M)return
				if(dead)return
				powerlevel-=D
				if(M.kill)DeathCheck(M)
				else spawn(0)src.KO()
			return
		Regenerate()
			if(race=="Namekian"||race=="Bio-Android")
				sleep(20)
				if(!regen)return
				else
					if(powerlevel>=powerlevel_max)
						powerlevel=powerlevel_max
						src<<"Your body is fully regenerated."
						regen=0
					else
						if(!regen)return
						powerlevel+=powerlevel_max*0.03
						spawn(5)Regenerate()
			else
				if(race=="Majin")
					if(dead)
						it_lock=0
						ki_lock=0
						buku_lock=0
						attack_lock=0
						regen_delay=0
						ki=ki_max
						doing=0
						frozen=0
						icon_state=""
						density=1
						buku=0
						regen_dead=0
					if(!regen_dead)
						src<<"There is no need to regenerate."
						return
					sleep(10)
					if(powerlevel>=powerlevel_max)
						src<<"Your body is fully regenerated."
						powerlevel=powerlevel_max
						regen_delay=0
						ki=ki_max
						doing=0
						frozen=0
						icon_state=""
						density=1
						buku=0
						regen_dead=0
						add_exp=0
						spawn(300)if(src)add_exp=level
						it_lock = 0
						ki_lock = 0
						buku_lock = 0
						attack_lock = 0
					else
						powerlevel+=powerlevel_max*0.15
						density=1
						frozen=1
						doing=1
						icon_state="Regenerate"
						spawn(5)Regenerate()
		RegenerateAndro()
			set background=1
			spawn while(1)
				if(ki<ki_max)
					ki+=ki_max*0.03
					if(ki>ki_max)ki=ki_max
				sleep(30)
obj
	Technique
		BlowUp
			verb
				Blow_Up()
					set category = "Techniques"
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<50000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(usr.jailed)
						usr<<"You're in jail!"
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					if(usr.race=="Saibaman")
						usr.icon_state = "enrage"
						usr.frozen = 1
						usr.doing=1
						sleep(30)
						new/obj/techs/Overlays/Crater_Center(usr.loc)
						sleep(10)
						for(var/obj/Earth_Dragonballs/O in usr)O.loc = usr.loc
						for(var/obj/Namek_Dragonballs/O in usr)O.loc = usr.loc
						for(var/obj/Black_Dragonballs/O in usr)O.loc = usr.loc
						usr.e_db_1 = 0
						usr.e_db_2 = 0
						usr.e_db_3 = 0
						usr.e_db_4 = 0
						usr.e_db_5 = 0
						usr.e_db_6 = 0
						usr.e_db_7 = 0
						usr.n_db_1 = 0
						usr.n_db_2 = 0
						usr.n_db_3 = 0
						usr.n_db_4 = 0
						usr.n_db_5 = 0
						usr.n_db_6 = 0
						usr.n_db_7 = 0
						usr.b_db_1 = 0
						usr.b_db_2 = 0
						usr.b_db_3 = 0
						usr.b_db_4 = 0
						usr.b_db_5 = 0
						usr.b_db_6 = 0
						usr.b_db_7 = 0
						usr.wait_room=0
						for(var/mob/M in oview(8,usr))
							var/damage = usr.ki*5
							if(!M.dead&&!M.safe&&M.pk)
								var/chance3 = rand(1,100)
								var/chance4= rand(1,100)
								var/damage2=((damage*chance3*0.01)-(M.kidefense*chance4*0.01))/get_dist(src,M)
								if(damage2 < 0)damage2 = (((power*0.0001))*chance3)/get_dist(src,M)
								if(damage2 < 1)damage2 = 1
								M.powerlevel-=damage2
								M.DeathCheck(usr)
								if(M.damage_enabled)M << "<font color=red>You took [damage2] damage!"
								if(usr.damage_enabled)usr<<"<font color=red>You caused [damage2] to [M]!"
						usr.powerlevel_max -= usr.powerlevel_max * 0.05
						usr.powerlevel=0
						usr.DeathCheck(usr)
						return
		GiganticMeteor
			verb
				Gigantic_Meteor()
					set category = "Techniques"
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<50000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						usr<<"You can't use ki right now."
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.safe)
						usr<<"You can't attack right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.overlays+='Gigantic Meteor.dmi'
					usr.frozen = 1
					usr.doing=1
					view(6)<<"[usr]: Gigantic METEOR..."
					sleep(20)
					view(6)<<"[usr]: HAAAAH! DIEEE!"
					usr.overlays-='Gigantic Meteor.dmi'
					sleep(5)
					new/obj/techs/Overlays/Crater_Center(usr.loc)
					for(var/mob/M in oview(8,usr))
						var/damage = usr.ki*2
						if(!M.dead&&!M.safe&&M.pk)
							var/chance3 = rand(1,100)
							var/chance4= rand(1,100)
							var/damage2=((damage*chance3*0.01)-(M.kidefense*chance4*0.01))/get_dist(src,M)
							if(damage2 < 0)damage2 = (((power*0.0001))*chance3)/get_dist(src,M)
							if(damage2 < 1)damage2 = 1
							if(M.damage_enabled)M << "<font color=red>You took [damage2] damage!"
							if(usr.damage_enabled)usr<<"<font color=red>You caused [damage2] to [M]!"
							M.powerlevel-=damage2
							M.DeathCheck(usr)
					usr.ki=0
					usr.frozen=0
					usr.doing=0
					return

		BurningAtack
			canfuse=1
			verb
				Burning_Atack()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Yellow.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: Burning..."
					view(6) << sound('burning.wav')
					for(var/turf/T in view(src,4))
						var/chance = roll(1,20)
						if(chance == 15)
							missile(new/obj/YellowPU, T, src)
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: Atack..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Yellow.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Burning Atack",usr.ki*usr.kiuse+src.setpower,'BurningAttack.dmi',"ba","yellow",0)
		CanonBlast
			canfuse=1
			verb
				Canon_Blast()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge blue.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: Canon..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: Blast..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge blue.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Canon Blast",usr.ki*usr.kiuse+src.setpower,'final canon.dmi',"ca","trail",0)
		DragonFire
			canfuse=1
			verb
				Dragon_Fire()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Yellow.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: Dragon..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: Fire..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: Atack!"
					usr.overlays-='Charge Yellow.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Dragon Fire",usr.ki*usr.kiuse+src.setpower,'hell blast.dmi',"db","trailer",0)
		UltraGalickGun
			canfuse=1
			verb
				Super_Galick_Gun()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Yellow.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: Super..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: Galick..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: Gun!"
					usr.overlays-='Charge Yellow.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Ultra Galick Gun",usr.ki*usr.kiuse+src.setpower,'Galick.dmi',"sgalicka","sgalickb",0)
		SuperGalickGun
			canfuse=1
			verb
				Super_Galick_Gun()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Yellow.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: Super..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: Galick..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: Gun!"
					usr.overlays-='Charge Yellow.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Super Galick Gun",usr.ki*usr.kiuse+src.setpower,'Galick.dmi',"galicka","galickb",0)
		WolfFist
			canfuse=1
			verb
				Wolf_Fist()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Yellow.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: Wolf..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: Fist..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: Fire!"
					usr.overlays-='Charge Yellow.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Wolf Fist",usr.ki*usr.kiuse+src.setpower,'dragons.dmi',"da","white",0)
		KiCanon
			canfuse=1
			verb
				Ki_Canon()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Yellow.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: Ki..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: Canon..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: Fire!"
					usr.overlays-='Charge Yellow.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Ki Canon",usr.ki*usr.kiuse+src.setpower,'ki canon.dmi',"ki","trailer",0)
		FireBlast
			canfuse=1
			verb
				Fire_Blast()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Fire..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Blast..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack!"
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Fire Blast",usr.ki*usr.kiuse+src.setpower,'fireblast.dmi',"fb","",0)
		FlameTornado
			canfuse=1
			verb
				Flame_Tornado()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Flame..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Tornado..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack!"
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Flame Tornado",usr.ki*usr.kiuse+src.setpower,'FlameTornado.dmi',"ft","",0)
		RedBall
			canfuse=1
			verb
				Red_Ball()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Red..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Ball..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack!"
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Red Ball",usr.ki*usr.kiuse+src.setpower,'red ball.dmi',"RedBall","",0)
		HellImpact
			canfuse=1
			verb
				Hell_Impact()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Hell..."
					view(6) << sound('sbomb.wav')
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Impact..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack!"
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Hell Impact",usr.ki*usr.kiuse+src.setpower,'hi.dmi',"RedBall","",0)
		HorridianBall
			canfuse=1
			verb
				Horridian_Ball()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Horridian..."
					view(6) << sound('sbomb.wav')
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Ball..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack!"
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Horridian Ball",usr.ki*usr.kiuse+src.setpower,'Horridian Ball.dmi',"hi","",0)
		HellFire
			canfuse=1
			verb
				Hell_Fire()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Hell..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Fire..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack!"
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Hell Fire",usr.ki*usr.kiuse+src.setpower,'LA3.dmi',"hf","",0)
		NeoBall
			canfuse=1
			verb
				Neo_Ball()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Neo..."
					view(6) << sound('sbomb.wav')
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Ball..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Neo Ball",usr.ki*usr.kiuse+src.setpower,'LA7.dmi',"neo ball","",0)
		SuperTriBall
			canfuse=1
			verb
				Super_Tri_Ball()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Super..."
					view(6) << sound('sbomb.wav')
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Tri..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Ball..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Super	Tri Ball",usr.ki*usr.kiuse+src.setpower,'LB3.dmi',"3","",0)
		XBall
			canfuse=1
			verb
				XBall()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: X..."
					view(6) << sound('sbomb.wav')
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Ball..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"X Ball",usr.ki*usr.kiuse+src.setpower,'LB4.dmi',"xbal","",0)
		SunBlast
			canfuse=1
			verb
				Sun_Blast()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Sun..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Blast..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Sun Blast",usr.ki*usr.kiuse+src.setpower,'LB1.dmi',"sun","",0)
		BlackHole
			canfuse=1
			verb
				Black_Hole()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Black..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Hole..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Black Hole",usr.ki*usr.kiuse+src.setpower,'LB5.dmi',"black","",0)
		DragonHole
			canfuse=1
			verb
				Dragon_Hole()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Dragon..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Hole..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Dragon Hole",usr.ki*usr.kiuse+src.setpower,'LB7.dmi',"1","",0)
		UltimateBlast
			canfuse=1
			verb
				Ultimate_Blast()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Ultimate..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Blast..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Ultimate Blast",usr.ki*usr.kiuse+src.setpower,'ultimate blast.dmi',"1","trail",0)
		FinalBuster
			canfuse=1
			verb
				Final_Buster()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6800/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Final..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Buster..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Final Buster",usr.ki*usr.kiuse+src.setpower,'FinalBuster.dmi',"fb","trail",0)
		FireWolf
			canfuse=1
			verb
				Fire_Wolf()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Fire..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Wolf..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Fire Wolf",usr.ki*usr.kiuse+src.setpower,'LB8.dmi',"fw","",0)
		PlanetBlast
			canfuse=1
			verb
				Planet_Blast()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Planet..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Blast..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Planet Blast",usr.ki*usr.kiuse+src.setpower,'LA8.dmi',"fb","",0)
		Boomerang
			canfuse=1
			verb
				Boomerang()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Boome..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Rang..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Boomerang",usr.ki*usr.kiuse+src.setpower,'LG6.dmi',"1","",0)
		IceSlayer
			canfuse=1
			verb
				Ice_Slayer()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Ice..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Slayer..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Ice Slayer",usr.ki*usr.kiuse+src.setpower,'LG8.dmi',"1","",0)
		PlasmaBall
			canfuse=1
			verb
				Plasma_Ball()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/16000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Plasma..."
					view(6) << sound('sbomb.wav')
					sleep(12-chargedelay)
					view(8)<<"\red [usr]: Ball..."
					sleep(12-chargedelay)
					view(8)<<"\red [usr]: Atack..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Plasma Ball",usr.ki*usr.kiuse+src.setpower,'EL.dmi',"el","",0)

		StarBall
			canfuse=1
			verb
				Star_Ball()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<7000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/16000/2)
					if(chargedelay>9)
						chargedelay=9
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Star..."
					view(6) << sound('sbomb.wav')
					sleep(12-chargedelay)
					view(8)<<"\red [usr]: Ball..."
					sleep(12-chargedelay)
					view(8)<<"\red [usr]: Atack..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Star Ball",usr.ki*usr.kiuse+src.setpower,'ID Techs.dmi',"6","",0)

		StarSlayer
			canfuse=1
			verb
				Star_Slayer()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<9000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/16000/2)
					if(chargedelay>9)
						chargedelay=9
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Star..."
					sleep(12-chargedelay)
					view(8)<<"\red [usr]: Slayer..."
					sleep(12-chargedelay)
					view(8)<<"\red [usr]: Fire..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.02+(usr.ki_skill/1.8))*(usr.kiuse/75)
					A.TechAttackBeam(usr,"Star Slayer",usr.ki*usr.kiuse+src.setpower,'ID Techs.dmi',"10","",0)

		WindBlast
			canfuse=1
			verb
				Wind_Blast()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<9000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/19000/2)
					if(chargedelay>6)
						chargedelay=6
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Wind..."
					sleep(12-chargedelay)
					view(8)<<"\red [usr]: Blast..."
					sleep(12-chargedelay)
					view(8)<<"\red [usr]: Atack..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.04+(usr.ki_skill/1.4))*(usr.kiuse/75)
					A.TechAttackBeam(usr,"Wind Blast",usr.ki*usr.kiuse+src.setpower,'ID Techs.dmi',"5","",0)


		LavaBlast
			canfuse=1
			verb
				Lava_Blast()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<9000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/19000/2)
					if(chargedelay>6)
						chargedelay=6
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Lava..."
					sleep(12-chargedelay)
					view(8)<<"\red [usr]: Blast..."
					sleep(12-chargedelay)
					view(8)<<"\red [usr]: Atack..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.04+(usr.ki_skill/1.4))*(usr.kiuse/75)
					A.TechAttackBeam(usr,"Lava Blast",usr.ki*usr.kiuse+src.setpower,'ID Techs.dmi',"3","",0)

		SunBall
			canfuse=1
			verb
				Sun_Ball()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Sun..."
					view(6) << sound('sbomb.wav')
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Ball..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Sun Ball",usr.ki*usr.kiuse+src.setpower,'SunBall.dmi',"1","",0)
		SuperBeamRay
			canfuse=1
			verb
				Super_Beam_Ray()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Super..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Beam..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Super Beam Ray",usr.ki*usr.kiuse+src.setpower,'Super beam ray.dmi',"1","",0)
		StarBeam
			canfuse=1
			verb
				Star_Beam()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Star..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Beam..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Star Beam",usr.ki*usr.kiuse+src.setpower,'star.dmi',"1","",0)
		MysticoBomb
			canfuse=1
			verb
				Mystico_Bomb()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Mystico..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Bomb..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Mystico Bomb",usr.ki*usr.kiuse+src.setpower,'mystico bomb.dmi',"1","",0)
		LaserBlast
			canfuse=1
			verb
				Laser_Blast()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Laser..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Blast..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Laser Blast",usr.ki*usr.kiuse+src.setpower,'LG5.dmi',"1","",0)
		UltimateKameBall
			canfuse=1
			verb
				UltimateKameBall()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Ultimate..."
					view(6) << sound('sbomb.wav')
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Kame..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Ball..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Ultimate Kame Ball",usr.ki*usr.kiuse+src.setpower,'LG4.dmi',"1","",0)
		NukeBall
			canfuse=1
			verb
				Nuke_Ball()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Nuke..."
					view(6) << sound('sbomb.wav')
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Ball..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Nuke Ball",usr.ki*usr.kiuse+src.setpower,'LG1.dmi',"n","",0)
		StarBlast
			canfuse=1
			verb
				Star_Blast()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Star..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Blast..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Star Blast",usr.ki*usr.kiuse+src.setpower,'LB2.dmi',"as","",0)
		FireBird
			canfuse=1
			verb
				Fire_Bird()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Fire..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Bird..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Fire Bird",usr.ki*usr.kiuse+src.setpower,'LA8.dmi',"fb","",0)
		BuuSpike
			canfuse=1
			verb
				Buu_Spike()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Spike..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Buu Spike",usr.ki*usr.kiuse+src.setpower,'LA6.dmi',"buu spike","",0)
		FireSlayer
			canfuse=1
			verb
				Fire_Slayer()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Fire..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Slayer..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Fire Slayer",usr.ki*usr.kiuse+src.setpower,'LA5.dmi',"rapidfire","",0)
		SpikeAtack
			canfuse=1
			verb
				Spike_Atack()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Spike..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack..."
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Spike Atack",usr.ki*usr.kiuse+src.setpower,'LA4.dmi',"sd","",0)
		RainBall
			canfuse=1
			verb
				Rain_Ball()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Rain..."
					view(6) << sound('sbomb.wav')
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Ball..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack!"
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Rain Ball",usr.ki*usr.kiuse+src.setpower,'rainball.dmi',"rainball","",0)
		UltraFireBall
			canfuse=1
			verb
				Ultra_Fire_Ball()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Ultra..."
					view(6) << sound('sbomb.wav')
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Fire..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Ball!"
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Ultra Fire Ball",usr.ki*usr.kiuse+src.setpower,'UltraFireBall.dmi',"1s","",0)


		DarkArc
			canfuse=1
			verb
				Dark_Arc()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Dark..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Arc..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Fire!"
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Dark Arc",usr.ki*usr.kiuse+src.setpower,'dark arc.dmi',"da","",0)
		JusticeBall
			canfuse=1
			verb
				Justice_Ball()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Justice..."
					view(6) << sound('sbomb.wav')
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Ball..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Fire!"
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Justice Ball",usr.ki*usr.kiuse+src.setpower,'Justice Ball.dmi',"jb","",0)

		WaterSlayer
			canfuse=1
			verb
				Water_Slayer()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<7000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/7000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Water..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Slayer..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Attack!"
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.04+(usr.ki_skill/1.3))*(usr.kiuse/66)
					A.TechAttackBeam(usr,"Water Slayer",usr.ki*usr.kiuse+src.setpower,'ID Techs.dmi',"8","",0)
		FinalBuu
			canfuse=1
			verb
				Final_Buu()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<8900)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/8900/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Final..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Buu..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Attack!"
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.04+(usr.ki_skill/1.6))*(usr.kiuse/88)
					A.TechAttackBeam(usr,"Final Buu",usr.ki*usr.kiuse+src.setpower,'ID Techs.dmi',"9","",0)
		FlamePower
			canfuse=1
			verb
				Flame_Power()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Flame..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Power..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Fire!"
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Flame Power",usr.ki*usr.kiuse+src.setpower,'ID Techs.dmi',"4","",0)
		WindSlayer
			canfuse=1
			verb
				Wind_Slayer()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<9000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/5500/2)
					if(chargedelay>10)
						chargedelay=10
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Wind..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Slayer..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Fire!"
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.04+(usr.ki_skill/1.6))*(usr.kiuse/71)
					A.TechAttackBeam(usr,"Wind Slayer",usr.ki*usr.kiuse+src.setpower,'ID Techs.dmi',"7","",0)
		NuclearBlast
			canfuse=1
			verb
				Nuclear_Blast()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Nuclear..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Blast..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack!"
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Nuclear Blast",usr.ki*usr.kiuse+src.setpower,'ID Techs.dmi',"2","",0)
		WaterBall
			canfuse=1
			verb
				Water_Ball()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Water..."
					view(6) << sound('sbomb.wav')
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Ball..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack!"
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Water Ball",usr.ki*usr.kiuse+src.setpower,'waterball.dmi',"wb","",0)
		IceBall
			canfuse=1
			verb
				Ice_Ball()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Ice..."
					view(6) << sound('sbomb.wav')
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Ball..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack!"
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Ice Ball",usr.ki*usr.kiuse+src.setpower,'FPEB.dmi',"ice ball","",0)
		GalacticBuster
			canfuse=1
			verb
				Galactic_Buster()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Galactic..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Buster..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack!"
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Galactic Blast",usr.ki*usr.kiuse+src.setpower,'Galactic Buster.dmi',"gb","",0)
		IceBlast
			canfuse=1
			verb
				Ice_Blast()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Ice..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Blast..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack!"
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Ice Blast",usr.ki*usr.kiuse+src.setpower,'FPEW.dmi',"ibb","",0)
		FireBall
			canfuse=1
			verb
				Fire_Ball()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Fire..."
					view(6) << sound('sbomb.wav')
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Ball..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Attack!"
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Fire Ball",usr.ki*usr.kiuse+src.setpower,'fire ball.dmi',"fb","",0)
		FinishBall
			canfuse=1
			verb
				Finish_Ball()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Finish..."
					view(6) << sound('sbomb.wav')
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Ball..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Fire!"
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Finish Ball",usr.ki*usr.kiuse+src.setpower,'finish ball.dmi',"fb","",0)
		ElectricBall
			canfuse=1
			verb
				Electric_Ball()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Electric..."
					view(6) << sound('sbomb.wav')
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Ball..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack!"
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Electric Ball",usr.ki*usr.kiuse+src.setpower,'Electric Ball.dmi',"ab","",0)
		DarkBall
			canfuse=1
			verb
				Dark_Ball()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Dark..."
					view(6) << sound('sbomb.wav')
					sleep(9-chargedelay)
					view(8)<<"\red [usr]: Ball..."
					sleep(9-chargedelay)
					view(8)<<"\red [usr]: Atack!"
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Dark Ball",usr.ki*usr.kiuse+src.setpower,'Final.dmi',"ad","",0)
		ApocalypseBall
			canfuse=1
			verb
				Apocalypse_Ball()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge blue.dmi'
					var/chargedelay=round(usr.ki_skill/9000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\blue [usr]: Apocalypse..."
					view(6) << sound('sbomb.wav')
					sleep(11-chargedelay)
					view(8)<<"\blue [usr]: Ball..."
					sleep(11-chargedelay)
					view(8)<<"\blue [usr]: Atack!"
					usr.overlays-='Charge blue.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Apocalypse Ball",usr.ki*usr.kiuse+src.setpower,'final bomb.dmi',"ab","",0)
		EnergyBall
			canfuse=1
			verb
				Energy_Ball()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='energy bomb charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Energy..."
					view(6) << sound('sbomb.wav')
					sleep(15-chargedelay)
					view(8)<<"\red [usr]: Ball.."
					sleep(15-chargedelay)
					view(8)<<"\red [usr]: Atack!"
					usr.overlays-='energy bomb charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Energy Ball",usr.ki*usr.kiuse+src.setpower,'EnergyBallBlast.dmi',"eb","",0)
		EonAtack
			canfuse=1
			verb
				Eon_Atack()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='energy bomb charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Eon..."
					view(6) << sound('sbomb.wav')
					sleep(15-chargedelay)
					view(8)<<"\red [usr]: Ball.."
					sleep(15-chargedelay)
					view(8)<<"\red [usr]: Atack!"
					usr.overlays-='energy bomb charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Eon Atack",usr.ki*usr.kiuse+src.setpower,'eon atack.dmi',"ea","green",0)
		BraveCanon
			canfuse=1
			verb
				Brave_Canon()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='energy bomb charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Brave..."
					sleep(15-chargedelay)
					view(8)<<"\red [usr]: Canon.."
					sleep(15-chargedelay)
					view(8)<<"\red [usr]: Atack!"
					usr.overlays-='energy bomb charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Brave Canon",usr.ki*usr.kiuse+src.setpower,'FinalFS.dmi',"ffa","ffb",0)
		DestroyerKamehameha
			canfuse=1
			verb
				Destroyer_Kamehameha()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='energy bomb charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Destroyeer..."
					sleep(15-chargedelay)
					view(8)<<"\red [usr]: Kame.."
					sleep(15-chargedelay)
					view(8)<<"\red [usr]: Hamee.."
					sleep(15-chargedelay)
					view(8)<<"\red [usr]: Ha!"
					usr.overlays-='energy bomb charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Destroyer Kamehameha",usr.ki*usr.kiuse+src.setpower,'FinalKamehameha.dmi',"destroyerkame","trail",0)
		DeathCanon
			canfuse=1
			verb
				Death_Canon()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='energy bomb charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Death..."
					sleep(15-chargedelay)
					view(8)<<"\red [usr]: Canon.."
					sleep(15-chargedelay)
					view(8)<<"\red [usr]: Atack!"
					usr.overlays-='energy bomb charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Death Canon",usr.ki*usr.kiuse+src.setpower,'FinalFS.dmi',"fsa","fsb",0)
		EnergyBomb
			canfuse=1
			verb
				Energy_bomb()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='charge red.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Energy..."
					sleep(15-chargedelay)
					view(8)<<"\red [usr]: Bomb.."
					sleep(15-chargedelay)
					view(8)<<"\red [usr]: Atack!"
					usr.overlays-='charge red.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Energy Bomb",usr.ki*usr.kiuse+src.setpower,'energy bomb.dmi',"eb","",0)
		DestructiveWave
			canfuse=1
			verb
				Destructive_Wave()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Destructive..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Wave..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: HA!"
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Destructive Wave",usr.ki*usr.kiuse+src.setpower,'DestructiveWave.dmi',"dw","red",0)
		KillDriver
			canfuse=1
			verb
				Kill_Driver()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Kill..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Driver..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: HA!"
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Kill Driver",usr.ki*usr.kiuse+src.setpower,'Kill Driver.dmi',"kd","",0)


		KiCatalyst
			canfuse=1
			verb
				Ki_Catalyst()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Destructive Wave Charge.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\red [usr]: Ki..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Catalyst..."
					sleep(10-chargedelay)
					view(8)<<"\red [usr]: Atack!"
					usr.overlays-='Destructive Wave Charge.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
					usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Ki Katalyst",usr.ki*usr.kiuse+src.setpower,'Ki Katalyst.dmi',"kk","",0)
		UltimateDisk
			verb
				Ultimate_Disk()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.overlays+=icon('ultimate disk.dmi',"1")
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>4)
						chargedelay=4
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: Ultimate..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: DISK..."
					sleep(17-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-=icon('ultimate disk.dmi',"1")
					usr.frozen=1
					spawn(5)
						usr.frozen=0
						usr.doing=0
					spawn(60)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.23+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackHoming(usr,"Ultimate Disk",usr.ki*(1+usr.kiuse/3)+src.setpower,'ultimate disk.dmi',"1","")

		IceKame
			canfuse=1
			verb
				IceKame()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Blue.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: Ice Kameh..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: Hamee..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.icon_state="ki3"
					usr.frozen=1
					usr.overlays-='Charge Blue.dmi'
					usr.tech_cooldown=1
					spawn(40)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.4+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Ice Kame",usr.ki*usr.kiuse+src.setpower,'BlastHead.dmi',"blast","trail",0)

		TenTimesKame
			canfuse=1
			verb
				TenTimesKame()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Red.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: Ten Times Kameh..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: Hamee..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.icon_state="ki3"
					usr.frozen=1
					usr.overlays-='Charge Red.dmi'
					usr.tech_cooldown=1
					spawn(40)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.4+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Ten Times KameHameha",usr.ki*usr.kiuse+src.setpower,'10xkame.dmi',"10x","trail",0)

		BardockKame
			canfuse=1
			verb
				Bardock_Kame()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge Black.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: Kame..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: Hame..."
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Black.dmi'
					usr.icon_state="ki3"
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(45)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.03+(usr.ki_skill/1.5))*(usr.kiuse/70)
					A.TechAttackBeam(usr,"Bardock Kame",usr.ki*usr.kiuse+src.setpower,'bardock kame.dmi',"bardockkame","trail",0)

		SuperBardockKame
			verb
				Super_Bardock_Kame()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					usr.overlays+='Charge bun.dmi'
					var/chargedelay=round(usr.ki_skill/6100/2)
					if(chargedelay>8)
						chargedelay=8
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: Super Kame..."
					usr.icon_state="ff1"
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: Hamee..."
					usr.icon_state="ff2"
					sleep(10-chargedelay)
					view(8)<<"\white [usr]: HA!"
					usr.icon_state="ff3"
					usr.overlays-='Charge bun.dmi'
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(50)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.43+(usr.ki_skill/1.5))*(usr.kiuse/100)
					A.TechAttackBeam(usr,"Super Bardock Kame",usr.ki*usr.kiuse+src.setpower,'bbkbeam.dmi',"sbk","trail",0)

		DimensionShatter
			verb
				DimensionShatter()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.overlays+='Charge Black.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>4)
						chargedelay=4
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: Dimension..."
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: Shatter..."
					sleep(17-chargedelay)
					view(8)<<"\white [usr]: Attack!"
					usr.overlays-='Charge Black.dmi'
					usr.frozen=1
					spawn(10)
						usr.frozen=0
						usr.doing=0
					spawn(45)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.1+(usr.ki_skill/4))*(usr.kiuse/100)
					A.TechAttackHoming(usr,"Dimension Shatter",usr.ki*(1+usr.kiuse/3)+src.setpower,'Dimension Shatter.dmi',0)

		SuperCrusherBall
			verb
				Super_Crusher_Ball()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 75 to be able to use battle techniques."
						return
					usr.doing=1
					usr.overlays+='Charge Black.dmi'
					var/chargedelay=round(usr.ki_skill/6000/2)
					if(chargedelay>4)
						chargedelay=4
					if(chargedelay<0)
						chargedelay=0
					view(8)<<"\white [usr]: Super..."
					for(var/turf/T in view(src,4))
						var/chance = roll(1,20)
						if(chance == 15)
							missile(new/obj/GreenPU, T, src)
					sleep(15-chargedelay)
					view(8)<<"\white [usr]: Crusher Ball..."
					view(6) << sound('sbomb.wav')
					sleep(17-chargedelay)
					view(8)<<"\white [usr]: Attack!"
					usr.overlays-='Charge Black.dmi'
					usr.frozen=1
					spawn(10)
						usr.frozen=0
						usr.doing=0
					spawn(45)
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.level*0.1+(usr.ki_skill/4))*(usr.kiuse/100)
					A.TechAttackHoming(usr,"Super Crusher Ball",usr.ki*(1+usr.kiuse/3)+src.setpower,'SuperCrusherBall.dmi',"",0)

