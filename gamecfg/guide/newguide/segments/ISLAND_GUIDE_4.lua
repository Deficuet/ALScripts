return {
	id = "ISLAND_GUIDE_4",
	events = {
		{
			is3dDorm = false,
			alpha = 0,
			style = {
				text = "左侧的计划栏会显示进行中的计划与目标，点击查看详细的计划内容",
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
				text = "这里会显示详细的计划内容和目标位置，点击前往完成能够追踪当前计划目标",
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
				text = "点击返回按钮，继续完成当前计划",
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
