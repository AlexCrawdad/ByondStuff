mob
	var
		crater_power=0
		tmp
			powering=0
obj/Technique/PowerUp
	verb/Power_Up()
		set category="Techniques"
		if(usr.FuseFollower)return
		if(usr.powering)
			usr<<"You stop Powering Up."
			usr.frozen=0
			usr.powering=0
			usr.doing=0
			usr.crater_power=0
			usr.buku_lock=0
			for(var/turf/T in view(usr,6))
				var/chance = roll(1,20)
				if(chance == 15)
					missile(new/obj/OrangePU, usr, T)
			for(var/turf/T in view(usr,8))
				var/chance = roll(1,20)
				if(chance == 15)
					missile(new/obj/YellowPU, usr, T)
			icon='sjt.dmi'
			usr.icon_state="pup"
			sleep(25)
			usr.power_delay=0
			return
		if(usr.doing)
			usr<<"You are already doing something!"
			return
		if(usr.kaioken)
			usr<<"Revert from kaioken form."
			return
		if(usr.KO)return
		if(usr.power_delay)
			usr<<"You must wait a moment before using Power Up again!"
			return
		if(!usr.powering)
			if(usr.powerlevel>=usr.powerlevel_max&&usr.ki>=usr.ki_max)
				usr<<"Theres no reason to Power Up!"
				return
			else
				usr.power_delay=1
				switch(input("What do you wish to Power Up?")in list("All","Powerlevel","Ki","Cancel"))
					if("Cancel")return
					if("All")
						if(usr.doing)
							usr<<"You're doing something!"
							return
						usr.frozen=1
						usr.powering=1
						usr.doing=1
						usr.buku_lock=1
						usr.icon_state="enrage"
						usr<<"You begin to focus on all of your stats."
						view(6) << sound('turbo.wav')
						for(var/turf/T in view(usr,6))
							var/chance = roll(1,20)
							if(chance == 15)
								missile(new/obj/OrangePU, usr, T)
						for(var/turf/T in view(usr,8))
							var/chance = roll(1,20)
							if(chance == 15)
								missile(new/obj/YellowPU, usr, T)
						spawn(1)usr.Powering_All()
						sleep(25)
						if(usr)usr.power_delay=0
					if("Powerlevel")
						if(usr.doing)
							usr<<"You're doing something!"
							return
						usr.frozen=1
						usr.powering=1
						usr.doing=1
						usr.buku_lock=1
						usr.icon_state="enrage"
						usr<<"You begin to focus your power."
						view(6) << sound('turbo.wav')
						spawn(1)usr.Powering_PL()
						sleep(25)
						if(usr)usr.power_delay=0
					if("Ki")
						if(usr.doing)
							usr<<"You're doing something!"
							return
						usr.frozen=1
						usr.powering=1
						usr.doing=1
						usr.buku_lock=1
						usr.icon_state="enrage"
						usr<<"You begin to focus your ki."
						view(6) << sound('turbo.wav')
						spawn(1)usr.Powering_KI()
						sleep(25)
						if(usr)usr.power_delay=0
	verb/Power_Down()
		set category="Techniques"
		if(usr.FuseFollower)return
		if(usr.doing)
			usr<<"You are already doing something!"
			return
		if(usr.KO)return
		switch(input("What do you wish to Power Down?")in list("All","Powerlevel","Ki","Ki Defense","Strength","Defense","Cancel"))
			if("Powerlevel")
				if(usr.doing)
					usr<<"You're doing something!"
					return
				if(usr.powerlevel<=1)
					usr<<"You are too weak to Power Down!"
					return
				var/pdown=input("What do you wish to Power Down to?")as num|null
				if(usr.doing)
					usr<<"You're doing something!"
					return
				if(pdown<=0)
					usr<<"You cannot Power Down that much!"
					return
				if(pdown>=usr.powerlevel)return
				if(pdown<usr.powerlevel)
					usr<<"You lower your Powerlevel to \white[num2text(pdown,10000000)]"
					usr.icon_state="enrage"
					oview(50) << "\white A Powerlevel drops in the Distance."
					usr.frozen=1
					sleep(15)
					usr.frozen=0
					usr.powerlevel=pdown
					usr.icon_state=""
			if("Ki")
				if(usr.doing)
					usr<<"You're doing something!"
					return
				if(usr.ki<=1)
					usr<<"You are too weak to Power Down!"
					return
				var/pdown=input("What do you wish to Power Down to?")as num|null
				if(usr.doing)
					usr<<"You're doing something!"
					return
				if(pdown<=0)
					usr<<"You cannot Power Down that much!"
					return
				if(pdown>=usr.ki)return
				if(pdown<usr.ki)
					usr<<"You lower your Ki to \white[num2text(pdown,10000000)]"
					usr.icon_state="enrage"
					usr.frozen=1
					sleep(15)
					usr.frozen=0
					usr.ki=pdown
					usr.icon_state=""
			if("Ki Defense")
				if(usr.doing)
					usr<<"You're doing something!"
					return
				if(usr.kidefense<=1)
					usr<<"You are too weak to Power Down!"
					return
				var/pdown=input("What do you wish to Power Down to?")as num|null
				if(usr.doing)
					usr<<"You're doing something!"
					return
				if(pdown<=0)
					usr<<"You cannot Power Down that much!"
					return
				if(pdown>=usr.kidefense)return
				if(pdown<usr.kidefense)
					usr<<"You lower your Ki Defense to \white[num2text(pdown,10000000)]"
					usr.icon_state="enrage"
					usr.frozen=1
					sleep(15)
					usr.frozen=0
					usr.kidefense=pdown
					usr.icon_state=""
			if("Strength")
				if(usr.doing)
					usr<<"You're doing something!"
					return
				if(usr.strength<=1)
					usr<<"You are too weak to Power Down!"
					return
				var/pdown=input("What do you wish to Power Down to?")as num|null
				if(usr.doing)
					usr<<"You're doing something!"
					return
				if(pdown<=0)
					usr<<"You cannot Power Down that much!"
					return
				if(pdown>=usr.strength)return
				if(pdown<usr.strength)
					usr<<"You lower your Strength to \white[num2text(pdown,10000000)]"
					usr.icon_state="enrage"
					usr.frozen=1
					sleep(15)
					usr.frozen=0
					usr.strength=pdown
					usr.icon_state=""
			if("Defense")
				if(usr.doing)
					usr<<"You're doing something!"
					return
				if(usr.defence<=1)
					usr<<"You are too weak to Power Down!"
					return
				var/pdown=input("What do you wish to Power Down to?")as num|null
				if(usr.doing)
					usr<<"You're doing something!"
					return
				if(pdown<=0)
					usr<<"You cannot Power Down that much!"
					return
				if(pdown>=usr.defence)return
				if(pdown<usr.defence)
					usr<<"You lower your Defense to \white[num2text(pdown,10000000)]"
					usr.icon_state="enrage"
					usr.frozen=1
					sleep(15)
					usr.frozen=0
					usr.defence=pdown
					usr.icon_state=""
			if("All")
				if(usr.doing)
					usr<<"You're doing something!"
					return
				if(usr.ki<=1||usr.kidefense<=1||usr.strength<=1||usr.defence<=1||usr.powerlevel<=1)
					usr<<"You are too weak to Power Down!"
					return
				var/pdown=input("What do you wish to Power Down to?")as num|null
				if(usr.doing)
					usr<<"You're doing something!"
					return
				if(pdown<=0)
					usr<<"You cannot Power Down that much!"
					return
				if(pdown>=usr.ki||pdown>=usr.kidefense||pdown>=usr.strength||pdown>=usr.defence||pdown>=usr.powerlevel)return
				if(usr.ki<=1||usr.kidefense<=1||usr.strength<=1||usr.defence<=1||usr.powerlevel<=1)
					usr<<"You are too weak to Power Down!"
					return
				usr<<"You lower all of your stats to \white[num2text(pdown,10000000)]"
				usr.icon_state="enrage"
				usr.frozen=1
				sleep(15)
				usr.frozen=0
				usr.ki=pdown
				usr.strength=pdown
				usr.defence=pdown
				usr.kidefense=pdown
				usr.powerlevel=pdown
				usr.icon_state=""
			if("Cancel")return
mob
	proc
		Powering_All()
			if(!powering)
				icon_state=""
				frozen=0
				sleep(50)
				power_delay=0
				return
			if(powerlevel>=powerlevel_max&&ki>=ki_max&&strength>=strength_max&&defence>=defence_max&&kidefense>=kidefense_max)
				src<<"You are fully powered up!"
				powerlevel=powerlevel_max
				ki=ki_max
				kidefense=kidefense_max
				strength=strength_max
				defence=defence_max
				frozen=0
				powering=0
				doing=0
				buku_lock=0
				icon_state=""
				crater_power=0
				sleep(25)
				power_delay=0
				overlays-=aura
				return
			else
				if(powerlevel<powerlevel_max)powerlevel+=powerlevel_max*0.1
				if(ki<ki_max)ki+=ki_max*0.1
				if(kidefense<kidefense_max)kidefense+=kidefense_max*0.1
				if(strength<strength_max)strength+=strength_max*0.1
				if(defence<defence_max)defence+=defence_max*0.1
				crater_power+=powerlevel_max*0.1
				if(crater_power>100000000)
					for(var/obj/Buildings/DE in oview(8,src))
						DE.hp-=powerlevel/(1+get_dist(src,DE))
						spawn(0)DE.DestroyIt()
					if(crater_on)
						new/obj/techs/Overlays/Crater_Center(loc)
						crater_power-=99999999999
				for(var/mob/PC/M in oview(8))
					if(powerlevel_max>=(M.powerlevel_max*1.5))
						var/FallDir=get_dir(src,M)
						if(!M.insafezone)
							step(M,FallDir)
							switch(FallDir)
								if(NORTH)M.dir=SOUTH
								if(NORTHWEST)M.dir=SOUTHEAST
								if(WEST)M.dir=EAST
								if(SOUTHWEST)M.dir=NORTHEAST
								if(SOUTH)M.dir=NORTH
								if(SOUTHEAST)M.dir=NORTHWEST
								if(EAST)M.dir=WEST
								if(NORTHEAST)M.dir=SOUTHWEST
				spawn(20)if(src)Powering_All()
				return
		Powering_PL()
			if(!powering)
				icon_state=""
				frozen=0
				sleep(50)
				power_delay=0
				return
			else
				if(powerlevel>=powerlevel_max)
					src<<"You are fully powered up!"
					powerlevel=powerlevel_max
					frozen=0
					powering=0
					doing=0
					buku_lock=0
					icon_state=""
					crater_power=0
					sleep(25)
					power_delay=0
					overlays-=aura
					return
				else
					powerlevel+=powerlevel_max*0.1
					crater_power+=powerlevel_max*0.1
					if(crater_power>100000000)
						for(var/obj/Buildings/DE in oview(8,src))
							DE.hp-=powerlevel/(1+get_dist(src,DE))
							spawn(0)DE.DestroyIt()
						if(crater_on)
							new/obj/techs/Overlays/Crater_Center(loc)
							crater_power-=99999999999
					for(var/mob/PC/M in oview(8))
						if(powerlevel_max>=(M.powerlevel_max * 1.5))
							var/FallDir=get_dir(src,M)
							if(!M.insafezone)
								step(M,FallDir)
								switch(FallDir)
									if(NORTH)M.dir=SOUTH
									if(NORTHWEST)M.dir=SOUTHEAST
									if(WEST)M.dir=EAST
									if(SOUTHWEST)M.dir=NORTHEAST
									if(SOUTH)M.dir=NORTH
									if(SOUTHEAST)M.dir=NORTHWEST
									if(EAST)M.dir=WEST
									if(NORTHEAST)M.dir=SOUTHWEST
					spawn(20)if(src)Powering_PL()
					return
		Powering_KI()
			if(!powering)
				icon_state=""
				frozen=0
				sleep(50)
				power_delay=0
				return
			else
				if(ki>=ki_max)
					src<<"You are fully powered up!"
					ki=ki_max
					frozen=0
					powering=0
					doing=0
					buku_lock=0
					icon_state=""
					crater_power=0
					sleep(25)
					power_delay=0
					overlays-=aura
					return
				else
					ki+=ki_max*0.1
					crater_power+=ki_max*0.1
					if(crater_power>100000000)
						for(var/obj/Buildings/DE in oview(8,src))
							DE.hp-=powerlevel/(1+get_dist(src,DE))
							spawn(0)DE.DestroyIt()
						if(crater_on)
							new/obj/techs/Overlays/Crater_Center(loc)
							crater_power-=99999999999
					for(var/mob/PC/M in oview(8))
						if(powerlevel_max>=(M.powerlevel_max * 1.5))
							var/FallDir=get_dir(src,M)
							step(M,FallDir)
							switch(FallDir)
								if(NORTH)M.dir=SOUTH
								if(NORTHWEST)M.dir=SOUTHEAST
								if(WEST)M.dir=EAST
								if(SOUTHWEST)M.dir=NORTHEAST
								if(SOUTH)M.dir=NORTH
								if(SOUTHEAST)M.dir=NORTHWEST
								if(EAST)M.dir=WEST
								if(NORTHEAST)M.dir=SOUTHWEST
					spawn(20)if(src)Powering_KI()
					return