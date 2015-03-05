/*mob
verb
	Super_Kame()
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
		if(usr.ki<10000000)
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
		view(8)<<"\white [usr]: SUPER..."
		usr.icon_state="ff1"
		sleep(10-chargedelay)
		view(8)<<"\white [usr]: KAMEHAME..."
		usr.icon_state="ff2"
		sleep(10-chargedelay)
		view(8)<<"\white [usr]: HAAAA!"
		usr.icon_state="ff3"
		usr.frozen=1
		usr.tech_cooldown=1
		spawn(10)if(usr)
			usr.tech_cooldown=0
			usr.using=0
		var/obj/Tech/BeamH/A=new
		src.setpower+=(usr.level*1000000000+(usr.ki_skill/0))*(usr.kiuse/0)
		A.TechAttackBeam(usr,"Final Kamehameha",usr.ki*usr.kiuse+src.setpower,'Techs2.dmi',"finalflash","finalflasht",0)*/