return {
	id = "ISLAND_GUIDE_32",
	events = {
		{
			is3dDorm = false,
			alpha = 0.2,
			style = {
				text = "After catching a fish for the first time, you can unlock its entry in your Fish Collection.",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = -100,
				uiset = {}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.2,
			style = {
				text = "Tap to unlock the entry. Unlocking an entry lets you buy the corresponding fish's fry in the shop.",
				mode = 2,
				dir = 1,
				char = 1,
				posY = -200,
				posX = 300,
				uiset = {}
			},
			ui = {
				path = "UICamera/Canvas/UIMain/UIIsland/layer1/page/IslandBookFishUI(Clone)/right/unlock_btn",
				pathIndex = -1
			}
		},
		{
			is3dDorm = false,
			alpha = 0.2,
			style = {
				text = "Britain runs a fish hatchery where you can grow the fry you've purchased to cultivate more fish.",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = -100,
				uiset = {}
			}
		}
	}
}
