mob/var/reported=0
mob
	verb
		RaportAdmin(mob/M in world)
			set category = "Channels"
			set name="Complaint/Report Admin"
			if(M.GMLevel < 1)
				usr << "<font color='#143806'>You can only complaint about Admins not players"
				return
			switch(alert("Are you sure you want to report [M]?","Report [M]","Yes","No"))
				if("Yes")
					var/Reason=input("Why you want to file a complaint against [M] ??")as null|text
					if(!M||M==null)return
					if(Reason)
						world<<"<b>[M] has been <font color='#4d503b'>reported</font> by [usr].([Reason])"
						ComplaintLog(usr,"Filed a complaint against [M]. Reason - [Reason]")
						if(M.client)M.client.SaveChar()
						M.reported+=1
						usr << "<font color=Red>Your complaint has been successfully registered!"
						return
					else
						usr << "You need to give a reason first!"
						return