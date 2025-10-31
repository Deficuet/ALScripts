return {
	id = "ISLAND_GUIDE_14",
	events = {
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "You can view the currently available events here.",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "Open the Milestone Points tab.",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/blur/toggles/content/pt",
				pathIndex = -1,
				triggerType = {
					2,
					true
				}
			}
		}
	}
}
