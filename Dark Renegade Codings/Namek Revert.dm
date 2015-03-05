mob/var/form_8=0
mob/var/form_9=0
mob/var/form_10=0
mob/proc/NamekRevert()
	if(src.form_3)
		src.frozen = 1
		src.icon_state = "enrage"
		sleep(10)
		src.doing = 0
		src.form_3 = 0
		src.form_4 = 0
		src.form_5 = 0
		src.form_6 = 0
		src.form_7 = 0
		src.form_8 = 0
		src.form_9 = 0
		src.form_10 = 0
		src.overlays -= 'Elec Demon 1.dmi'
		src.overlays -= 'Elec Demon 2.dmi'
		src.overlays -= 'Elec Demon 3.dmi'
		src.Power_Redefine()
		src.Skin_Apply()
		oview() << "[src.name] has reverted from his Transformed state."
		src.icon_state = ""
		src.icon = 'Namek - Super.dmi'
		src.frozen = 0
		return
	else
		return