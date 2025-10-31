return {
	id = "ISLAND_GUIDE_2",
	events = {
		{
			hideui = {
				{
					ishide = true,
					path = "/UICamera/Canvas/UIMain/UIIsland/layer1/op/IslandEmptyUI(Clone)/IslandOpUI(Clone)/op_btns/jump",
					type = 2
				},
				{
					ishide = true,
					path = "/UICamera/Canvas/UIMain/UIIsland/layer1/op/IslandEmptyUI(Clone)/IslandOpUI(Clone)/op_btns/run",
					type = 2
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0,
			style = {
				text = "Commander, we've entered the Singularity.",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			}
		},
		{
			hideui = {
				{
					ishide = false,
					path = "/UICamera/Canvas/UIMain/UIIsland/layer1/ui/IslandUI(Clone)/guide"
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0,
			style = {
				text = "Press the stick to move around. You can also slide on the right side of the screen to adjust the camera.",
				mode = 2,
				dir = -1,
				char = 1,
				posY = -320,
				posX = -300,
				uiset = {}
			}
		},
		{
			hideui = {
				{
					ishide = true,
					path = "/UICamera/Canvas/UIMain/UIIsland/layer1/ui/IslandUI(Clone)/guide"
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0,
			style = {
				text = "Check what's ahead.",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			}
		},
		{
			hideui = {
				{
					ishide = false,
					path = "UICamera/Canvas/UIMain/UIIsland/layer1/op/IslandEmptyUI(Clone)/IslandOpUI(Clone)/op_btns/jump",
					type = 2
				},
				{
					ishide = false,
					path = "UICamera/Canvas/UIMain/UIIsland/layer1/op/IslandEmptyUI(Clone)/IslandOpUI(Clone)/op_btns/run",
					type = 2
				}
			}
		}
	}
}
