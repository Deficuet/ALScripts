return {
	id = "ISLAND_GUIDE_4",
	events = {
		{
			is3dDorm = false,
			alpha = 0,
			style = {
				text = "The planner in the top left of the screen displays your active objectives and plans.",
				mode = 2,
				dir = -1,
				char = 1,
				posY = 200,
				posX = -250,
				uiset = {
					{
						lineMode = 1,
						path = "UICamera/Canvas/UIMain/UIIsland/layer1/ui/IslandUI(Clone)/track_container/Island3dTaskTrackPanel(Clone)/content",
						pathIndex = -1
					}
				}
			},
			ui = {
				path = "UICamera/Canvas/UIMain/UIIsland/layer1/ui/IslandUI(Clone)/track_container/Island3dTaskTrackPanel(Clone)/content",
				pathIndex = -1
			}
		},
		{
			is3dDorm = false,
			alpha = 0,
			style = {
				text = "This displays your plans in detail and shows you the location of your objective. \nTap here to track your target.",
				mode = 2,
				dir = 1,
				char = 1,
				posY = -200,
				posX = 200,
				uiset = {
					{
						lineMode = 1,
						path = "OverlayCamera/Overlay/UIMain/Island3dTaskUI(Clone)/adapt/detail/content/btns/traced",
						pathIndex = -1
					}
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0,
			style = {
				text = "Tap the Return button to advance your current plans.",
				mode = 2,
				dir = -1,
				char = 1,
				posY = 300,
				posX = -250,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/Island3dTaskUI(Clone)/top/back",
				pathIndex = -1
			}
		}
	}
}
