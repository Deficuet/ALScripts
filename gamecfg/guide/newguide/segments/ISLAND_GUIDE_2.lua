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
				text = "指挥官，我们已经进入了奇异点内部",
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
				text = "推动摇杆能够进行移动，滑动右侧空白区域可调整指挥官的视角",
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
				text = "试着去前方的区域看看",
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
