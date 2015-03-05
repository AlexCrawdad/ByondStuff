/////////////////////////
//////Masteries//////////
/////////////////////////
mob
	var
		TransMastery=1
		InvertMastery=1
		GravityMastery=1
		PLMastery=1
		STRMastery=1
		DEFMastery=1
		KIMastery=1
		MedTime=1

mob
	proc
		TransMastery()
			if(src.TransMastery<5)
				src.TransMastery+=0.001
		InvertMastery()
			if(src.InvertMastery<5)
				src.InvertMastery+=0.001

		PLMastery()
			if(src.PLMastery<4)
				src.PLMastery+=0.0001
		STRMastery()
			if(src.STRMastery<4)
				src.STRMastery+=0.0001
		KIMastery()
			if(src.KIMastery<4)
				src.KIMastery+=0.0001
		DEFMastery()
			if(src.DEFMastery<4)
				src.DEFMastery+=0.0001



		TransformMasteryMultiplier()
			src.powerlevel*=src.TransMastery
			src.ki*=src.TransMastery
			src.strength*=src.TransMastery
			src.defence*=src.TransMastery
			src.kidefense*=src.TransMastery

		InvertMasteryMultiplier()
			usr.powerlevel*=src.InvertMastery
			usr.ki*=src.InvertMastery
			usr.strength*=src.InvertMastery
			usr.defence*=src.InvertMastery
			usr.kidefense*=src.InvertMastery
