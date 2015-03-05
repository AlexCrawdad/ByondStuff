mob
	var
		biobase='Male - White.dmi'
		bio_about
		bio_motto
		bio_style
		tmp/using_bio=0
mob/PC
	verb
		View_Biography(mob/PC/M in oview(8))
			set category="Channels"
			if(!M.client)
				usr<<"This mob isn't an actual player!"
				return
			if(using_bio)return
			using_bio=1
			switch(input("Are you sure you want to see [M]'s biography?")in list("Yes","No"))
				if("No")
					using_bio=0
					return
				if("Yes")
					var/trainingtest
					switch(M.leveldone)
						if(0)trainingtest="Warrior"
						if(1)trainingtest="Assasin"
						if(2)trainingtest="Deadly Shadow"
						if(3)trainingtest="Demon"
						if(4)trainingtest="Immortal"
						if(5)trainingtest="God"
						if(6)trainingtest="Legend"
						if(7)trainingtest="Inferno"
						if(8)trainingtest="Titan"
						if(9)trainingtest="Dragon Mode"
						if(10)trainingtest="Semi God of Destruction"
						if(11)trainingtest="True God of Destruction"
					winshow(usr,"Bio_Skin",1)
					winset(usr,"Bio_Skin","title=\"[M]'s biography\"")
					usr<<output(null,"BioOut")
					usr<<output("<center><big>\icon[M.biobase]</big></center>","BioOut")
					winset(usr,null,"Bio_Skin.Bio_Name.text='[M]'")
					winset(usr,null,"Bio_Skin.Bio_Training.text=[trainingtest]")
					winset(usr,null,"Bio_Skin.Bio_About.text='[M.bio_about]'")
					winset(usr,null,"Bio_Skin.Bio_Defense.text=[applycommas(M.defence)]/[applycommas(M.defence_max)]")
					winset(usr,null,"Bio_Skin.Bio_Strength.text=[applycommas(M.strength)]/[applycommas(M.strength_max)]")
					winset(usr,null,"Bio_Skin.Bio_Ki_Defense.text=[applycommas(M.kidefense)]/[applycommas(M.kidefense_max)]")
					winset(usr,null,"Bio_Skin.Bio_Ki.text=[applycommas(M.ki)]/[applycommas(M.ki_max)]")
					winset(usr,null,"Bio_Skin.Bio_Powerlevel.text=[applycommas(M.powerlevel)]/[applycommas(M.powerlevel_max)]")
					winset(usr,null,"Bio_Skin.Bio_Level.text=[applycommas(M.level)]")
					winset(usr,null,"Bio_Skin.Bio_Race.text=[M.race]")
					winset(usr,null,"Bio_Skin.Bio_Motto.text='[M.bio_motto]'")
					winset(usr,null,"Bio_Skin.Bio_Style.text='[M.bio_style]'")
					winset(usr,null,"Bio_Skin.button52.is-visible=false")
					winset(usr,null,"Bio_Skin.button53.is-visible=false")
					winset(usr,null,"Bio_Skin.button54.is-visible=false")
					winset(usr,null,"Bio_Skin.button55.is-visible=false")
					using_bio=0
					return
		Edit_Biography()
			set category="Channels"
			if(using_bio)return
			using_bio=1
			switch(input("Are you sure you want to update your biography?")in list("Yes","No"))
				if("No")
					using_bio=0
					return
				if("Yes")
					var/trainingtest
					switch(leveldone)
						if(0)trainingtest="Warrior"
						if(1)trainingtest="Assasin"
						if(2)trainingtest="Deadly Shadow"
						if(3)trainingtest="Demon"
						if(4)trainingtest="Immortal"
						if(5)trainingtest="God"
						if(6)trainingtest="Legend"
						if(7)trainingtest="Inferno"
						if(8)trainingtest="Titan"
						if(9)trainingtest="Dragon Mode"
						if(10)trainingtest="Semi God of Destruction"
						if(11)trainingtest="True God of Destruction"
					winshow(usr,"Bio_Skin",1)
					winset(usr,"Bio_Skin","title=\"[usr]'s biography\"")
					usr<<output(null,"BioOut")
					usr<<output("<center><big>\icon[biobase]</big></center>","BioOut")
					winset(usr,null,"Bio_Skin.Bio_Name.text='[usr]'")
					winset(usr,null,"Bio_Skin.Bio_Training.text=[trainingtest]")
					winset(usr,null,"Bio_Skin.Bio_About.text='[bio_about]'")
					winset(usr,null,"Bio_Skin.Bio_Defense.text=[applycommas(defence)]/[applycommas(defence_max)]")
					winset(usr,null,"Bio_Skin.Bio_Strength.text=[applycommas(strength)]/[applycommas(strength_max)]")
					winset(usr,null,"Bio_Skin.Bio_Ki_Defense.text=[applycommas(kidefense)]/[applycommas(kidefense_max)]")
					winset(usr,null,"Bio_Skin.Bio_Ki.text=[applycommas(ki)]/[applycommas(ki_max)]")
					winset(usr,null,"Bio_Skin.Bio_Powerlevel.text=[applycommas(powerlevel)]/[applycommas(powerlevel_max)]")
					winset(usr,null,"Bio_Skin.Bio_Level.text=[applycommas(level)]")
					winset(usr,null,"Bio_Skin.Bio_Race.text=[race]")
					winset(usr,null,"Bio_Skin.Bio_Motto.text='[bio_motto]'")
					winset(usr,null,"Bio_Skin.Bio_Style.text='[bio_style]'")
					winset(usr,null,"Bio_Skin.button52.is-visible=true")
					winset(usr,null,"Bio_Skin.button53.is-visible=true")
					winset(usr,null,"Bio_Skin.button54.is-visible=true")
					winset(usr,null,"Bio_Skin.button55.is-visible=true")
					using_bio=0
					return
		EditAbout()
			set hidden=1
			var/msg=input("Input text for everyone who is checking your 'about me' as well as yourself!")as null|text
			if(!usr||!msg)return
			msg = html_encode(msg)
			if(lentext(msg)>600)
				usr<<"Your text must have 600 or less words!"
				return
			bio_about="[msg]"
			winset(usr,null,"Bio_Skin.Bio_About.text='[bio_about]'")
			usr<<"Updated!"
			return
		EditBioBase()
			set hidden=1
			var/icon/I=input("Input an icon for your biography.")as null|icon
			if(!usr||!I)return
			biobase=I
			usr<<output(null,"BioOut")
			usr<<output("<center><big>\icon[biobase]</big></center>","BioOut")
			usr<<"Updated!"
			return
		EditMotto()
			set hidden=1
			var/msg=input("Input text for everyone who is checking your 'motto' as well as yourself!")as null|text
			if(!usr||!msg)return
			msg=html_encode(msg)
			if(lentext(msg)>60)
				usr<<"Your text must have 60 or less words!"
				return
			bio_motto="[msg]"
			winset(usr,null,"Bio_Skin.Bio_Motto.text='[bio_motto]'")
			usr<<"Updated!"
			return
		EditStyle()
			set hidden=1
			switch(input("What fighting style do you prefer?")in list("Ki whore","Melee whore","Cancel"))
				if("Cancel")return
				if("Ki whore")bio_style="Ki whore"
				if("Melee whore")bio_style="Melee whore"
			winset(usr,null,"Bio_Skin.Bio_Style.text='[bio_style]'")
			usr<<"Updated!"
			return