return {
	id = "PHANTOM_HELP",
	events = {
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "You've unlocked the skin projection feature! Tap here to create a skin projection!",
				mode = 1,
				dir = 1,
				char = "char",
				posY = 234.52,
				posX = 310.92,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/blur_panel/adapt/right_panel/mod_panel/switch",
				pathIndex = -1
			}
		},
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "The projections you make can be applied to skins!",
				mode = 1,
				dir = -1,
				char = "char",
				posY = 17.36,
				posX = 151.22,
				uiset = {}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "You can manage your finished projections over here!",
				mode = 1,
				dir = -1,
				char = "char",
				posY = 223.97,
				posX = 103.8,
				uiset = {
					{
						lineMode = 2,
						path = "OverlayCamera/Overlay/UIMain/blur_panel/adapt/phantomBtn",
						pathIndex = -1
					}
				}
			}
		}
	}
}
