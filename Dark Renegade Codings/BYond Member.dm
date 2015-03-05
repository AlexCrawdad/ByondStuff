mob/var
	gotbyondmember=0
	gotbyondlevelsgain=0
	gotbyondtpsgain=0
/*
mob
	verb
		BM_Levels()
			set category = "Member"
			set name = "Gain Levels"
			set desc = "For being Byond Member, you can give yourself 1,000 levels. Beware, this can only be used once!"
			if(usr.gotbyondlevelsgain)
				usr<<"<font color=red>Thank you for being Byond Member, but you already used this feature!"
				return
			switch(alert("Gain 1,000 levels for being Byond Member!","Gain 1,000 Levels?","Yes","No"))
				if("Yes")
					usr.gotbyondlevelsgain=1
					var/amount=1000
					while(amount>0)
						usr.exp = usr.tnl
						usr.Level_Up()
						amount -= 1
						sleep(1)
				else
					return
		Safe_Zone()
			set category = "Member"
			set name = "Return to SZ"
			if(usr.jailed)
				usr<<"<font color=red>You're in jail!"
				return
			if(usr.dead)
				usr<<"<font color=red>You're dead!"
				return
			switch(alert("Return to Safe Zone","Return to Safe Zone?","Yes","No"))
				if("Yes")
					usr.loc=locate(165,224,1)
					usr<<"<font color=green>You have been successfully returned to Safe Zone!"
				else
					return
		BM_TPS()
			set category = "Member"
			set name = "Gain Training Points"
			set desc = "For being Byond Member, you can give yourself 10,000 Training Points. Beware, this can only be used once!"
			if(usr.gotbyondtpsgain)
				usr<<"<font color=red>Thank you for being Byond Member, but you already used this feature!"
				return
			switch(alert("Gain 10,000 training points for being Byond Member!","Gain 10,000 Training Points?","Yes","No"))
				if("Yes")
					usr.tp += 10000
					usr.gotbyondtpsgain=1
				else
					return

		Change_My_Icon()
			set category="Member"
			var/icon/I=input("Select your Icon:")as null|icon
			if(!length(I))
				return
			if(length(I)>filesizemax)
				usr<<"File is too large. 50kb max."
				return
			switch(alert("Change Your Icon?","Icon Change","Yes","No"))
				if("Yes")
					usr.icon=I
					return
				if("No")return
/*
		BM_TECHS()
			set category = "Member"
			set name = "Get Techs"
			if(!client.IsByondMember())
				usr<<"<font color=red>You are not a Byond Member!"
				return
			usr.ALLTECHS()
			return
*/*/