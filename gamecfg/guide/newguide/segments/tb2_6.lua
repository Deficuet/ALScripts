return {
	id = "tb2_6",
	events = {
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "Navi's personality is already showing changes based on the choice you just made.",
				mode = 2,
				dir = -1,
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
				text = "Red means her personality is becoming more rebellious, while blue indicates it's becoming milder.",
				mode = 2,
				dir = -1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {
					{
						lineMode = 1,
						path = "OverlayCamera/Overlay/UIMain/NewEducateInfoPanel(Clone)/show_panel/content/personality",
						pathIndex = -1
					}
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "Your choices in day-to-day interactions and special events with her will also have an influence on her personality.",
				mode = 2,
				dir = -1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			}
		}
	}
}
