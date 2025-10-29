return {
	id = "ISLAND_GUIDE_6",
	events = {
		{
			is3dDorm = false,
			alpha = 0,
			style = {
				text = "離島のマップです",
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
				text = "マップの任意の区域をタップすると、当該区域の詳細を確認できます",
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
				text = "確認ボタンをタップすると、その区域に移動することができます",
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
