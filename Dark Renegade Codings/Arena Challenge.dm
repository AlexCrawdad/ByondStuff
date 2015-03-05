mob/PC/verb/Watch_Arena()
	set category="Channels"
	set name="Arena TV"
	if(!tourny_watch)
		ceye=client.eye
		client.perspective=EYE_PERSPECTIVE
		client.eye=locate(217,385,6)
		tourny_watch=1
		return
	else
		client.eye=ceye
		client.perspective=EDGE_PERSPECTIVE
		tourny_watch=0
		return
mob
	proc
		ARENARESET()
			if(arena_on&&challenge)
				challenge=0
				challenge_on=0
				challenger=0
				arena_on=0
var/arena_on=0
mob/var/arenatxt=1
mob/PC/verb/Arena_Challenge()
	set category = "Channels"
	var/list/Rivals=new/list()
	for(var/mob/PC/N in world)
		if(N==usr)continue
		if(N.dead)continue
		if(N.z==6)continue
		if(N.grav)continue
		if(N.FuseFollower)continue
		if(!N.challenge_on)continue
		if(!N.pk)continue
		if(N.fused)continue
		Rivals.Add(N)
	Rivals.Add("Cancel")
	var/mob/M=input("Challenge who?")in null|Rivals
	if(arena_on)
		usr<<"The arena is currently being used."
		return
	if(M=="Cancel"||!M)return
	if(fused)
		usr<<"You cannot arena battle in the fused state!"
		return
	for(var/obj/O in M)
		if(O.dball)
			usr<<"[M] cannot arena right now!"
			return
	for(var/obj/O in usr)
		if(O.dball)
			usr<<"You cannot arena challenge with the dragonballs!"
			return
	if(guild_challenge||M.guild_challenge||babatourny||M.babatourny||grav>0||M.grav>0||M.FuseFollower||FuseFollower||M.in_hbtc||M.tourny||in_hbtc||tourny||M.in_war||in_war)return
	if(M==usr)
		usr<<"You cannot challenge yourself."
		return
	if(dead)
		usr<<"You are dead."
		return
	if(!M.challenge_on)
		usr<<"[M] does not want to be challenged."
		return
	if(M.z!=4&&M.z!=3&&M.z!=2&&M.z!=1)
		usr<<"[M] isn't in right place!"
		return
	if(z!=4&&z!=3&&z!=2&&z!=1)
		usr<<"You aren't in right place!"
		return
	if(M.dead)
		usr<<"[M] is dead!"
		return
	if(!M.pk)
		usr<<"[M] is not a combatant."
		return
	if(!pk)
		usr<<"You are not a combatant."
		return
	if(istype(M,/mob/PC))
		arena_on=1
		challenge=1
		M.challenge=1
		for(var/mob/PC/X in world)if(X.arenatxt)X<<"\red Arena Battle: \white [usr] has challenged [M] for an Arena Battle!"
		var/obj/Challenges/C=new
		C.C1=usr
		C.C2=M
		C.ChallengeMob(M,src)
	else
		usr<<"You can't challenge NPCs."
		arena_on=0
		return
obj
	Challenges
		var/time=15
		var/mob/C1
		var/mob/C2
		New()
			..()
			spawn while(1)
				time-=1
				if(time<=0)
					if(C1)
						C1.challenge=0
						C1.challenger=""
					if(C2)
						C2.challenge=0
						C2.challenger=""
					arena_on=0
					for(var/mob/PC/M in world)if(M.arenatxt)M<<"<font color=red>Arena Battle: \white [C2] didn't reply to [C1]'s challenge!"
					del(src)
				sleep(10)
		proc
			ChallengeMob(mob/A,mob/B)
				switch(alert(A,"Do you accept [B]'s Challenge? You have 15 seconds to reply.","Arena Challenge","Decline","Accept"))
					if("Accept")
						for(var/obj/O in B)
							if(O.dball)
								if(B)
									B<<"You cannot arena challenge with the dragonballs!"
									B.challenger=""
									B.challenge=0
								if(A)
									A<<"[B] cannot arena right now!"
									A.challenger=""
									A.challenge=0
								arena_on=0
								del(src)
						for(var/obj/O in A)
							if(O.dball)
								if(A)
									A<<"You cannot arena challenge with the dragonballs!"
									A.challenger=""
									A.challenge=0
								if(B)
									B<<"[A] cannot arena right now!"
									B.challenger=""
									B.challenge=0
								arena_on=0
								del(src)
						if(A.z!=4&&A.z!=3&&A.z!=2&&A.z!=1)
							B<<"[A] isn't in right place!"
							if(A)
								A.challenger=""
								A.challenge=0
							if(B)
								B.challenger=""
								B.challenge=0
							arena_on=0
							del(src)
						if(B.z!=4&&B.z!=3&&B.z!=2&&B.z!=1)
							A<<"[B] isn't in right place!"
							if(A)
								A.challenger=""
								A.challenge=0
							if(B)
								B.challenger=""
								B.challenge=0
							arena_on=0
							del(src)
						if(A.dead)
							if(A)
								A<<"You are dead."
								A.challenge=0
								A.challenger=""
							if(B)
								B.challenge=0
								B.challenger=""
							arena_on=0
							del(src)
						if(B.dead)
							if(B)
								B.challenge=0
								B.challenger=""
							if(A)
								A<<"[B] is dead."
								A.challenge=0
								A.challenger=""
							arena_on=0
							del(src)
						if(!B)
							if(A)
								A.challenge=0
								A.challenger=""
							arena_on=0
							del(src)
						if(A.guild_challenge||B.guild_challenge||A.babatourny||B.babatourny||A.grav > 0 || B.grav > 0||A.FuseFollower||B.FuseFollower||A.in_hbtc||B.tourny||A.in_hbtc||B.tourny||A.in_war||B.in_war)
							if(A)
								A.challenge=0
								A.challenger=""
							if(B)
								B.challenge=0
								B.challenger=""
							arena_on=0
							del(src)
						for(var/mob/PC/M in world)if(M.arenatxt)M<<"<font color=red>Arena Battle: \white [A] has \green <u>accepted</u> \white [B]'s challenge!"
						B.loc=locate(211,384,6)
						A.loc=locate(223,384,6)
						spawn(15)if(B)B.loc=locate(211,384,6)
						spawn(15)if(A)A.loc=locate(223,384,6)
						B.dir=EAST
						A.dir=WEST
						A.safe=0
						B.safe=0
						A.grav=0
						B.grav=0
						B.challenger=A
						A.challenger=B
						del(src)
					if("Decline")
						arena_on=0
						if(A)
							A.challenge=0
							A.challenger=""
						if(B)
							for(var/mob/PC/M in world)if(M.arenatxt)M << "<font color=red>Arena Battle: \white [A] has \red <u>declined</u> \white [B]'s challenge!"
							B.challenger=""
							B.challenge=0
						del(src)