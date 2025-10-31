return {
	id = "ISLAND_GUIDE_9",
	events = {
		{
			is3dDorm = false,
			alpha = 0,
			style = {
				text = "Put an Island Authority Permit into the machine.",
				mode = 2,
				dir = -1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {
					{
						lineMode = 2,
						path = "/UICamera/Canvas/UIMain/UIIsland/layer1/ui/IslandInviteUI(Clone)/bottom/scroll/content/10703",
						pathIndex = -1
					}
				}
			}
		},
		{
			hideui = {
				{
					ishide = true,
					path = "/UICamera/Canvas/UIMain/UIIsland/layer1/ui/IslandInviteUI(Clone)/guide"
				}
			}
		}
	}
}
