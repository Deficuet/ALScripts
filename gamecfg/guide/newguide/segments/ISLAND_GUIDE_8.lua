return {
	id = "ISLAND_GUIDE_8",
	events = {
		{
			is3dDorm = false,
			alpha = 0,
			style = {
				text = "Tap the Research button to view available technologies to research.",
				mode = 2,
				dir = -1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			},
			ui = {
				path = "/UICamera/Canvas/UIMain/UIIsland/layer1/ui/IslandTechnologyUI(Clone)/adapt/pages/IslandTechCentrePanel(Clone)/view/content/0/items_view/content/tpl",
				pathIndex = -1
			}
		},
		{
			is3dDorm = false,
			alpha = 0,
			style = {
				text = "You can start researching island technologies by tapping the Begin Research button.",
				mode = 2,
				dir = 1,
				char = 1,
				posY = -320,
				posX = 0,
				uiset = {}
			},
			ui = {
				path = "/OverlayCamera/Overlay/UIMain/IslandTechDetailPanel(Clone)/panel/status/normal",
				pathIndex = -1
			}
		},
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "Tap the Confirm button.",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			},
			ui = {
				path = "/OverlayCamera/Overlay/UIMain/IslandShipSelectUI(Clone)/sure",
				pathIndex = -1
			}
		},
		{
			alpha = 0,
			notifies = {
				{
					notify = "story update",
					body = {
						storyId = "ISLAND_GUIDE_8"
					}
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0,
			style = {
				text = "You can use Express Tickets to speed up your research.",
				mode = 2,
				dir = 1,
				char = 1,
				posY = -240,
				posX = 0,
				uiset = {}
			}
		}
	}
}
