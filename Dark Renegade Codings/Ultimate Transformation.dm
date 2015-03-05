mob
	var
		tmp
			using_ut=0
			ut_waiting=0
		transe_points=20
		limited_points=5
		src_limited_points=6
		power_points=0
		ki_points=0
		kidef_points=0
		str_points=0
		def_points=0
		sac_points=0
		pvpkills=0
		pvplvl=0
		UTrevert=0
		transetxt=""
		transeaura='Elec Red Big.dmi'
		transebase='Male - White.dmi'
mob/PC
	verb
		UTReset()
			set hidden=1
			switch(input("Are you sure you want to reset the points back to default?")in list("Yes","No"))
				if("No")return
				if("Yes")
					transe_points=20
					power_points=0
					ki_points=0
					kidef_points=0
					str_points=0
					sac_points=0
					def_points=0
					winset(usr,null,"UltimateSacrifice.USStrOut.text=[str_points]")
					winset(usr,null,"UltimateSacrifice.USDefOut.text=[def_points]")
					winset(usr,null,"UltimateSacrifice.USKiDefOut.text=[kidef_points]")
					winset(usr,null,"UltimateSacrifice.USKiOut.text=[ki_points]")
					winset(usr,null,"UltimateSacrifice.USPowerOut.text=[power_points]")
					winset(usr,null,"UltimateSacrifice.USPointsOut.text=[transe_points]")
					winset(usr,null,"UltimateSacrifice.USSacPointsOut.text=[sac_points]")
					usr<<"Updated!"
					return
		Ultimate_Sacrifice()
			set category="Channels"
			if(using_ut)return
			using_ut=1
			switch(input("Are you sure you want to update your Ultimate Sacrifice?")in list("Yes","No"))
				if("No")
					using_ut=0
					return
				if("Yes")
					if(!pvplvl)
						usr<<"Error: You need to be level 10,000 or over to be able to use this!"
						using_ut=0
						return
					if(pvpkills<150)
						usr<<"Error: You need to have 150 or more kills to be able to use this!"
						using_ut=0
						return
					contents+=new/obj/Transform/Revert
					contents+=new/obj/UT/UT
					gotut=1
					winshow(usr,"UltimateSacrifice",1)
					winset(usr,null,"UltimateSacrifice.USStrOut.text=[str_points]")
					winset(usr,null,"UltimateSacrifice.USDefOut.text=[def_points]")
					winset(usr,null,"UltimateSacrifice.USKiDefOut.text=[kidef_points]")
					winset(usr,null,"UltimateSacrifice.USKiOut.text=[ki_points]")
					winset(usr,null,"UltimateSacrifice.USPowerOut.text=[power_points]")
					winset(usr,null,"UltimateSacrifice.USPointsOut.text=[transe_points]")
					winset(usr,null,"UltimateSacrifice.USSacPointsOut.text=[sac_points]")
					using_ut=0
					return
		USRevert()
			set hidden=1
			if(using_ut)return
			using_ut=1
			switch(input("Are you sure you want to undo the conversion into your UT points?")in list("Yes","No"))
				if("No")
					using_ut=0
					return
				if("Yes")
					if(!sac_points)
						usr<<"Error: There's no SAC point!"
						using_ut=0
						return
					switch(input("Are you 100% sure you want to undo the conversion into your UT points?!")in list("Yes","No"))
						if("No")
							using_ut=0
							return
						if("Yes")
							sac_points-=1
							transe_points+=2
							winset(usr,null,"UltimateSacrifice.USPointsOut.text=[transe_points]")
							winset(usr,null,"UltimateSacrifice.USSacPointsOut.text=[sac_points]")
							usr<<"Updated!"
							using_ut=0
							return
		USConvert()
			set hidden=1
			if(using_ut)return
			using_ut=1
			switch(input("Are you sure you want to convert your Ultimate Transformation points?")in list("Yes","No"))
				if("No")
					using_ut=0
					return
				if("Yes")
					if(power_points<5&&ki_points<5&&kidef_points<5&&str_points<5&&def_points<5)
						usr<<"Error: There's no skill that has been maxed out!"
						using_ut=0
						return
					if(sac_points)
						usr<<"Error: You need to assign SAC point into the UT skills before using this!"
						using_ut=0
						return
					if(transe_points<2)
						usr<<"Error: You do not have enough points for the conversion!"
						using_ut=0
						return
					else
						switch(input("Are you 100% sure you want to convert your Ultimate Transformation points?!")in list("Yes","No"))
							if("No")
								using_ut=0
								return
							if("Yes")
								if(transe_points>=2&&transe_points<=6)
									using_ut=0
									transe_points-=2
									sac_points+=1
									usr<<"Updated!"
									winset(usr,null,"UltimateSacrifice.USPointsOut.text=[transe_points]")
									winset(usr,null,"UltimateSacrifice.USSacPointsOut.text=[sac_points]")
									return
								else
									using_ut=0
									usr<<"Error: You need to assign some points into the UT skills!"
									return
		USPowerUp()
			set hidden=1
			if(!sac_points)
				usr<<"Error: You do not have the point to do that!"
				return
			if(power_points<11)
				usr<<"Error: This skill needs to be at 5!"
				return
			if(power_points>=src_limited_points)
				usr<<"Error: This skill is maxed out!"
				return
			power_points+=1
			sac_points-=1
			winset(usr,null,"UltimateSacrifice.USPowerOut.text=[power_points]")
			winset(usr,null,"UltimateSacrifice.USSacPointsOut.text=[sac_points]")
		USPowerDown()
			set hidden=1
			if(power_points<10)
				usr<<"Error: This isn't maxed out!"
				return
			power_points-=1
			sac_points+=1
			winset(usr,null,"UltimateSacrifice.USPowerOut.text=[power_points]")
			winset(usr,null,"UltimateSacrifice.USSacPointsOut.text=[sac_points]")
		USKiUp()
			set hidden=1
			if(!sac_points)
				usr<<"Error: You do not have the point to do that!"
				return
			if(ki_points<11)
				usr<<"Error: This skill needs to be at 5!"
				return
			if(ki_points>=src_limited_points)
				usr<<"Error: This skill is maxed out!"
				return
			ki_points+=1
			sac_points-=1
			winset(usr,null,"UltimateSacrifice.USKiOut.text=[ki_points]")
			winset(usr,null,"UltimateSacrifice.USSacPointsOut.text=[sac_points]")
		USKiDown()
			set hidden=1
			if(ki_points<10)
				usr<<"Error: This isn't maxed out!"
				return
			ki_points-=1
			sac_points+=1
			winset(usr,null,"UltimateSacrifice.USKiOut.text=[ki_points]")
			winset(usr,null,"UltimateSacrifice.USSacPointsOut.text=[sac_points]")
		USKiDefUp()
			set hidden=1
			if(!sac_points)
				usr<<"Error: You do not have the point to do that!"
				return
			if(kidef_points<11)
				usr<<"Error: This skill needs to be at 5!"
				return
			if(kidef_points>=src_limited_points)
				usr<<"Error: This skill is maxed out!"
				return
			kidef_points+=1
			sac_points-=1
			winset(usr,null,"UltimateSacrifice.USKiDefOut.text=[kidef_points]")
			winset(usr,null,"UltimateSacrifice.USSacPointsOut.text=[sac_points]")
		USKiDefDown()
			set hidden=1
			if(kidef_points<10)
				usr<<"Error: This isn't maxed out!"
				return
			kidef_points-=1
			sac_points+=1
			winset(usr,null,"UltimateSacrifice.USKiDefOut.text=[kidef_points]")
			winset(usr,null,"UltimateSacrifice.USSacPointsOut.text=[sac_points]")
		USStrUp()
			set hidden=1
			if(!sac_points)
				usr<<"Error: You do not have the point to do that!"
				return
			if(str_points<11)
				usr<<"Error: This skill needs to be at 5!"
				return
			if(str_points>=src_limited_points)
				usr<<"Error: This skill is maxed out!"
				return
			str_points+=1
			sac_points-=1
			winset(usr,null,"UltimateSacrifice.USStrOut.text=[str_points]")
			winset(usr,null,"UltimateSacrifice.USSacPointsOut.text=[sac_points]")
		USStrDown()
			set hidden=1
			if(str_points<10)
				usr<<"Error: This isn't maxed out!"
				return
			str_points-=1
			sac_points+=1
			winset(usr,null,"UltimateSacrifice.USStrOut.text=[str_points]")
			winset(usr,null,"UltimateSacrifice.USSacPointsOut.text=[sac_points]")
		USDefUp()
			set hidden=1
			if(!sac_points)
				usr<<"Error: You do not have the point to do that!"
				return
			if(def_points<11)
				usr<<"Error: This skill needs to be at 5!"
				return
			if(def_points>=src_limited_points)
				usr<<"Error: This skill is maxed out!"
				return
			def_points+=1
			sac_points-=1
			winset(usr,null,"UltimateSacrifice.USDefOut.text=[def_points]")
			winset(usr,null,"UltimateSacrifice.USSacPointsOut.text=[sac_points]")
		USDefDown()
			set hidden=1
			if(def_points<10)
				usr<<"Error: This isn't maxed out!"
				return
			def_points-=1
			sac_points+=1
			winset(usr,null,"UltimateSacrifice.USDefOut.text=[def_points]")
			winset(usr,null,"UltimateSacrifice.USSacPointsOut.text=[sac_points]")
		Ultimate_Transformation()
			set category = "Channels"
			if(using_ut)return
			using_ut=1
			if(!pvplvl)
				usr<<"Error: You need to be level 10,000 or over to be able to use this!"
				using_ut=0
				return
			if(pvpkills<150)
				usr<<"Error: You need to have 150 or more kills to be able to use this!"
				using_ut=0
				return
			switch(input("Are you sure you want to edit your Ultimate Transformation?")in list("Yes","No"))
				if("No")
					using_ut=0
					return
				if("Yes")
					if(!pvplvl)
						usr<<"Error: You need to be level 10,000 or over to be able to use this!"
						using_ut=0
						return
					if(pvpkills<150)
						usr<<"Error: You need to have 150 or more kills to be able to use this!"
						using_ut=0
						return
					contents+=new/obj/UT/UT
					contents+=new/obj/Transform/Revert
					gotut=1
					winshow(usr,"UltimateTransformation",1)
					winset(usr,null,"UltimateTransformation.StrOut.text=[str_points]")
					winset(usr,null,"UltimateTransformation.DefOut.text=[def_points]")
					winset(usr,null,"UltimateTransformation.KiDefOut.text=[kidef_points]")
					winset(usr,null,"UltimateTransformation.KiOut.text=[ki_points]")
					winset(usr,null,"UltimateTransformation.PowerOut.text=[power_points]")
					winset(usr,null,"UltimateTransformation.Points.text=[transe_points]")
					winset(usr,null,"UltimateTransformation.TextOutput.text='[transetxt]'")
					usr<<output(null,"TransOut")
					usr<<output("<big>\icon[transebase]</big>","TransOut")
					using_ut=0
					return
		PowerUp()
			set hidden=1
			if(!transe_points)
				usr<<"Error: You do not have the point to do that!"
				return
			if(power_points>=limited_points)
				usr<<"Error: This skill is maxed out!"
				return
			power_points+=1
			transe_points-=1
			winset(usr,null,"UltimateTransformation.PowerOut.text=[power_points]")
			winset(usr,null,"UltimateTransformation.Points.text=[transe_points]")
		PowerDown()
			set hidden=1
			if(power_points>5)
				usr<<"To return the Sacrificed Point to normal, please use Ultimate Sacrifice."
				return
			if(!power_points)
				usr<<"Error: This skill have no point!"
				return
			power_points-=1
			transe_points+=1
			winset(usr,null,"UltimateTransformation.PowerOut.text=[power_points]")
			winset(usr,null,"UltimateTransformation.Points.text=[transe_points]")
		KiUp()
			set hidden=1
			if(!transe_points)
				usr<<"Error: You do not have the point to do that!"
				return
			if(ki_points>=limited_points)
				usr<<"Error: This skill is maxed out!"
				return
			ki_points+=1
			transe_points-=1
			winset(usr,null,"UltimateTransformation.KiOut.text=[ki_points]")
			winset(usr,null,"UltimateTransformation.Points.text=[transe_points]")
		KiDown()
			set hidden=1
			if(ki_points>5)
				usr<<"To return the Sacrificed Point to normal, please use Ultimate Sacrifice."
				return
			if(!ki_points)
				usr<<"Error: This skill have no point!"
				return
			ki_points-=1
			transe_points+=1
			winset(usr,null,"UltimateTransformation.KiOut.text=[ki_points]")
			winset(usr,null,"UltimateTransformation.Points.text=[transe_points]")
		KiDefUp()
			set hidden=1
			if(!transe_points)
				usr<<"Error: You do not have the point to do that!"
				return
			if(kidef_points>=limited_points)
				usr<<"Error: This skill is maxed out!"
				return
			kidef_points+=1
			transe_points-=1
			winset(usr,null,"UltimateTransformation.KiDefOut.text=[kidef_points]")
			winset(usr,null,"UltimateTransformation.Points.text=[transe_points]")
		KiDefDown()
			set hidden=1
			if(kidef_points>5)
				usr<<"To return the Sacrificed Point to normal, please use Ultimate Sacrifice."
				return
			if(!kidef_points)
				usr<<"Error: This skill have no point!"
				return
			kidef_points-=1
			transe_points+=1
			winset(usr,null,"UltimateTransformation.KiDefOut.text=[kidef_points]")
			winset(usr,null,"UltimateTransformation.Points.text=[transe_points]")
		StrUp()
			set hidden=1
			if(!transe_points)
				usr<<"Error: You do not have the point to do that!"
				return
			if(str_points>=limited_points)
				usr<<"Error: This skill is maxed out!"
				return
			str_points+=1
			transe_points-=1
			winset(usr,null,"UltimateTransformation.StrOut.text=[str_points]")
			winset(usr,null,"UltimateTransformation.Points.text=[transe_points]")
		StrDown()
			set hidden=1
			if(str_points>5)
				usr<<"To return the Sacrificed Point to normal, please use Ultimate Sacrifice."
				return
			if(!str_points)
				usr<<"Error: This skill have no point!"
				return
			str_points-=1
			transe_points+=1
			winset(usr,null,"UltimateTransformation.StrOut.text=[str_points]")
			winset(usr,null,"UltimateTransformation.Points.text=[transe_points]")
		DefUp()
			set hidden=1
			if(!transe_points)
				usr<<"Error: You do not have the point to do that!"
				return
			if(def_points>=limited_points)
				usr<<"Error: This skill is maxed out!"
				return
			def_points+=1
			transe_points-=1
			winset(usr,null,"UltimateTransformation.DefOut.text=[def_points]")
			winset(usr,null,"UltimateTransformation.Points.text=[transe_points]")
		DefDown()
			set hidden=1
			if(def_points>5)
				usr<<"To return the Sacrificed Point to normal, please use Ultimate Sacrifice."
				return
			if(!def_points)
				usr<<"Error: This skill have no point!"
				return
			def_points-=1
			transe_points+=1
			winset(usr,null,"UltimateTransformation.DefOut.text=[def_points]")
			winset(usr,null,"UltimateTransformation.Points.text=[transe_points]")
		EditText()
			set hidden=1
			var/msg=input("Input text for everyone in view to see when you're 'ultimate' transing. Max: 80 words.") as null|text
			if(!usr||!msg)return
			msg = html_encode(msg)
			if(lentext(msg)>80)
				usr<<"Your text must have 80 or less words!"
				return
			transetxt="[msg]"
			winset(usr,null,"UltimateTransformation.TextOutput.text='[transetxt]'")
			usr<<"Updated!"
			return
		EditBase()
			set hidden=1
			var/icon/I=input("Input an icon for your transformation base to use with UT.")as null|icon
			if(!usr||!I)return
			transebase=I
			usr<<output(null,"TransOut")
			usr<<output("<big>\icon[transebase]</big>","TransOut")
			usr<<"Updated!"
			switch(input("Do you also want your reverted icon as your UT base?")in list("Yes","No"))
				if("Yes")
					UTrevert=1
					return
				if("No")
					UTrevert=0
					return
		EditHair()
			set hidden=1
			if(!hairut)
				switch(alert("This option enables you to use the default UT hair overlays.","Toggle UT hair?","Yes","No"))
					if("No")return
					if("Yes")
						hairut=1
						usr<<"Updated!"
			else
				switch(alert("This option disables you to use the default UT hair overlays.","Toggle UT hair?","Yes","No"))
					if("No")return
					if("Yes")
						hairut=0
						usr<<"Updated!"
			return
		EditAura()
			set hidden=1
			overlays-=transeaura
			transeaura=""
			var/icon/I=input("Input an icon for your overlay aura to use with UT.")as null|icon
			if(!usr||!I)return
			transeaura=I
			usr<<"Updated!"
			return