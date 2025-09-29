return {
	id = "ISLAND_GUIDE_6",
	events = {
		{
			is3dDorm = false,
			alpha = 0,
			style = {
				text = "这就是岛屿地图了",
				mode = 2,
				dir = 1,
				char = 1,
				posY = -120,
				posX = -200,
				uiset = {}
			}
		},
		{
			is3dDorm = false,
			alpha = 0,
			style = {
				text = "点击岛屿地图上的区域按钮可查看区域详情",
				mode = 2,
				dir = 1,
				char = 1,
				posY = -120,
				posX = -200,
				uiset = {}
			},
			ui = {
				path = "UICamera/Canvas/UIMain/UIIsland/layer1/ui/IslandMapUI(Clone)/bg/1004",
				pathIndex = -1,
				fingerPos = {
					posY = -100,
					posX = 100
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.2,
			style = {
				text = "点击前往按钮能够快速前往所选区域",
				mode = 2,
				dir = 1,
				char = 1,
				posY = -120,
				posX = -200,
				uiset = {
					{
						lineMode = 1,
						path = "UICamera/Canvas/UIMain/UIIsland/layer1/page/IslandMapDescUI(Clone)/frame/go",
						pathIndex = -1
					}
				}
			}
		}
	}
}
