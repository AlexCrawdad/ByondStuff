icon
	// Multiply all alpha values by this float
	proc/ChangeOpacity(opacity = 1.0)
		MapColors(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,opacity, 0,0,0,0)

	// Convert to grayscale