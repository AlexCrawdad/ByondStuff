proc/CapsCount(var/Text)
	var/Caps=1
	var/NotCaps=1
	for(var/A in 1 to length(Text))
		switch(text2ascii(Text,A))
			if(65 to 90)Caps+=1
			if(97 to 122)NotCaps+=1
	var/L=length(Text)
	var/Ll=length(Text)**2
	var/T=Caps
	return round((NotCaps**2+NotCaps*Ll-T*Ll)/(NotCaps*T*L)+3)