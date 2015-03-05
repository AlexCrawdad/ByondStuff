mob
	verb
		Screen_size()
			set category = "Channels"
			set name = "Screen Size"
			alert("Your current view is [client.view]. The default view is 8.")
			switch(input("What Screen size do you want?","Choose your screen size!",) in list("6","7","8","9","10","Cancel"))

				if("6")
					if(client.view == 6)
						usr << "You are on this size ([client.view]) already..."
					else
						client.view = 6
				if("7")
					if(client.view == 7)
						usr << "You are on this size ([client.view]) already..."
					else
						client.view = 7
				if("8")
					if(client.view == 8)
						usr << "You are on this size ([client.view]) already..."
					else
						client.view = 8
				if("9")
					if(client.view == 9)
						usr << "You are on this size ([client.view]) already..."
					else
						client.view = 9
				if("10")
					if(client.view == 10)
						usr << "You are on this size ([client.view]) already..."
					else
						client.view = 10


				if("Cancel")
					return()